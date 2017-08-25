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
// CREATED		"Thu Aug 24 22:09:52 2017"

module BatalhaNavalDefinitivo(
	clk,
	we_memoria,
	jogadorPosicionando,
	jogadorExecutando,
	readyPosicionando,
	readyExecutando,
	reset,
	SELECT,
	ENTER,
	VGA_CLK,
	rgb_r,
	rgb_g,
	rgb_b,
	H_SYNC,
	V_SYNC
);


input wire	clk;
input wire	we_memoria;
input wire	jogadorPosicionando;
input wire	jogadorExecutando;
input wire	readyPosicionando;
input wire	readyExecutando;
input wire	reset;
input wire	SELECT;
input wire	ENTER;
output wire	VGA_CLK;
output wire	rgb_r;
output wire	rgb_g;
output wire	rgb_b;
output wire	H_SYNC;
output wire	V_SYNC;

wire	SYNTHESIZED_WIRE_122;
wire	[4:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[63:0] SYNTHESIZED_WIRE_6;
wire	[4:0] SYNTHESIZED_WIRE_7;
wire	[63:0] SYNTHESIZED_WIRE_8;
wire	[4:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_123;
wire	[9:0] SYNTHESIZED_WIRE_124;
wire	[9:0] SYNTHESIZED_WIRE_125;
wire	[63:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_20;
wire	[63:0] SYNTHESIZED_WIRE_25;
wire	[63:0] SYNTHESIZED_WIRE_30;
wire	[63:0] SYNTHESIZED_WIRE_35;
wire	[63:0] SYNTHESIZED_WIRE_40;
wire	[63:0] SYNTHESIZED_WIRE_45;
wire	[63:0] SYNTHESIZED_WIRE_50;
wire	[63:0] SYNTHESIZED_WIRE_55;
wire	[63:0] SYNTHESIZED_WIRE_60;
wire	[63:0] SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;
wire	[2:0] SYNTHESIZED_WIRE_70;
wire	[2:0] SYNTHESIZED_WIRE_71;
wire	[63:0] SYNTHESIZED_WIRE_72;
wire	[3:0] SYNTHESIZED_WIRE_73;
wire	[3:0] SYNTHESIZED_WIRE_74;
wire	[63:0] SYNTHESIZED_WIRE_79;
wire	SYNTHESIZED_WIRE_80;
wire	SYNTHESIZED_WIRE_81;
wire	SYNTHESIZED_WIRE_82;
wire	SYNTHESIZED_WIRE_83;
wire	SYNTHESIZED_WIRE_84;
wire	SYNTHESIZED_WIRE_85;
wire	SYNTHESIZED_WIRE_86;
wire	SYNTHESIZED_WIRE_87;
wire	SYNTHESIZED_WIRE_88;
wire	SYNTHESIZED_WIRE_89;
wire	SYNTHESIZED_WIRE_90;
wire	SYNTHESIZED_WIRE_91;
wire	SYNTHESIZED_WIRE_92;
wire	SYNTHESIZED_WIRE_93;
wire	SYNTHESIZED_WIRE_94;
wire	SYNTHESIZED_WIRE_95;
wire	SYNTHESIZED_WIRE_96;
wire	SYNTHESIZED_WIRE_97;
wire	SYNTHESIZED_WIRE_98;
wire	SYNTHESIZED_WIRE_99;
wire	SYNTHESIZED_WIRE_100;
wire	SYNTHESIZED_WIRE_101;
wire	SYNTHESIZED_WIRE_102;
wire	SYNTHESIZED_WIRE_103;
wire	SYNTHESIZED_WIRE_104;
wire	SYNTHESIZED_WIRE_105;
wire	SYNTHESIZED_WIRE_106;
wire	SYNTHESIZED_WIRE_107;
wire	SYNTHESIZED_WIRE_108;
wire	SYNTHESIZED_WIRE_109;
wire	SYNTHESIZED_WIRE_110;
wire	SYNTHESIZED_WIRE_111;
wire	SYNTHESIZED_WIRE_112;
wire	SYNTHESIZED_WIRE_113;
wire	SYNTHESIZED_WIRE_114;
wire	SYNTHESIZED_WIRE_115;
wire	SYNTHESIZED_WIRE_116;
wire	[63:0] SYNTHESIZED_WIRE_118;
wire	SYNTHESIZED_WIRE_119;
wire	SYNTHESIZED_WIRE_120;

assign	VGA_CLK = SYNTHESIZED_WIRE_122;




memoriaA	b2v_inst(
	.wren(we_memoria),
	.clock(SYNTHESIZED_WIRE_122),
	.address(SYNTHESIZED_WIRE_1),
	
	.q(SYNTHESIZED_WIRE_6));


ControladoMemoria	b2v_inst1(
	.clk(SYNTHESIZED_WIRE_122),
	.readyColisor(readyExecutando),
	
	
	.jogadorColisor(readyExecutando),
	.readyPontuacao(readyExecutando),
	.jogadorPontuacao(readyExecutando),
	.readyValidador(readyExecutando),
	.enableValidador(readyExecutando),
	.validador_wrep1(SYNTHESIZED_WIRE_3),
	
	.validadorJogador(SYNTHESIZED_WIRE_4),
	.jogadorVGA(SYNTHESIZED_WIRE_5),
	.resetGeral(reset),
	
	
	
	.data_memoria_jogadorUm(SYNTHESIZED_WIRE_6),
	
	.validador_addr(SYNTHESIZED_WIRE_7),
	.validador_data(SYNTHESIZED_WIRE_8),
	.vga_readAddr(SYNTHESIZED_WIRE_9),
	
	
	.addr(SYNTHESIZED_WIRE_1),
	
	
	
	.dataReadValidador(SYNTHESIZED_WIRE_72),
	.dataReadVGA(SYNTHESIZED_WIRE_118));
	defparam	b2v_inst1.CalculandoPontuacaoPlayerDois = 4'b0110;
	defparam	b2v_inst1.CalculandoPontuacaoPlayerUm = 4'b0101;
	defparam	b2v_inst1.ColidindoPlayerDois = 4'b0100;
	defparam	b2v_inst1.ColidindoPlayerUm = 4'b0011;
	defparam	b2v_inst1.Idle = 4'b0000;
	defparam	b2v_inst1.TransmitindoVgaPlayerDois = 4'b1000;
	defparam	b2v_inst1.TransmitindoVgaPlayerUm = 4'b0111;
	defparam	b2v_inst1.ValidandorPlayerDois = 4'b0010;
	defparam	b2v_inst1.ValidandorPlayerUm = 4'b0001;


PLL_clk	b2v_inst10(
	.inclk0(clk),
	.c0(SYNTHESIZED_WIRE_122));


VGA_Mapa	b2v_inst13(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.rgb_r(SYNTHESIZED_WIRE_91),
	.rgb_g(SYNTHESIZED_WIRE_103),
	.rgb_b(SYNTHESIZED_WIRE_115));


VGA_Submarino	b2v_inst14(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_18),
	.rgb_r(SYNTHESIZED_WIRE_82),
	.rgb_g(SYNTHESIZED_WIRE_94),
	.rgb_b(SYNTHESIZED_WIRE_106));
	defparam	b2v_inst14.X1 = 10'b0000000001;
	defparam	b2v_inst14.X2 = 10'b0000000010;
	defparam	b2v_inst14.X3 = 10'b0000000011;
	defparam	b2v_inst14.X4 = 10'b0000000100;
	defparam	b2v_inst14.X5 = 10'b0000000101;
	defparam	b2v_inst14.X6 = 10'b0000000110;
	defparam	b2v_inst14.X7 = 10'b0000000111;
	defparam	b2v_inst14.X8 = 10'b0000001000;
	defparam	b2v_inst14.Y1 = 10'b0000000001;
	defparam	b2v_inst14.Y2 = 10'b0000000010;
	defparam	b2v_inst14.Y3 = 10'b0000000011;
	defparam	b2v_inst14.Y4 = 10'b0000000100;
	defparam	b2v_inst14.Y5 = 10'b0000000101;
	defparam	b2v_inst14.Y6 = 10'b0000000110;
	defparam	b2v_inst14.Y7 = 10'b0000000111;
	defparam	b2v_inst14.Y8 = 10'b0000001000;


posicionandoPecas	b2v_inst2(
	.enable(reset),
	.reset(reset),
	.enter(SELECT),
	.select(ENTER),
	
	.clk(SYNTHESIZED_WIRE_122),
	.conflito(SYNTHESIZED_WIRE_20),
	.ready(SYNTHESIZED_WIRE_119),
	
	.jogador(SYNTHESIZED_WIRE_67),
	.direcao(SYNTHESIZED_WIRE_68),
	
	
	
	
	
	
	.orientacao(SYNTHESIZED_WIRE_70),
	.tipo(SYNTHESIZED_WIRE_71),
	.X1(SYNTHESIZED_WIRE_73),
	.Y1(SYNTHESIZED_WIRE_74));
	defparam	b2v_inst2.armazenaPeca = 4'b0110;
	defparam	b2v_inst2.defineX = 4'b0011;
	defparam	b2v_inst2.defineY = 4'b0100;
	defparam	b2v_inst2.escolheDirecao = 4'b0001;
	defparam	b2v_inst2.escolheOrientacao = 4'b0010;
	defparam	b2v_inst2.verificaConflito = 4'b0101;


VGA_Submarino	b2v_inst21(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_25),
	.rgb_r(SYNTHESIZED_WIRE_81),
	.rgb_g(SYNTHESIZED_WIRE_93),
	.rgb_b(SYNTHESIZED_WIRE_105));
	defparam	b2v_inst21.X1 = 10'b0000000001;
	defparam	b2v_inst21.X2 = 10'b0000000010;
	defparam	b2v_inst21.X3 = 10'b0000000011;
	defparam	b2v_inst21.X4 = 10'b0000000100;
	defparam	b2v_inst21.X5 = 10'b0000000101;
	defparam	b2v_inst21.X6 = 10'b0000000110;
	defparam	b2v_inst21.X7 = 10'b0000000111;
	defparam	b2v_inst21.X8 = 10'b0000001000;
	defparam	b2v_inst21.Y1 = 10'b0000000001;
	defparam	b2v_inst21.Y2 = 10'b0000000010;
	defparam	b2v_inst21.Y3 = 10'b0000000011;
	defparam	b2v_inst21.Y4 = 10'b0000000100;
	defparam	b2v_inst21.Y5 = 10'b0000000101;
	defparam	b2v_inst21.Y6 = 10'b0000000110;
	defparam	b2v_inst21.Y7 = 10'b0000000111;
	defparam	b2v_inst21.Y8 = 10'b0000001000;


VGA_Submarino	b2v_inst22(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_30),
	.rgb_r(SYNTHESIZED_WIRE_80),
	.rgb_g(SYNTHESIZED_WIRE_92),
	.rgb_b(SYNTHESIZED_WIRE_104));
	defparam	b2v_inst22.X1 = 10'b0000000001;
	defparam	b2v_inst22.X2 = 10'b0000000010;
	defparam	b2v_inst22.X3 = 10'b0000000011;
	defparam	b2v_inst22.X4 = 10'b0000000100;
	defparam	b2v_inst22.X5 = 10'b0000000101;
	defparam	b2v_inst22.X6 = 10'b0000000110;
	defparam	b2v_inst22.X7 = 10'b0000000111;
	defparam	b2v_inst22.X8 = 10'b0000001000;
	defparam	b2v_inst22.Y1 = 10'b0000000001;
	defparam	b2v_inst22.Y2 = 10'b0000000010;
	defparam	b2v_inst22.Y3 = 10'b0000000011;
	defparam	b2v_inst22.Y4 = 10'b0000000100;
	defparam	b2v_inst22.Y5 = 10'b0000000101;
	defparam	b2v_inst22.Y6 = 10'b0000000110;
	defparam	b2v_inst22.Y7 = 10'b0000000111;
	defparam	b2v_inst22.Y8 = 10'b0000001000;


