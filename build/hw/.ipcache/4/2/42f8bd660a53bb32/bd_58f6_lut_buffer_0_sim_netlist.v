// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Mon Sep 28 23:46:01 2026
// Host        : node06.local running 64-bit Rocky Linux release 8.9 (Green Obsidian)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_58f6_lut_buffer_0_sim_netlist.v
// Design      : bd_58f6_lut_buffer_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_58f6_lut_buffer_0,lut_buffer_v2_0_1_lut_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "lut_buffer_v2_0_1_lut_buffer,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (tdi_i,
    tms_i,
    tck_i,
    drck_i,
    sel_i,
    shift_i,
    update_i,
    capture_i,
    runtest_i,
    reset_i,
    bscanid_en_i,
    tdo_o,
    tdi_o,
    tms_o,
    tck_o,
    drck_o,
    sel_o,
    shift_o,
    update_o,
    capture_o,
    runtest_o,
    reset_o,
    bscanid_en_o,
    tdo_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDI" *) (* X_INTERFACE_MODE = "slave" *) input tdi_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TMS" *) input tms_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TCK" *) input tck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan DRCK" *) input drck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SEL" *) input sel_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SHIFT" *) input shift_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan UPDATE" *) input update_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE" *) input capture_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST" *) input runtest_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RESET" *) input reset_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN" *) input bscanid_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDO" *) output tdo_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *) (* X_INTERFACE_MODE = "master" *) output tdi_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *) output tms_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *) output tck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *) output drck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *) output sel_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *) output shift_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *) output update_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *) output capture_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *) output runtest_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *) output reset_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN" *) output bscanid_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *) input tdo_i;

  wire bscanid_en_i;
  wire bscanid_en_o;
  wire capture_i;
  wire capture_o;
  wire drck_i;
  wire drck_o;
  wire reset_i;
  wire reset_o;
  wire runtest_i;
  wire runtest_o;
  wire sel_i;
  wire sel_o;
  wire shift_i;
  wire shift_o;
  wire tck_i;
  wire tck_o;
  wire tdi_i;
  wire tdi_o;
  wire tdo_i;
  wire tdo_o;
  wire tms_i;
  wire tms_o;
  wire update_i;
  wire update_o;
  wire [31:0]NLW_inst_bscanid_o_UNCONNECTED;

  (* C_EN_BSCANID_VEC = "0" *) 
  (* DONT_TOUCH *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lut_buffer_v2_0_1_lut_buffer inst
       (.bscanid_en_i(bscanid_en_i),
        .bscanid_en_o(bscanid_en_o),
        .bscanid_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bscanid_o(NLW_inst_bscanid_o_UNCONNECTED[31:0]),
        .capture_i(capture_i),
        .capture_o(capture_o),
        .drck_i(drck_i),
        .drck_o(drck_o),
        .reset_i(reset_i),
        .reset_o(reset_o),
        .runtest_i(runtest_i),
        .runtest_o(runtest_o),
        .sel_i(sel_i),
        .sel_o(sel_o),
        .shift_i(shift_i),
        .shift_o(shift_o),
        .tck_i(tck_i),
        .tck_o(tck_o),
        .tdi_i(tdi_i),
        .tdi_o(tdi_o),
        .tdo_i(tdo_i),
        .tdo_o(tdo_o),
        .tms_i(tms_i),
        .tms_o(tms_o),
        .update_i(update_i),
        .update_o(update_o));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SSBRCQ40MxSqdI65DGZN1mftpVDzrnXA6niCZQTB+CQtpIjro8Ml3/FYb2s8aksyDR1VhGBuL3X2
bIikLXz5oGnn3cLC5euzeNFbAR3ge6DkRJYa3u9AggJ42tV6P+AYTOsIzI4IVgBPkoPZVYe1UVvG
jmgAPPR2NE3OL3YfNR0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7KLOIWVfI6lpiIUxJyB4Cruqr2qpl3U94SJaw1vEv04wy2RdX9NNNng1EQACPOJCBGy5pYZSSzJ
WrR1VafMr4Wmw5Dj/9Cy7/KTSJS/mtbZ/Z02M5hogyfWik1hqdDeUAIdpSIcA72762p+cMom5Syo
av/7lIG/5/ETUkUqMp7ZvKIzuPJUjdBkQxbTO8Hp4HRl2gXOR/D9cxNgyzRf7F8hXvOLApy7i7V8
U2nBbIe0+Vurk4mcQmPF5zrj9jUzqsGr0nf4zzdhI+gFedSRJ3UH0lQ7ud1jzTO+iUXS+6fr/68b
2HyVAahUvfvUdIt7NC+p41j0Zw8NGAL6IqOYvw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
kyQhYGJ9ge5mch8VSi+DV5bu0/14Z7bfTvz7ztTvDxaXiNVdVOaQRSX1XF9MH+KE4X2WVtZh1uih
/yb9UX6F6uAhRpo23Zjdtb8Dh3CkkeWQEt/m7PpDGfR0cq44tab7PkrIWIRcqo0ONM6cFEyrktzf
lTDI5UcAdPMwa9WNX4Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F2qAqxhyOh/z3Ht89t3V+fHVZ8pAdXylJIxS7GHXbyyWTAoBfn3tlyCHUveePkYAFVTbVudjFiUx
PDyB76Os7El8b2pEc/Wh3OISLDYzQAh8dLWdt+C7OhvBDfryReLSJ3q71jBIW0h7i+mMlm3HJSHu
QmeeVaivTMqObnjWfw/L4vsD8MugBWCi/dMIIE5VhtpTvHcqn0hi5dlT1oqlHXYPBB8cz54B8u+1
i4zZt0+cMj1bEHmsjWkipKDwoqziGIsZGxtGm5+SBn+HHt5eDfrgJKNQzEEO3lfSpHJU02xsTiZP
WjVtnU1mNkLl5Agah1TcGa+hgh4bBfAEWQKTdg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3vWwvMvtbB1BAV0sniX0EKmgVPJY9QITs5zn6X4fRFVcSXUy9n9vS+oAjsgylaPOK/uYN1COCagP
5P+rz+thG660mgd3d1MlIFdaCQsqrl28roLKtLlyt+cIdHF6HGV8AQ0+gHWjqW7oUc+e1x56Gr5j
KFD3KtAci4ekXYbCDFXJaLMzhsNX+UTBS71MLhdg+tcQNIE3hhRhFwQRMDWp9Rsx22kKKp5x6S7/
emeRYMVVzqzLFy/mwtMJIfDh1Pdgy9jVBSew6pu2/UO2ITNlJiJ2E9N324IOAYW0W5bm0E5bYuEC
GidQxE8XVyBtmrdgTLMg4UXox8Y+lDyPzhqOPg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kiWGzT9SbJEH7bVbQjVwNUnTv7pAUp8yhW5Bwq5DehJ5SKXKjIasGcAhD99RYnPgnI4Fj0Mn+79v
vEQaae2MVQYFZ1vHbwQQAu15oNFz6csYhjarpZxIOME5xu9nEf/KsRMSQa1Ewj7SG5FRsUfR2/O8
2RpPPjyPCtPpoqJfWNMVWYYMk+IOGN2sUdhm09N4cgcY5B2Zzw06mZReYv+dunJ/N4PnNjReTRW8
JdObPijV0iX0iM2GAVHgP7dYrvGkddw8mDwUULi/irxDKtYrsSlCKyeQyUoxUyB8QJ7Q4LTfIIRu
E1GlwrTyvsY20hQ62b54LVJKLNNYqj3+9eL20w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eodNY9MZaYaCRLkW1EUygNxV/NwRSypQgf9h5+pShB/1iUnT0B0EGmEsS/x1lXAFXxqkvP5IcKiS
p2jj1wjD4cv0vu07nFENNlEsUc0tWeAlL0sfcJwPdKTEZprhZW2LE/pmnjeIrBBGcNqfhX/wpCYU
/pTILq9o0l2czcGeq3KicNhq5VMEFJfEQUeE/+SM2lwEUHhTRGzlPsn4DS7Fs0hMtUZkeCfg/D35
f8NURV9z8suFhyIGlDD+QClEiFACj5Kfi9G3VPyWidqXhDX6ZvxRBn4Kwxp6tiNVbBK8+HFeqV7N
4/FEPJVHT2BWzR6ftAdaujEVs7gOa2dAL4z4iw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
j9mEUB6YlzDa5moKcEte/LDcTiShg21u0ejseyB4gcRc6iTI/zEteRnOdmRWEva+LXIX3jgVMtNe
qjnfPw83w4z0xn5jfPEZ8iDjoNLAZyBavs4diNpK9NaFpPTlNEKS2PBZ3uwLZxKedhSGPzLY6byu
28IDaHtdL2EVbEcuDoBcFvfjZLp4HGpwqsrnvO14IBuBjIZmobtok+9WLikYU83wOC6dgtHfvYrH
NXWOdvqesAnpSfl7FlRK8hVZmDNWzQ5f+OX0VfaOJkoiOvSINw6nz7qWV0yz/79RHM4xHGoL8aOu
p5g5cWFQlTs5zEDSoydKiakpwr3RhwFKOYhCGKlkNOuvJO++iX7p60VLUqlUakW0PQabAWSjoFms
JzEB0QOP8vNzI/62vS9OMDrVdZ3aTuXeFLg+g/IFHmuHtSNuimR/G+o2r708Om3w1B0oCtqkHFFE
/TO0Xe4IJiips2RspFi9DWrbOhlDW01JaFnscq0/MjtaHW8ZeQsHVv2Q

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k85XwG8ZEWHIj3B0OxaRhQ9DPZhA2AEmn1Fk5sSFQ9RUvPgjTU7sBcRdnykvi0cKB04EsWsaT3UH
OFZ27tF5UqrEfo9OPXtquL+wzgwXDxMrN3QymSRIeqnkVnr3FQ5ZLXMed/g8eugAO6BsK7ayc3q3
poNXvA3qAd0Qb/61R0Y8fC/mzAOZC1kmySJ+m5McBW3S/PSumlfFYgEJfqBBlhcJlDnbQC7JZ67S
uSRNCb58BruGJ0tU/J9g0nJrt8suR55k/GN7w9YOOL8KARIwKRZVH9+PqbpIbj3PFi4X/YTnWykH
CSrnlAxWCvDjLa43yhbtZtpvP8PYK+IZF6lG1Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2960)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
