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
// CREATED		"Wed Aug 23 08:50:38 2017"

module TopLevel(
	ENTER,
	SELECT,
	RESET,
	CLK,
	VGA_CLK,
	VGA_R,
	VGA_G,
	VGA_B,
	H_SYNC,
	V_SYNC
);


input wire	ENTER;
input wire	SELECT;
input wire	RESET;
input wire	CLK;
output wire	VGA_CLK;
output wire	VGA_R;
output wire	VGA_G;
output wire	VGA_B;
output wire	H_SYNC;
output wire	V_SYNC;

wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_25;
wire	[9:0] SYNTHESIZED_WIRE_26;
wire	[9:0] SYNTHESIZED_WIRE_27;
wire	[63:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;

assign	VGA_CLK = SYNTHESIZED_WIRE_23;




Debouncer	b2v_inst(
	.clk(SYNTHESIZED_WIRE_23),
	.psh_btn(ENTER),
	.psh_stable(SYNTHESIZED_WIRE_20));


PLL_clk	b2v_inst1(
	.inclk0(CLK),
	.c0(SYNTHESIZED_WIRE_23));

assign	VGA_B = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;


VGASinc	b2v_inst2(
	.reset(SYNTHESIZED_WIRE_24),
	.clk(SYNTHESIZED_WIRE_23),
	.h_sync(H_SYNC),
	.v_sync(V_SYNC),
	.regiaoAtiva(SYNTHESIZED_WIRE_25),
	.coluna(SYNTHESIZED_WIRE_26),
	.linha(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst2.COLUNASATIVAS = 640;
	defparam	b2v_inst2.LINHASATIVAS = 480;
	defparam	b2v_inst2.TOTALCOLUNAS = 800;
	defparam	b2v_inst2.TOTALLINHAS = 524;

assign	VGA_R = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;


VGA_Mapa	b2v_inst4(
	.clk(SYNTHESIZED_WIRE_23),
	.areaAtiva(SYNTHESIZED_WIRE_25),
	.coluna(SYNTHESIZED_WIRE_26),
	.linha(SYNTHESIZED_WIRE_27),
	.rgb_r(SYNTHESIZED_WIRE_6),
	.rgb_g(SYNTHESIZED_WIRE_22),
	.rgb_b(SYNTHESIZED_WIRE_2));


VGA_Submarino	b2v_inst5(
	.clk(SYNTHESIZED_WIRE_23),
	.areaAtiva(SYNTHESIZED_WIRE_25),
	.coluna(SYNTHESIZED_WIRE_26),
	.linha(SYNTHESIZED_WIRE_27),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_15),
	.rgb_r(SYNTHESIZED_WIRE_5),
	.rgb_g(SYNTHESIZED_WIRE_21),
	.rgb_b(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst5.X1 = 10'b0000000001;
	defparam	b2v_inst5.X2 = 10'b0000000010;
	defparam	b2v_inst5.X3 = 10'b0000000011;
	defparam	b2v_inst5.X4 = 10'b0000000100;
	defparam	b2v_inst5.X5 = 10'b0000000101;
	defparam	b2v_inst5.X6 = 10'b0000000110;
	defparam	b2v_inst5.X7 = 10'b0000000111;
	defparam	b2v_inst5.X8 = 10'b0000001000;
	defparam	b2v_inst5.Y1 = 10'b0000000001;
	defparam	b2v_inst5.Y2 = 10'b0000000010;
	defparam	b2v_inst5.Y3 = 10'b0000000011;
	defparam	b2v_inst5.Y4 = 10'b0000000100;
	defparam	b2v_inst5.Y5 = 10'b0000000101;
	defparam	b2v_inst5.Y6 = 10'b0000000110;
	defparam	b2v_inst5.Y7 = 10'b0000000111;
	defparam	b2v_inst5.Y8 = 10'b0000001000;


Debouncer	b2v_inst6(
	.clk(SYNTHESIZED_WIRE_23),
	.psh_btn(SELECT),
	.psh_stable(SYNTHESIZED_WIRE_19));


Debouncer	b2v_inst7(
	.clk(SYNTHESIZED_WIRE_23),
	.psh_btn(RESET),
	.psh_stable(SYNTHESIZED_WIRE_24));


VGA_Coordenada	b2v_inst8(
	.reset(SYNTHESIZED_WIRE_24),
	.select(SYNTHESIZED_WIRE_19),
	.enter(SYNTHESIZED_WIRE_20),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_15));

assign	VGA_G = SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22;


endmodule
