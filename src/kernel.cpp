// kernel.cpp v3 - fp32 GEMM for Alveo U50 (Vitis HLS 2025.1), sized for a <3 h hw build.
// C[M*N] = A[M*K] * B[K*N], row-major.
// Spec bounds: K <= 768, N <= 768, any M >= 1, any N >= 1.
//
// Architecture: B resident in URAM, A streamed from HBM exactly once, output-stationary
// TM x TN array; each PE keeps L=8 *different* output rows in an 8-deep register shift
// chain (fp32 add latency 7 <= 8 -> II=1, no final reduction, k-order sums).
//
// Array-size knobs (compile flags):
//   default            TM=16, TN=16 : 256 MAC/cycle  (fast build, ~half of v1's logic)
//   -DGEMM_TN=32       TM=16, TN=32 : 512 MAC/cycle  (v1/v2 "SAFE" size, slower build)
//
// Changes vs v1:
//  * A-tile load is fused into the MAC pipeline (non-blocking FIFO reads into the idle
//    ping-pong buffer) -> load overlaps compute (v1 ran them back to back).
//  * Scalar C writer: no multiplies / dynamic 1024-bit part-select (was the -1.02 ns path).
//  * Naive fallback removed (spec guarantees K, N <= 768): less logic, shorter HLS.
//  * TN is a knob; B and C chunks are NH = TN/16 512-bit words.
#include <ap_int.h>
#include <hls_stream.h>
#include <stdint.h>

#ifndef GEMM_TM
#define GEMM_TM 16
#endif
#ifndef GEMM_TN
#define GEMM_TN 16
#endif

constexpr int TM = GEMM_TM;               // PE rows
constexpr int TN = GEMM_TN;               // PE columns = columns per N tile
static_assert(TM == 8 || TM == 16 || TM == 32, "TM must be 8, 16 or 32");
static_assert(TN == 16 || TN == 32, "TN must be 16 or 32");
constexpr int LOG2_TM = (TM == 8) ? 3 : (TM == 16) ? 4 : 5;
constexpr int LOG2_TN = (TN == 16) ? 4 : 5;
constexpr int NH = TN / 16;               // 512-bit words per TN-column chunk
constexpr int LOG2_NH = (NH == 2) ? 1 : 0;
constexpr int L = 8;                      // rows per PE = shift-chain depth (>= fadd latency 7)
constexpr int LOG2_L = 3;
constexpr int KMAX = 768;
constexpr int NMAX = 768;
constexpr int KW = KMAX / 16;             // max 512-bit words per A row
constexpr int NWB = NMAX / TN;            // B chunks per k-row
constexpr int TROWS = TM * L;             // rows per A tile
constexpr int LOG2_TROWS = LOG2_TM + LOG2_L;
constexpr int NTMAX = NMAX / TN;          // max N tiles

typedef ap_uint<512> w512;
typedef ap_uint<32 * TN> wout;            // one TN-float row chunk of C

static inline float u2f(ap_uint<32> x) {
  union { uint32_t i; float f; } c;
  c.i = x.to_uint();
  return c.f;
}
static inline ap_uint<32> f2u(float f) {
  union { uint32_t i; float f; } c;
  c.f = f;
  return ap_uint<32>(c.i);
}

// read_A: stream A exactly once; each row padded to Kw = ceil(K/16) 512-bit words.
static void read_A(const float *A, hls::stream<w512> &as, int M, int K) {
#pragma HLS INLINE off
  if ((K & 15) == 0) {
    const long nw = (long)M * (K >> 4);
  rdA_wide:
    for (long w = 0; w < nw; w++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=5184 max=576000
      w512 v;
      for (int u = 0; u < 16; u++) {
#pragma HLS UNROLL
        v.range(32 * u + 31, 32 * u) = f2u(A[16 * w + u]);
      }
      as.write(v);
    }
  } else {
    const long ne = (long)M * K;
    int kk = 0;
    w512 v = 0;
  rdA_scalar:
    for (long e = 0; e < ne; e++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=589824
      const int lane = kk & 15;
      v.range(32 * lane + 31, 32 * lane) = f2u(A[e]);
      if (lane == 15 || kk == K - 1) {
        as.write(v);
        v = 0;
      }
      kk = (kk == K - 1) ? 0 : kk + 1;
    }
  }
}

