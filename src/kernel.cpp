// kernel.cpp - fp32 GEMM for Alveo U50 (Vitis HLS 2025.1).
// C[M*N] = A[M*K] * B[K*N], row-major.
//
// Dataflow pipeline: read_A streams A from HBM exactly once in 512-bit words, B is loaded
// once into URAM, compute produces one row of C per A row, write_C stores it.
#include <ap_int.h>
#include <hls_stream.h>
#include <stdint.h>

constexpr int TM = 16;                    // PE rows
constexpr int TN = 16;                    // PE columns = columns per N tile (one 512-bit word)
constexpr int LOG2_TM = 4;
constexpr int LOG2_TN = 4;
constexpr int L = 8;                      // rows per PE = shift-chain depth (>= fadd latency 7)
constexpr int LOG2_L = 3;
constexpr int KMAX = 768;
constexpr int NMAX = 768;
constexpr int KW = KMAX / 16;             // max 512-bit words per A row
constexpr int NWB = NMAX / TN;            // B words per k-row
constexpr int TROWS = TM * L;             // rows per A tile
constexpr int LOG2_TROWS = LOG2_TM + LOG2_L;

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

// load_B: B[k][j] -> bw[k*NWB + j/16], lane j%16 (B stays on chip for the whole call).
static void load_B(const float *B, w512 bw[KMAX * NWB], int K, int N) {
#pragma HLS INLINE off
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
      bw[kb + (j0 >> LOG2_TN)] = v;
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
        bw[kb + (j >> LOG2_TN)] = v;
        v = 0;
      }
      if (j == N - 1) { j = 0; kb += NWB; } else { j++; }
    }
  }
}

// compute: B prologue, then one A row at a time. Each TN-column chunk of the row is a
// K-long dot product per column; L partial sums per column hide the fadd latency (II=1).
static void compute(const float *B, hls::stream<w512> &as, hls::stream<wout> &cs, int M,
                    int K, int N) {
#pragma HLS INLINE off
  static w512 bw[KMAX * NWB];
#pragma HLS BIND_STORAGE variable=bw type=ram_2p impl=uram
  w512 arow[KW];

  load_B(B, bw, K, N);

  const int Kw = (K + 15) >> 4;
  const int NT = (N + TN - 1) >> LOG2_TN;
rows:
  for (int i = 0; i < M; i++) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=32000
  ld_row:
    for (int w = 0; w < Kw; w++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=18 max=48
      arow[w] = as.read();
    }
  cols:
    for (int jt = 0; jt < NT; jt++) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=48
      float acc[L][TN];
#pragma HLS ARRAY_PARTITION variable=acc dim=0 type=complete
      for (int l = 0; l < L; l++) {
#pragma HLS UNROLL
        for (int c = 0; c < TN; c++) {
#pragma HLS UNROLL
          acc[l][c] = 0.0f;
        }
      }
    k_loop:
      for (int k = 0; k < K; k++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=288 max=768
#pragma HLS DEPENDENCE variable=acc type=inter distance=8 dependent=true
        const int sel = k & 15;
        const float a = u2f(arow[k >> 4].range(32 * sel + 31, 32 * sel));
        const w512 wb = bw[k * NWB + jt];
        for (int c = 0; c < TN; c++) {
#pragma HLS UNROLL
          acc[k & (L - 1)][c] += a * u2f(wb.range(32 * c + 31, 32 * c));
        }
      }
      wout out;
    reduce:
      for (int c = 0; c < TN; c++) {
#pragma HLS UNROLL
        float s = 0.0f;
        for (int l = 0; l < L; l++) {
#pragma HLS UNROLL
          s += acc[l][c];
        }
        out.range(32 * c + 31, 32 * c) = f2u(s);
      }
      cs.write(out);
    }
  }
}

// write_C: one TN-float chunk per (row, N tile), in row order.
static void write_C(hls::stream<wout> &cs, float *C, int M, int N) {
#pragma HLS INLINE off
  const int NT = (N + TN - 1) >> LOG2_TN;
wr_chunks:
  for (int t = 0; t < M * NT; t++) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=32000
    const int i = t / NT;
    const int col0 = (t % NT) * TN;
    const int left = N - col0;
    const int ncols = (left < TN) ? left : TN;
    const wout v = cs.read();
  wr_cols:
    for (int c = 0; c < ncols; c++) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=16
      C[(long)i * N + col0 + c] = u2f(v.range(32 * c + 31, 32 * c));
    }
  }
}

// Fallback for shapes beyond the on-chip buffers (K > 768 or N > 768).
static void gemm_naive(const float *A, const float *B, float *C, int M, int K, int N) {
#pragma HLS INLINE off
nv_i:
  for (int i = 0; i < M; i++) {
  nv_j:
    for (int j = 0; j < N; j++) {
      float acc = 0.0f;
    nv_k:
      for (int k = 0; k < K; k++) {
#pragma HLS PIPELINE II=8
        acc += A[(long)i * K + k] * B[(long)k * N + j];
      }
      C[(long)i * N + j] = acc;
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
  if (M <= 0 || N <= 0 || K < 0) return;
  if (K > KMAX || N > NMAX) {
    gemm_naive(A, B, C, M, K, N);
    return;
  }
  gemm_fast(A, B, C, M, K, N);
}