VGA_Submarino	b2v_inst23(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_35),
	.rgb_r(SYNTHESIZED_WIRE_85),
	.rgb_g(SYNTHESIZED_WIRE_97),
	.rgb_b(SYNTHESIZED_WIRE_109));
	defparam	b2v_inst23.X1 = 10'b0000000001;
	defparam	b2v_inst23.X2 = 10'b0000000010;
	defparam	b2v_inst23.X3 = 10'b0000000011;
	defparam	b2v_inst23.X4 = 10'b0000000100;
	defparam	b2v_inst23.X5 = 10'b0000000101;
	defparam	b2v_inst23.X6 = 10'b0000000110;
	defparam	b2v_inst23.X7 = 10'b0000000111;
	defparam	b2v_inst23.X8 = 10'b0000001000;
	defparam	b2v_inst23.Y1 = 10'b0000000001;
	defparam	b2v_inst23.Y2 = 10'b0000000010;
	defparam	b2v_inst23.Y3 = 10'b0000000011;
	defparam	b2v_inst23.Y4 = 10'b0000000100;
	defparam	b2v_inst23.Y5 = 10'b0000000101;
	defparam	b2v_inst23.Y6 = 10'b0000000110;
	defparam	b2v_inst23.Y7 = 10'b0000000111;
	defparam	b2v_inst23.Y8 = 10'b0000001000;


