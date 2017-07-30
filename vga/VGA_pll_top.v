// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
// CREATED		"Sat Jul 29 18:10:27 2017"

module VGA_pll_top(
	reset,
	clk,
	rgb_R,
	rgb_G,
	rgb_B,
	v_sync,
	h_sync,
	pll_clk
);


input wire	reset;
input wire	clk;
output wire	rgb_R;
output wire	rgb_G;
output wire	rgb_B;
output wire	v_sync;
output wire	h_sync;
output wire	pll_clk;

wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_2;
wire	[9:0] SYNTHESIZED_WIRE_3;
wire	[9:0] SYNTHESIZED_WIRE_4;

assign	pll_clk = SYNTHESIZED_WIRE_5;




PLL_clk	b2v_inst(
	.inclk0(clk),
	.c0(SYNTHESIZED_WIRE_5));


VGASinc	b2v_inst1(
	.reset(reset),
	.clk(SYNTHESIZED_WIRE_5),
	.h_sync(h_sync),
	.v_sync(v_sync),
	.regiaoAtiva(SYNTHESIZED_WIRE_2),
	.coluna(SYNTHESIZED_WIRE_3),
	.linha(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst1.COLUNASATIVAS = 640;
	defparam	b2v_inst1.LINHASATIVAS = 480;
	defparam	b2v_inst1.TOTALCOLUNAS = 800;
	defparam	b2v_inst1.TOTALLINHAS = 524;


VGA_Submarino	b2v_inst2(
	.clk(SYNTHESIZED_WIRE_5),
	.areaAtiva(SYNTHESIZED_WIRE_2),
	.coluna(SYNTHESIZED_WIRE_3),
	.linha(SYNTHESIZED_WIRE_4),
	
	.rgb_r(rgb_R),
	.rgb_g(rgb_G),
	.rgb_b(rgb_B));
	defparam	b2v_inst2.X1 = 10'b0000000001;
	defparam	b2v_inst2.X2 = 10'b0000000010;
	defparam	b2v_inst2.X3 = 10'b0000000011;
	defparam	b2v_inst2.X4 = 10'b0000000100;
	defparam	b2v_inst2.X5 = 10'b0000000101;
	defparam	b2v_inst2.X6 = 10'b0000000110;
	defparam	b2v_inst2.X7 = 10'b0000000111;
	defparam	b2v_inst2.X8 = 10'b0000001000;
	defparam	b2v_inst2.Y1 = 10'b0000000001;
	defparam	b2v_inst2.Y2 = 10'b0000000010;
	defparam	b2v_inst2.Y3 = 10'b0000000011;
	defparam	b2v_inst2.Y4 = 10'b0000000100;
	defparam	b2v_inst2.Y5 = 10'b0000000101;
	defparam	b2v_inst2.Y6 = 10'b0000000110;
	defparam	b2v_inst2.Y7 = 10'b0000000111;
	defparam	b2v_inst2.Y8 = 10'b0000001000;


endmodule