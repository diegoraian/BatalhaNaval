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
// CREATED		"Thu Aug 17 21:06:10 2017"

module BatalhaNavalDefinitivo(
	clk,
	enable,
	reset,
	enter,
	select,
	mode,
	conflitoMemoria,
	conflitoBorda,
	VGA_CLK,
	rgb_r,
	rgb_g,
	rgb_b,
	H_SYNC,
	V_SYNC
);


input wire	clk;
input wire	enable;
input wire	reset;
input wire	enter;
input wire	select;
input wire	mode;
output wire	conflitoMemoria;
output wire	conflitoBorda;
output wire	VGA_CLK;
output wire	rgb_r;
output wire	rgb_g;
output wire	rgb_b;
output wire	H_SYNC;
output wire	V_SYNC;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_158;
wire	[63:0] SYNTHESIZED_WIRE_159;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_160;
wire	SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_161;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_162;
wire	SYNTHESIZED_WIRE_163;
wire	SYNTHESIZED_WIRE_164;
wire	[9:0] SYNTHESIZED_WIRE_165;
wire	[9:0] SYNTHESIZED_WIRE_166;
wire	[63:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_167;
wire	SYNTHESIZED_WIRE_168;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_169;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_31;
wire	[63:0] SYNTHESIZED_WIRE_36;
wire	[63:0] SYNTHESIZED_WIRE_41;
wire	[63:0] SYNTHESIZED_WIRE_46;
wire	[63:0] SYNTHESIZED_WIRE_51;
wire	[63:0] SYNTHESIZED_WIRE_56;
wire	[63:0] SYNTHESIZED_WIRE_61;
wire	[63:0] SYNTHESIZED_WIRE_66;
wire	[63:0] SYNTHESIZED_WIRE_71;
wire	[63:0] SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
wire	SYNTHESIZED_WIRE_80;
wire	SYNTHESIZED_WIRE_82;
wire	SYNTHESIZED_WIRE_83;
wire	SYNTHESIZED_WIRE_84;
wire	SYNTHESIZED_WIRE_85;
wire	[4:0] SYNTHESIZED_WIRE_86;
wire	[63:0] SYNTHESIZED_WIRE_87;
wire	[63:0] SYNTHESIZED_WIRE_88;
wire	[63:0] SYNTHESIZED_WIRE_89;
wire	[4:0] SYNTHESIZED_WIRE_90;
wire	[63:0] SYNTHESIZED_WIRE_91;
wire	[4:0] SYNTHESIZED_WIRE_92;
wire	[63:0] SYNTHESIZED_WIRE_97;
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
wire	SYNTHESIZED_WIRE_117;
wire	SYNTHESIZED_WIRE_118;
wire	SYNTHESIZED_WIRE_119;
wire	SYNTHESIZED_WIRE_120;
wire	SYNTHESIZED_WIRE_121;
wire	SYNTHESIZED_WIRE_122;
wire	SYNTHESIZED_WIRE_123;
wire	SYNTHESIZED_WIRE_124;
wire	SYNTHESIZED_WIRE_125;
wire	SYNTHESIZED_WIRE_126;
wire	SYNTHESIZED_WIRE_127;
wire	SYNTHESIZED_WIRE_128;
wire	SYNTHESIZED_WIRE_129;
wire	SYNTHESIZED_WIRE_130;
wire	SYNTHESIZED_WIRE_131;
wire	SYNTHESIZED_WIRE_132;
wire	SYNTHESIZED_WIRE_133;
wire	SYNTHESIZED_WIRE_134;
wire	SYNTHESIZED_WIRE_170;
wire	SYNTHESIZED_WIRE_136;
wire	[2:0] SYNTHESIZED_WIRE_137;
wire	[2:0] SYNTHESIZED_WIRE_138;
wire	[63:0] SYNTHESIZED_WIRE_139;
wire	[3:0] SYNTHESIZED_WIRE_140;
wire	[3:0] SYNTHESIZED_WIRE_141;
wire	[63:0] SYNTHESIZED_WIRE_146;
wire	SYNTHESIZED_WIRE_147;
wire	SYNTHESIZED_WIRE_150;
wire	SYNTHESIZED_WIRE_151;
wire	SYNTHESIZED_WIRE_152;
wire	[4:0] SYNTHESIZED_WIRE_171;
wire	[63:0] SYNTHESIZED_WIRE_172;
wire	SYNTHESIZED_WIRE_155;

assign	VGA_CLK = SYNTHESIZED_WIRE_163;




Colisor	b2v_inst(
	.enable(SYNTHESIZED_WIRE_0),
	.jogadorAtirador(SYNTHESIZED_WIRE_158),
	.clk(clk),
	.memoriaP1(SYNTHESIZED_WIRE_159),
	.memoriaP2(SYNTHESIZED_WIRE_159),
	.x(SYNTHESIZED_WIRE_4),
	.y(SYNTHESIZED_WIRE_5),
	.ready(SYNTHESIZED_WIRE_167),
	.hit(SYNTHESIZED_WIRE_7),
	.wrep1(SYNTHESIZED_WIRE_78),
	.wrep2(SYNTHESIZED_WIRE_79),
	.jogadorAlvo(SYNTHESIZED_WIRE_80),
	.addr(SYNTHESIZED_WIRE_86),
	.clear(SYNTHESIZED_WIRE_87)
	);


ExecutandoJogo	b2v_inst1(
	.enable(SYNTHESIZED_WIRE_160),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_7),
	
	.qtd_P1(SYNTHESIZED_WIRE_8),
	.qtd_P2(SYNTHESIZED_WIRE_9),
	.ready(SYNTHESIZED_WIRE_161),
	.jogador(SYNTHESIZED_WIRE_158),
	.coord_tiroX(SYNTHESIZED_WIRE_4),
	.coord_tiroY(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst1.end_game = 4'b1010;
	defparam	b2v_inst1.p1_atacandox = 4'b0000;
	defparam	b2v_inst1.p1_atacandoy = 4'b0001;
	defparam	b2v_inst1.p1_vencedor = 4'b1000;
	defparam	b2v_inst1.p2_atacandox = 4'b0100;
	defparam	b2v_inst1.p2_atacandoy = 4'b0101;
	defparam	b2v_inst1.p2_vencedor = 4'b1001;
	defparam	b2v_inst1.verificando_acertop1 = 4'b0010;
	defparam	b2v_inst1.verificando_acertop2 = 4'b0011;
	defparam	b2v_inst1.verificando_vidap1 = 4'b0110;
	defparam	b2v_inst1.verificando_vidap2 = 4'b0111;


PLL_clk	b2v_inst10(
	.inclk0(clk),
	.c0(SYNTHESIZED_WIRE_163));

assign	SYNTHESIZED_WIRE_11 =  ~SYNTHESIZED_WIRE_161;

assign	SYNTHESIZED_WIRE_160 = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_162;


VGA_Mapa	b2v_inst13(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.rgb_r(SYNTHESIZED_WIRE_109),
	.rgb_g(SYNTHESIZED_WIRE_121),
	.rgb_b(SYNTHESIZED_WIRE_133));


VGA_Submarino	b2v_inst14(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_21),
	.rgb_r(SYNTHESIZED_WIRE_100),
	.rgb_g(SYNTHESIZED_WIRE_112),
	.rgb_b(SYNTHESIZED_WIRE_124));
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

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_161;

assign	SYNTHESIZED_WIRE_22 =  ~SYNTHESIZED_WIRE_167;

assign	SYNTHESIZED_WIRE_150 =  ~SYNTHESIZED_WIRE_168;


ContagemPecas	b2v_inst18(
	.enable(SYNTHESIZED_WIRE_26),
	.clk(clk),
	
	
	.ready(SYNTHESIZED_WIRE_27),
	
	.qtd_P1(SYNTHESIZED_WIRE_8),
	.qtd_P2(SYNTHESIZED_WIRE_9));

assign	SYNTHESIZED_WIRE_31 =  ~SYNTHESIZED_WIRE_27;


posicionandoPecas	b2v_inst2(
	.enable(SYNTHESIZED_WIRE_169),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(SYNTHESIZED_WIRE_29),
	.ready(SYNTHESIZED_WIRE_162),
	.valida(SYNTHESIZED_WIRE_151),
	.jogador(SYNTHESIZED_WIRE_170),
	.direcao(SYNTHESIZED_WIRE_136),
	.orientacao(SYNTHESIZED_WIRE_137),
	.tipo(SYNTHESIZED_WIRE_138),
	.X1(SYNTHESIZED_WIRE_140),
	.Y1(SYNTHESIZED_WIRE_141));
	defparam	b2v_inst2.armazenaPeca = 4'b0110;
	defparam	b2v_inst2.defineX = 4'b0011;
	defparam	b2v_inst2.defineY = 4'b0100;
	defparam	b2v_inst2.escolheDirecao = 4'b0001;
	defparam	b2v_inst2.escolheOrientacao = 4'b0010;
	defparam	b2v_inst2.verificaConflito = 4'b0101;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_160 & SYNTHESIZED_WIRE_31;


VGA_Submarino	b2v_inst21(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_36),
	.rgb_r(SYNTHESIZED_WIRE_99),
	.rgb_g(SYNTHESIZED_WIRE_111),
	.rgb_b(SYNTHESIZED_WIRE_123));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_41),
	.rgb_r(SYNTHESIZED_WIRE_98),
	.rgb_g(SYNTHESIZED_WIRE_110),
	.rgb_b(SYNTHESIZED_WIRE_122));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_46),
	.rgb_r(SYNTHESIZED_WIRE_103),
	.rgb_g(SYNTHESIZED_WIRE_115),
	.rgb_b(SYNTHESIZED_WIRE_127));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_51),
	.rgb_r(SYNTHESIZED_WIRE_102),
	.rgb_g(SYNTHESIZED_WIRE_114),
	.rgb_b(SYNTHESIZED_WIRE_126));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_56),
	.rgb_r(SYNTHESIZED_WIRE_101),
	.rgb_g(SYNTHESIZED_WIRE_113),
	.rgb_b(SYNTHESIZED_WIRE_125));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_61),
	.rgb_r(SYNTHESIZED_WIRE_105),
	.rgb_g(SYNTHESIZED_WIRE_117),
	.rgb_b(SYNTHESIZED_WIRE_129));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_66),
	.rgb_r(SYNTHESIZED_WIRE_104),
	.rgb_g(SYNTHESIZED_WIRE_116),
	.rgb_b(SYNTHESIZED_WIRE_128));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_71),
	.rgb_r(SYNTHESIZED_WIRE_106),
	.rgb_g(SYNTHESIZED_WIRE_118),
	.rgb_b(SYNTHESIZED_WIRE_130));
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
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_76),
	.rgb_r(SYNTHESIZED_WIRE_108),
	.rgb_g(SYNTHESIZED_WIRE_120),
	.rgb_b(SYNTHESIZED_WIRE_132));
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