VGA_Submarino	b2v_inst24(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_40),
	.rgb_r(SYNTHESIZED_WIRE_84),
	.rgb_g(SYNTHESIZED_WIRE_96),
	.rgb_b(SYNTHESIZED_WIRE_108));
	defparam	b2v_inst24.X1 = 10'b0000000001;
	defparam	b2v_inst24.X2 = 10'b0000000010;
	defparam	b2v_inst24.X3 = 10'b0000000011;
	defparam	b2v_inst24.X4 = 10'b0000000100;
	defparam	b2v_inst24.X5 = 10'b0000000101;
	defparam	b2v_inst24.X6 = 10'b0000000110;
	defparam	b2v_inst24.X7 = 10'b0000000111;
	defparam	b2v_inst24.X8 = 10'b0000001000;
	defparam	b2v_inst24.Y1 = 10'b0000000001;
	defparam	b2v_inst24.Y2 = 10'b0000000010;
	defparam	b2v_inst24.Y3 = 10'b0000000011;
	defparam	b2v_inst24.Y4 = 10'b0000000100;
	defparam	b2v_inst24.Y5 = 10'b0000000101;
	defparam	b2v_inst24.Y6 = 10'b0000000110;
	defparam	b2v_inst24.Y7 = 10'b0000000111;
	defparam	b2v_inst24.Y8 = 10'b0000001000;