// load_B: B[k][j] -> bw[(j/16) % NH][k*NWB + j/TN], lane j%16.
// One read of all NH halves at one address returns TN consecutive columns of row k.
static void load_B(const float *B, w512 bw[NH][KMAX * NWB], int K, int N) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=bw dim=1 type=complete
  if ((N & 15) == 0) {
    const int nw = (K * N) >> 4;
    int kb = 0, j0 = 0;                   // kb = k * NWB
  ldB_wide:
    for (int w = 0; w < nw; w++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=18 max=36864
      w512 v;
      for (int u = 0; u < 16; u++) {
#pragma HLS UNROLL
        v.range(32 * u + 31, 32 * u) = f2u(B[16 * w + u]);
      }
      bw[(j0 >> 4) & (NH - 1)][kb + (j0 >> LOG2_TN)] = v;
      if (j0 + 16 == N) { j0 = 0; kb += NWB; } else { j0 += 16; }
    }
  } else {
    const int ne = K * N;
    int kb = 0, j = 0;
    w512 v = 0;
  ldB_scalar:
    for (int e = 0; e < ne; e++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=288 max=589056
      const int lane = j & 15;
      v.range(32 * lane + 31, 32 * lane) = f2u(B[e]);
      if (lane == 15 || j == N - 1) {
        bw[(j >> 4) & (NH - 1)][kb + (j >> LOG2_TN)] = v;
        v = 0;
      }
      if (j == N - 1) { j = 0; kb += NWB; } else { j++; }
    }
  }
}

// tile_step: one call per tile index.
//  MAC side : npass passes over the tile in (cbuf ? aw1 : aw0), Kp*L cycles each, II=1.
//             Cycle (k,l): PE(r,c) accumulates local row l*TM+r, column jt*TN+c.
//             At k==0 the outgoing chain value is the finished result of the PREVIOUS pass
//             -> obuf; cycles L..L+TROWS-1 of each pass emit one TN-float row chunk each.
//  Load side: the next tile (load_words words) goes into the OTHER buffer: non-blocking FIFO
//             reads inside the MAC pipeline, then blocking reads for whatever is left.
// Within one call each of aw0/aw1 is only read or only written -> the dependences HLS would
// otherwise assume between those accesses are genuinely false.
static void tile_step(hls::stream<w512> &as, w512 aw0[TM][L * KW], w512 aw1[TM][L * KW],
                      const w512 bw[NH][KMAX * NWB], hls::stream<wout> &cs,
                      float chain[TM][TN][L], float obuf[TM][TN][L], bool &have_prev,
                      bool cbuf, int npass, int K, int Kp, int Kw, bool mac, int load_words) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=aw0 dim=1 type=complete
#pragma HLS ARRAY_PARTITION variable=aw1 dim=1 type=complete
#pragma HLS ARRAY_PARTITION variable=bw dim=1 type=complete
#pragma HLS ARRAY_PARTITION variable=chain dim=0 type=complete
#pragma HLS ARRAY_PARTITION variable=obuf dim=1 type=complete
#pragma HLS ARRAY_PARTITION variable=obuf dim=2 type=complete
  bool hp = have_prev;
  int jt = 0, k = 0, l = 0;
  int lw = 0;      // words loaded so far
  int li = 0;      // local row being loaded
  int lwi = 0;     // word within that row
  int sbase = 0;   // (li / TM) * Kw, kept incrementally
  const int total = npass * Kp * L;
