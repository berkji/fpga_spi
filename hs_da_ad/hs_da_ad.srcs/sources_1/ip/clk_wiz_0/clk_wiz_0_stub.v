// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Apr  1 23:11:56 2023
// Host        : DESKTOP-CPEH9UU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/workspace/arty-a7/Arty-ex20/hs_da_ad/hs_da_ad.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_50, resetn, locked, sys_clk)
/* synthesis syn_black_box black_box_pad_pin="clk_50,resetn,locked,sys_clk" */;
  output clk_50;
  input resetn;
  output locked;
  input sys_clk;
endmodule