VGA_Cruzador	b2v_inst25(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_45),
	.rgb_r(SYNTHESIZED_WIRE_83),
	.rgb_g(SYNTHESIZED_WIRE_95),
	.rgb_b(SYNTHESIZED_WIRE_107));
	defparam	b2v_inst25.X1 = 10'b0000000001;
	defparam	b2v_inst25.X2 = 10'b0000000010;
	defparam	b2v_inst25.X3 = 10'b0000000011;
	defparam	b2v_inst25.X4 = 10'b0000000100;
	defparam	b2v_inst25.X5 = 10'b0000000101;
	defparam	b2v_inst25.X6 = 10'b0000000110;
	defparam	b2v_inst25.X7 = 10'b0000000111;
	defparam	b2v_inst25.X8 = 10'b0000001000;
	defparam	b2v_inst25.Y1 = 10'b0000000001;
	defparam	b2v_inst25.Y2 = 10'b0000000010;
	defparam	b2v_inst25.Y3 = 10'b0000000011;
	defparam	b2v_inst25.Y4 = 10'b0000000100;
	defparam	b2v_inst25.Y5 = 10'b0000000101;
	defparam	b2v_inst25.Y6 = 10'b0000000110;
	defparam	b2v_inst25.Y7 = 10'b0000000111;
	defparam	b2v_inst25.Y8 = 10'b0000001000;