mac_loop:
  for (int t = 0; t < total; t++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=136 max=294912
#pragma HLS DEPENDENCE variable=obuf type=inter direction=RAW distance=8 dependent=true
#pragma HLS DEPENDENCE variable=aw0 type=inter dependent=false
#pragma HLS DEPENDENCE variable=aw1 type=inter dependent=false
#pragma HLS DEPENDENCE variable=aw0 type=intra dependent=false
#pragma HLS DEPENDENCE variable=aw1 type=intra dependent=false
    // ---------------- load side (overlapped with MAC) ----------------
    if (lw < load_words) {
      w512 v;
      if (as.read_nb(v)) {
        const int bank = li & (TM - 1);
        const int addr = sbase + lwi;
        if (cbuf) aw0[bank][addr] = v; else aw1[bank][addr] = v;
        lw++;
        if (lwi == Kw - 1) {
          lwi = 0;
          li++;
          if ((li & (TM - 1)) == 0) sbase += Kw;
        } else {
          lwi++;
        }
      }
    }
    // ---------------- MAC side ----------------
    const bool kv = mac && (k < K);
    const int kk = kv ? k : 0;
    const int sel = kk & 15;
    float a[TM];
    float b[TN];
#pragma HLS ARRAY_PARTITION variable=a dim=0 type=complete
#pragma HLS ARRAY_PARTITION variable=b dim=0 type=complete
  rdA:
    for (int r = 0; r < TM; r++) {
#pragma HLS UNROLL
      const int ra = l * Kw + (kk >> 4);
      const w512 wa = cbuf ? aw1[r][ra] : aw0[r][ra];
      a[r] = kv ? u2f(wa.range(32 * sel + 31, 32 * sel)) : 0.0f;
    }
  rdB:
    for (int h = 0; h < NH; h++) {
#pragma HLS UNROLL
      const w512 wb = bw[h][kk * NWB + jt];
      for (int c = 0; c < 16; c++) {
#pragma HLS UNROLL
        b[16 * h + c] = kv ? u2f(wb.range(32 * c + 31, 32 * c)) : 0.0f;
      }
    }
    const bool first_k = (k == 0);
    const bool cap = first_k && hp;
  pe_r:
    for (int r = 0; r < TM; r++) {
#pragma HLS UNROLL
    pe_c:
      for (int c = 0; c < TN; c++) {
#pragma HLS UNROLL
        const float old = chain[r][c][L - 1];
        if (cap) obuf[r][c][l] = old;
        float prod = a[r] * b[c];
#if (GEMM_TM * GEMM_TN) > 512
#pragma HLS BIND_OP variable=prod op=fmul impl=meddsp
#else
#pragma HLS BIND_OP variable=prod op=fmul impl=maxdsp
#endif
        const float base = first_k ? 0.0f : old;
        float acc = base + prod;
#pragma HLS BIND_OP variable=acc op=fadd impl=fulldsp
      shift:
        for (int i = L - 1; i > 0; i--) {
#pragma HLS UNROLL
          chain[r][c][i] = chain[r][c][i - 1];
        }
        chain[r][c][0] = acc;
      }
    }
    const int q = (k << LOG2_L) + l;
    if (hp && q >= L && q < L + TROWS) {
      const int d = q - L;
      const int rr = d & (TM - 1);
      const int ll = d >> LOG2_TM;
      wout out;
    emit:
      for (int c = 0; c < TN; c++) {
#pragma HLS UNROLL
        out.range(32 * c + 31, 32 * c) = f2u(obuf[rr][c][ll]);
      }
      cs.write(out);
    }
    if (l == L - 1) {
      l = 0;
      if (k == Kp - 1) { k = 0; jt++; hp = true; } else { k++; }
    } else {
      l++;
    }
  }
  have_prev = hp;

  // Finish loading whatever the MAC passes did not cover (the whole tile on the first call).
fill_rest:
  for (int x = lw; x < load_words; x++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=0 max=6144
#pragma HLS DEPENDENCE variable=aw0 type=inter dependent=false
#pragma HLS DEPENDENCE variable=aw1 type=inter dependent=false
    const w512 v = as.read();
    const int bank = li & (TM - 1);
    const int addr = sbase + lwi;
    if (cbuf) aw0[bank][addr] = v; else aw1[bank][addr] = v;
    if (lwi == Kw - 1) {
      lwi = 0;
      li++;
      if ((li & (TM - 1)) == 0) sbase += Kw;
    } else {
      lwi++;
    }
  }
}

