// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Mon Sep 28 23:42:58 2026
// Host        : node06.local running 64-bit Rocky Linux release 8.9 (Green Obsidian)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_22c0_gapping_demand_toggle_0_sim_netlist.v
// Design      : bd_22c0_gapping_demand_toggle_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_22c0_gapping_demand_toggle_0,c_counter_binary_v12_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_21,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN cd_ctrl_00, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_mode = "slave ce_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_mode = "master q_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 1}" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_COUNT_BY = "1" *) 
  (* C_COUNT_MODE = "0" *) 
  (* C_COUNT_TO = "1" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_LOAD = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_HAS_THRESH0 = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_LOAD_LOW = "0" *) 
  (* C_RESTRICT_COUNT = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_THRESH0_VALUE = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "1" *) 
  (* C_XDEVICEFAMILY = "virtexuplusHBM" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_21 U0
       (.CE(CE),
        .CLK(CLK),
        .L(1'b0),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
BzpXTEKA8BVsrspByEDp/11GmM+rxG9XMJJJnmPNjGdQQboQwi++OZU3ieaWxVBebPZFocPwODUK
3YSjgSy7gDq0QaoBQZG6dZMAag7Ne0KGfWsP1RqdsPfVxeH8Qx/6wZgpp78UM9HQGzTHo1GLZBWS
D4wUYwEsU87u9Zpk3qs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vpBJkG8TIIvbLGijR8Bv2vcecc3ZXSLh67+33TG+HIWVhhxrrYg0y/8AvFRWiudkKCNlAbPuc21/
CBoxEnV/LjWMInbIFuSDIvOG8YntNXFMyV5vsO6fmRNacW9hih9Fw2He/tr75B/S25kFdFus6dUq
8UyHbnShYb39EGpaT8QIg/FBg3M4scSnbKUQgZvAjUqPbPp24vO/T8m2aU7Vep++Wl0eSykhEgjW
MjtHYZn7kE2KKNgxYa/KQbvvP0Gf7nFLvEI10dGiGLxPd1u7V370HoIZjYKDtyR0kzX4BKMwwKoS
NulYuGY6BDWl62DKHwhGYkf0IS+HXlSikk4liQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
E48CjVwTRLHIDhOzAwgts1XbVc6DxcxGnoR9OV1zjKj3qFL1M/uWMiuaVq+LhoGPTQ5A4NG56fLV
5VV7/BgXKg/VECNvgEEYeQT/wj1+DvDdp504/7nU3sBA13uhhPSNa7nI0u6LqO2vksEZLQzkRkWh
eiuYdOOIEGb7fsy61HI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mGOeQ9tc5jI6QAZv7QO4L3cVfVa/LhRQbJW/zRcR+rZXpzRvcDHrXUpbvJJmZiGLu+GO43OagOrs
JJje6ctkHjBbdnaclDtJoVMLYaE/wmkaFn8jO0jKVzfHGwOJ2tex55X80BDpAb6poBcWi5LL2/MV
xkMZZcV65cGDdTRFLmf5M7lifrLkaqOwgdAma9Voud8egHaPwtITXN1T707M5717wNjUoA3xzaNq
SxtdD6rBT/R0rpWqnetxcdcm+cyJtDFAiFXfWYtheZfJQzLzNNr0+gOtIl2Vsj819K1053mMlIIA
7rPm0YsAyCmhhBgGHTJ5hsvbewhsG/oMhPnwyA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ir2SU2p9N+IdgqX22ItQaWq9hixnYLt4vKaB894e/xFxWuXoMzqHcfYR7vBCuujeMXpoSBBVJBEb
aL1CBX494Fct8JbU64s8drP+5zp7Ik5bO/BP6UDP0zR1Lk8gBldA0NhA+4R/NtFKoHBXV9Hyqb4c
eeRiQKbkzwOpniYRNK9KaDFaR6nhBrUIiemCW1UApV1qD7qZSafxFn0I1XFe05NsAyumBdNUFj8N
/AFeTcU7CjC3SR0TehjOq+M4ajm2Eg6C7r7+jIhJqgWudMuX6NhOX9KPvLKao3POKANouaF9rkjY
U4F5L9YRkFYwysEBCskyCWTzM9gmnFEcNtTHjg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qCdZIR2lY555ysNYtBeic8wRf70LXFEa31kdQ5kzdBTiiODubBlmOjZkSwgV2tYDTGtnwtOcvF0s
Elys3IPJllruqyEsPok2IPTWRmwZhhM+jT2m6JHal3xelQUa9aATbp6zuYJOJn1D31DpNoLD1DfZ
AJ2P+MTOyy8gQujheVqkOqmJgl9dQ5ZjrA8GPkJ9UYXWhUlpQvCj6ti6jVbVXZj72iqxdK9GnHk1
nHncVoywR5bxthUHs3N/GYvfrYpt+JEdVOIjkVAiquKOJWaRb7l5XP3P5JaVRnbNQyQdLJ9N5kKL
Dlvam6j2UzbfKWdcZaFoiHHE+Zgccsm1OviOFg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QxSQvBzpc2EEF090FbGf60i+fTpGqmZdwcvY+ujlnv2k4tn/UH5GonGALqhl46o5ss7Gi3/Z7ywi
nHOkluAL7B3eyqfuCiFqVyjpsJBKi1PGbIY5SQeLsEwU3ScOXCqOe4o0e8Ew0CzN2ieBjiRJo8Ci
4a2G7m9qSVvm10eUHWJjk7dBLAv39V1IDpNupW2sc6ExAehKASl2a1UyTfxU5xNcesaw9/ET326O
Ife91Cm76aO/Pnu/pvnAULbURniJRYxzfYzAjdZTF31GZhPmFaXRA/YBNGtjpq3zHk8wrQwLN+N7
j8LFGwUNTUKWqj7ronPDeIxcosTol4FIpCiPYw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gIe/tZRqjW0No3A5MCNWTIBlKvh9R8myhpu8uDYycW7kxN72cZojsq8Of1nYbk8iBoLnq5157CZs
0fBjlhoAzspgFPQV4yMLrZS6TusQ5yKtuqypUAjE7LJQFedz+y9ZETdxdVbOvYtWzKea0U3Fzv1k
tjOq+Cj90aPa3GGDyNfRqYx61Dpi2RHlFaByI/7zxFMWhJGmyMgTWlbwsEwdgHI7k0a7fRC/XY8g
RnZ4JXrhTHxkuK9jvS51fLbz9aaydUJ/XbKyrF1vGgzE4mG+74ggIbKzZ5xQtggLa0hWmCHzpeHp
ufwT86ozoQbfgn7FqbIbsWrG9GEF6TgFxFzBmZ7h5rhU5F6Y0NNtWEP1yVpq1WTsybH1KdfqnRLX
/fUjCypGHbL2vrR99Xa/zKUrEfG+GrGPWhqHX55NLQHuHuoCn6gaQZrG9hvMfqVczMXZxM1922Dd
8HrKwlNCvVtT/3daJVNr7+Tb5Atyq/jFISaNwYMM8xXyJiUIE4Ytd8OJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bM8gxHQieXQanVvZmD3hi66fOv5Uf/ir2vAxD6v2EOriOQSZBYrhXdRSaeTTm2qXbKAnKSsP+a/7
LMXmNnigIUvTNvsbQgr2yJifLo03H1WEwoBJwZIw7sDUSLpnQZx5EWv9XQwlAt2w86uuvWVQr0Tt
iN14uUJYdHV1344RX91A6rlSZ0AKu1CjeJN8t2AQl4IjKke0JQMiimZFuk34xuO0gcNE2YOfiQMS
v4AJOHL2LPEu+7TGgOxT9Uhpp91WdVWcKkPzCK4t41zgP2/8oAUiHhtzKXSnVgPe26RuNX1lsJki
eq9qM846JZxMsSbL8ipW3GG+i5qdsUATs6fzEw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kwJ6Q71uc9bPegeb1ytad4J3iQkoEBblCyV3UQfZOdiW1rDzfyAaVUoa9mS4XrfRsDlQfVRHBhvL
eVMmapH9l6BrSwIhz6DCnoH6W2/NMkL6uqS1cXT9X2xK//t+lUGjPOAH1jE5Fj6T5uQaROacGeeE
nbNfXy9tqV2HZ18qdM68c0xKg0/Qp3Kj7xFF83jUq/nnpQrvsTCEDOyknMjgcHUUgt8AP2oVxRT5
rXvX/2nFBClFCugAdgO+bqY44cr+vQ2qBuPjNCMpoLt7iWFpXzthEaUoJSGPH6QSJLv33c9pwWPU
eib9cnzlx+XNFaLe3i3/3Zp30PPnk0osNkxD4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ckmb4dWDpAZAGAIVUn02YtfbkK3GxAuwJy6uBEXF8442TvhBd+VebHNHGgYyyNdb7cKMew7Ihod4
NLgbAwZVkdrtd4bHtJVVZeEnGG9+kAbFOzPhSu5wUmCNfLmdMN/2dkUwASCj681QZtR7Y/atMOM+
WMbBEK5ddfXkCLgrAd4FGC1MfGLc0MqY6LUwH9haai4ICPApVdSeuWSMaubHa7KaZtCfOP0XfhuM
gnzZnOb+MUEd2Vhn/OjVESjqW4rYYxu2FSP71dpG5TznpyVHKq+PqZ9z2DnFU1ldoe+zwEosFrx4
oCuFduC9IBNSOgy/Si7ouaDl09xJ/9ZWgQtjSg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2336)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
BzpXTEKA8BVsrspByEDp/11GmM+rxG9XMJJJnmPNjGdQQboQwi++OZU3ieaWxVBebPZFocPwODUK
3YSjgSy7gDq0QaoBQZG6dZMAag7Ne0KGfWsP1RqdsPfVxeH8Qx/6wZgpp78UM9HQGzTHo1GLZBWS
D4wUYwEsU87u9Zpk3qs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vpBJkG8TIIvbLGijR8Bv2vcecc3ZXSLh67+33TG+HIWVhhxrrYg0y/8AvFRWiudkKCNlAbPuc21/
CBoxEnV/LjWMInbIFuSDIvOG8YntNXFMyV5vsO6fmRNacW9hih9Fw2He/tr75B/S25kFdFus6dUq
8UyHbnShYb39EGpaT8QIg/FBg3M4scSnbKUQgZvAjUqPbPp24vO/T8m2aU7Vep++Wl0eSykhEgjW
MjtHYZn7kE2KKNgxYa/KQbvvP0Gf7nFLvEI10dGiGLxPd1u7V370HoIZjYKDtyR0kzX4BKMwwKoS
NulYuGY6BDWl62DKHwhGYkf0IS+HXlSikk4liQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
E48CjVwTRLHIDhOzAwgts1XbVc6DxcxGnoR9OV1zjKj3qFL1M/uWMiuaVq+LhoGPTQ5A4NG56fLV
5VV7/BgXKg/VECNvgEEYeQT/wj1+DvDdp504/7nU3sBA13uhhPSNa7nI0u6LqO2vksEZLQzkRkWh
eiuYdOOIEGb7fsy61HI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mGOeQ9tc5jI6QAZv7QO4L3cVfVa/LhRQbJW/zRcR+rZXpzRvcDHrXUpbvJJmZiGLu+GO43OagOrs
JJje6ctkHjBbdnaclDtJoVMLYaE/wmkaFn8jO0jKVzfHGwOJ2tex55X80BDpAb6poBcWi5LL2/MV
xkMZZcV65cGDdTRFLmf5M7lifrLkaqOwgdAma9Voud8egHaPwtITXN1T707M5717wNjUoA3xzaNq
SxtdD6rBT/R0rpWqnetxcdcm+cyJtDFAiFXfWYtheZfJQzLzNNr0+gOtIl2Vsj819K1053mMlIIA
7rPm0YsAyCmhhBgGHTJ5hsvbewhsG/oMhPnwyA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ir2SU2p9N+IdgqX22ItQaWq9hixnYLt4vKaB894e/xFxWuXoMzqHcfYR7vBCuujeMXpoSBBVJBEb
aL1CBX494Fct8JbU64s8drP+5zp7Ik5bO/BP6UDP0zR1Lk8gBldA0NhA+4R/NtFKoHBXV9Hyqb4c
eeRiQKbkzwOpniYRNK9KaDFaR6nhBrUIiemCW1UApV1qD7qZSafxFn0I1XFe05NsAyumBdNUFj8N
/AFeTcU7CjC3SR0TehjOq+M4ajm2Eg6C7r7+jIhJqgWudMuX6NhOX9KPvLKao3POKANouaF9rkjY
U4F5L9YRkFYwysEBCskyCWTzM9gmnFEcNtTHjg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qCdZIR2lY555ysNYtBeic8wRf70LXFEa31kdQ5kzdBTiiODubBlmOjZkSwgV2tYDTGtnwtOcvF0s
Elys3IPJllruqyEsPok2IPTWRmwZhhM+jT2m6JHal3xelQUa9aATbp6zuYJOJn1D31DpNoLD1DfZ
AJ2P+MTOyy8gQujheVqkOqmJgl9dQ5ZjrA8GPkJ9UYXWhUlpQvCj6ti6jVbVXZj72iqxdK9GnHk1
nHncVoywR5bxthUHs3N/GYvfrYpt+JEdVOIjkVAiquKOJWaRb7l5XP3P5JaVRnbNQyQdLJ9N5kKL
Dlvam6j2UzbfKWdcZaFoiHHE+Zgccsm1OviOFg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QxSQvBzpc2EEF090FbGf60i+fTpGqmZdwcvY+ujlnv2k4tn/UH5GonGALqhl46o5ss7Gi3/Z7ywi
nHOkluAL7B3eyqfuCiFqVyjpsJBKi1PGbIY5SQeLsEwU3ScOXCqOe4o0e8Ew0CzN2ieBjiRJo8Ci
4a2G7m9qSVvm10eUHWJjk7dBLAv39V1IDpNupW2sc6ExAehKASl2a1UyTfxU5xNcesaw9/ET326O
Ife91Cm76aO/Pnu/pvnAULbURniJRYxzfYzAjdZTF31GZhPmFaXRA/YBNGtjpq3zHk8wrQwLN+N7
j8LFGwUNTUKWqj7ronPDeIxcosTol4FIpCiPYw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gIe/tZRqjW0No3A5MCNWTIBlKvh9R8myhpu8uDYycW7kxN72cZojsq8Of1nYbk8iBoLnq5157CZs
0fBjlhoAzspgFPQV4yMLrZS6TusQ5yKtuqypUAjE7LJQFedz+y9ZETdxdVbOvYtWzKea0U3Fzv1k
tjOq+Cj90aPa3GGDyNfRqYx61Dpi2RHlFaByI/7zxFMWhJGmyMgTWlbwsEwdgHI7k0a7fRC/XY8g
RnZ4JXrhTHxkuK9jvS51fLbz9aaydUJ/XbKyrF1vGgzE4mG+74ggIbKzZ5xQtggLa0hWmCHzpeHp
ufwT86ozoQbfgn7FqbIbsWrG9GEF6TgFxFzBmZ7h5rhU5F6Y0NNtWEP1yVpq1WTsybH1KdfqnRLX
/fUjCypGHbL2vrR99Xa/zKUrEfG+GrGPWhqHX55NLQHuHuoCn6gaQZrG9hvMfqVczMXZxM1922Dd
8HrKwlNCvVtT/3daJVNr7+Tb5Atyq/jFISaNwYMM8xXyJiUIE4Ytd8OJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bM8gxHQieXQanVvZmD3hi66fOv5Uf/ir2vAxD6v2EOriOQSZBYrhXdRSaeTTm2qXbKAnKSsP+a/7
LMXmNnigIUvTNvsbQgr2yJifLo03H1WEwoBJwZIw7sDUSLpnQZx5EWv9XQwlAt2w86uuvWVQr0Tt
iN14uUJYdHV1344RX91A6rlSZ0AKu1CjeJN8t2AQl4IjKke0JQMiimZFuk34xuO0gcNE2YOfiQMS
v4AJOHL2LPEu+7TGgOxT9Uhpp91WdVWcKkPzCK4t41zgP2/8oAUiHhtzKXSnVgPe26RuNX1lsJki
eq9qM846JZxMsSbL8ipW3GG+i5qdsUATs6fzEw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kwJ6Q71uc9bPegeb1ytad4J3iQkoEBblCyV3UQfZOdiW1rDzfyAaVUoa9mS4XrfRsDlQfVRHBhvL
eVMmapH9l6BrSwIhz6DCnoH6W2/NMkL6uqS1cXT9X2xK//t+lUGjPOAH1jE5Fj6T5uQaROacGeeE
nbNfXy9tqV2HZ18qdM68c0xKg0/Qp3Kj7xFF83jUq/nnpQrvsTCEDOyknMjgcHUUgt8AP2oVxRT5
rXvX/2nFBClFCugAdgO+bqY44cr+vQ2qBuPjNCMpoLt7iWFpXzthEaUoJSGPH6QSJLv33c9pwWPU
eib9cnzlx+XNFaLe3i3/3Zp30PPnk0osNkxD4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ckmb4dWDpAZAGAIVUn02YtfbkK3GxAuwJy6uBEXF8442TvhBd+VebHNHGgYyyNdb7cKMew7Ihod4
NLgbAwZVkdrtd4bHtJVVZeEnGG9+kAbFOzPhSu5wUmCNfLmdMN/2dkUwASCj681QZtR7Y/atMOM+
WMbBEK5ddfXkCLgrAd4FGC1MfGLc0MqY6LUwH9haai4ICPApVdSeuWSMaubHa7KaZtCfOP0XfhuM
gnzZnOb+MUEd2Vhn/OjVESjqW4rYYxu2FSP71dpG5TznpyVHKq+PqZ9z2DnFU1ldoe+zwEosFrx4
oCuFduC9IBNSOgy/Si7ouaDl09xJ/9ZWgQtjSg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2816)
`pragma protect data_block
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
hgIqfIROIHRINbxqSSponTdbUmqsRJU=
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