VGA_Cruzador	b2v_inst26(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_50),
	.rgb_r(SYNTHESIZED_WIRE_87),
	.rgb_g(SYNTHESIZED_WIRE_99),
	.rgb_b(SYNTHESIZED_WIRE_111));
	defparam	b2v_inst26.X1 = 10'b0000000001;
	defparam	b2v_inst26.X2 = 10'b0000000010;
	defparam	b2v_inst26.X3 = 10'b0000000011;
	defparam	b2v_inst26.X4 = 10'b0000000100;
	defparam	b2v_inst26.X5 = 10'b0000000101;
	defparam	b2v_inst26.X6 = 10'b0000000110;
	defparam	b2v_inst26.X7 = 10'b0000000111;
	defparam	b2v_inst26.X8 = 10'b0000001000;
	defparam	b2v_inst26.Y1 = 10'b0000000001;
	defparam	b2v_inst26.Y2 = 10'b0000000010;
	defparam	b2v_inst26.Y3 = 10'b0000000011;
	defparam	b2v_inst26.Y4 = 10'b0000000100;
	defparam	b2v_inst26.Y5 = 10'b0000000101;
	defparam	b2v_inst26.Y6 = 10'b0000000110;
	defparam	b2v_inst26.Y7 = 10'b0000000111;
	defparam	b2v_inst26.Y8 = 10'b0000001000;


VGA_Hidroaviao	b2v_inst27(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_55),
	.rgb_r(SYNTHESIZED_WIRE_86),
	.rgb_g(SYNTHESIZED_WIRE_98),
	.rgb_b(SYNTHESIZED_WIRE_110));
	defparam	b2v_inst27.X1 = 10'b0000000001;
	defparam	b2v_inst27.X2 = 10'b0000000010;
	defparam	b2v_inst27.X3 = 10'b0000000011;
	defparam	b2v_inst27.X4 = 10'b0000000100;
	defparam	b2v_inst27.X5 = 10'b0000000101;
	defparam	b2v_inst27.X6 = 10'b0000000110;
	defparam	b2v_inst27.X7 = 10'b0000000111;
	defparam	b2v_inst27.X8 = 10'b0000001000;
	defparam	b2v_inst27.Y1 = 10'b0000000001;
	defparam	b2v_inst27.Y2 = 10'b0000000010;
	defparam	b2v_inst27.Y3 = 10'b0000000011;
	defparam	b2v_inst27.Y4 = 10'b0000000100;
	defparam	b2v_inst27.Y5 = 10'b0000000101;
	defparam	b2v_inst27.Y6 = 10'b0000000110;
	defparam	b2v_inst27.Y7 = 10'b0000000111;
	defparam	b2v_inst27.Y8 = 10'b0000001000;


VGA_Hidroaviao	b2v_inst28(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_60),
	.rgb_r(SYNTHESIZED_WIRE_88),
	.rgb_g(SYNTHESIZED_WIRE_100),
	.rgb_b(SYNTHESIZED_WIRE_112));
	defparam	b2v_inst28.X1 = 10'b0000000001;
	defparam	b2v_inst28.X2 = 10'b0000000010;
	defparam	b2v_inst28.X3 = 10'b0000000011;
	defparam	b2v_inst28.X4 = 10'b0000000100;
	defparam	b2v_inst28.X5 = 10'b0000000101;
	defparam	b2v_inst28.X6 = 10'b0000000110;
	defparam	b2v_inst28.X7 = 10'b0000000111;
	defparam	b2v_inst28.X8 = 10'b0000001000;
	defparam	b2v_inst28.Y1 = 10'b0000000001;
	defparam	b2v_inst28.Y2 = 10'b0000000010;
	defparam	b2v_inst28.Y3 = 10'b0000000011;
	defparam	b2v_inst28.Y4 = 10'b0000000100;
	defparam	b2v_inst28.Y5 = 10'b0000000101;
	defparam	b2v_inst28.Y6 = 10'b0000000110;
	defparam	b2v_inst28.Y7 = 10'b0000000111;
	defparam	b2v_inst28.Y8 = 10'b0000001000;


