// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Apr  1 21:59:09 2023
// Host        : DESKTOP-CPEH9UU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/workspace/arty-a7/Arty-ex20/hs_da_ad/hs_da_ad.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2019.2" *)
module ila_0(clk, probe0, probe1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[7:0]" */;
  input clk;
  input [0:0]probe0;
  input [7:0]probe1;
endmodule