// compute: B prologue, then one tile_step per tile index (single call site = one PE array).
//   s = 0          : load tile 0 only
//   1 <= s <= NS   : compute tile s-1 from aw[(s-1)&1]  ||  load tile s into aw[s&1]
//   s = NS+1       : flush pass (drains the last pass's results)
static void compute(const float *B, hls::stream<w512> &as, hls::stream<wout> &cs, int M,
                    int K, int N) {
#pragma HLS INLINE off
  static w512 bw[NH][KMAX * NWB];
#pragma HLS ARRAY_PARTITION variable=bw dim=1 type=complete
#pragma HLS BIND_STORAGE variable=bw type=ram_2p impl=uram
  static w512 aw0[TM][L * KW];
#pragma HLS ARRAY_PARTITION variable=aw0 dim=1 type=complete
#pragma HLS BIND_STORAGE variable=aw0 type=ram_2p impl=bram
  static w512 aw1[TM][L * KW];
#pragma HLS ARRAY_PARTITION variable=aw1 dim=1 type=complete
#pragma HLS BIND_STORAGE variable=aw1 type=ram_2p impl=bram
  static float chain[TM][TN][L];
#pragma HLS ARRAY_PARTITION variable=chain dim=0 type=complete
  static float obuf[TM][TN][L];
#pragma HLS ARRAY_PARTITION variable=obuf dim=1 type=complete
#pragma HLS ARRAY_PARTITION variable=obuf dim=2 type=complete
#pragma HLS BIND_STORAGE variable=obuf type=ram_2p impl=lutram

  load_B(B, bw, K, N);

  const int Kw = (K + 15) >> 4;
  const int Kp = (K > TM) ? K : (TM + 1);      // pass >= L + TROWS cycles for the drain
  const int NT = (N + TN - 1) >> LOG2_TN;
  const int NS = (M + TROWS - 1) >> LOG2_TROWS;
  bool have_prev = false;

tiles:
  for (int s = 0; s <= NS + 1; s++) {
#pragma HLS LOOP_TRIPCOUNT min=3 max=252
    const bool flush = (s == NS + 1);
    const bool mac = (s >= 1) && (s <= NS);
    const int rem = M - s * TROWS;
    const int rows = (s < NS) ? ((rem < TROWS) ? rem : TROWS) : 0;
    const int npass = mac ? NT : (flush ? 1 : 0);
    const int kp = flush ? (TM + 1) : Kp;
    const bool cbuf = (s & 1) == 0;              // tile s-1 lives in aw1 when s is even
    tile_step(as, aw0, aw1, bw, cs, chain, obuf, have_prev, cbuf, npass, K, kp, Kw, mac,
              rows * Kw);
  }
}