ControladoMemoria	b2v_inst3(
	.clk(clk),
	.readyColisor(SYNTHESIZED_WIRE_167),
	.colisor_wrep1(SYNTHESIZED_WIRE_78),
	.colisor_wrep2(SYNTHESIZED_WIRE_79),
	.jogadorColisor(SYNTHESIZED_WIRE_80),
	
	
	
	.readyValidador(SYNTHESIZED_WIRE_168),
	.validador_wrep1(SYNTHESIZED_WIRE_82),
	.validador_wrep2(SYNTHESIZED_WIRE_83),
	.validadorJogador(SYNTHESIZED_WIRE_84),
	.jogadorVGA(SYNTHESIZED_WIRE_85),
	
	.colisor_addr(SYNTHESIZED_WIRE_86),
	.colisor_data(SYNTHESIZED_WIRE_87),
	.data_memoria_jogadorDois(SYNTHESIZED_WIRE_88),
	.data_memoria_jogadorUm(SYNTHESIZED_WIRE_89),
	.validador_addr(SYNTHESIZED_WIRE_90),
	.validador_data(SYNTHESIZED_WIRE_91),
	.vga_readAddr(SYNTHESIZED_WIRE_92),
	.wrenP1(SYNTHESIZED_WIRE_152),
	.wrenP2(SYNTHESIZED_WIRE_155),
	.addr(SYNTHESIZED_WIRE_171),
	.data(SYNTHESIZED_WIRE_172),
	.dataReadColisor(SYNTHESIZED_WIRE_159),
	.dataReadValidador(SYNTHESIZED_WIRE_139),
	.dataReadVGA(SYNTHESIZED_WIRE_146));
	defparam	b2v_inst3.CalculandoPontuacaoPlayerDois = 4'b0110;
	defparam	b2v_inst3.CalculandoPontuacaoPlayerUm = 4'b0101;
	defparam	b2v_inst3.ColidindoPlayerDois = 4'b0100;
	defparam	b2v_inst3.ColidindoPlayerUm = 4'b0011;
	defparam	b2v_inst3.Idle = 4'b0000;
	defparam	b2v_inst3.TransmitindoVgaPlayerDois = 4'b1000;
	defparam	b2v_inst3.TransmitindoVgaPlayerUm = 4'b0111;
	defparam	b2v_inst3.ValidandorPlayerDois = 4'b0010;
	defparam	b2v_inst3.ValidandorPlayerUm = 4'b0001;