VGA_Encouracado	b2v_inst29(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_65),
	.rgb_r(SYNTHESIZED_WIRE_90),
	.rgb_g(SYNTHESIZED_WIRE_102),
	.rgb_b(SYNTHESIZED_WIRE_114));
	defparam	b2v_inst29.X1 = 10'b0000000001;
	defparam	b2v_inst29.X2 = 10'b0000000010;
	defparam	b2v_inst29.X3 = 10'b0000000011;
	defparam	b2v_inst29.X4 = 10'b0000000100;
	defparam	b2v_inst29.X5 = 10'b0000000101;
	defparam	b2v_inst29.X6 = 10'b0000000110;
	defparam	b2v_inst29.X7 = 10'b0000000111;
	defparam	b2v_inst29.X8 = 10'b0000001000;
	defparam	b2v_inst29.Y1 = 10'b0000000001;
	defparam	b2v_inst29.Y2 = 10'b0000000010;
	defparam	b2v_inst29.Y3 = 10'b0000000011;
	defparam	b2v_inst29.Y4 = 10'b0000000100;
	defparam	b2v_inst29.Y5 = 10'b0000000101;
	defparam	b2v_inst29.Y6 = 10'b0000000110;
	defparam	b2v_inst29.Y7 = 10'b0000000111;
	defparam	b2v_inst29.Y8 = 10'b0000001000;


