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
// CREATED		"Tue Aug 01 15:52:40 2017"

module VGA_TopLevel(
	clk,
	reset,
	leftArrow,
	rightArrow,
	upArrow,
	downArrow,
	h_sync,
	v_sync,
	VGA_CLK,
	rgb_r_out7,
	rgb_g_out7,
	rgb_b_out7,
	rgb_b_out8,
	rgb_g_out8,
	rgb_r_out8
);


input wire	clk;
input wire	reset;
input wire	leftArrow;
input wire	rightArrow;
input wire	upArrow;
input wire	downArrow;
output wire	h_sync;
output wire	v_sync;
output wire	VGA_CLK;
output wire	rgb_r_out7;
output wire	rgb_g_out7;
output wire	rgb_b_out7;
output wire	rgb_b_out8;
output wire	rgb_g_out8;
output wire	rgb_r_out8;

wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[9:0] SYNTHESIZED_WIRE_12;
wire	[9:0] SYNTHESIZED_WIRE_13;
wire	[63:0] SYNTHESIZED_WIRE_8;

assign	VGA_CLK = SYNTHESIZED_WIRE_10;




PLL_clk	b2v_inst(
	.inclk0(clk),
	.c0(SYNTHESIZED_WIRE_10));


VGA_Coordemada_Embarcacao_Teste	b2v_inst1(
	.leftArrow(leftArrow),
	.rightArrow(rightArrow),
	.upArrow(upArrow),
	.downArrow(downArrow),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_8));


VGA_MapaGame	b2v_inst2(
	.clk(SYNTHESIZED_WIRE_10),
	.areaAtiva(SYNTHESIZED_WIRE_11),
	.coluna(SYNTHESIZED_WIRE_12),
	.linha(SYNTHESIZED_WIRE_13),
	.rgb_r(rgb_r_out7),
	.rgb_g(rgb_g_out7),
	.rgb_b(rgb_b_out7));


VGA_Submarino	b2v_inst3(
	.clk(SYNTHESIZED_WIRE_10),
	.areaAtiva(SYNTHESIZED_WIRE_11),
	.coluna(SYNTHESIZED_WIRE_12),
	.linha(SYNTHESIZED_WIRE_13),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_8),
	.rgb_r(rgb_r_out8),
	.rgb_g(rgb_g_out8),
	.rgb_b(rgb_b_out8));
	defparam	b2v_inst3.X1 = 10'b0000000001;
	defparam	b2v_inst3.X2 = 10'b0000000010;
	defparam	b2v_inst3.X3 = 10'b0000000011;
	defparam	b2v_inst3.X4 = 10'b0000000100;
	defparam	b2v_inst3.X5 = 10'b0000000101;
	defparam	b2v_inst3.X6 = 10'b0000000110;
	defparam	b2v_inst3.X7 = 10'b0000000111;
	defparam	b2v_inst3.X8 = 10'b0000001000;
	defparam	b2v_inst3.Y1 = 10'b0000000001;
	defparam	b2v_inst3.Y2 = 10'b0000000010;
	defparam	b2v_inst3.Y3 = 10'b0000000011;
	defparam	b2v_inst3.Y4 = 10'b0000000100;
	defparam	b2v_inst3.Y5 = 10'b0000000101;
	defparam	b2v_inst3.Y6 = 10'b0000000110;
	defparam	b2v_inst3.Y7 = 10'b0000000111;
	defparam	b2v_inst3.Y8 = 10'b0000001000;


VGASinc	b2v_vga_sinc(
	.reset(reset),
	.clk(SYNTHESIZED_WIRE_10),
	.h_sync(h_sync),
	.v_sync(v_sync),
	.regiaoAtiva(SYNTHESIZED_WIRE_11),
	.coluna(SYNTHESIZED_WIRE_12),
	.linha(SYNTHESIZED_WIRE_13));
	defparam	b2v_vga_sinc.COLUNASATIVAS = 640;
	defparam	b2v_vga_sinc.LINHASATIVAS = 480;
	defparam	b2v_vga_sinc.TOTALCOLUNAS = 800;
	defparam	b2v_vga_sinc.TOTALLINHAS = 524;


endmodule