// write_C: chunks arrive per tile s, per N tile jt, per local row d (TN floats each).
static void write_C(hls::stream<wout> &cs, float *C, int M, int N) {
#pragma HLS INLINE off
  static w512 cw[NH][TROWS * NTMAX];
#pragma HLS ARRAY_PARTITION variable=cw dim=1 type=complete
#pragma HLS BIND_STORAGE variable=cw type=ram_2p impl=uram
  const int NT = (N + TN - 1) >> LOG2_TN;
  const int NS = (M + TROWS - 1) >> LOG2_TROWS;
  if ((N & 15) == 0) {
    const int NW = N >> 4;                       // 512-bit words per C row
  wr_tiles:
    for (int s = 0; s < NS; s++) {
#pragma HLS LOOP_TRIPCOUNT min=2 max=250
      const int i0 = s * TROWS;
      const int rem = M - i0;
      const int rows = (rem < TROWS) ? rem : TROWS;
    gather:
      for (int t = 0; t < NT * TROWS; t++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=6144
        const int d = t & (TROWS - 1);
        const int jt = t >> LOG2_TROWS;
        const wout v = cs.read();
        for (int h = 0; h < NH; h++) {
#pragma HLS UNROLL
          cw[h][d * NT + jt] = v.range(512 * h + 511, 512 * h);
        }
      }
      const long base = (long)i0 * N;            // 64-byte aligned because N % 16 == 0
      const int nwords = rows * NW;
      int rbase = 0, x = 0;                      // rbase = row * NT
    put:
      for (int w = 0; w < nwords; w++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=2 max=12288
        const int idx = rbase + (x >> LOG2_NH);
        w512 v = cw[0][idx];
        if (NH == 2 && (x & 1)) v = cw[NH - 1][idx];
        for (int u = 0; u < 16; u++) {
#pragma HLS UNROLL
          C[base + 16 * (long)w + u] = u2f(v.range(32 * u + 31, 32 * u));
        }
        if (x == NW - 1) { x = 0; rbase += NT; } else { x++; }
      }
    }
  } else {
    // Scalar path (e.g. N = 1): no multiplies, no dynamic part-select.
    const long total = (long)NS * TROWS * N;
    const long tstep = (long)TROWS * N;
    int jt = 0, d = 0, c = 0;
    int row = 0;          // global row  = s*TROWS + d
    int tilerow = 0;      // s*TROWS
    long tilebase = 0;    // s*TROWS*N
    long rowaddr = 0;     // row*N
    int colbase = 0;      // jt*TN
    int ncols = (N < TN) ? N : TN;
    wout cur = 0;
  wr_scalar:
    for (long t = 0; t < total; t++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=32000
      if (c == 0) cur = cs.read();
      const float v = u2f(cur.range(31, 0));
      cur = cur >> 32;
      if (row < M) C[rowaddr + colbase + c] = v;
      if (c == ncols - 1) {
        c = 0;
        if (d == TROWS - 1) {
          d = 0;
          if (jt == NT - 1) {
            jt = 0;
            colbase = 0;
            tilerow += TROWS;
            tilebase += tstep;
          } else {
            jt++;
            colbase += TN;
          }
          row = tilerow;
          rowaddr = tilebase;
          const int left = N - colbase;
          ncols = (left < TN) ? left : TN;
        } else {
          d++;
          row++;
          rowaddr += N;
        }
      } else {
        c++;
      }
    }
  }
}

static void gemm_fast(const float *A, const float *B, float *C, int M, int K, int N) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW
  hls::stream<w512> as("as");
#pragma HLS STREAM variable=as depth=512
  hls::stream<wout> cs("cs");
#pragma HLS STREAM variable=cs depth=1024
#pragma HLS BIND_STORAGE variable=cs type=fifo impl=uram
  read_A(A, as, M, K);
  compute(B, as, cs, M, K, N);
  write_C(cs, C, M, N);
}

extern "C" void gemm(const float *A, const float *B, float *C, int M, int K, int N) {
#pragma HLS INTERFACE m_axi port=A offset=slave bundle=gmem0 depth=6144 max_widen_bitwidth=512 max_read_burst_length=64 num_read_outstanding=32 num_write_outstanding=1 latency=64
#pragma HLS INTERFACE m_axi port=B offset=slave bundle=gmem1 depth=11520 max_widen_bitwidth=512 max_read_burst_length=64 num_read_outstanding=32 num_write_outstanding=1 latency=64
#pragma HLS INTERFACE m_axi port=C offset=slave bundle=gmem2 depth=256 max_widen_bitwidth=512 max_write_burst_length=64 num_write_outstanding=32 num_read_outstanding=1 latency=64
#pragma HLS INTERFACE s_axilite port=M
#pragma HLS INTERFACE s_axilite port=K
#pragma HLS INTERFACE s_axilite port=N
#pragma HLS INTERFACE s_axilite port=return
  // Spec: K <= 768, N <= 768. Shapes outside the spec are not computed.
  if (M <= 0 || N <= 0 || K < 0 || K > KMAX || N > NMAX) return;
  gemm_fast(A, B, C, M, K, N);
}