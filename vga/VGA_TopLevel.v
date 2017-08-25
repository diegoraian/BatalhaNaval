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
// CREATED		"Mon Aug 07 19:28:57 2017"

module VGA_TopLevel(
	clk,
	reset,
	leftArrowA,
	rightArrowA,
	upArrowA,
	downArrowA,
	leftArrowB,
	rightArrowB,
	upArrowB,
	downArrowB,
	h_sync,
	v_sync,
	VGA_CLK,
	rgb_r_out7,
	rgb_g_out7,
	rgb_b_out7,
	rgb_r_outA,
	rgb_g_outA,
	rgb_b_outA,
	rgb_r_outB,
	rgb_g_outB,
	rgb_b_outB
);


input wire	clk;
input wire	reset;
input wire	leftArrowA;
input wire	rightArrowA;
input wire	upArrowA;
input wire	downArrowA;
input wire	leftArrowB;
input wire	rightArrowB;
input wire	upArrowB;
input wire	downArrowB;
output wire	h_sync;
output wire	v_sync;
output wire	VGA_CLK;
output wire	rgb_r_out7;
output wire	rgb_g_out7;
output wire	rgb_b_out7;
output wire	rgb_r_outA;
output wire	rgb_g_outA;
output wire	rgb_b_outA;
output wire	rgb_r_outB;
output wire	rgb_g_outB;
output wire	rgb_b_outB;

wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[9:0] SYNTHESIZED_WIRE_17;
wire	[9:0] SYNTHESIZED_WIRE_18;
wire	[63:0] SYNTHESIZED_WIRE_4;
wire	[63:0] SYNTHESIZED_WIRE_13;

assign	VGA_CLK = SYNTHESIZED_WIRE_15;




PLL_clk	b2v_inst(
	.inclk0(clk),
	.c0(SYNTHESIZED_WIRE_15));


VGA_Coordenada_Embarcacao_Teste_A	b2v_inst1(
	.leftArrow(leftArrowA),
	.rightArrow(rightArrowA),
	.upArrow(upArrowA),
	.downArrow(downArrowA),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_4));


VGA_Submarino	b2v_inst10(
	.clk(SYNTHESIZED_WIRE_15),
	.areaAtiva(SYNTHESIZED_WIRE_16),
	.coluna(SYNTHESIZED_WIRE_17),
	.linha(SYNTHESIZED_WIRE_18),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_4),
	.rgb_r(rgb_r_outB),
	.rgb_g(rgb_g_outB),
	.rgb_b(rgb_b_outB));
	defparam	b2v_inst10.X1 = 10'b0000000001;
	defparam	b2v_inst10.X2 = 10'b0000000010;
	defparam	b2v_inst10.X3 = 10'b0000000011;
	defparam	b2v_inst10.X4 = 10'b0000000100;
	defparam	b2v_inst10.X5 = 10'b0000000101;
	defparam	b2v_inst10.X6 = 10'b0000000110;
	defparam	b2v_inst10.X7 = 10'b0000000111;
	defparam	b2v_inst10.X8 = 10'b0000001000;
	defparam	b2v_inst10.Y1 = 10'b0000000001;
	defparam	b2v_inst10.Y2 = 10'b0000000010;
	defparam	b2v_inst10.Y3 = 10'b0000000011;
	defparam	b2v_inst10.Y4 = 10'b0000000100;
	defparam	b2v_inst10.Y5 = 10'b0000000101;
	defparam	b2v_inst10.Y6 = 10'b0000000110;
	defparam	b2v_inst10.Y7 = 10'b0000000111;
	defparam	b2v_inst10.Y8 = 10'b0000001000;


VGA_Mapa	b2v_inst2(
	.clk(SYNTHESIZED_WIRE_15),
	.areaAtiva(SYNTHESIZED_WIRE_16),
	.coluna(SYNTHESIZED_WIRE_17),
	.linha(SYNTHESIZED_WIRE_18),
	.rgb_r(rgb_r_out7),
	.rgb_g(rgb_g_out7),
	.rgb_b(rgb_b_out7));


VGA_Coordenada_Embarcacao_Teste_B	b2v_inst4(
	.leftArrow(leftArrowB),
	.rightArrow(rightArrowB),
	.upArrow(upArrowB),
	.downArrow(downArrowB),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_13));


VGA_Submarino	b2v_inst9(
	.clk(SYNTHESIZED_WIRE_15),
	.areaAtiva(SYNTHESIZED_WIRE_16),
	.coluna(SYNTHESIZED_WIRE_17),
	.linha(SYNTHESIZED_WIRE_18),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_13),
	.rgb_r(rgb_r_outA),
	.rgb_g(rgb_g_outA),
	.rgb_b(rgb_b_outA));
	defparam	b2v_inst9.X1 = 10'b0000000001;
	defparam	b2v_inst9.X2 = 10'b0000000010;
	defparam	b2v_inst9.X3 = 10'b0000000011;
	defparam	b2v_inst9.X4 = 10'b0000000100;
	defparam	b2v_inst9.X5 = 10'b0000000101;
	defparam	b2v_inst9.X6 = 10'b0000000110;
	defparam	b2v_inst9.X7 = 10'b0000000111;
	defparam	b2v_inst9.X8 = 10'b0000001000;
	defparam	b2v_inst9.Y1 = 10'b0000000001;
	defparam	b2v_inst9.Y2 = 10'b0000000010;
	defparam	b2v_inst9.Y3 = 10'b0000000011;
	defparam	b2v_inst9.Y4 = 10'b0000000100;
	defparam	b2v_inst9.Y5 = 10'b0000000101;
	defparam	b2v_inst9.Y6 = 10'b0000000110;
	defparam	b2v_inst9.Y7 = 10'b0000000111;
	defparam	b2v_inst9.Y8 = 10'b0000001000;


VGASinc	b2v_vga_sinc(
	.reset(reset),
	.clk(SYNTHESIZED_WIRE_15),
	.h_sync(h_sync),
	.v_sync(v_sync),
	.regiaoAtiva(SYNTHESIZED_WIRE_16),
	.coluna(SYNTHESIZED_WIRE_17),
	.linha(SYNTHESIZED_WIRE_18));
	defparam	b2v_vga_sinc.COLUNASATIVAS = 640;
	defparam	b2v_vga_sinc.LINHASATIVAS = 480;
	defparam	b2v_vga_sinc.TOTALCOLUNAS = 800;
	defparam	b2v_vga_sinc.TOTALLINHAS = 524;


endmodule
