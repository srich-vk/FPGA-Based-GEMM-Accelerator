// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "/home/cs2401.20/mini1-gemm-final-starter/mini1-gemm/src/kernel.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 401 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/cs2401.20/mini1-gemm-final-starter/mini1-gemm/src/kernel.cpp" 2
# 19 "/home/cs2401.20/mini1-gemm-final-starter/mini1-gemm/src/kernel.cpp"
extern "C" void gemm(const float *A, const float *B, float *C, int M, int K, int N) {


#pragma HLS INTERFACE m_axi port=A offset=slave bundle=gmem0 depth=6144
#pragma HLS INTERFACE m_axi port=B offset=slave bundle=gmem1 depth=11520
#pragma HLS INTERFACE m_axi port=C offset=slave bundle=gmem2 depth=256
#pragma HLS INTERFACE s_axilite port=M
#pragma HLS INTERFACE s_axilite port=K
#pragma HLS INTERFACE s_axilite port=N
#pragma HLS INTERFACE s_axilite port=return
# 39 "/home/cs2401.20/mini1-gemm-final-starter/mini1-gemm/src/kernel.cpp"
    constexpr int L = 16;
    float crow[L][768];
#pragma HLS ARRAY_PARTITION variable=crow dim=1 type=complete
    float arow[768];

    zero_init_top_loop: for(int z = 0; z < L; z++)
        zero_init_in_loop: for(int j = 0; j < N; j++){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1
#pragma HLS PIPELINE II=1
        crow[z][j] = 0.0f;
    }

    i_loop: for(int i = 0; i < M; i++){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1

        arow_loop: for(int k = 0; k < K; k++){
#pragma HLS PIPELINE II=1
            arow[k] = A[(long)i * K + k];
        }

        int j = 0, k = 0;
        kj_loop: for(int t = 0; t < K * N; t++){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1
#pragma HLS PIPELINE II=1
#pragma HLS DEPENDENCE variable=crow type=inter false
#pragma HLS ARRAY_RESHAPE variable=arow type=cyclic factor=16 dim=1
            crow[k % L][j] += arow[k] * B[t];
            j++;
            if (j == N){
                j = 0;
                k++;
            }
        }


        wb_loop: for(int j = 0; j < N; j++){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1
#pragma HLS PIPELINE II=1
            float s = 0.0f;
            for(int l = 0; l < L; l++){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1
#pragma HLS UNROLL
                s += crow[l][j];
                crow[l][j] = 0.0f;
            }
            C[(long)i * N + j] = s;
        }
    }
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_gemm_ir(const float *, const float *, float *, int, int, int);
#ifdef __cplusplus
extern "C"
#endif
void gemm_hw_stub(const float *A, const float *B, float *C, int M, int K, int N){
gemm(A, B, C, M, K, N);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void refine_signal_handler();
#ifdef __cplusplus
extern "C"
#endif
void apatb_gemm_sw(const float *A, const float *B, float *C, int M, int K, int N){
refine_signal_handler();
apatb_gemm_ir(A, B, C, M, K, N);
return ;
}
#endif
# 87 "/home/cs2401.20/mini1-gemm-final-starter/mini1-gemm/src/kernel.cpp"