Validador	b2v_inst3(
	.enable(SYNTHESIZED_WIRE_66),
	.jogador(SYNTHESIZED_WIRE_67),
	.direcao(SYNTHESIZED_WIRE_68),
	.clk(SYNTHESIZED_WIRE_122),
	.orientacao(SYNTHESIZED_WIRE_70),
	.tipo(SYNTHESIZED_WIRE_71),
	.vetor_leitura(SYNTHESIZED_WIRE_72),
	.x1(SYNTHESIZED_WIRE_73),
	.y1(SYNTHESIZED_WIRE_74),
	.ready(SYNTHESIZED_WIRE_116),
	
	
	.wrep1(SYNTHESIZED_WIRE_3),
	
	.jogadorOut(SYNTHESIZED_WIRE_4),
	.conflito(SYNTHESIZED_WIRE_20),
	.addr(SYNTHESIZED_WIRE_7),
	.vetor(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst3.ConflitoBorda = 3'b010;
	defparam	b2v_inst3.ConflitoMemoria = 3'b100;
	defparam	b2v_inst3.CRUZADOR = 3'b011;
	defparam	b2v_inst3.ENCOURACADO = 3'b001;
	defparam	b2v_inst3.EstadoInicial = 3'b000;
	defparam	b2v_inst3.HIDROAVIAO = 3'b010;
	defparam	b2v_inst3.PORTA_AVIOES = 3'b000;
	defparam	b2v_inst3.SalvandoPeca = 3'b101;
	defparam	b2v_inst3.SUBMARINO = 3'b100;
	defparam	b2v_inst3.VerificandoBorda = 3'b001;
	defparam	b2v_inst3.VerificandoMemoria = 3'b011;


VGA_PortaAvioes	b2v_inst30(
	.clk(SYNTHESIZED_WIRE_122),
	.areaAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_79),
	.rgb_r(SYNTHESIZED_WIRE_89),
	.rgb_g(SYNTHESIZED_WIRE_101),
	.rgb_b(SYNTHESIZED_WIRE_113));
	defparam	b2v_inst30.X1 = 10'b0000000001;
	defparam	b2v_inst30.X2 = 10'b0000000010;
	defparam	b2v_inst30.X3 = 10'b0000000011;
	defparam	b2v_inst30.X4 = 10'b0000000100;
	defparam	b2v_inst30.X5 = 10'b0000000101;
	defparam	b2v_inst30.X6 = 10'b0000000110;
	defparam	b2v_inst30.X7 = 10'b0000000111;
	defparam	b2v_inst30.X8 = 10'b0000001000;
	defparam	b2v_inst30.Y1 = 10'b0000000001;
	defparam	b2v_inst30.Y2 = 10'b0000000010;
	defparam	b2v_inst30.Y3 = 10'b0000000011;
	defparam	b2v_inst30.Y4 = 10'b0000000100;
	defparam	b2v_inst30.Y5 = 10'b0000000101;
	defparam	b2v_inst30.Y6 = 10'b0000000110;
	defparam	b2v_inst30.Y7 = 10'b0000000111;
	defparam	b2v_inst30.Y8 = 10'b0000001000;

assign	rgb_r = SYNTHESIZED_WIRE_80 | SYNTHESIZED_WIRE_81 | SYNTHESIZED_WIRE_82 | SYNTHESIZED_WIRE_83 | SYNTHESIZED_WIRE_84 | SYNTHESIZED_WIRE_85 | SYNTHESIZED_WIRE_86 | SYNTHESIZED_WIRE_87 | SYNTHESIZED_WIRE_88 | SYNTHESIZED_WIRE_89 | SYNTHESIZED_WIRE_90 | SYNTHESIZED_WIRE_91;

assign	rgb_g = SYNTHESIZED_WIRE_92 | SYNTHESIZED_WIRE_93 | SYNTHESIZED_WIRE_94 | SYNTHESIZED_WIRE_95 | SYNTHESIZED_WIRE_96 | SYNTHESIZED_WIRE_97 | SYNTHESIZED_WIRE_98 | SYNTHESIZED_WIRE_99 | SYNTHESIZED_WIRE_100 | SYNTHESIZED_WIRE_101 | SYNTHESIZED_WIRE_102 | SYNTHESIZED_WIRE_103;

assign	rgb_b = SYNTHESIZED_WIRE_104 | SYNTHESIZED_WIRE_105 | SYNTHESIZED_WIRE_106 | SYNTHESIZED_WIRE_107 | SYNTHESIZED_WIRE_108 | SYNTHESIZED_WIRE_109 | SYNTHESIZED_WIRE_110 | SYNTHESIZED_WIRE_111 | SYNTHESIZED_WIRE_112 | SYNTHESIZED_WIRE_113 | SYNTHESIZED_WIRE_114 | SYNTHESIZED_WIRE_115;

assign	SYNTHESIZED_WIRE_120 =  ~SYNTHESIZED_WIRE_116;


VGA_Compositor	b2v_inst5(
	.clk(SYNTHESIZED_WIRE_122),
	.resetGeral(reset),
	.readyExecutandoJogo(readyExecutando),
	.readyPosicionandoPecas(readyPosicionando),
	.jogadorExecutandoJogo(jogadorExecutando),
	.jogadorPosicionandoPecas(jogadorPosicionando),
	.data_memoria(SYNTHESIZED_WIRE_118),
	
	.jogadorVGA(SYNTHESIZED_WIRE_5),
	.addr(SYNTHESIZED_WIRE_9),
	.dataEmbarcacaoCruzadorDois(SYNTHESIZED_WIRE_50),
	.dataEmbarcacaoCruzadorUm(SYNTHESIZED_WIRE_45),
	.dataEmbarcacaoEncouracado(SYNTHESIZED_WIRE_65),
	.dataEmbarcacaoHidroaviaoDois(SYNTHESIZED_WIRE_60),
	.dataEmbarcacaoHidroaviaoUm(SYNTHESIZED_WIRE_55),
	.dataEmbarcacaoPortaAvioes(SYNTHESIZED_WIRE_79),
	.dataEmbarcacaoSubmarinoCinco(SYNTHESIZED_WIRE_40),
	.dataEmbarcacaoSubmarinoDois(SYNTHESIZED_WIRE_25),
	.dataEmbarcacaoSubmarinoQuatro(SYNTHESIZED_WIRE_35),
	.dataEmbarcacaoSubmarinoTres(SYNTHESIZED_WIRE_30),
	.dataEmbarcacaoSubmarinoUm(SYNTHESIZED_WIRE_18));
	defparam	b2v_inst5.ExecutandoJogo = 3'b010;
	defparam	b2v_inst5.Idle = 3'b000;
	defparam	b2v_inst5.PosicionandoPecas = 3'b001;

assign	SYNTHESIZED_WIRE_66 = SYNTHESIZED_WIRE_119 & SYNTHESIZED_WIRE_120;


VGASinc	b2v_inst8(
	.reset(reset),
	.clk(SYNTHESIZED_WIRE_122),
	.h_sync(H_SYNC),
	.v_sync(V_SYNC),
	.regiaoAtiva(SYNTHESIZED_WIRE_123),
	.coluna(SYNTHESIZED_WIRE_124),
	.linha(SYNTHESIZED_WIRE_125));
	defparam	b2v_inst8.COLUNASATIVAS = 640;
	defparam	b2v_inst8.LINHASATIVAS = 480;
	defparam	b2v_inst8.TOTALCOLUNAS = 800;
	defparam	b2v_inst8.TOTALLINHAS = 524;


endmodule
