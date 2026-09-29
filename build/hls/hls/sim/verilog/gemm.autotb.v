// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps


`define AUTOTB_DUT      gemm
`define AUTOTB_DUT_INST AESL_inst_gemm
`define AUTOTB_TOP      apatb_gemm_top
`define AUTOTB_LAT_RESULT_FILE "gemm.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "gemm.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_gemm_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 1.67

`define AESL_DEPTH_gmem0 1
`define AESL_DEPTH_gmem1 1
`define AESL_DEPTH_gmem2 1
`define AESL_DEPTH_A 1
`define AESL_DEPTH_B 1
`define AESL_DEPTH_C 1
`define AESL_DEPTH_M 1
`define AESL_DEPTH_K 1
`define AESL_DEPTH_N 1
`define AUTOTB_TVIN_gmem0  "../tv/cdatafile/c.gemm.autotvin_gmem0.dat"
`define AUTOTB_TVIN_gmem1  "../tv/cdatafile/c.gemm.autotvin_gmem1.dat"
`define AUTOTB_TVIN_A  "../tv/cdatafile/c.gemm.autotvin_A.dat"
`define AUTOTB_TVIN_B  "../tv/cdatafile/c.gemm.autotvin_B.dat"
`define AUTOTB_TVIN_C  "../tv/cdatafile/c.gemm.autotvin_C.dat"
`define AUTOTB_TVIN_M  "../tv/cdatafile/c.gemm.autotvin_M.dat"
`define AUTOTB_TVIN_K  "../tv/cdatafile/c.gemm.autotvin_K.dat"
`define AUTOTB_TVIN_N  "../tv/cdatafile/c.gemm.autotvin_N.dat"
`define AUTOTB_TVIN_gmem0_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_gmem0.dat"
`define AUTOTB_TVIN_gmem1_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_gmem1.dat"
`define AUTOTB_TVIN_A_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_A.dat"
`define AUTOTB_TVIN_B_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_B.dat"
`define AUTOTB_TVIN_C_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_C.dat"
`define AUTOTB_TVIN_M_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_M.dat"
`define AUTOTB_TVIN_K_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_K.dat"
`define AUTOTB_TVIN_N_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvin_N.dat"
`define AUTOTB_TVOUT_gmem2  "../tv/cdatafile/c.gemm.autotvout_gmem2.dat"
`define AUTOTB_TVOUT_gmem2_out_wrapc  "../tv/rtldatafile/rtl.gemm.autotvout_gmem2.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 3;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_A = 1;
parameter LENGTH_B = 1;
parameter LENGTH_C = 1;
parameter LENGTH_K = 1;
parameter LENGTH_M = 1;
parameter LENGTH_N = 1;
parameter LENGTH_gmem0 = 6144;
parameter LENGTH_gmem1 = 11520;
parameter LENGTH_gmem2 = 256;

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [6 : 0] control_AWADDR;
wire  control_AWVALID;
wire  control_AWREADY;
wire  control_WVALID;
wire  control_WREADY;
wire [31 : 0] control_WDATA;
wire [3 : 0] control_WSTRB;
wire [6 : 0] control_ARADDR;
wire  control_ARVALID;
wire  control_ARREADY;
wire  control_RVALID;
wire  control_RREADY;
wire [31 : 0] control_RDATA;
wire [1 : 0] control_RRESP;
wire  control_BVALID;
wire  control_BREADY;
wire [1 : 0] control_BRESP;
wire  control_INTERRUPT;
wire  gmem0_AWVALID;
wire  gmem0_AWREADY;
wire [63 : 0] gmem0_AWADDR;
wire [0 : 0] gmem0_AWID;
wire [7 : 0] gmem0_AWLEN;
wire [2 : 0] gmem0_AWSIZE;
wire [1 : 0] gmem0_AWBURST;
wire [1 : 0] gmem0_AWLOCK;
wire [3 : 0] gmem0_AWCACHE;
wire [2 : 0] gmem0_AWPROT;
wire [3 : 0] gmem0_AWQOS;
wire [3 : 0] gmem0_AWREGION;
wire [0 : 0] gmem0_AWUSER;
wire  gmem0_WVALID;
wire  gmem0_WREADY;
wire [31 : 0] gmem0_WDATA;
wire [3 : 0] gmem0_WSTRB;
wire  gmem0_WLAST;
wire [0 : 0] gmem0_WID;
wire [0 : 0] gmem0_WUSER;
wire  gmem0_ARVALID;
wire  gmem0_ARREADY;
wire [63 : 0] gmem0_ARADDR;
wire [0 : 0] gmem0_ARID;
wire [7 : 0] gmem0_ARLEN;
wire [2 : 0] gmem0_ARSIZE;
wire [1 : 0] gmem0_ARBURST;
wire [1 : 0] gmem0_ARLOCK;
wire [3 : 0] gmem0_ARCACHE;
wire [2 : 0] gmem0_ARPROT;
wire [3 : 0] gmem0_ARQOS;
wire [3 : 0] gmem0_ARREGION;
wire [0 : 0] gmem0_ARUSER;
wire  gmem0_RVALID;
wire  gmem0_RREADY;
wire [31 : 0] gmem0_RDATA;
wire  gmem0_RLAST;
wire [0 : 0] gmem0_RID;
wire [0 : 0] gmem0_RUSER;
wire [1 : 0] gmem0_RRESP;
wire  gmem0_BVALID;
wire  gmem0_BREADY;
wire [1 : 0] gmem0_BRESP;
wire [0 : 0] gmem0_BID;
wire [0 : 0] gmem0_BUSER;
wire  gmem1_AWVALID;
wire  gmem1_AWREADY;
wire [63 : 0] gmem1_AWADDR;
wire [0 : 0] gmem1_AWID;
wire [7 : 0] gmem1_AWLEN;
wire [2 : 0] gmem1_AWSIZE;
wire [1 : 0] gmem1_AWBURST;
wire [1 : 0] gmem1_AWLOCK;
wire [3 : 0] gmem1_AWCACHE;
wire [2 : 0] gmem1_AWPROT;
wire [3 : 0] gmem1_AWQOS;
wire [3 : 0] gmem1_AWREGION;
wire [0 : 0] gmem1_AWUSER;
wire  gmem1_WVALID;
wire  gmem1_WREADY;
wire [31 : 0] gmem1_WDATA;
wire [3 : 0] gmem1_WSTRB;
wire  gmem1_WLAST;
wire [0 : 0] gmem1_WID;
wire [0 : 0] gmem1_WUSER;
wire  gmem1_ARVALID;
wire  gmem1_ARREADY;
wire [63 : 0] gmem1_ARADDR;
wire [0 : 0] gmem1_ARID;
wire [7 : 0] gmem1_ARLEN;
wire [2 : 0] gmem1_ARSIZE;
wire [1 : 0] gmem1_ARBURST;
wire [1 : 0] gmem1_ARLOCK;
wire [3 : 0] gmem1_ARCACHE;
wire [2 : 0] gmem1_ARPROT;
wire [3 : 0] gmem1_ARQOS;
wire [3 : 0] gmem1_ARREGION;
wire [0 : 0] gmem1_ARUSER;
wire  gmem1_RVALID;
wire  gmem1_RREADY;
wire [31 : 0] gmem1_RDATA;
wire  gmem1_RLAST;
wire [0 : 0] gmem1_RID;
wire [0 : 0] gmem1_RUSER;
wire [1 : 0] gmem1_RRESP;
wire  gmem1_BVALID;
wire  gmem1_BREADY;
wire [1 : 0] gmem1_BRESP;
wire [0 : 0] gmem1_BID;
wire [0 : 0] gmem1_BUSER;
wire  gmem2_AWVALID;
wire  gmem2_AWREADY;
wire [63 : 0] gmem2_AWADDR;
wire [0 : 0] gmem2_AWID;
wire [7 : 0] gmem2_AWLEN;
wire [2 : 0] gmem2_AWSIZE;
wire [1 : 0] gmem2_AWBURST;
wire [1 : 0] gmem2_AWLOCK;
wire [3 : 0] gmem2_AWCACHE;
wire [2 : 0] gmem2_AWPROT;
wire [3 : 0] gmem2_AWQOS;
wire [3 : 0] gmem2_AWREGION;
wire [0 : 0] gmem2_AWUSER;
wire  gmem2_WVALID;
wire  gmem2_WREADY;
wire [31 : 0] gmem2_WDATA;
wire [3 : 0] gmem2_WSTRB;
wire  gmem2_WLAST;
wire [0 : 0] gmem2_WID;
wire [0 : 0] gmem2_WUSER;
wire  gmem2_ARVALID;
wire  gmem2_ARREADY;
wire [63 : 0] gmem2_ARADDR;
wire [0 : 0] gmem2_ARID;
wire [7 : 0] gmem2_ARLEN;
wire [2 : 0] gmem2_ARSIZE;
wire [1 : 0] gmem2_ARBURST;
wire [1 : 0] gmem2_ARLOCK;
wire [3 : 0] gmem2_ARCACHE;
wire [2 : 0] gmem2_ARPROT;
wire [3 : 0] gmem2_ARQOS;
wire [3 : 0] gmem2_ARREGION;
wire [0 : 0] gmem2_ARUSER;
wire  gmem2_RVALID;
wire  gmem2_RREADY;
wire [31 : 0] gmem2_RDATA;
wire  gmem2_RLAST;
wire [0 : 0] gmem2_RID;
wire [0 : 0] gmem2_RUSER;
wire [1 : 0] gmem2_RRESP;
wire  gmem2_BVALID;
wire  gmem2_BREADY;
wire [1 : 0] gmem2_BRESP;
wire [0 : 0] gmem2_BID;
wire [0 : 0] gmem2_BUSER;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;
wire control_write_data_finish;
wire AESL_slave_start;
reg AESL_slave_start_lock = 0;
wire AESL_slave_write_start_in;
wire AESL_slave_write_start_finish;
reg AESL_slave_ready;
wire AESL_slave_output_done;
wire AESL_slave_done;
reg ready_rise = 0;
reg start_rise = 0;
reg slave_start_status = 0;
reg slave_done_status = 0;
reg ap_done_lock = 0;


wire all_finish;
wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .s_axi_control_AWADDR(control_AWADDR),
    .s_axi_control_AWVALID(control_AWVALID),
    .s_axi_control_AWREADY(control_AWREADY),
    .s_axi_control_WVALID(control_WVALID),
    .s_axi_control_WREADY(control_WREADY),
    .s_axi_control_WDATA(control_WDATA),
    .s_axi_control_WSTRB(control_WSTRB),
    .s_axi_control_ARADDR(control_ARADDR),
    .s_axi_control_ARVALID(control_ARVALID),
    .s_axi_control_ARREADY(control_ARREADY),
    .s_axi_control_RVALID(control_RVALID),
    .s_axi_control_RREADY(control_RREADY),
    .s_axi_control_RDATA(control_RDATA),
    .s_axi_control_RRESP(control_RRESP),
    .s_axi_control_BVALID(control_BVALID),
    .s_axi_control_BREADY(control_BREADY),
    .s_axi_control_BRESP(control_BRESP),
    .interrupt(control_INTERRUPT),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .m_axi_gmem0_AWVALID(gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(gmem0_AWADDR),
    .m_axi_gmem0_AWID(gmem0_AWID),
    .m_axi_gmem0_AWLEN(gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(gmem0_AWUSER),
    .m_axi_gmem0_WVALID(gmem0_WVALID),
    .m_axi_gmem0_WREADY(gmem0_WREADY),
    .m_axi_gmem0_WDATA(gmem0_WDATA),
    .m_axi_gmem0_WSTRB(gmem0_WSTRB),
    .m_axi_gmem0_WLAST(gmem0_WLAST),
    .m_axi_gmem0_WID(gmem0_WID),
    .m_axi_gmem0_WUSER(gmem0_WUSER),
    .m_axi_gmem0_ARVALID(gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(gmem0_ARREADY),
    .m_axi_gmem0_ARADDR(gmem0_ARADDR),
    .m_axi_gmem0_ARID(gmem0_ARID),
    .m_axi_gmem0_ARLEN(gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(gmem0_ARUSER),
    .m_axi_gmem0_RVALID(gmem0_RVALID),
    .m_axi_gmem0_RREADY(gmem0_RREADY),
    .m_axi_gmem0_RDATA(gmem0_RDATA),
    .m_axi_gmem0_RLAST(gmem0_RLAST),
    .m_axi_gmem0_RID(gmem0_RID),
    .m_axi_gmem0_RUSER(gmem0_RUSER),
    .m_axi_gmem0_RRESP(gmem0_RRESP),
    .m_axi_gmem0_BVALID(gmem0_BVALID),
    .m_axi_gmem0_BREADY(gmem0_BREADY),
    .m_axi_gmem0_BRESP(gmem0_BRESP),
    .m_axi_gmem0_BID(gmem0_BID),
    .m_axi_gmem0_BUSER(gmem0_BUSER),
    .m_axi_gmem1_AWVALID(gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(gmem1_AWREADY),
    .m_axi_gmem1_AWADDR(gmem1_AWADDR),
    .m_axi_gmem1_AWID(gmem1_AWID),
    .m_axi_gmem1_AWLEN(gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(gmem1_AWUSER),
    .m_axi_gmem1_WVALID(gmem1_WVALID),
    .m_axi_gmem1_WREADY(gmem1_WREADY),
    .m_axi_gmem1_WDATA(gmem1_WDATA),
    .m_axi_gmem1_WSTRB(gmem1_WSTRB),
    .m_axi_gmem1_WLAST(gmem1_WLAST),
    .m_axi_gmem1_WID(gmem1_WID),
    .m_axi_gmem1_WUSER(gmem1_WUSER),
    .m_axi_gmem1_ARVALID(gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(gmem1_ARADDR),
    .m_axi_gmem1_ARID(gmem1_ARID),
    .m_axi_gmem1_ARLEN(gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(gmem1_ARUSER),
    .m_axi_gmem1_RVALID(gmem1_RVALID),
    .m_axi_gmem1_RREADY(gmem1_RREADY),
    .m_axi_gmem1_RDATA(gmem1_RDATA),
    .m_axi_gmem1_RLAST(gmem1_RLAST),
    .m_axi_gmem1_RID(gmem1_RID),
    .m_axi_gmem1_RUSER(gmem1_RUSER),
    .m_axi_gmem1_RRESP(gmem1_RRESP),
    .m_axi_gmem1_BVALID(gmem1_BVALID),
    .m_axi_gmem1_BREADY(gmem1_BREADY),
    .m_axi_gmem1_BRESP(gmem1_BRESP),
    .m_axi_gmem1_BID(gmem1_BID),
    .m_axi_gmem1_BUSER(gmem1_BUSER),
    .m_axi_gmem2_AWVALID(gmem2_AWVALID),
    .m_axi_gmem2_AWREADY(gmem2_AWREADY),
    .m_axi_gmem2_AWADDR(gmem2_AWADDR),
    .m_axi_gmem2_AWID(gmem2_AWID),
    .m_axi_gmem2_AWLEN(gmem2_AWLEN),
    .m_axi_gmem2_AWSIZE(gmem2_AWSIZE),
    .m_axi_gmem2_AWBURST(gmem2_AWBURST),
    .m_axi_gmem2_AWLOCK(gmem2_AWLOCK),
    .m_axi_gmem2_AWCACHE(gmem2_AWCACHE),
    .m_axi_gmem2_AWPROT(gmem2_AWPROT),
    .m_axi_gmem2_AWQOS(gmem2_AWQOS),
    .m_axi_gmem2_AWREGION(gmem2_AWREGION),
    .m_axi_gmem2_AWUSER(gmem2_AWUSER),
    .m_axi_gmem2_WVALID(gmem2_WVALID),
    .m_axi_gmem2_WREADY(gmem2_WREADY),
    .m_axi_gmem2_WDATA(gmem2_WDATA),
    .m_axi_gmem2_WSTRB(gmem2_WSTRB),
    .m_axi_gmem2_WLAST(gmem2_WLAST),
    .m_axi_gmem2_WID(gmem2_WID),
    .m_axi_gmem2_WUSER(gmem2_WUSER),
    .m_axi_gmem2_ARVALID(gmem2_ARVALID),
    .m_axi_gmem2_ARREADY(gmem2_ARREADY),
    .m_axi_gmem2_ARADDR(gmem2_ARADDR),
    .m_axi_gmem2_ARID(gmem2_ARID),
    .m_axi_gmem2_ARLEN(gmem2_ARLEN),
    .m_axi_gmem2_ARSIZE(gmem2_ARSIZE),
    .m_axi_gmem2_ARBURST(gmem2_ARBURST),
    .m_axi_gmem2_ARLOCK(gmem2_ARLOCK),
    .m_axi_gmem2_ARCACHE(gmem2_ARCACHE),
    .m_axi_gmem2_ARPROT(gmem2_ARPROT),
    .m_axi_gmem2_ARQOS(gmem2_ARQOS),
    .m_axi_gmem2_ARREGION(gmem2_ARREGION),
    .m_axi_gmem2_ARUSER(gmem2_ARUSER),
    .m_axi_gmem2_RVALID(gmem2_RVALID),
    .m_axi_gmem2_RREADY(gmem2_RREADY),
    .m_axi_gmem2_RDATA(gmem2_RDATA),
    .m_axi_gmem2_RLAST(gmem2_RLAST),
    .m_axi_gmem2_RID(gmem2_RID),
    .m_axi_gmem2_RUSER(gmem2_RUSER),
    .m_axi_gmem2_RRESP(gmem2_RRESP),
    .m_axi_gmem2_BVALID(gmem2_BVALID),
    .m_axi_gmem2_BREADY(gmem2_BREADY),
    .m_axi_gmem2_BRESP(gmem2_BRESP),
    .m_axi_gmem2_BID(gmem2_BID),
    .m_axi_gmem2_BUSER(gmem2_BUSER));
assign ap_clk = AESL_clock;
assign ap_rst_n = AESL_reset;
assign ap_rst_n_n = ~AESL_reset;
assign AESL_reset = dut_rst;
assign AESL_start = svtb_top.misc_if.tb2dut_ap_start;
assign AESL_ready = svtb_top.misc_if.dut2tb_ap_ready;
assign AESL_done  = svtb_top.misc_if.dut2tb_ap_done;
assign all_finish = svtb_top.misc_if.finished;
initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(3+3) @ (posedge AESL_clock);
    # 0.1;
    rst = 1;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    # 0.1;
    dut_rst = 1;
end
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end

    sv_module_top svtb_top();

////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 0) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

// Dependence Check (WAR) "ap_enable_operation_106"(R:SV5-6) -> "ap_enable_operation_163"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_107"(R:SV5-6) -> "ap_enable_operation_161"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_108"(R:SV5-6) -> "ap_enable_operation_159"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_109"(R:SV5-6) -> "ap_enable_operation_157"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_110"(R:SV5-6) -> "ap_enable_operation_155"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_111"(R:SV5-6) -> "ap_enable_operation_153"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_112"(R:SV5-6) -> "ap_enable_operation_151"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_113"(R:SV5-6) -> "ap_enable_operation_149"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_114"(R:SV5-6) -> "ap_enable_operation_147"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_115"(R:SV5-6) -> "ap_enable_operation_145"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_116"(R:SV5-6) -> "ap_enable_operation_143"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_117"(R:SV5-6) -> "ap_enable_operation_141"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_118"(R:SV5-6) -> "ap_enable_operation_139"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_119"(R:SV5-6) -> "ap_enable_operation_137"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_120"(R:SV5-6) -> "ap_enable_operation_135"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (WAR) "ap_enable_operation_121"(R:SV5-6) -> "ap_enable_operation_133"(W:SV14-14) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285

// Dependence Check (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_16_to [9 - 1:0];
time DEP_time_16_to [9 - 1:0];
reg [10:0] DEP_address_16_from [1 - 1:0];
time DEP_time_16_from [1 - 1:0];
reg DEP_error_16 = 0;
integer DEP_i_16;

initial begin
    DEP_address_16_to[0] = 0;
    DEP_time_16_to[0] = 0;
    DEP_address_16_to[1] = 0;
    DEP_time_16_to[1] = 0;
    DEP_address_16_to[2] = 0;
    DEP_time_16_to[2] = 0;
    DEP_address_16_to[3] = 0;
    DEP_time_16_to[3] = 0;
    DEP_address_16_to[4] = 0;
    DEP_time_16_to[4] = 0;
    DEP_address_16_to[5] = 0;
    DEP_time_16_to[5] = 0;
    DEP_address_16_to[6] = 0;
    DEP_time_16_to[6] = 0;
    DEP_address_16_to[7] = 0;
    DEP_time_16_to[7] = 0;
    DEP_address_16_to[8] = 0;
    DEP_time_16_to[8] = 0;
    DEP_address_16_from[0] = 0;
    DEP_time_16_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_16_to[8] = DEP_address_16_to[7];
            DEP_time_16_to[8] = DEP_time_16_to[7];
            DEP_address_16_to[7] = DEP_address_16_to[6];
            DEP_time_16_to[7] = DEP_time_16_to[6];
            DEP_address_16_to[6] = DEP_address_16_to[5];
            DEP_time_16_to[6] = DEP_time_16_to[5];
            DEP_address_16_to[5] = DEP_address_16_to[4];
            DEP_time_16_to[5] = DEP_time_16_to[4];
            DEP_address_16_to[4] = DEP_address_16_to[3];
            DEP_time_16_to[4] = DEP_time_16_to[3];
            DEP_address_16_to[3] = DEP_address_16_to[2];
            DEP_time_16_to[3] = DEP_time_16_to[2];
            DEP_address_16_to[2] = DEP_address_16_to[1];
            DEP_time_16_to[2] = DEP_time_16_to[1];
            DEP_address_16_to[1] = DEP_address_16_to[0];
            DEP_time_16_to[1] = DEP_time_16_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_104) begin
                DEP_address_16_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_15_address1};
                DEP_time_16_to[0] = $time;
            end else begin
                DEP_address_16_to[0] = {1'b0, 10'b0};
                DEP_time_16_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_16_to[8] = DEP_address_16_to[7];
            DEP_time_16_to[8] = DEP_time_16_to[7];
            DEP_address_16_to[7] = DEP_address_16_to[6];
            DEP_time_16_to[7] = DEP_time_16_to[6];
            DEP_address_16_to[6] = DEP_address_16_to[5];
            DEP_time_16_to[6] = DEP_time_16_to[5];
            DEP_address_16_to[5] = DEP_address_16_to[4];
            DEP_time_16_to[5] = DEP_time_16_to[4];
            DEP_address_16_to[4] = DEP_address_16_to[3];
            DEP_time_16_to[4] = DEP_time_16_to[3];
            DEP_address_16_to[3] = DEP_address_16_to[2];
            DEP_time_16_to[3] = DEP_time_16_to[2];
            DEP_address_16_to[2] = DEP_address_16_to[1];
            DEP_time_16_to[2] = DEP_time_16_to[1];
            DEP_address_16_to[1] = DEP_address_16_to[0];
            DEP_time_16_to[1] = DEP_time_16_to[0];
            DEP_address_16_to[0] = {1'b0, 10'b0};
            DEP_time_16_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_133) begin
                if (DEP_address_16_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_16_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_16_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_15_address0};
                DEP_time_16_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_133) begin
                DEP_i_16 = 0;
                if (DEP_address_16_to[0][10]) begin
                    DEP_error_16 = (DEP_address_16_to[0][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[0][9:0], DEP_time_16_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[1][10]) begin
                    DEP_error_16 = (DEP_address_16_to[1][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[1][9:0], DEP_time_16_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[2][10]) begin
                    DEP_error_16 = (DEP_address_16_to[2][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[2][9:0], DEP_time_16_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[3][10]) begin
                    DEP_error_16 = (DEP_address_16_to[3][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[3][9:0], DEP_time_16_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[4][10]) begin
                    DEP_error_16 = (DEP_address_16_to[4][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[4][9:0], DEP_time_16_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[5][10]) begin
                    DEP_error_16 = (DEP_address_16_to[5][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[5][9:0], DEP_time_16_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[6][10]) begin
                    DEP_error_16 = (DEP_address_16_to[6][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[6][9:0], DEP_time_16_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[7][10]) begin
                    DEP_error_16 = (DEP_address_16_to[7][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[7][9:0], DEP_time_16_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_16_to[8][10]) begin
                    DEP_error_16 = (DEP_address_16_to[8][9:0] == DEP_address_16_from[DEP_i_16][9:0]);
                    if (DEP_error_16) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_15_address0\" = 0x%0h @ \"%0t\"", DEP_address_16_from[DEP_i_16][9:0], DEP_time_16_from[DEP_i_16]);
                        $display("//                : To memory access \"crow_15_address1\" = DEP_address_16_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_16_to[8][9:0], DEP_time_16_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_133"(W:SV14-14) -> "ap_enable_operation_104"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_16_from[DEP_i_16] = {1'b0, 10'b0};
                DEP_time_16_from[DEP_i_16] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_17_to [9 - 1:0];
time DEP_time_17_to [9 - 1:0];
reg [10:0] DEP_address_17_from [1 - 1:0];
time DEP_time_17_from [1 - 1:0];
reg DEP_error_17 = 0;
integer DEP_i_17;

initial begin
    DEP_address_17_to[0] = 0;
    DEP_time_17_to[0] = 0;
    DEP_address_17_to[1] = 0;
    DEP_time_17_to[1] = 0;
    DEP_address_17_to[2] = 0;
    DEP_time_17_to[2] = 0;
    DEP_address_17_to[3] = 0;
    DEP_time_17_to[3] = 0;
    DEP_address_17_to[4] = 0;
    DEP_time_17_to[4] = 0;
    DEP_address_17_to[5] = 0;
    DEP_time_17_to[5] = 0;
    DEP_address_17_to[6] = 0;
    DEP_time_17_to[6] = 0;
    DEP_address_17_to[7] = 0;
    DEP_time_17_to[7] = 0;
    DEP_address_17_to[8] = 0;
    DEP_time_17_to[8] = 0;
    DEP_address_17_from[0] = 0;
    DEP_time_17_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_17_to[8] = DEP_address_17_to[7];
            DEP_time_17_to[8] = DEP_time_17_to[7];
            DEP_address_17_to[7] = DEP_address_17_to[6];
            DEP_time_17_to[7] = DEP_time_17_to[6];
            DEP_address_17_to[6] = DEP_address_17_to[5];
            DEP_time_17_to[6] = DEP_time_17_to[5];
            DEP_address_17_to[5] = DEP_address_17_to[4];
            DEP_time_17_to[5] = DEP_time_17_to[4];
            DEP_address_17_to[4] = DEP_address_17_to[3];
            DEP_time_17_to[4] = DEP_time_17_to[3];
            DEP_address_17_to[3] = DEP_address_17_to[2];
            DEP_time_17_to[3] = DEP_time_17_to[2];
            DEP_address_17_to[2] = DEP_address_17_to[1];
            DEP_time_17_to[2] = DEP_time_17_to[1];
            DEP_address_17_to[1] = DEP_address_17_to[0];
            DEP_time_17_to[1] = DEP_time_17_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_103) begin
                DEP_address_17_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_14_address1};
                DEP_time_17_to[0] = $time;
            end else begin
                DEP_address_17_to[0] = {1'b0, 10'b0};
                DEP_time_17_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_17_to[8] = DEP_address_17_to[7];
            DEP_time_17_to[8] = DEP_time_17_to[7];
            DEP_address_17_to[7] = DEP_address_17_to[6];
            DEP_time_17_to[7] = DEP_time_17_to[6];
            DEP_address_17_to[6] = DEP_address_17_to[5];
            DEP_time_17_to[6] = DEP_time_17_to[5];
            DEP_address_17_to[5] = DEP_address_17_to[4];
            DEP_time_17_to[5] = DEP_time_17_to[4];
            DEP_address_17_to[4] = DEP_address_17_to[3];
            DEP_time_17_to[4] = DEP_time_17_to[3];
            DEP_address_17_to[3] = DEP_address_17_to[2];
            DEP_time_17_to[3] = DEP_time_17_to[2];
            DEP_address_17_to[2] = DEP_address_17_to[1];
            DEP_time_17_to[2] = DEP_time_17_to[1];
            DEP_address_17_to[1] = DEP_address_17_to[0];
            DEP_time_17_to[1] = DEP_time_17_to[0];
            DEP_address_17_to[0] = {1'b0, 10'b0};
            DEP_time_17_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_135) begin
                if (DEP_address_17_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_17_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_17_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_14_address0};
                DEP_time_17_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_135) begin
                DEP_i_17 = 0;
                if (DEP_address_17_to[0][10]) begin
                    DEP_error_17 = (DEP_address_17_to[0][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[0][9:0], DEP_time_17_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[1][10]) begin
                    DEP_error_17 = (DEP_address_17_to[1][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[1][9:0], DEP_time_17_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[2][10]) begin
                    DEP_error_17 = (DEP_address_17_to[2][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[2][9:0], DEP_time_17_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[3][10]) begin
                    DEP_error_17 = (DEP_address_17_to[3][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[3][9:0], DEP_time_17_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[4][10]) begin
                    DEP_error_17 = (DEP_address_17_to[4][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[4][9:0], DEP_time_17_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[5][10]) begin
                    DEP_error_17 = (DEP_address_17_to[5][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[5][9:0], DEP_time_17_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[6][10]) begin
                    DEP_error_17 = (DEP_address_17_to[6][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[6][9:0], DEP_time_17_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[7][10]) begin
                    DEP_error_17 = (DEP_address_17_to[7][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[7][9:0], DEP_time_17_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_17_to[8][10]) begin
                    DEP_error_17 = (DEP_address_17_to[8][9:0] == DEP_address_17_from[DEP_i_17][9:0]);
                    if (DEP_error_17) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_14_address0\" = 0x%0h @ \"%0t\"", DEP_address_17_from[DEP_i_17][9:0], DEP_time_17_from[DEP_i_17]);
                        $display("//                : To memory access \"crow_14_address1\" = DEP_address_17_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_17_to[8][9:0], DEP_time_17_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_135"(W:SV14-14) -> "ap_enable_operation_103"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_17_from[DEP_i_17] = {1'b0, 10'b0};
                DEP_time_17_from[DEP_i_17] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_18_to [9 - 1:0];
time DEP_time_18_to [9 - 1:0];
reg [10:0] DEP_address_18_from [1 - 1:0];
time DEP_time_18_from [1 - 1:0];
reg DEP_error_18 = 0;
integer DEP_i_18;

initial begin
    DEP_address_18_to[0] = 0;
    DEP_time_18_to[0] = 0;
    DEP_address_18_to[1] = 0;
    DEP_time_18_to[1] = 0;
    DEP_address_18_to[2] = 0;
    DEP_time_18_to[2] = 0;
    DEP_address_18_to[3] = 0;
    DEP_time_18_to[3] = 0;
    DEP_address_18_to[4] = 0;
    DEP_time_18_to[4] = 0;
    DEP_address_18_to[5] = 0;
    DEP_time_18_to[5] = 0;
    DEP_address_18_to[6] = 0;
    DEP_time_18_to[6] = 0;
    DEP_address_18_to[7] = 0;
    DEP_time_18_to[7] = 0;
    DEP_address_18_to[8] = 0;
    DEP_time_18_to[8] = 0;
    DEP_address_18_from[0] = 0;
    DEP_time_18_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_18_to[8] = DEP_address_18_to[7];
            DEP_time_18_to[8] = DEP_time_18_to[7];
            DEP_address_18_to[7] = DEP_address_18_to[6];
            DEP_time_18_to[7] = DEP_time_18_to[6];
            DEP_address_18_to[6] = DEP_address_18_to[5];
            DEP_time_18_to[6] = DEP_time_18_to[5];
            DEP_address_18_to[5] = DEP_address_18_to[4];
            DEP_time_18_to[5] = DEP_time_18_to[4];
            DEP_address_18_to[4] = DEP_address_18_to[3];
            DEP_time_18_to[4] = DEP_time_18_to[3];
            DEP_address_18_to[3] = DEP_address_18_to[2];
            DEP_time_18_to[3] = DEP_time_18_to[2];
            DEP_address_18_to[2] = DEP_address_18_to[1];
            DEP_time_18_to[2] = DEP_time_18_to[1];
            DEP_address_18_to[1] = DEP_address_18_to[0];
            DEP_time_18_to[1] = DEP_time_18_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_102) begin
                DEP_address_18_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_13_address1};
                DEP_time_18_to[0] = $time;
            end else begin
                DEP_address_18_to[0] = {1'b0, 10'b0};
                DEP_time_18_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_18_to[8] = DEP_address_18_to[7];
            DEP_time_18_to[8] = DEP_time_18_to[7];
            DEP_address_18_to[7] = DEP_address_18_to[6];
            DEP_time_18_to[7] = DEP_time_18_to[6];
            DEP_address_18_to[6] = DEP_address_18_to[5];
            DEP_time_18_to[6] = DEP_time_18_to[5];
            DEP_address_18_to[5] = DEP_address_18_to[4];
            DEP_time_18_to[5] = DEP_time_18_to[4];
            DEP_address_18_to[4] = DEP_address_18_to[3];
            DEP_time_18_to[4] = DEP_time_18_to[3];
            DEP_address_18_to[3] = DEP_address_18_to[2];
            DEP_time_18_to[3] = DEP_time_18_to[2];
            DEP_address_18_to[2] = DEP_address_18_to[1];
            DEP_time_18_to[2] = DEP_time_18_to[1];
            DEP_address_18_to[1] = DEP_address_18_to[0];
            DEP_time_18_to[1] = DEP_time_18_to[0];
            DEP_address_18_to[0] = {1'b0, 10'b0};
            DEP_time_18_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_137) begin
                if (DEP_address_18_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_18_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_18_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_13_address0};
                DEP_time_18_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_137) begin
                DEP_i_18 = 0;
                if (DEP_address_18_to[0][10]) begin
                    DEP_error_18 = (DEP_address_18_to[0][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[0][9:0], DEP_time_18_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[1][10]) begin
                    DEP_error_18 = (DEP_address_18_to[1][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[1][9:0], DEP_time_18_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[2][10]) begin
                    DEP_error_18 = (DEP_address_18_to[2][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[2][9:0], DEP_time_18_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[3][10]) begin
                    DEP_error_18 = (DEP_address_18_to[3][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[3][9:0], DEP_time_18_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[4][10]) begin
                    DEP_error_18 = (DEP_address_18_to[4][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[4][9:0], DEP_time_18_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[5][10]) begin
                    DEP_error_18 = (DEP_address_18_to[5][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[5][9:0], DEP_time_18_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[6][10]) begin
                    DEP_error_18 = (DEP_address_18_to[6][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[6][9:0], DEP_time_18_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[7][10]) begin
                    DEP_error_18 = (DEP_address_18_to[7][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[7][9:0], DEP_time_18_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_18_to[8][10]) begin
                    DEP_error_18 = (DEP_address_18_to[8][9:0] == DEP_address_18_from[DEP_i_18][9:0]);
                    if (DEP_error_18) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_13_address0\" = 0x%0h @ \"%0t\"", DEP_address_18_from[DEP_i_18][9:0], DEP_time_18_from[DEP_i_18]);
                        $display("//                : To memory access \"crow_13_address1\" = DEP_address_18_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_18_to[8][9:0], DEP_time_18_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_137"(W:SV14-14) -> "ap_enable_operation_102"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_18_from[DEP_i_18] = {1'b0, 10'b0};
                DEP_time_18_from[DEP_i_18] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_19_to [9 - 1:0];
time DEP_time_19_to [9 - 1:0];
reg [10:0] DEP_address_19_from [1 - 1:0];
time DEP_time_19_from [1 - 1:0];
reg DEP_error_19 = 0;
integer DEP_i_19;

initial begin
    DEP_address_19_to[0] = 0;
    DEP_time_19_to[0] = 0;
    DEP_address_19_to[1] = 0;
    DEP_time_19_to[1] = 0;
    DEP_address_19_to[2] = 0;
    DEP_time_19_to[2] = 0;
    DEP_address_19_to[3] = 0;
    DEP_time_19_to[3] = 0;
    DEP_address_19_to[4] = 0;
    DEP_time_19_to[4] = 0;
    DEP_address_19_to[5] = 0;
    DEP_time_19_to[5] = 0;
    DEP_address_19_to[6] = 0;
    DEP_time_19_to[6] = 0;
    DEP_address_19_to[7] = 0;
    DEP_time_19_to[7] = 0;
    DEP_address_19_to[8] = 0;
    DEP_time_19_to[8] = 0;
    DEP_address_19_from[0] = 0;
    DEP_time_19_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_19_to[8] = DEP_address_19_to[7];
            DEP_time_19_to[8] = DEP_time_19_to[7];
            DEP_address_19_to[7] = DEP_address_19_to[6];
            DEP_time_19_to[7] = DEP_time_19_to[6];
            DEP_address_19_to[6] = DEP_address_19_to[5];
            DEP_time_19_to[6] = DEP_time_19_to[5];
            DEP_address_19_to[5] = DEP_address_19_to[4];
            DEP_time_19_to[5] = DEP_time_19_to[4];
            DEP_address_19_to[4] = DEP_address_19_to[3];
            DEP_time_19_to[4] = DEP_time_19_to[3];
            DEP_address_19_to[3] = DEP_address_19_to[2];
            DEP_time_19_to[3] = DEP_time_19_to[2];
            DEP_address_19_to[2] = DEP_address_19_to[1];
            DEP_time_19_to[2] = DEP_time_19_to[1];
            DEP_address_19_to[1] = DEP_address_19_to[0];
            DEP_time_19_to[1] = DEP_time_19_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_101) begin
                DEP_address_19_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_12_address1};
                DEP_time_19_to[0] = $time;
            end else begin
                DEP_address_19_to[0] = {1'b0, 10'b0};
                DEP_time_19_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_19_to[8] = DEP_address_19_to[7];
            DEP_time_19_to[8] = DEP_time_19_to[7];
            DEP_address_19_to[7] = DEP_address_19_to[6];
            DEP_time_19_to[7] = DEP_time_19_to[6];
            DEP_address_19_to[6] = DEP_address_19_to[5];
            DEP_time_19_to[6] = DEP_time_19_to[5];
            DEP_address_19_to[5] = DEP_address_19_to[4];
            DEP_time_19_to[5] = DEP_time_19_to[4];
            DEP_address_19_to[4] = DEP_address_19_to[3];
            DEP_time_19_to[4] = DEP_time_19_to[3];
            DEP_address_19_to[3] = DEP_address_19_to[2];
            DEP_time_19_to[3] = DEP_time_19_to[2];
            DEP_address_19_to[2] = DEP_address_19_to[1];
            DEP_time_19_to[2] = DEP_time_19_to[1];
            DEP_address_19_to[1] = DEP_address_19_to[0];
            DEP_time_19_to[1] = DEP_time_19_to[0];
            DEP_address_19_to[0] = {1'b0, 10'b0};
            DEP_time_19_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_139) begin
                if (DEP_address_19_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_19_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_19_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_12_address0};
                DEP_time_19_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_139) begin
                DEP_i_19 = 0;
                if (DEP_address_19_to[0][10]) begin
                    DEP_error_19 = (DEP_address_19_to[0][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[0][9:0], DEP_time_19_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[1][10]) begin
                    DEP_error_19 = (DEP_address_19_to[1][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[1][9:0], DEP_time_19_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[2][10]) begin
                    DEP_error_19 = (DEP_address_19_to[2][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[2][9:0], DEP_time_19_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[3][10]) begin
                    DEP_error_19 = (DEP_address_19_to[3][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[3][9:0], DEP_time_19_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[4][10]) begin
                    DEP_error_19 = (DEP_address_19_to[4][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[4][9:0], DEP_time_19_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[5][10]) begin
                    DEP_error_19 = (DEP_address_19_to[5][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[5][9:0], DEP_time_19_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[6][10]) begin
                    DEP_error_19 = (DEP_address_19_to[6][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[6][9:0], DEP_time_19_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[7][10]) begin
                    DEP_error_19 = (DEP_address_19_to[7][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[7][9:0], DEP_time_19_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_19_to[8][10]) begin
                    DEP_error_19 = (DEP_address_19_to[8][9:0] == DEP_address_19_from[DEP_i_19][9:0]);
                    if (DEP_error_19) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_12_address0\" = 0x%0h @ \"%0t\"", DEP_address_19_from[DEP_i_19][9:0], DEP_time_19_from[DEP_i_19]);
                        $display("//                : To memory access \"crow_12_address1\" = DEP_address_19_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_19_to[8][9:0], DEP_time_19_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_139"(W:SV14-14) -> "ap_enable_operation_101"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_19_from[DEP_i_19] = {1'b0, 10'b0};
                DEP_time_19_from[DEP_i_19] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_20_to [9 - 1:0];
time DEP_time_20_to [9 - 1:0];
reg [10:0] DEP_address_20_from [1 - 1:0];
time DEP_time_20_from [1 - 1:0];
reg DEP_error_20 = 0;
integer DEP_i_20;

initial begin
    DEP_address_20_to[0] = 0;
    DEP_time_20_to[0] = 0;
    DEP_address_20_to[1] = 0;
    DEP_time_20_to[1] = 0;
    DEP_address_20_to[2] = 0;
    DEP_time_20_to[2] = 0;
    DEP_address_20_to[3] = 0;
    DEP_time_20_to[3] = 0;
    DEP_address_20_to[4] = 0;
    DEP_time_20_to[4] = 0;
    DEP_address_20_to[5] = 0;
    DEP_time_20_to[5] = 0;
    DEP_address_20_to[6] = 0;
    DEP_time_20_to[6] = 0;
    DEP_address_20_to[7] = 0;
    DEP_time_20_to[7] = 0;
    DEP_address_20_to[8] = 0;
    DEP_time_20_to[8] = 0;
    DEP_address_20_from[0] = 0;
    DEP_time_20_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_20_to[8] = DEP_address_20_to[7];
            DEP_time_20_to[8] = DEP_time_20_to[7];
            DEP_address_20_to[7] = DEP_address_20_to[6];
            DEP_time_20_to[7] = DEP_time_20_to[6];
            DEP_address_20_to[6] = DEP_address_20_to[5];
            DEP_time_20_to[6] = DEP_time_20_to[5];
            DEP_address_20_to[5] = DEP_address_20_to[4];
            DEP_time_20_to[5] = DEP_time_20_to[4];
            DEP_address_20_to[4] = DEP_address_20_to[3];
            DEP_time_20_to[4] = DEP_time_20_to[3];
            DEP_address_20_to[3] = DEP_address_20_to[2];
            DEP_time_20_to[3] = DEP_time_20_to[2];
            DEP_address_20_to[2] = DEP_address_20_to[1];
            DEP_time_20_to[2] = DEP_time_20_to[1];
            DEP_address_20_to[1] = DEP_address_20_to[0];
            DEP_time_20_to[1] = DEP_time_20_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_100) begin
                DEP_address_20_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_11_address1};
                DEP_time_20_to[0] = $time;
            end else begin
                DEP_address_20_to[0] = {1'b0, 10'b0};
                DEP_time_20_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_20_to[8] = DEP_address_20_to[7];
            DEP_time_20_to[8] = DEP_time_20_to[7];
            DEP_address_20_to[7] = DEP_address_20_to[6];
            DEP_time_20_to[7] = DEP_time_20_to[6];
            DEP_address_20_to[6] = DEP_address_20_to[5];
            DEP_time_20_to[6] = DEP_time_20_to[5];
            DEP_address_20_to[5] = DEP_address_20_to[4];
            DEP_time_20_to[5] = DEP_time_20_to[4];
            DEP_address_20_to[4] = DEP_address_20_to[3];
            DEP_time_20_to[4] = DEP_time_20_to[3];
            DEP_address_20_to[3] = DEP_address_20_to[2];
            DEP_time_20_to[3] = DEP_time_20_to[2];
            DEP_address_20_to[2] = DEP_address_20_to[1];
            DEP_time_20_to[2] = DEP_time_20_to[1];
            DEP_address_20_to[1] = DEP_address_20_to[0];
            DEP_time_20_to[1] = DEP_time_20_to[0];
            DEP_address_20_to[0] = {1'b0, 10'b0};
            DEP_time_20_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_141) begin
                if (DEP_address_20_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_20_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_20_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_11_address0};
                DEP_time_20_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_141) begin
                DEP_i_20 = 0;
                if (DEP_address_20_to[0][10]) begin
                    DEP_error_20 = (DEP_address_20_to[0][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[0][9:0], DEP_time_20_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[1][10]) begin
                    DEP_error_20 = (DEP_address_20_to[1][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[1][9:0], DEP_time_20_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[2][10]) begin
                    DEP_error_20 = (DEP_address_20_to[2][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[2][9:0], DEP_time_20_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[3][10]) begin
                    DEP_error_20 = (DEP_address_20_to[3][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[3][9:0], DEP_time_20_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[4][10]) begin
                    DEP_error_20 = (DEP_address_20_to[4][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[4][9:0], DEP_time_20_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[5][10]) begin
                    DEP_error_20 = (DEP_address_20_to[5][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[5][9:0], DEP_time_20_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[6][10]) begin
                    DEP_error_20 = (DEP_address_20_to[6][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[6][9:0], DEP_time_20_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[7][10]) begin
                    DEP_error_20 = (DEP_address_20_to[7][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[7][9:0], DEP_time_20_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_20_to[8][10]) begin
                    DEP_error_20 = (DEP_address_20_to[8][9:0] == DEP_address_20_from[DEP_i_20][9:0]);
                    if (DEP_error_20) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_11_address0\" = 0x%0h @ \"%0t\"", DEP_address_20_from[DEP_i_20][9:0], DEP_time_20_from[DEP_i_20]);
                        $display("//                : To memory access \"crow_11_address1\" = DEP_address_20_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_20_to[8][9:0], DEP_time_20_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_141"(W:SV14-14) -> "ap_enable_operation_100"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_20_from[DEP_i_20] = {1'b0, 10'b0};
                DEP_time_20_from[DEP_i_20] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_21_to [9 - 1:0];
time DEP_time_21_to [9 - 1:0];
reg [10:0] DEP_address_21_from [1 - 1:0];
time DEP_time_21_from [1 - 1:0];
reg DEP_error_21 = 0;
integer DEP_i_21;

initial begin
    DEP_address_21_to[0] = 0;
    DEP_time_21_to[0] = 0;
    DEP_address_21_to[1] = 0;
    DEP_time_21_to[1] = 0;
    DEP_address_21_to[2] = 0;
    DEP_time_21_to[2] = 0;
    DEP_address_21_to[3] = 0;
    DEP_time_21_to[3] = 0;
    DEP_address_21_to[4] = 0;
    DEP_time_21_to[4] = 0;
    DEP_address_21_to[5] = 0;
    DEP_time_21_to[5] = 0;
    DEP_address_21_to[6] = 0;
    DEP_time_21_to[6] = 0;
    DEP_address_21_to[7] = 0;
    DEP_time_21_to[7] = 0;
    DEP_address_21_to[8] = 0;
    DEP_time_21_to[8] = 0;
    DEP_address_21_from[0] = 0;
    DEP_time_21_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_21_to[8] = DEP_address_21_to[7];
            DEP_time_21_to[8] = DEP_time_21_to[7];
            DEP_address_21_to[7] = DEP_address_21_to[6];
            DEP_time_21_to[7] = DEP_time_21_to[6];
            DEP_address_21_to[6] = DEP_address_21_to[5];
            DEP_time_21_to[6] = DEP_time_21_to[5];
            DEP_address_21_to[5] = DEP_address_21_to[4];
            DEP_time_21_to[5] = DEP_time_21_to[4];
            DEP_address_21_to[4] = DEP_address_21_to[3];
            DEP_time_21_to[4] = DEP_time_21_to[3];
            DEP_address_21_to[3] = DEP_address_21_to[2];
            DEP_time_21_to[3] = DEP_time_21_to[2];
            DEP_address_21_to[2] = DEP_address_21_to[1];
            DEP_time_21_to[2] = DEP_time_21_to[1];
            DEP_address_21_to[1] = DEP_address_21_to[0];
            DEP_time_21_to[1] = DEP_time_21_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_99) begin
                DEP_address_21_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_10_address1};
                DEP_time_21_to[0] = $time;
            end else begin
                DEP_address_21_to[0] = {1'b0, 10'b0};
                DEP_time_21_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_21_to[8] = DEP_address_21_to[7];
            DEP_time_21_to[8] = DEP_time_21_to[7];
            DEP_address_21_to[7] = DEP_address_21_to[6];
            DEP_time_21_to[7] = DEP_time_21_to[6];
            DEP_address_21_to[6] = DEP_address_21_to[5];
            DEP_time_21_to[6] = DEP_time_21_to[5];
            DEP_address_21_to[5] = DEP_address_21_to[4];
            DEP_time_21_to[5] = DEP_time_21_to[4];
            DEP_address_21_to[4] = DEP_address_21_to[3];
            DEP_time_21_to[4] = DEP_time_21_to[3];
            DEP_address_21_to[3] = DEP_address_21_to[2];
            DEP_time_21_to[3] = DEP_time_21_to[2];
            DEP_address_21_to[2] = DEP_address_21_to[1];
            DEP_time_21_to[2] = DEP_time_21_to[1];
            DEP_address_21_to[1] = DEP_address_21_to[0];
            DEP_time_21_to[1] = DEP_time_21_to[0];
            DEP_address_21_to[0] = {1'b0, 10'b0};
            DEP_time_21_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_143) begin
                if (DEP_address_21_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_21_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_21_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_10_address0};
                DEP_time_21_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_143) begin
                DEP_i_21 = 0;
                if (DEP_address_21_to[0][10]) begin
                    DEP_error_21 = (DEP_address_21_to[0][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[0][9:0], DEP_time_21_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[1][10]) begin
                    DEP_error_21 = (DEP_address_21_to[1][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[1][9:0], DEP_time_21_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[2][10]) begin
                    DEP_error_21 = (DEP_address_21_to[2][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[2][9:0], DEP_time_21_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[3][10]) begin
                    DEP_error_21 = (DEP_address_21_to[3][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[3][9:0], DEP_time_21_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[4][10]) begin
                    DEP_error_21 = (DEP_address_21_to[4][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[4][9:0], DEP_time_21_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[5][10]) begin
                    DEP_error_21 = (DEP_address_21_to[5][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[5][9:0], DEP_time_21_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[6][10]) begin
                    DEP_error_21 = (DEP_address_21_to[6][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[6][9:0], DEP_time_21_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[7][10]) begin
                    DEP_error_21 = (DEP_address_21_to[7][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[7][9:0], DEP_time_21_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_21_to[8][10]) begin
                    DEP_error_21 = (DEP_address_21_to[8][9:0] == DEP_address_21_from[DEP_i_21][9:0]);
                    if (DEP_error_21) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_10_address0\" = 0x%0h @ \"%0t\"", DEP_address_21_from[DEP_i_21][9:0], DEP_time_21_from[DEP_i_21]);
                        $display("//                : To memory access \"crow_10_address1\" = DEP_address_21_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_21_to[8][9:0], DEP_time_21_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_143"(W:SV14-14) -> "ap_enable_operation_99"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_21_from[DEP_i_21] = {1'b0, 10'b0};
                DEP_time_21_from[DEP_i_21] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_22_to [9 - 1:0];
time DEP_time_22_to [9 - 1:0];
reg [10:0] DEP_address_22_from [1 - 1:0];
time DEP_time_22_from [1 - 1:0];
reg DEP_error_22 = 0;
integer DEP_i_22;

initial begin
    DEP_address_22_to[0] = 0;
    DEP_time_22_to[0] = 0;
    DEP_address_22_to[1] = 0;
    DEP_time_22_to[1] = 0;
    DEP_address_22_to[2] = 0;
    DEP_time_22_to[2] = 0;
    DEP_address_22_to[3] = 0;
    DEP_time_22_to[3] = 0;
    DEP_address_22_to[4] = 0;
    DEP_time_22_to[4] = 0;
    DEP_address_22_to[5] = 0;
    DEP_time_22_to[5] = 0;
    DEP_address_22_to[6] = 0;
    DEP_time_22_to[6] = 0;
    DEP_address_22_to[7] = 0;
    DEP_time_22_to[7] = 0;
    DEP_address_22_to[8] = 0;
    DEP_time_22_to[8] = 0;
    DEP_address_22_from[0] = 0;
    DEP_time_22_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_22_to[8] = DEP_address_22_to[7];
            DEP_time_22_to[8] = DEP_time_22_to[7];
            DEP_address_22_to[7] = DEP_address_22_to[6];
            DEP_time_22_to[7] = DEP_time_22_to[6];
            DEP_address_22_to[6] = DEP_address_22_to[5];
            DEP_time_22_to[6] = DEP_time_22_to[5];
            DEP_address_22_to[5] = DEP_address_22_to[4];
            DEP_time_22_to[5] = DEP_time_22_to[4];
            DEP_address_22_to[4] = DEP_address_22_to[3];
            DEP_time_22_to[4] = DEP_time_22_to[3];
            DEP_address_22_to[3] = DEP_address_22_to[2];
            DEP_time_22_to[3] = DEP_time_22_to[2];
            DEP_address_22_to[2] = DEP_address_22_to[1];
            DEP_time_22_to[2] = DEP_time_22_to[1];
            DEP_address_22_to[1] = DEP_address_22_to[0];
            DEP_time_22_to[1] = DEP_time_22_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_98) begin
                DEP_address_22_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_9_address1};
                DEP_time_22_to[0] = $time;
            end else begin
                DEP_address_22_to[0] = {1'b0, 10'b0};
                DEP_time_22_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_22_to[8] = DEP_address_22_to[7];
            DEP_time_22_to[8] = DEP_time_22_to[7];
            DEP_address_22_to[7] = DEP_address_22_to[6];
            DEP_time_22_to[7] = DEP_time_22_to[6];
            DEP_address_22_to[6] = DEP_address_22_to[5];
            DEP_time_22_to[6] = DEP_time_22_to[5];
            DEP_address_22_to[5] = DEP_address_22_to[4];
            DEP_time_22_to[5] = DEP_time_22_to[4];
            DEP_address_22_to[4] = DEP_address_22_to[3];
            DEP_time_22_to[4] = DEP_time_22_to[3];
            DEP_address_22_to[3] = DEP_address_22_to[2];
            DEP_time_22_to[3] = DEP_time_22_to[2];
            DEP_address_22_to[2] = DEP_address_22_to[1];
            DEP_time_22_to[2] = DEP_time_22_to[1];
            DEP_address_22_to[1] = DEP_address_22_to[0];
            DEP_time_22_to[1] = DEP_time_22_to[0];
            DEP_address_22_to[0] = {1'b0, 10'b0};
            DEP_time_22_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_145) begin
                if (DEP_address_22_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_22_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_22_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_9_address0};
                DEP_time_22_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_145) begin
                DEP_i_22 = 0;
                if (DEP_address_22_to[0][10]) begin
                    DEP_error_22 = (DEP_address_22_to[0][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[0][9:0], DEP_time_22_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[1][10]) begin
                    DEP_error_22 = (DEP_address_22_to[1][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[1][9:0], DEP_time_22_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[2][10]) begin
                    DEP_error_22 = (DEP_address_22_to[2][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[2][9:0], DEP_time_22_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[3][10]) begin
                    DEP_error_22 = (DEP_address_22_to[3][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[3][9:0], DEP_time_22_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[4][10]) begin
                    DEP_error_22 = (DEP_address_22_to[4][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[4][9:0], DEP_time_22_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[5][10]) begin
                    DEP_error_22 = (DEP_address_22_to[5][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[5][9:0], DEP_time_22_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[6][10]) begin
                    DEP_error_22 = (DEP_address_22_to[6][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[6][9:0], DEP_time_22_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[7][10]) begin
                    DEP_error_22 = (DEP_address_22_to[7][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[7][9:0], DEP_time_22_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_22_to[8][10]) begin
                    DEP_error_22 = (DEP_address_22_to[8][9:0] == DEP_address_22_from[DEP_i_22][9:0]);
                    if (DEP_error_22) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_9_address0\" = 0x%0h @ \"%0t\"", DEP_address_22_from[DEP_i_22][9:0], DEP_time_22_from[DEP_i_22]);
                        $display("//                : To memory access \"crow_9_address1\" = DEP_address_22_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_22_to[8][9:0], DEP_time_22_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_145"(W:SV14-14) -> "ap_enable_operation_98"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_22_from[DEP_i_22] = {1'b0, 10'b0};
                DEP_time_22_from[DEP_i_22] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_23_to [9 - 1:0];
time DEP_time_23_to [9 - 1:0];
reg [10:0] DEP_address_23_from [1 - 1:0];
time DEP_time_23_from [1 - 1:0];
reg DEP_error_23 = 0;
integer DEP_i_23;

initial begin
    DEP_address_23_to[0] = 0;
    DEP_time_23_to[0] = 0;
    DEP_address_23_to[1] = 0;
    DEP_time_23_to[1] = 0;
    DEP_address_23_to[2] = 0;
    DEP_time_23_to[2] = 0;
    DEP_address_23_to[3] = 0;
    DEP_time_23_to[3] = 0;
    DEP_address_23_to[4] = 0;
    DEP_time_23_to[4] = 0;
    DEP_address_23_to[5] = 0;
    DEP_time_23_to[5] = 0;
    DEP_address_23_to[6] = 0;
    DEP_time_23_to[6] = 0;
    DEP_address_23_to[7] = 0;
    DEP_time_23_to[7] = 0;
    DEP_address_23_to[8] = 0;
    DEP_time_23_to[8] = 0;
    DEP_address_23_from[0] = 0;
    DEP_time_23_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_23_to[8] = DEP_address_23_to[7];
            DEP_time_23_to[8] = DEP_time_23_to[7];
            DEP_address_23_to[7] = DEP_address_23_to[6];
            DEP_time_23_to[7] = DEP_time_23_to[6];
            DEP_address_23_to[6] = DEP_address_23_to[5];
            DEP_time_23_to[6] = DEP_time_23_to[5];
            DEP_address_23_to[5] = DEP_address_23_to[4];
            DEP_time_23_to[5] = DEP_time_23_to[4];
            DEP_address_23_to[4] = DEP_address_23_to[3];
            DEP_time_23_to[4] = DEP_time_23_to[3];
            DEP_address_23_to[3] = DEP_address_23_to[2];
            DEP_time_23_to[3] = DEP_time_23_to[2];
            DEP_address_23_to[2] = DEP_address_23_to[1];
            DEP_time_23_to[2] = DEP_time_23_to[1];
            DEP_address_23_to[1] = DEP_address_23_to[0];
            DEP_time_23_to[1] = DEP_time_23_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_97) begin
                DEP_address_23_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_8_address1};
                DEP_time_23_to[0] = $time;
            end else begin
                DEP_address_23_to[0] = {1'b0, 10'b0};
                DEP_time_23_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_23_to[8] = DEP_address_23_to[7];
            DEP_time_23_to[8] = DEP_time_23_to[7];
            DEP_address_23_to[7] = DEP_address_23_to[6];
            DEP_time_23_to[7] = DEP_time_23_to[6];
            DEP_address_23_to[6] = DEP_address_23_to[5];
            DEP_time_23_to[6] = DEP_time_23_to[5];
            DEP_address_23_to[5] = DEP_address_23_to[4];
            DEP_time_23_to[5] = DEP_time_23_to[4];
            DEP_address_23_to[4] = DEP_address_23_to[3];
            DEP_time_23_to[4] = DEP_time_23_to[3];
            DEP_address_23_to[3] = DEP_address_23_to[2];
            DEP_time_23_to[3] = DEP_time_23_to[2];
            DEP_address_23_to[2] = DEP_address_23_to[1];
            DEP_time_23_to[2] = DEP_time_23_to[1];
            DEP_address_23_to[1] = DEP_address_23_to[0];
            DEP_time_23_to[1] = DEP_time_23_to[0];
            DEP_address_23_to[0] = {1'b0, 10'b0};
            DEP_time_23_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_147) begin
                if (DEP_address_23_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_23_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_23_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_8_address0};
                DEP_time_23_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_147) begin
                DEP_i_23 = 0;
                if (DEP_address_23_to[0][10]) begin
                    DEP_error_23 = (DEP_address_23_to[0][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[0][9:0], DEP_time_23_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[1][10]) begin
                    DEP_error_23 = (DEP_address_23_to[1][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[1][9:0], DEP_time_23_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[2][10]) begin
                    DEP_error_23 = (DEP_address_23_to[2][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[2][9:0], DEP_time_23_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[3][10]) begin
                    DEP_error_23 = (DEP_address_23_to[3][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[3][9:0], DEP_time_23_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[4][10]) begin
                    DEP_error_23 = (DEP_address_23_to[4][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[4][9:0], DEP_time_23_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[5][10]) begin
                    DEP_error_23 = (DEP_address_23_to[5][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[5][9:0], DEP_time_23_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[6][10]) begin
                    DEP_error_23 = (DEP_address_23_to[6][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[6][9:0], DEP_time_23_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[7][10]) begin
                    DEP_error_23 = (DEP_address_23_to[7][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[7][9:0], DEP_time_23_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_23_to[8][10]) begin
                    DEP_error_23 = (DEP_address_23_to[8][9:0] == DEP_address_23_from[DEP_i_23][9:0]);
                    if (DEP_error_23) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_8_address0\" = 0x%0h @ \"%0t\"", DEP_address_23_from[DEP_i_23][9:0], DEP_time_23_from[DEP_i_23]);
                        $display("//                : To memory access \"crow_8_address1\" = DEP_address_23_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_23_to[8][9:0], DEP_time_23_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_147"(W:SV14-14) -> "ap_enable_operation_97"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_23_from[DEP_i_23] = {1'b0, 10'b0};
                DEP_time_23_from[DEP_i_23] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_24_to [9 - 1:0];
time DEP_time_24_to [9 - 1:0];
reg [10:0] DEP_address_24_from [1 - 1:0];
time DEP_time_24_from [1 - 1:0];
reg DEP_error_24 = 0;
integer DEP_i_24;

initial begin
    DEP_address_24_to[0] = 0;
    DEP_time_24_to[0] = 0;
    DEP_address_24_to[1] = 0;
    DEP_time_24_to[1] = 0;
    DEP_address_24_to[2] = 0;
    DEP_time_24_to[2] = 0;
    DEP_address_24_to[3] = 0;
    DEP_time_24_to[3] = 0;
    DEP_address_24_to[4] = 0;
    DEP_time_24_to[4] = 0;
    DEP_address_24_to[5] = 0;
    DEP_time_24_to[5] = 0;
    DEP_address_24_to[6] = 0;
    DEP_time_24_to[6] = 0;
    DEP_address_24_to[7] = 0;
    DEP_time_24_to[7] = 0;
    DEP_address_24_to[8] = 0;
    DEP_time_24_to[8] = 0;
    DEP_address_24_from[0] = 0;
    DEP_time_24_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_24_to[8] = DEP_address_24_to[7];
            DEP_time_24_to[8] = DEP_time_24_to[7];
            DEP_address_24_to[7] = DEP_address_24_to[6];
            DEP_time_24_to[7] = DEP_time_24_to[6];
            DEP_address_24_to[6] = DEP_address_24_to[5];
            DEP_time_24_to[6] = DEP_time_24_to[5];
            DEP_address_24_to[5] = DEP_address_24_to[4];
            DEP_time_24_to[5] = DEP_time_24_to[4];
            DEP_address_24_to[4] = DEP_address_24_to[3];
            DEP_time_24_to[4] = DEP_time_24_to[3];
            DEP_address_24_to[3] = DEP_address_24_to[2];
            DEP_time_24_to[3] = DEP_time_24_to[2];
            DEP_address_24_to[2] = DEP_address_24_to[1];
            DEP_time_24_to[2] = DEP_time_24_to[1];
            DEP_address_24_to[1] = DEP_address_24_to[0];
            DEP_time_24_to[1] = DEP_time_24_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_96) begin
                DEP_address_24_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_7_address1};
                DEP_time_24_to[0] = $time;
            end else begin
                DEP_address_24_to[0] = {1'b0, 10'b0};
                DEP_time_24_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_24_to[8] = DEP_address_24_to[7];
            DEP_time_24_to[8] = DEP_time_24_to[7];
            DEP_address_24_to[7] = DEP_address_24_to[6];
            DEP_time_24_to[7] = DEP_time_24_to[6];
            DEP_address_24_to[6] = DEP_address_24_to[5];
            DEP_time_24_to[6] = DEP_time_24_to[5];
            DEP_address_24_to[5] = DEP_address_24_to[4];
            DEP_time_24_to[5] = DEP_time_24_to[4];
            DEP_address_24_to[4] = DEP_address_24_to[3];
            DEP_time_24_to[4] = DEP_time_24_to[3];
            DEP_address_24_to[3] = DEP_address_24_to[2];
            DEP_time_24_to[3] = DEP_time_24_to[2];
            DEP_address_24_to[2] = DEP_address_24_to[1];
            DEP_time_24_to[2] = DEP_time_24_to[1];
            DEP_address_24_to[1] = DEP_address_24_to[0];
            DEP_time_24_to[1] = DEP_time_24_to[0];
            DEP_address_24_to[0] = {1'b0, 10'b0};
            DEP_time_24_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_149) begin
                if (DEP_address_24_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_24_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_24_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_7_address0};
                DEP_time_24_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_149) begin
                DEP_i_24 = 0;
                if (DEP_address_24_to[0][10]) begin
                    DEP_error_24 = (DEP_address_24_to[0][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[0][9:0], DEP_time_24_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[1][10]) begin
                    DEP_error_24 = (DEP_address_24_to[1][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[1][9:0], DEP_time_24_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[2][10]) begin
                    DEP_error_24 = (DEP_address_24_to[2][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[2][9:0], DEP_time_24_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[3][10]) begin
                    DEP_error_24 = (DEP_address_24_to[3][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[3][9:0], DEP_time_24_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[4][10]) begin
                    DEP_error_24 = (DEP_address_24_to[4][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[4][9:0], DEP_time_24_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[5][10]) begin
                    DEP_error_24 = (DEP_address_24_to[5][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[5][9:0], DEP_time_24_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[6][10]) begin
                    DEP_error_24 = (DEP_address_24_to[6][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[6][9:0], DEP_time_24_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[7][10]) begin
                    DEP_error_24 = (DEP_address_24_to[7][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[7][9:0], DEP_time_24_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_24_to[8][10]) begin
                    DEP_error_24 = (DEP_address_24_to[8][9:0] == DEP_address_24_from[DEP_i_24][9:0]);
                    if (DEP_error_24) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_7_address0\" = 0x%0h @ \"%0t\"", DEP_address_24_from[DEP_i_24][9:0], DEP_time_24_from[DEP_i_24]);
                        $display("//                : To memory access \"crow_7_address1\" = DEP_address_24_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_24_to[8][9:0], DEP_time_24_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_149"(W:SV14-14) -> "ap_enable_operation_96"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_24_from[DEP_i_24] = {1'b0, 10'b0};
                DEP_time_24_from[DEP_i_24] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_25_to [9 - 1:0];
time DEP_time_25_to [9 - 1:0];
reg [10:0] DEP_address_25_from [1 - 1:0];
time DEP_time_25_from [1 - 1:0];
reg DEP_error_25 = 0;
integer DEP_i_25;

initial begin
    DEP_address_25_to[0] = 0;
    DEP_time_25_to[0] = 0;
    DEP_address_25_to[1] = 0;
    DEP_time_25_to[1] = 0;
    DEP_address_25_to[2] = 0;
    DEP_time_25_to[2] = 0;
    DEP_address_25_to[3] = 0;
    DEP_time_25_to[3] = 0;
    DEP_address_25_to[4] = 0;
    DEP_time_25_to[4] = 0;
    DEP_address_25_to[5] = 0;
    DEP_time_25_to[5] = 0;
    DEP_address_25_to[6] = 0;
    DEP_time_25_to[6] = 0;
    DEP_address_25_to[7] = 0;
    DEP_time_25_to[7] = 0;
    DEP_address_25_to[8] = 0;
    DEP_time_25_to[8] = 0;
    DEP_address_25_from[0] = 0;
    DEP_time_25_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_25_to[8] = DEP_address_25_to[7];
            DEP_time_25_to[8] = DEP_time_25_to[7];
            DEP_address_25_to[7] = DEP_address_25_to[6];
            DEP_time_25_to[7] = DEP_time_25_to[6];
            DEP_address_25_to[6] = DEP_address_25_to[5];
            DEP_time_25_to[6] = DEP_time_25_to[5];
            DEP_address_25_to[5] = DEP_address_25_to[4];
            DEP_time_25_to[5] = DEP_time_25_to[4];
            DEP_address_25_to[4] = DEP_address_25_to[3];
            DEP_time_25_to[4] = DEP_time_25_to[3];
            DEP_address_25_to[3] = DEP_address_25_to[2];
            DEP_time_25_to[3] = DEP_time_25_to[2];
            DEP_address_25_to[2] = DEP_address_25_to[1];
            DEP_time_25_to[2] = DEP_time_25_to[1];
            DEP_address_25_to[1] = DEP_address_25_to[0];
            DEP_time_25_to[1] = DEP_time_25_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_95) begin
                DEP_address_25_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_6_address1};
                DEP_time_25_to[0] = $time;
            end else begin
                DEP_address_25_to[0] = {1'b0, 10'b0};
                DEP_time_25_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_25_to[8] = DEP_address_25_to[7];
            DEP_time_25_to[8] = DEP_time_25_to[7];
            DEP_address_25_to[7] = DEP_address_25_to[6];
            DEP_time_25_to[7] = DEP_time_25_to[6];
            DEP_address_25_to[6] = DEP_address_25_to[5];
            DEP_time_25_to[6] = DEP_time_25_to[5];
            DEP_address_25_to[5] = DEP_address_25_to[4];
            DEP_time_25_to[5] = DEP_time_25_to[4];
            DEP_address_25_to[4] = DEP_address_25_to[3];
            DEP_time_25_to[4] = DEP_time_25_to[3];
            DEP_address_25_to[3] = DEP_address_25_to[2];
            DEP_time_25_to[3] = DEP_time_25_to[2];
            DEP_address_25_to[2] = DEP_address_25_to[1];
            DEP_time_25_to[2] = DEP_time_25_to[1];
            DEP_address_25_to[1] = DEP_address_25_to[0];
            DEP_time_25_to[1] = DEP_time_25_to[0];
            DEP_address_25_to[0] = {1'b0, 10'b0};
            DEP_time_25_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_151) begin
                if (DEP_address_25_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_25_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_25_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_6_address0};
                DEP_time_25_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_151) begin
                DEP_i_25 = 0;
                if (DEP_address_25_to[0][10]) begin
                    DEP_error_25 = (DEP_address_25_to[0][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[0][9:0], DEP_time_25_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[1][10]) begin
                    DEP_error_25 = (DEP_address_25_to[1][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[1][9:0], DEP_time_25_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[2][10]) begin
                    DEP_error_25 = (DEP_address_25_to[2][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[2][9:0], DEP_time_25_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[3][10]) begin
                    DEP_error_25 = (DEP_address_25_to[3][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[3][9:0], DEP_time_25_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[4][10]) begin
                    DEP_error_25 = (DEP_address_25_to[4][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[4][9:0], DEP_time_25_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[5][10]) begin
                    DEP_error_25 = (DEP_address_25_to[5][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[5][9:0], DEP_time_25_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[6][10]) begin
                    DEP_error_25 = (DEP_address_25_to[6][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[6][9:0], DEP_time_25_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[7][10]) begin
                    DEP_error_25 = (DEP_address_25_to[7][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[7][9:0], DEP_time_25_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_25_to[8][10]) begin
                    DEP_error_25 = (DEP_address_25_to[8][9:0] == DEP_address_25_from[DEP_i_25][9:0]);
                    if (DEP_error_25) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_6_address0\" = 0x%0h @ \"%0t\"", DEP_address_25_from[DEP_i_25][9:0], DEP_time_25_from[DEP_i_25]);
                        $display("//                : To memory access \"crow_6_address1\" = DEP_address_25_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_25_to[8][9:0], DEP_time_25_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_151"(W:SV14-14) -> "ap_enable_operation_95"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_25_from[DEP_i_25] = {1'b0, 10'b0};
                DEP_time_25_from[DEP_i_25] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_26_to [9 - 1:0];
time DEP_time_26_to [9 - 1:0];
reg [10:0] DEP_address_26_from [1 - 1:0];
time DEP_time_26_from [1 - 1:0];
reg DEP_error_26 = 0;
integer DEP_i_26;

initial begin
    DEP_address_26_to[0] = 0;
    DEP_time_26_to[0] = 0;
    DEP_address_26_to[1] = 0;
    DEP_time_26_to[1] = 0;
    DEP_address_26_to[2] = 0;
    DEP_time_26_to[2] = 0;
    DEP_address_26_to[3] = 0;
    DEP_time_26_to[3] = 0;
    DEP_address_26_to[4] = 0;
    DEP_time_26_to[4] = 0;
    DEP_address_26_to[5] = 0;
    DEP_time_26_to[5] = 0;
    DEP_address_26_to[6] = 0;
    DEP_time_26_to[6] = 0;
    DEP_address_26_to[7] = 0;
    DEP_time_26_to[7] = 0;
    DEP_address_26_to[8] = 0;
    DEP_time_26_to[8] = 0;
    DEP_address_26_from[0] = 0;
    DEP_time_26_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_26_to[8] = DEP_address_26_to[7];
            DEP_time_26_to[8] = DEP_time_26_to[7];
            DEP_address_26_to[7] = DEP_address_26_to[6];
            DEP_time_26_to[7] = DEP_time_26_to[6];
            DEP_address_26_to[6] = DEP_address_26_to[5];
            DEP_time_26_to[6] = DEP_time_26_to[5];
            DEP_address_26_to[5] = DEP_address_26_to[4];
            DEP_time_26_to[5] = DEP_time_26_to[4];
            DEP_address_26_to[4] = DEP_address_26_to[3];
            DEP_time_26_to[4] = DEP_time_26_to[3];
            DEP_address_26_to[3] = DEP_address_26_to[2];
            DEP_time_26_to[3] = DEP_time_26_to[2];
            DEP_address_26_to[2] = DEP_address_26_to[1];
            DEP_time_26_to[2] = DEP_time_26_to[1];
            DEP_address_26_to[1] = DEP_address_26_to[0];
            DEP_time_26_to[1] = DEP_time_26_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_94) begin
                DEP_address_26_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_5_address1};
                DEP_time_26_to[0] = $time;
            end else begin
                DEP_address_26_to[0] = {1'b0, 10'b0};
                DEP_time_26_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_26_to[8] = DEP_address_26_to[7];
            DEP_time_26_to[8] = DEP_time_26_to[7];
            DEP_address_26_to[7] = DEP_address_26_to[6];
            DEP_time_26_to[7] = DEP_time_26_to[6];
            DEP_address_26_to[6] = DEP_address_26_to[5];
            DEP_time_26_to[6] = DEP_time_26_to[5];
            DEP_address_26_to[5] = DEP_address_26_to[4];
            DEP_time_26_to[5] = DEP_time_26_to[4];
            DEP_address_26_to[4] = DEP_address_26_to[3];
            DEP_time_26_to[4] = DEP_time_26_to[3];
            DEP_address_26_to[3] = DEP_address_26_to[2];
            DEP_time_26_to[3] = DEP_time_26_to[2];
            DEP_address_26_to[2] = DEP_address_26_to[1];
            DEP_time_26_to[2] = DEP_time_26_to[1];
            DEP_address_26_to[1] = DEP_address_26_to[0];
            DEP_time_26_to[1] = DEP_time_26_to[0];
            DEP_address_26_to[0] = {1'b0, 10'b0};
            DEP_time_26_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_153) begin
                if (DEP_address_26_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_26_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_26_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_5_address0};
                DEP_time_26_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_153) begin
                DEP_i_26 = 0;
                if (DEP_address_26_to[0][10]) begin
                    DEP_error_26 = (DEP_address_26_to[0][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[0][9:0], DEP_time_26_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[1][10]) begin
                    DEP_error_26 = (DEP_address_26_to[1][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[1][9:0], DEP_time_26_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[2][10]) begin
                    DEP_error_26 = (DEP_address_26_to[2][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[2][9:0], DEP_time_26_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[3][10]) begin
                    DEP_error_26 = (DEP_address_26_to[3][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[3][9:0], DEP_time_26_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[4][10]) begin
                    DEP_error_26 = (DEP_address_26_to[4][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[4][9:0], DEP_time_26_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[5][10]) begin
                    DEP_error_26 = (DEP_address_26_to[5][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[5][9:0], DEP_time_26_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[6][10]) begin
                    DEP_error_26 = (DEP_address_26_to[6][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[6][9:0], DEP_time_26_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[7][10]) begin
                    DEP_error_26 = (DEP_address_26_to[7][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[7][9:0], DEP_time_26_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_26_to[8][10]) begin
                    DEP_error_26 = (DEP_address_26_to[8][9:0] == DEP_address_26_from[DEP_i_26][9:0]);
                    if (DEP_error_26) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_5_address0\" = 0x%0h @ \"%0t\"", DEP_address_26_from[DEP_i_26][9:0], DEP_time_26_from[DEP_i_26]);
                        $display("//                : To memory access \"crow_5_address1\" = DEP_address_26_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_26_to[8][9:0], DEP_time_26_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_153"(W:SV14-14) -> "ap_enable_operation_94"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_26_from[DEP_i_26] = {1'b0, 10'b0};
                DEP_time_26_from[DEP_i_26] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_27_to [9 - 1:0];
time DEP_time_27_to [9 - 1:0];
reg [10:0] DEP_address_27_from [1 - 1:0];
time DEP_time_27_from [1 - 1:0];
reg DEP_error_27 = 0;
integer DEP_i_27;

initial begin
    DEP_address_27_to[0] = 0;
    DEP_time_27_to[0] = 0;
    DEP_address_27_to[1] = 0;
    DEP_time_27_to[1] = 0;
    DEP_address_27_to[2] = 0;
    DEP_time_27_to[2] = 0;
    DEP_address_27_to[3] = 0;
    DEP_time_27_to[3] = 0;
    DEP_address_27_to[4] = 0;
    DEP_time_27_to[4] = 0;
    DEP_address_27_to[5] = 0;
    DEP_time_27_to[5] = 0;
    DEP_address_27_to[6] = 0;
    DEP_time_27_to[6] = 0;
    DEP_address_27_to[7] = 0;
    DEP_time_27_to[7] = 0;
    DEP_address_27_to[8] = 0;
    DEP_time_27_to[8] = 0;
    DEP_address_27_from[0] = 0;
    DEP_time_27_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_27_to[8] = DEP_address_27_to[7];
            DEP_time_27_to[8] = DEP_time_27_to[7];
            DEP_address_27_to[7] = DEP_address_27_to[6];
            DEP_time_27_to[7] = DEP_time_27_to[6];
            DEP_address_27_to[6] = DEP_address_27_to[5];
            DEP_time_27_to[6] = DEP_time_27_to[5];
            DEP_address_27_to[5] = DEP_address_27_to[4];
            DEP_time_27_to[5] = DEP_time_27_to[4];
            DEP_address_27_to[4] = DEP_address_27_to[3];
            DEP_time_27_to[4] = DEP_time_27_to[3];
            DEP_address_27_to[3] = DEP_address_27_to[2];
            DEP_time_27_to[3] = DEP_time_27_to[2];
            DEP_address_27_to[2] = DEP_address_27_to[1];
            DEP_time_27_to[2] = DEP_time_27_to[1];
            DEP_address_27_to[1] = DEP_address_27_to[0];
            DEP_time_27_to[1] = DEP_time_27_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_93) begin
                DEP_address_27_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_4_address1};
                DEP_time_27_to[0] = $time;
            end else begin
                DEP_address_27_to[0] = {1'b0, 10'b0};
                DEP_time_27_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_27_to[8] = DEP_address_27_to[7];
            DEP_time_27_to[8] = DEP_time_27_to[7];
            DEP_address_27_to[7] = DEP_address_27_to[6];
            DEP_time_27_to[7] = DEP_time_27_to[6];
            DEP_address_27_to[6] = DEP_address_27_to[5];
            DEP_time_27_to[6] = DEP_time_27_to[5];
            DEP_address_27_to[5] = DEP_address_27_to[4];
            DEP_time_27_to[5] = DEP_time_27_to[4];
            DEP_address_27_to[4] = DEP_address_27_to[3];
            DEP_time_27_to[4] = DEP_time_27_to[3];
            DEP_address_27_to[3] = DEP_address_27_to[2];
            DEP_time_27_to[3] = DEP_time_27_to[2];
            DEP_address_27_to[2] = DEP_address_27_to[1];
            DEP_time_27_to[2] = DEP_time_27_to[1];
            DEP_address_27_to[1] = DEP_address_27_to[0];
            DEP_time_27_to[1] = DEP_time_27_to[0];
            DEP_address_27_to[0] = {1'b0, 10'b0};
            DEP_time_27_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_155) begin
                if (DEP_address_27_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_27_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_27_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_4_address0};
                DEP_time_27_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_155) begin
                DEP_i_27 = 0;
                if (DEP_address_27_to[0][10]) begin
                    DEP_error_27 = (DEP_address_27_to[0][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[0][9:0], DEP_time_27_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[1][10]) begin
                    DEP_error_27 = (DEP_address_27_to[1][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[1][9:0], DEP_time_27_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[2][10]) begin
                    DEP_error_27 = (DEP_address_27_to[2][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[2][9:0], DEP_time_27_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[3][10]) begin
                    DEP_error_27 = (DEP_address_27_to[3][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[3][9:0], DEP_time_27_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[4][10]) begin
                    DEP_error_27 = (DEP_address_27_to[4][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[4][9:0], DEP_time_27_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[5][10]) begin
                    DEP_error_27 = (DEP_address_27_to[5][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[5][9:0], DEP_time_27_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[6][10]) begin
                    DEP_error_27 = (DEP_address_27_to[6][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[6][9:0], DEP_time_27_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[7][10]) begin
                    DEP_error_27 = (DEP_address_27_to[7][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[7][9:0], DEP_time_27_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_27_to[8][10]) begin
                    DEP_error_27 = (DEP_address_27_to[8][9:0] == DEP_address_27_from[DEP_i_27][9:0]);
                    if (DEP_error_27) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_4_address0\" = 0x%0h @ \"%0t\"", DEP_address_27_from[DEP_i_27][9:0], DEP_time_27_from[DEP_i_27]);
                        $display("//                : To memory access \"crow_4_address1\" = DEP_address_27_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_27_to[8][9:0], DEP_time_27_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_155"(W:SV14-14) -> "ap_enable_operation_93"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_27_from[DEP_i_27] = {1'b0, 10'b0};
                DEP_time_27_from[DEP_i_27] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_28_to [9 - 1:0];
time DEP_time_28_to [9 - 1:0];
reg [10:0] DEP_address_28_from [1 - 1:0];
time DEP_time_28_from [1 - 1:0];
reg DEP_error_28 = 0;
integer DEP_i_28;

initial begin
    DEP_address_28_to[0] = 0;
    DEP_time_28_to[0] = 0;
    DEP_address_28_to[1] = 0;
    DEP_time_28_to[1] = 0;
    DEP_address_28_to[2] = 0;
    DEP_time_28_to[2] = 0;
    DEP_address_28_to[3] = 0;
    DEP_time_28_to[3] = 0;
    DEP_address_28_to[4] = 0;
    DEP_time_28_to[4] = 0;
    DEP_address_28_to[5] = 0;
    DEP_time_28_to[5] = 0;
    DEP_address_28_to[6] = 0;
    DEP_time_28_to[6] = 0;
    DEP_address_28_to[7] = 0;
    DEP_time_28_to[7] = 0;
    DEP_address_28_to[8] = 0;
    DEP_time_28_to[8] = 0;
    DEP_address_28_from[0] = 0;
    DEP_time_28_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_28_to[8] = DEP_address_28_to[7];
            DEP_time_28_to[8] = DEP_time_28_to[7];
            DEP_address_28_to[7] = DEP_address_28_to[6];
            DEP_time_28_to[7] = DEP_time_28_to[6];
            DEP_address_28_to[6] = DEP_address_28_to[5];
            DEP_time_28_to[6] = DEP_time_28_to[5];
            DEP_address_28_to[5] = DEP_address_28_to[4];
            DEP_time_28_to[5] = DEP_time_28_to[4];
            DEP_address_28_to[4] = DEP_address_28_to[3];
            DEP_time_28_to[4] = DEP_time_28_to[3];
            DEP_address_28_to[3] = DEP_address_28_to[2];
            DEP_time_28_to[3] = DEP_time_28_to[2];
            DEP_address_28_to[2] = DEP_address_28_to[1];
            DEP_time_28_to[2] = DEP_time_28_to[1];
            DEP_address_28_to[1] = DEP_address_28_to[0];
            DEP_time_28_to[1] = DEP_time_28_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_92) begin
                DEP_address_28_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_3_address1};
                DEP_time_28_to[0] = $time;
            end else begin
                DEP_address_28_to[0] = {1'b0, 10'b0};
                DEP_time_28_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_28_to[8] = DEP_address_28_to[7];
            DEP_time_28_to[8] = DEP_time_28_to[7];
            DEP_address_28_to[7] = DEP_address_28_to[6];
            DEP_time_28_to[7] = DEP_time_28_to[6];
            DEP_address_28_to[6] = DEP_address_28_to[5];
            DEP_time_28_to[6] = DEP_time_28_to[5];
            DEP_address_28_to[5] = DEP_address_28_to[4];
            DEP_time_28_to[5] = DEP_time_28_to[4];
            DEP_address_28_to[4] = DEP_address_28_to[3];
            DEP_time_28_to[4] = DEP_time_28_to[3];
            DEP_address_28_to[3] = DEP_address_28_to[2];
            DEP_time_28_to[3] = DEP_time_28_to[2];
            DEP_address_28_to[2] = DEP_address_28_to[1];
            DEP_time_28_to[2] = DEP_time_28_to[1];
            DEP_address_28_to[1] = DEP_address_28_to[0];
            DEP_time_28_to[1] = DEP_time_28_to[0];
            DEP_address_28_to[0] = {1'b0, 10'b0};
            DEP_time_28_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_157) begin
                if (DEP_address_28_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_28_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_28_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_3_address0};
                DEP_time_28_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_157) begin
                DEP_i_28 = 0;
                if (DEP_address_28_to[0][10]) begin
                    DEP_error_28 = (DEP_address_28_to[0][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[0][9:0], DEP_time_28_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[1][10]) begin
                    DEP_error_28 = (DEP_address_28_to[1][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[1][9:0], DEP_time_28_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[2][10]) begin
                    DEP_error_28 = (DEP_address_28_to[2][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[2][9:0], DEP_time_28_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[3][10]) begin
                    DEP_error_28 = (DEP_address_28_to[3][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[3][9:0], DEP_time_28_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[4][10]) begin
                    DEP_error_28 = (DEP_address_28_to[4][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[4][9:0], DEP_time_28_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[5][10]) begin
                    DEP_error_28 = (DEP_address_28_to[5][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[5][9:0], DEP_time_28_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[6][10]) begin
                    DEP_error_28 = (DEP_address_28_to[6][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[6][9:0], DEP_time_28_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[7][10]) begin
                    DEP_error_28 = (DEP_address_28_to[7][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[7][9:0], DEP_time_28_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_28_to[8][10]) begin
                    DEP_error_28 = (DEP_address_28_to[8][9:0] == DEP_address_28_from[DEP_i_28][9:0]);
                    if (DEP_error_28) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_3_address0\" = 0x%0h @ \"%0t\"", DEP_address_28_from[DEP_i_28][9:0], DEP_time_28_from[DEP_i_28]);
                        $display("//                : To memory access \"crow_3_address1\" = DEP_address_28_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_28_to[8][9:0], DEP_time_28_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_157"(W:SV14-14) -> "ap_enable_operation_92"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_28_from[DEP_i_28] = {1'b0, 10'b0};
                DEP_time_28_from[DEP_i_28] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_29_to [9 - 1:0];
time DEP_time_29_to [9 - 1:0];
reg [10:0] DEP_address_29_from [1 - 1:0];
time DEP_time_29_from [1 - 1:0];
reg DEP_error_29 = 0;
integer DEP_i_29;

initial begin
    DEP_address_29_to[0] = 0;
    DEP_time_29_to[0] = 0;
    DEP_address_29_to[1] = 0;
    DEP_time_29_to[1] = 0;
    DEP_address_29_to[2] = 0;
    DEP_time_29_to[2] = 0;
    DEP_address_29_to[3] = 0;
    DEP_time_29_to[3] = 0;
    DEP_address_29_to[4] = 0;
    DEP_time_29_to[4] = 0;
    DEP_address_29_to[5] = 0;
    DEP_time_29_to[5] = 0;
    DEP_address_29_to[6] = 0;
    DEP_time_29_to[6] = 0;
    DEP_address_29_to[7] = 0;
    DEP_time_29_to[7] = 0;
    DEP_address_29_to[8] = 0;
    DEP_time_29_to[8] = 0;
    DEP_address_29_from[0] = 0;
    DEP_time_29_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_29_to[8] = DEP_address_29_to[7];
            DEP_time_29_to[8] = DEP_time_29_to[7];
            DEP_address_29_to[7] = DEP_address_29_to[6];
            DEP_time_29_to[7] = DEP_time_29_to[6];
            DEP_address_29_to[6] = DEP_address_29_to[5];
            DEP_time_29_to[6] = DEP_time_29_to[5];
            DEP_address_29_to[5] = DEP_address_29_to[4];
            DEP_time_29_to[5] = DEP_time_29_to[4];
            DEP_address_29_to[4] = DEP_address_29_to[3];
            DEP_time_29_to[4] = DEP_time_29_to[3];
            DEP_address_29_to[3] = DEP_address_29_to[2];
            DEP_time_29_to[3] = DEP_time_29_to[2];
            DEP_address_29_to[2] = DEP_address_29_to[1];
            DEP_time_29_to[2] = DEP_time_29_to[1];
            DEP_address_29_to[1] = DEP_address_29_to[0];
            DEP_time_29_to[1] = DEP_time_29_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_91) begin
                DEP_address_29_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_2_address1};
                DEP_time_29_to[0] = $time;
            end else begin
                DEP_address_29_to[0] = {1'b0, 10'b0};
                DEP_time_29_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_29_to[8] = DEP_address_29_to[7];
            DEP_time_29_to[8] = DEP_time_29_to[7];
            DEP_address_29_to[7] = DEP_address_29_to[6];
            DEP_time_29_to[7] = DEP_time_29_to[6];
            DEP_address_29_to[6] = DEP_address_29_to[5];
            DEP_time_29_to[6] = DEP_time_29_to[5];
            DEP_address_29_to[5] = DEP_address_29_to[4];
            DEP_time_29_to[5] = DEP_time_29_to[4];
            DEP_address_29_to[4] = DEP_address_29_to[3];
            DEP_time_29_to[4] = DEP_time_29_to[3];
            DEP_address_29_to[3] = DEP_address_29_to[2];
            DEP_time_29_to[3] = DEP_time_29_to[2];
            DEP_address_29_to[2] = DEP_address_29_to[1];
            DEP_time_29_to[2] = DEP_time_29_to[1];
            DEP_address_29_to[1] = DEP_address_29_to[0];
            DEP_time_29_to[1] = DEP_time_29_to[0];
            DEP_address_29_to[0] = {1'b0, 10'b0};
            DEP_time_29_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_159) begin
                if (DEP_address_29_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_29_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_29_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_2_address0};
                DEP_time_29_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_159) begin
                DEP_i_29 = 0;
                if (DEP_address_29_to[0][10]) begin
                    DEP_error_29 = (DEP_address_29_to[0][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[0][9:0], DEP_time_29_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[1][10]) begin
                    DEP_error_29 = (DEP_address_29_to[1][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[1][9:0], DEP_time_29_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[2][10]) begin
                    DEP_error_29 = (DEP_address_29_to[2][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[2][9:0], DEP_time_29_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[3][10]) begin
                    DEP_error_29 = (DEP_address_29_to[3][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[3][9:0], DEP_time_29_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[4][10]) begin
                    DEP_error_29 = (DEP_address_29_to[4][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[4][9:0], DEP_time_29_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[5][10]) begin
                    DEP_error_29 = (DEP_address_29_to[5][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[5][9:0], DEP_time_29_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[6][10]) begin
                    DEP_error_29 = (DEP_address_29_to[6][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[6][9:0], DEP_time_29_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[7][10]) begin
                    DEP_error_29 = (DEP_address_29_to[7][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[7][9:0], DEP_time_29_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_29_to[8][10]) begin
                    DEP_error_29 = (DEP_address_29_to[8][9:0] == DEP_address_29_from[DEP_i_29][9:0]);
                    if (DEP_error_29) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_2_address0\" = 0x%0h @ \"%0t\"", DEP_address_29_from[DEP_i_29][9:0], DEP_time_29_from[DEP_i_29]);
                        $display("//                : To memory access \"crow_2_address1\" = DEP_address_29_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_29_to[8][9:0], DEP_time_29_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_159"(W:SV14-14) -> "ap_enable_operation_91"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_29_from[DEP_i_29] = {1'b0, 10'b0};
                DEP_time_29_from[DEP_i_29] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_30_to [9 - 1:0];
time DEP_time_30_to [9 - 1:0];
reg [10:0] DEP_address_30_from [1 - 1:0];
time DEP_time_30_from [1 - 1:0];
reg DEP_error_30 = 0;
integer DEP_i_30;

initial begin
    DEP_address_30_to[0] = 0;
    DEP_time_30_to[0] = 0;
    DEP_address_30_to[1] = 0;
    DEP_time_30_to[1] = 0;
    DEP_address_30_to[2] = 0;
    DEP_time_30_to[2] = 0;
    DEP_address_30_to[3] = 0;
    DEP_time_30_to[3] = 0;
    DEP_address_30_to[4] = 0;
    DEP_time_30_to[4] = 0;
    DEP_address_30_to[5] = 0;
    DEP_time_30_to[5] = 0;
    DEP_address_30_to[6] = 0;
    DEP_time_30_to[6] = 0;
    DEP_address_30_to[7] = 0;
    DEP_time_30_to[7] = 0;
    DEP_address_30_to[8] = 0;
    DEP_time_30_to[8] = 0;
    DEP_address_30_from[0] = 0;
    DEP_time_30_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_30_to[8] = DEP_address_30_to[7];
            DEP_time_30_to[8] = DEP_time_30_to[7];
            DEP_address_30_to[7] = DEP_address_30_to[6];
            DEP_time_30_to[7] = DEP_time_30_to[6];
            DEP_address_30_to[6] = DEP_address_30_to[5];
            DEP_time_30_to[6] = DEP_time_30_to[5];
            DEP_address_30_to[5] = DEP_address_30_to[4];
            DEP_time_30_to[5] = DEP_time_30_to[4];
            DEP_address_30_to[4] = DEP_address_30_to[3];
            DEP_time_30_to[4] = DEP_time_30_to[3];
            DEP_address_30_to[3] = DEP_address_30_to[2];
            DEP_time_30_to[3] = DEP_time_30_to[2];
            DEP_address_30_to[2] = DEP_address_30_to[1];
            DEP_time_30_to[2] = DEP_time_30_to[1];
            DEP_address_30_to[1] = DEP_address_30_to[0];
            DEP_time_30_to[1] = DEP_time_30_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_90) begin
                DEP_address_30_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_1_address1};
                DEP_time_30_to[0] = $time;
            end else begin
                DEP_address_30_to[0] = {1'b0, 10'b0};
                DEP_time_30_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_30_to[8] = DEP_address_30_to[7];
            DEP_time_30_to[8] = DEP_time_30_to[7];
            DEP_address_30_to[7] = DEP_address_30_to[6];
            DEP_time_30_to[7] = DEP_time_30_to[6];
            DEP_address_30_to[6] = DEP_address_30_to[5];
            DEP_time_30_to[6] = DEP_time_30_to[5];
            DEP_address_30_to[5] = DEP_address_30_to[4];
            DEP_time_30_to[5] = DEP_time_30_to[4];
            DEP_address_30_to[4] = DEP_address_30_to[3];
            DEP_time_30_to[4] = DEP_time_30_to[3];
            DEP_address_30_to[3] = DEP_address_30_to[2];
            DEP_time_30_to[3] = DEP_time_30_to[2];
            DEP_address_30_to[2] = DEP_address_30_to[1];
            DEP_time_30_to[2] = DEP_time_30_to[1];
            DEP_address_30_to[1] = DEP_address_30_to[0];
            DEP_time_30_to[1] = DEP_time_30_to[0];
            DEP_address_30_to[0] = {1'b0, 10'b0};
            DEP_time_30_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_161) begin
                if (DEP_address_30_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_30_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_30_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_1_address0};
                DEP_time_30_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_161) begin
                DEP_i_30 = 0;
                if (DEP_address_30_to[0][10]) begin
                    DEP_error_30 = (DEP_address_30_to[0][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[0][9:0], DEP_time_30_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[1][10]) begin
                    DEP_error_30 = (DEP_address_30_to[1][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[1][9:0], DEP_time_30_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[2][10]) begin
                    DEP_error_30 = (DEP_address_30_to[2][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[2][9:0], DEP_time_30_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[3][10]) begin
                    DEP_error_30 = (DEP_address_30_to[3][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[3][9:0], DEP_time_30_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[4][10]) begin
                    DEP_error_30 = (DEP_address_30_to[4][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[4][9:0], DEP_time_30_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[5][10]) begin
                    DEP_error_30 = (DEP_address_30_to[5][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[5][9:0], DEP_time_30_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[6][10]) begin
                    DEP_error_30 = (DEP_address_30_to[6][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[6][9:0], DEP_time_30_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[7][10]) begin
                    DEP_error_30 = (DEP_address_30_to[7][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[7][9:0], DEP_time_30_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_30_to[8][10]) begin
                    DEP_error_30 = (DEP_address_30_to[8][9:0] == DEP_address_30_from[DEP_i_30][9:0]);
                    if (DEP_error_30) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_1_address0\" = 0x%0h @ \"%0t\"", DEP_address_30_from[DEP_i_30][9:0], DEP_time_30_from[DEP_i_30]);
                        $display("//                : To memory access \"crow_1_address1\" = DEP_address_30_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_30_to[8][9:0], DEP_time_30_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_161"(W:SV14-14) -> "ap_enable_operation_90"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_30_from[DEP_i_30] = {1'b0, 10'b0};
                DEP_time_30_from[DEP_i_30] = 0;
            end
        end // of check access
    end 
end

// Dependence Check (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
reg [10:0] DEP_address_31_to [9 - 1:0];
time DEP_time_31_to [9 - 1:0];
reg [10:0] DEP_address_31_from [1 - 1:0];
time DEP_time_31_from [1 - 1:0];
reg DEP_error_31 = 0;
integer DEP_i_31;

initial begin
    DEP_address_31_to[0] = 0;
    DEP_time_31_to[0] = 0;
    DEP_address_31_to[1] = 0;
    DEP_time_31_to[1] = 0;
    DEP_address_31_to[2] = 0;
    DEP_time_31_to[2] = 0;
    DEP_address_31_to[3] = 0;
    DEP_time_31_to[3] = 0;
    DEP_address_31_to[4] = 0;
    DEP_time_31_to[4] = 0;
    DEP_address_31_to[5] = 0;
    DEP_time_31_to[5] = 0;
    DEP_address_31_to[6] = 0;
    DEP_time_31_to[6] = 0;
    DEP_address_31_to[7] = 0;
    DEP_time_31_to[7] = 0;
    DEP_address_31_to[8] = 0;
    DEP_time_31_to[8] = 0;
    DEP_address_31_from[0] = 0;
    DEP_time_31_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin 
            DEP_address_31_to[8] = DEP_address_31_to[7];
            DEP_time_31_to[8] = DEP_time_31_to[7];
            DEP_address_31_to[7] = DEP_address_31_to[6];
            DEP_time_31_to[7] = DEP_time_31_to[6];
            DEP_address_31_to[6] = DEP_address_31_to[5];
            DEP_time_31_to[6] = DEP_time_31_to[5];
            DEP_address_31_to[5] = DEP_address_31_to[4];
            DEP_time_31_to[5] = DEP_time_31_to[4];
            DEP_address_31_to[4] = DEP_address_31_to[3];
            DEP_time_31_to[4] = DEP_time_31_to[3];
            DEP_address_31_to[3] = DEP_address_31_to[2];
            DEP_time_31_to[3] = DEP_time_31_to[2];
            DEP_address_31_to[2] = DEP_address_31_to[1];
            DEP_time_31_to[2] = DEP_time_31_to[1];
            DEP_address_31_to[1] = DEP_address_31_to[0];
            DEP_time_31_to[1] = DEP_time_31_to[0];
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_89) begin
                DEP_address_31_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_address1};
                DEP_time_31_to[0] = $time;
            end else begin
                DEP_address_31_to[0] = {1'b0, 10'b0};
                DEP_time_31_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state6_pp0_iter5_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state7_pp0_iter6_stage0||
            `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter5) begin
            DEP_address_31_to[8] = DEP_address_31_to[7];
            DEP_time_31_to[8] = DEP_time_31_to[7];
            DEP_address_31_to[7] = DEP_address_31_to[6];
            DEP_time_31_to[7] = DEP_time_31_to[6];
            DEP_address_31_to[6] = DEP_address_31_to[5];
            DEP_time_31_to[6] = DEP_time_31_to[5];
            DEP_address_31_to[5] = DEP_address_31_to[4];
            DEP_time_31_to[5] = DEP_time_31_to[4];
            DEP_address_31_to[4] = DEP_address_31_to[3];
            DEP_time_31_to[4] = DEP_time_31_to[3];
            DEP_address_31_to[3] = DEP_address_31_to[2];
            DEP_time_31_to[3] = DEP_time_31_to[2];
            DEP_address_31_to[2] = DEP_address_31_to[1];
            DEP_time_31_to[2] = DEP_time_31_to[1];
            DEP_address_31_to[1] = DEP_address_31_to[0];
            DEP_time_31_to[1] = DEP_time_31_to[0];
            DEP_address_31_to[0] = {1'b0, 10'b0};
            DEP_time_31_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_163) begin
                if (DEP_address_31_from[0][10]) begin
                    $display("// ERROR : \"DEP_address_31_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_31_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.crow_address0};
                DEP_time_31_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_state15_pp0_iter14_stage0
            &&  `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_reg_pp0_iter14) begin
            if (`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285.ap_enable_operation_163) begin
                DEP_i_31 = 0;
                if (DEP_address_31_to[0][10]) begin
                    DEP_error_31 = (DEP_address_31_to[0][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 9) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[0][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[0][9:0], DEP_time_31_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[1][10]) begin
                    DEP_error_31 = (DEP_address_31_to[1][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 8) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[1][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[1][9:0], DEP_time_31_to[1]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[2][10]) begin
                    DEP_error_31 = (DEP_address_31_to[2][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 7) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[2][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[2][9:0], DEP_time_31_to[2]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[3][10]) begin
                    DEP_error_31 = (DEP_address_31_to[3][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 6) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[3][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[3][9:0], DEP_time_31_to[3]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[4][10]) begin
                    DEP_error_31 = (DEP_address_31_to[4][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 5) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[4][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[4][9:0], DEP_time_31_to[4]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[5][10]) begin
                    DEP_error_31 = (DEP_address_31_to[5][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 4) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[5][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[5][9:0], DEP_time_31_to[5]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[6][10]) begin
                    DEP_error_31 = (DEP_address_31_to[6][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 3) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[6][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[6][9:0], DEP_time_31_to[6]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[7][10]) begin
                    DEP_error_31 = (DEP_address_31_to[7][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 2) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[7][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[7][9:0], DEP_time_31_to[7]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                if (DEP_address_31_to[8][10]) begin
                    DEP_error_31 = (DEP_address_31_to[8][9:0] == DEP_address_31_from[DEP_i_31][9:0]);
                    if (DEP_error_31) begin
                        $display("//Critical WARNING: Due to pragma (../src/kernel.cpp:63:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285\"");
                        $display("//                : From memory access \"crow_address0\" = 0x%0h @ \"%0t\"", DEP_address_31_from[DEP_i_31][9:0], DEP_time_31_from[DEP_i_31]);
                        $display("//                : To memory access \"crow_address1\" = DEP_address_31_to[8][9:0] = 0x%0h @ \"%0t\"", DEP_address_31_to[8][9:0], DEP_time_31_to[8]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_163"(W:SV14-14) -> "ap_enable_operation_89"(R:SV5-6) @ `AUTOTB_DUT_INST.grp_gemm_Pipeline_kj_loop_fu_285
                    end
                end
                DEP_address_31_from[DEP_i_31] = {1'b0, 10'b0};
                DEP_time_31_from[DEP_i_31] = 0;
            end
        end // of check access
    end 
end

`endif
///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(~rst),
    .finish(all_finish));

`include "fifo_para.vh"
endmodule