VGA_PortaAvioes	b2v_inst30(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_97),
	.rgb_r(SYNTHESIZED_WIRE_107),
	.rgb_g(SYNTHESIZED_WIRE_119),
	.rgb_b(SYNTHESIZED_WIRE_131));
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

assign	rgb_r = SYNTHESIZED_WIRE_98 | SYNTHESIZED_WIRE_99 | SYNTHESIZED_WIRE_100 | SYNTHESIZED_WIRE_101 | SYNTHESIZED_WIRE_102 | SYNTHESIZED_WIRE_103 | SYNTHESIZED_WIRE_104 | SYNTHESIZED_WIRE_105 | SYNTHESIZED_WIRE_106 | SYNTHESIZED_WIRE_107 | SYNTHESIZED_WIRE_108 | SYNTHESIZED_WIRE_109;

assign	rgb_g = SYNTHESIZED_WIRE_110 | SYNTHESIZED_WIRE_111 | SYNTHESIZED_WIRE_112 | SYNTHESIZED_WIRE_113 | SYNTHESIZED_WIRE_114 | SYNTHESIZED_WIRE_115 | SYNTHESIZED_WIRE_116 | SYNTHESIZED_WIRE_117 | SYNTHESIZED_WIRE_118 | SYNTHESIZED_WIRE_119 | SYNTHESIZED_WIRE_120 | SYNTHESIZED_WIRE_121;

