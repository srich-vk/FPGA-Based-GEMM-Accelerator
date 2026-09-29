set moduleName gemm_Pipeline_zero_init_top_loop_zero_init_in_loop
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 7
set C_modelName {gemm_Pipeline_zero_init_top_loop_zero_init_in_loop}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict crow_15 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_14 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_13 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_12 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_11 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_10 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_9 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_8 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_7 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_6 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_5 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_4 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_3 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_2 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow_1 { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict crow { MEM_WIDTH 32 MEM_SIZE 3072 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ tmp_3 int 35 regular  }
	{ N int 32 regular  }
	{ crow_15 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_14 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_13 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_12 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_11 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_10 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_9 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_8 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_7 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_6 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_5 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_4 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_3 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_2 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow_1 float 32 regular {array 768 { 0 3 } 0 1 }  }
	{ crow float 32 regular {array 768 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "tmp_3", "interface" : "wire", "bitwidth" : 35, "direction" : "READONLY"} , 
 	{ "Name" : "N", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "crow_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crow", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 72
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tmp_3 sc_in sc_lv 35 signal 0 } 
	{ N sc_in sc_lv 32 signal 1 } 
	{ crow_15_address0 sc_out sc_lv 10 signal 2 } 
	{ crow_15_ce0 sc_out sc_logic 1 signal 2 } 
	{ crow_15_we0 sc_out sc_logic 1 signal 2 } 
	{ crow_15_d0 sc_out sc_lv 32 signal 2 } 
	{ crow_14_address0 sc_out sc_lv 10 signal 3 } 
	{ crow_14_ce0 sc_out sc_logic 1 signal 3 } 
	{ crow_14_we0 sc_out sc_logic 1 signal 3 } 
	{ crow_14_d0 sc_out sc_lv 32 signal 3 } 
	{ crow_13_address0 sc_out sc_lv 10 signal 4 } 
	{ crow_13_ce0 sc_out sc_logic 1 signal 4 } 
	{ crow_13_we0 sc_out sc_logic 1 signal 4 } 
	{ crow_13_d0 sc_out sc_lv 32 signal 4 } 
	{ crow_12_address0 sc_out sc_lv 10 signal 5 } 
	{ crow_12_ce0 sc_out sc_logic 1 signal 5 } 
	{ crow_12_we0 sc_out sc_logic 1 signal 5 } 
	{ crow_12_d0 sc_out sc_lv 32 signal 5 } 
	{ crow_11_address0 sc_out sc_lv 10 signal 6 } 
	{ crow_11_ce0 sc_out sc_logic 1 signal 6 } 
	{ crow_11_we0 sc_out sc_logic 1 signal 6 } 
	{ crow_11_d0 sc_out sc_lv 32 signal 6 } 
	{ crow_10_address0 sc_out sc_lv 10 signal 7 } 
	{ crow_10_ce0 sc_out sc_logic 1 signal 7 } 
	{ crow_10_we0 sc_out sc_logic 1 signal 7 } 
	{ crow_10_d0 sc_out sc_lv 32 signal 7 } 
	{ crow_9_address0 sc_out sc_lv 10 signal 8 } 
	{ crow_9_ce0 sc_out sc_logic 1 signal 8 } 
	{ crow_9_we0 sc_out sc_logic 1 signal 8 } 
	{ crow_9_d0 sc_out sc_lv 32 signal 8 } 
	{ crow_8_address0 sc_out sc_lv 10 signal 9 } 
	{ crow_8_ce0 sc_out sc_logic 1 signal 9 } 
	{ crow_8_we0 sc_out sc_logic 1 signal 9 } 
	{ crow_8_d0 sc_out sc_lv 32 signal 9 } 
	{ crow_7_address0 sc_out sc_lv 10 signal 10 } 
	{ crow_7_ce0 sc_out sc_logic 1 signal 10 } 
	{ crow_7_we0 sc_out sc_logic 1 signal 10 } 
	{ crow_7_d0 sc_out sc_lv 32 signal 10 } 
	{ crow_6_address0 sc_out sc_lv 10 signal 11 } 
	{ crow_6_ce0 sc_out sc_logic 1 signal 11 } 
	{ crow_6_we0 sc_out sc_logic 1 signal 11 } 
	{ crow_6_d0 sc_out sc_lv 32 signal 11 } 
	{ crow_5_address0 sc_out sc_lv 10 signal 12 } 
	{ crow_5_ce0 sc_out sc_logic 1 signal 12 } 
	{ crow_5_we0 sc_out sc_logic 1 signal 12 } 
	{ crow_5_d0 sc_out sc_lv 32 signal 12 } 
	{ crow_4_address0 sc_out sc_lv 10 signal 13 } 
	{ crow_4_ce0 sc_out sc_logic 1 signal 13 } 
	{ crow_4_we0 sc_out sc_logic 1 signal 13 } 
	{ crow_4_d0 sc_out sc_lv 32 signal 13 } 
	{ crow_3_address0 sc_out sc_lv 10 signal 14 } 
	{ crow_3_ce0 sc_out sc_logic 1 signal 14 } 
	{ crow_3_we0 sc_out sc_logic 1 signal 14 } 
	{ crow_3_d0 sc_out sc_lv 32 signal 14 } 
	{ crow_2_address0 sc_out sc_lv 10 signal 15 } 
	{ crow_2_ce0 sc_out sc_logic 1 signal 15 } 
	{ crow_2_we0 sc_out sc_logic 1 signal 15 } 
	{ crow_2_d0 sc_out sc_lv 32 signal 15 } 
	{ crow_1_address0 sc_out sc_lv 10 signal 16 } 
	{ crow_1_ce0 sc_out sc_logic 1 signal 16 } 
	{ crow_1_we0 sc_out sc_logic 1 signal 16 } 
	{ crow_1_d0 sc_out sc_lv 32 signal 16 } 
	{ crow_address0 sc_out sc_lv 10 signal 17 } 
	{ crow_ce0 sc_out sc_logic 1 signal 17 } 
	{ crow_we0 sc_out sc_logic 1 signal 17 } 
	{ crow_d0 sc_out sc_lv 32 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tmp_3", "direction": "in", "datatype": "sc_lv", "bitwidth":35, "type": "signal", "bundle":{"name": "tmp_3", "role": "default" }} , 
 	{ "name": "N", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N", "role": "default" }} , 
 	{ "name": "crow_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_15", "role": "address0" }} , 
 	{ "name": "crow_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_15", "role": "ce0" }} , 
 	{ "name": "crow_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_15", "role": "we0" }} , 
 	{ "name": "crow_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_15", "role": "d0" }} , 
 	{ "name": "crow_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_14", "role": "address0" }} , 
 	{ "name": "crow_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_14", "role": "ce0" }} , 
 	{ "name": "crow_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_14", "role": "we0" }} , 
 	{ "name": "crow_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_14", "role": "d0" }} , 
 	{ "name": "crow_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_13", "role": "address0" }} , 
 	{ "name": "crow_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_13", "role": "ce0" }} , 
 	{ "name": "crow_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_13", "role": "we0" }} , 
 	{ "name": "crow_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_13", "role": "d0" }} , 
 	{ "name": "crow_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_12", "role": "address0" }} , 
 	{ "name": "crow_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_12", "role": "ce0" }} , 
 	{ "name": "crow_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_12", "role": "we0" }} , 
 	{ "name": "crow_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_12", "role": "d0" }} , 
 	{ "name": "crow_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_11", "role": "address0" }} , 
 	{ "name": "crow_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_11", "role": "ce0" }} , 
 	{ "name": "crow_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_11", "role": "we0" }} , 
 	{ "name": "crow_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_11", "role": "d0" }} , 
 	{ "name": "crow_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_10", "role": "address0" }} , 
 	{ "name": "crow_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_10", "role": "ce0" }} , 
 	{ "name": "crow_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_10", "role": "we0" }} , 
 	{ "name": "crow_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_10", "role": "d0" }} , 
 	{ "name": "crow_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_9", "role": "address0" }} , 
 	{ "name": "crow_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_9", "role": "ce0" }} , 
 	{ "name": "crow_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_9", "role": "we0" }} , 
 	{ "name": "crow_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_9", "role": "d0" }} , 
 	{ "name": "crow_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_8", "role": "address0" }} , 
 	{ "name": "crow_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_8", "role": "ce0" }} , 
 	{ "name": "crow_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_8", "role": "we0" }} , 
 	{ "name": "crow_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_8", "role": "d0" }} , 
 	{ "name": "crow_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_7", "role": "address0" }} , 
 	{ "name": "crow_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_7", "role": "ce0" }} , 
 	{ "name": "crow_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_7", "role": "we0" }} , 
 	{ "name": "crow_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_7", "role": "d0" }} , 
 	{ "name": "crow_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_6", "role": "address0" }} , 
 	{ "name": "crow_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_6", "role": "ce0" }} , 
 	{ "name": "crow_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_6", "role": "we0" }} , 
 	{ "name": "crow_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_6", "role": "d0" }} , 
 	{ "name": "crow_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_5", "role": "address0" }} , 
 	{ "name": "crow_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_5", "role": "ce0" }} , 
 	{ "name": "crow_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_5", "role": "we0" }} , 
 	{ "name": "crow_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_5", "role": "d0" }} , 
 	{ "name": "crow_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_4", "role": "address0" }} , 
 	{ "name": "crow_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_4", "role": "ce0" }} , 
 	{ "name": "crow_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_4", "role": "we0" }} , 
 	{ "name": "crow_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_4", "role": "d0" }} , 
 	{ "name": "crow_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_3", "role": "address0" }} , 
 	{ "name": "crow_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_3", "role": "ce0" }} , 
 	{ "name": "crow_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_3", "role": "we0" }} , 
 	{ "name": "crow_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_3", "role": "d0" }} , 
 	{ "name": "crow_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_2", "role": "address0" }} , 
 	{ "name": "crow_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_2", "role": "ce0" }} , 
 	{ "name": "crow_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_2", "role": "we0" }} , 
 	{ "name": "crow_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_2", "role": "d0" }} , 
 	{ "name": "crow_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow_1", "role": "address0" }} , 
 	{ "name": "crow_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_1", "role": "ce0" }} , 
 	{ "name": "crow_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow_1", "role": "we0" }} , 
 	{ "name": "crow_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow_1", "role": "d0" }} , 
 	{ "name": "crow_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "crow", "role": "address0" }} , 
 	{ "name": "crow_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow", "role": "ce0" }} , 
 	{ "name": "crow_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crow", "role": "we0" }} , 
 	{ "name": "crow_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crow", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	gemm_Pipeline_zero_init_top_loop_zero_init_in_loop {
		tmp_3 {Type I LastRead 0 FirstWrite -1}
		N {Type I LastRead 0 FirstWrite -1}
		crow_15 {Type O LastRead -1 FirstWrite 3}
		crow_14 {Type O LastRead -1 FirstWrite 3}
		crow_13 {Type O LastRead -1 FirstWrite 3}
		crow_12 {Type O LastRead -1 FirstWrite 3}
		crow_11 {Type O LastRead -1 FirstWrite 3}
		crow_10 {Type O LastRead -1 FirstWrite 3}
		crow_9 {Type O LastRead -1 FirstWrite 3}
		crow_8 {Type O LastRead -1 FirstWrite 3}
		crow_7 {Type O LastRead -1 FirstWrite 3}
		crow_6 {Type O LastRead -1 FirstWrite 3}
		crow_5 {Type O LastRead -1 FirstWrite 3}
		crow_4 {Type O LastRead -1 FirstWrite 3}
		crow_3 {Type O LastRead -1 FirstWrite 3}
		crow_2 {Type O LastRead -1 FirstWrite 3}
		crow_1 {Type O LastRead -1 FirstWrite 3}
		crow {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19", "Max" : "19"}
	, {"Name" : "Interval", "Min" : "19", "Max" : "19"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tmp_3 { ap_none {  { tmp_3 in_data 0 35 } } }
	N { ap_none {  { N in_data 0 32 } } }
	crow_15 { ap_memory {  { crow_15_address0 mem_address 1 10 }  { crow_15_ce0 mem_ce 1 1 }  { crow_15_we0 mem_we 1 1 }  { crow_15_d0 mem_din 1 32 } } }
	crow_14 { ap_memory {  { crow_14_address0 mem_address 1 10 }  { crow_14_ce0 mem_ce 1 1 }  { crow_14_we0 mem_we 1 1 }  { crow_14_d0 mem_din 1 32 } } }
	crow_13 { ap_memory {  { crow_13_address0 mem_address 1 10 }  { crow_13_ce0 mem_ce 1 1 }  { crow_13_we0 mem_we 1 1 }  { crow_13_d0 mem_din 1 32 } } }
	crow_12 { ap_memory {  { crow_12_address0 mem_address 1 10 }  { crow_12_ce0 mem_ce 1 1 }  { crow_12_we0 mem_we 1 1 }  { crow_12_d0 mem_din 1 32 } } }
	crow_11 { ap_memory {  { crow_11_address0 mem_address 1 10 }  { crow_11_ce0 mem_ce 1 1 }  { crow_11_we0 mem_we 1 1 }  { crow_11_d0 mem_din 1 32 } } }
	crow_10 { ap_memory {  { crow_10_address0 mem_address 1 10 }  { crow_10_ce0 mem_ce 1 1 }  { crow_10_we0 mem_we 1 1 }  { crow_10_d0 mem_din 1 32 } } }
	crow_9 { ap_memory {  { crow_9_address0 mem_address 1 10 }  { crow_9_ce0 mem_ce 1 1 }  { crow_9_we0 mem_we 1 1 }  { crow_9_d0 mem_din 1 32 } } }
	crow_8 { ap_memory {  { crow_8_address0 mem_address 1 10 }  { crow_8_ce0 mem_ce 1 1 }  { crow_8_we0 mem_we 1 1 }  { crow_8_d0 mem_din 1 32 } } }
	crow_7 { ap_memory {  { crow_7_address0 mem_address 1 10 }  { crow_7_ce0 mem_ce 1 1 }  { crow_7_we0 mem_we 1 1 }  { crow_7_d0 mem_din 1 32 } } }
	crow_6 { ap_memory {  { crow_6_address0 mem_address 1 10 }  { crow_6_ce0 mem_ce 1 1 }  { crow_6_we0 mem_we 1 1 }  { crow_6_d0 mem_din 1 32 } } }
	crow_5 { ap_memory {  { crow_5_address0 mem_address 1 10 }  { crow_5_ce0 mem_ce 1 1 }  { crow_5_we0 mem_we 1 1 }  { crow_5_d0 mem_din 1 32 } } }
	crow_4 { ap_memory {  { crow_4_address0 mem_address 1 10 }  { crow_4_ce0 mem_ce 1 1 }  { crow_4_we0 mem_we 1 1 }  { crow_4_d0 mem_din 1 32 } } }
	crow_3 { ap_memory {  { crow_3_address0 mem_address 1 10 }  { crow_3_ce0 mem_ce 1 1 }  { crow_3_we0 mem_we 1 1 }  { crow_3_d0 mem_din 1 32 } } }
	crow_2 { ap_memory {  { crow_2_address0 mem_address 1 10 }  { crow_2_ce0 mem_ce 1 1 }  { crow_2_we0 mem_we 1 1 }  { crow_2_d0 mem_din 1 32 } } }
	crow_1 { ap_memory {  { crow_1_address0 mem_address 1 10 }  { crow_1_ce0 mem_ce 1 1 }  { crow_1_we0 mem_we 1 1 }  { crow_1_d0 mem_din 1 32 } } }
	crow { ap_memory {  { crow_address0 mem_address 1 10 }  { crow_ce0 mem_ce 1 1 }  { crow_we0 mem_we 1 1 }  { crow_d0 mem_din 1 32 } } }
}
