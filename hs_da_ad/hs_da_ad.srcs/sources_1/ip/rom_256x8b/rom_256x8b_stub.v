// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Apr  1 17:49:26 2023
// Host        : DESKTOP-CPEH9UU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/workspace/arty-a7/Arty-ex20/hs_da_ad/hs_da_ad.srcs/sources_1/ip/rom_256x8b/rom_256x8b_stub.v
// Design      : rom_256x8b
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module rom_256x8b(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[7:0]" */;
  input clka;
  input [7:0]addra;
  output [7:0]douta;
endmodule