assign	rgb_b = SYNTHESIZED_WIRE_122 | SYNTHESIZED_WIRE_123 | SYNTHESIZED_WIRE_124 | SYNTHESIZED_WIRE_125 | SYNTHESIZED_WIRE_126 | SYNTHESIZED_WIRE_127 | SYNTHESIZED_WIRE_128 | SYNTHESIZED_WIRE_129 | SYNTHESIZED_WIRE_130 | SYNTHESIZED_WIRE_131 | SYNTHESIZED_WIRE_132 | SYNTHESIZED_WIRE_133;


Validador	b2v_inst4(
	.enable(SYNTHESIZED_WIRE_134),
	.jogador(SYNTHESIZED_WIRE_170),
	.direcao(SYNTHESIZED_WIRE_136),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_137),
	.tipo(SYNTHESIZED_WIRE_138),
	.vetor_leitura(SYNTHESIZED_WIRE_139),
	.x1(SYNTHESIZED_WIRE_140),
	.y1(SYNTHESIZED_WIRE_141),
	.ready(SYNTHESIZED_WIRE_168),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(SYNTHESIZED_WIRE_82),
	.wrep2(SYNTHESIZED_WIRE_83),
	.jogadorOut(SYNTHESIZED_WIRE_84),
	.conflito(SYNTHESIZED_WIRE_29),
	.addr(SYNTHESIZED_WIRE_90),
	.vetor(SYNTHESIZED_WIRE_91));
	defparam	b2v_inst4.ConflitoBorda = 3'b010;
	defparam	b2v_inst4.ConflitoMemoria = 3'b100;
	defparam	b2v_inst4.CRUZADOR = 3'b011;
	defparam	b2v_inst4.ENCOURACADO = 3'b001;
	defparam	b2v_inst4.EstadoInicial = 3'b000;
	defparam	b2v_inst4.HIDROAVIAO = 3'b010;
	defparam	b2v_inst4.PORTA_AVIOES = 3'b000;
	defparam	b2v_inst4.SalvandoPeca = 3'b101;
	defparam	b2v_inst4.SUBMARINO = 3'b100;
	defparam	b2v_inst4.VerificandoBorda = 3'b001;
	defparam	b2v_inst4.VerificandoMemoria = 3'b011;


VGA_Compositor	b2v_inst5(
	.clk(clk),
	.resetGeral(reset),
	.readyExecutandoJogo(SYNTHESIZED_WIRE_160),
	.readyPosicionandoPecas(SYNTHESIZED_WIRE_169),
	.jogadorExecutandoJogo(SYNTHESIZED_WIRE_158),
	.jogadorPosicionandoPecas(SYNTHESIZED_WIRE_170),
	.data_memoria(SYNTHESIZED_WIRE_146),
	
	.jogadorVGA(SYNTHESIZED_WIRE_85),
	.addr(SYNTHESIZED_WIRE_92),
	.dataEmbarcacaoCruzadorDois(SYNTHESIZED_WIRE_61),
	.dataEmbarcacaoCruzadorUm(SYNTHESIZED_WIRE_56),
	.dataEmbarcacaoEncouracado(SYNTHESIZED_WIRE_76),
	.dataEmbarcacaoHidroaviaoDois(SYNTHESIZED_WIRE_71),
	.dataEmbarcacaoHidroaviaoUm(SYNTHESIZED_WIRE_66),
	.dataEmbarcacaoPortaAvioes(SYNTHESIZED_WIRE_97),
	.dataEmbarcacaoSubmarinoCinco(SYNTHESIZED_WIRE_51),
	.dataEmbarcacaoSubmarinoDois(SYNTHESIZED_WIRE_36),
	.dataEmbarcacaoSubmarinoQuatro(SYNTHESIZED_WIRE_46),
	.dataEmbarcacaoSubmarinoTres(SYNTHESIZED_WIRE_41),
	.dataEmbarcacaoSubmarinoUm(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst5.ExecutandoJogo = 3'b010;
	defparam	b2v_inst5.Idle = 3'b000;
	defparam	b2v_inst5.PosicionandoPecas = 3'b001;

assign	SYNTHESIZED_WIRE_169 = SYNTHESIZED_WIRE_147 & enable;

assign	SYNTHESIZED_WIRE_147 =  ~SYNTHESIZED_WIRE_162;


VGASinc	b2v_inst8(
	.reset(reset),
	.clk(SYNTHESIZED_WIRE_163),
	.h_sync(H_SYNC),
	.v_sync(V_SYNC),
	.regiaoAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166));
	defparam	b2v_inst8.COLUNASATIVAS = 640;
	defparam	b2v_inst8.LINHASATIVAS = 480;
	defparam	b2v_inst8.TOTALCOLUNAS = 800;
	defparam	b2v_inst8.TOTALLINHAS = 524;

assign	SYNTHESIZED_WIRE_134 = SYNTHESIZED_WIRE_150 & SYNTHESIZED_WIRE_151;


memoriaA	b2v_memoriaA(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_152),
	.address(SYNTHESIZED_WIRE_171),
	.data(SYNTHESIZED_WIRE_172),
	.q(SYNTHESIZED_WIRE_89));


memoriaB	b2v_memoriaB(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_155),
	.address(SYNTHESIZED_WIRE_171),
	.data(SYNTHESIZED_WIRE_172),
	.q(SYNTHESIZED_WIRE_88));


endmodule
