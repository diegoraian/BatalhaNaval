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
// CREATED		"Thu Aug 31 00:39:55 2017"

module BatalhaNavalDefinitivo(
	clk,
	enable,
	reset,
	enter,
	select,
	mode,
	sw10,
	sw11,
	sw12,
	sw13,
	sw14,
	sw15,
	sw16,
	sw17,
	pll_clk,
	data_memoria_dois,
	data_memoria_um,
	conflitoMemoria,
	conflitoBorda,
	VGA_CLK,
	rgb_r,
	rgb_g,
	rgb_b,
	H_SYNC,
	V_SYNC,
	estado1,
	estado2,
	estado3,
	estado4,
	estado5,
	estado6,
	wren_p1_geral,
	wren_p2_geral,
	addr_memoria,
	data_memoria_salvar
);


input wire	clk;
input wire	enable;
input wire	reset;
input wire	enter;
input wire	select;
input wire	mode;
input wire	sw10;
input wire	sw11;
input wire	sw12;
input wire	sw13;
input wire	sw14;
input wire	sw15;
input wire	sw16;
input wire	sw17;
input wire	pll_clk;
input wire	[63:0] data_memoria_dois;
input wire	[63:0] data_memoria_um;
output wire	conflitoMemoria;
output wire	conflitoBorda;
output wire	VGA_CLK;
output wire	rgb_r;
output wire	rgb_g;
output wire	rgb_b;
output wire	H_SYNC;
output wire	V_SYNC;
output wire	estado1;
output wire	estado2;
output wire	estado3;
output wire	estado4;
output wire	estado5;
output wire	estado6;
output wire	wren_p1_geral;
output wire	wren_p2_geral;
output wire	[4:0] addr_memoria;
output wire	[63:0] data_memoria_salvar;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_135;
wire	[63:0] SYNTHESIZED_WIRE_136;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_137;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_138;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[4:0] SYNTHESIZED_WIRE_16;
wire	[63:0] SYNTHESIZED_WIRE_17;
wire	[4:0] SYNTHESIZED_WIRE_18;
wire	[63:0] SYNTHESIZED_WIRE_19;
wire	[4:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_139;
wire	SYNTHESIZED_WIRE_22;
wire	[3:0] SYNTHESIZED_WIRE_23;
wire	[3:0] SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_140;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_141;
wire	SYNTHESIZED_WIRE_142;
wire	[9:0] SYNTHESIZED_WIRE_143;
wire	[9:0] SYNTHESIZED_WIRE_144;
wire	[63:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_41;
wire	[63:0] SYNTHESIZED_WIRE_45;
wire	[63:0] SYNTHESIZED_WIRE_49;
wire	[63:0] SYNTHESIZED_WIRE_53;
wire	[63:0] SYNTHESIZED_WIRE_57;
wire	[63:0] SYNTHESIZED_WIRE_61;
wire	[63:0] SYNTHESIZED_WIRE_65;
wire	[63:0] SYNTHESIZED_WIRE_69;
wire	[63:0] SYNTHESIZED_WIRE_73;
wire	[63:0] SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_78;
wire	[63:0] SYNTHESIZED_WIRE_82;
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
wire	SYNTHESIZED_WIRE_117;
wire	SYNTHESIZED_WIRE_118;
wire	SYNTHESIZED_WIRE_145;
wire	SYNTHESIZED_WIRE_146;
wire	[63:0] SYNTHESIZED_WIRE_123;
wire	SYNTHESIZED_WIRE_126;
wire	SYNTHESIZED_WIRE_129;
wire	[2:0] SYNTHESIZED_WIRE_130;
wire	[2:0] SYNTHESIZED_WIRE_131;
wire	[63:0] SYNTHESIZED_WIRE_132;
wire	[3:0] SYNTHESIZED_WIRE_133;
wire	[3:0] SYNTHESIZED_WIRE_134;

assign	VGA_CLK = pll_clk;




Colisor	b2v_colisor(
	.enable(SYNTHESIZED_WIRE_0),
	.jogadorAtirador(SYNTHESIZED_WIRE_135),
	.clk(clk),
	.memoriaP1(SYNTHESIZED_WIRE_136),
	.memoriaP2(SYNTHESIZED_WIRE_136),
	.x(SYNTHESIZED_WIRE_4),
	.y(SYNTHESIZED_WIRE_5),
	.ready(SYNTHESIZED_WIRE_137),
	.hit(SYNTHESIZED_WIRE_22),
	.wrep1(SYNTHESIZED_WIRE_7),
	.wrep2(SYNTHESIZED_WIRE_8),
	.jogadorAlvo(SYNTHESIZED_WIRE_9),
	.addr(SYNTHESIZED_WIRE_16),
	.clear(SYNTHESIZED_WIRE_17)
	);


ControladoMemoria	b2v_controladorMemoria(
	.clk(clk),
	.readyColisor(SYNTHESIZED_WIRE_137),
	.colisor_wrep1(SYNTHESIZED_WIRE_7),
	.colisor_wrep2(SYNTHESIZED_WIRE_8),
	.jogadorColisor(SYNTHESIZED_WIRE_9),
	
	
	.readyValidador(SYNTHESIZED_WIRE_10),
	.enableValidador(SYNTHESIZED_WIRE_138),
	.validador_wrep1(SYNTHESIZED_WIRE_12),
	.validador_wrep2(SYNTHESIZED_WIRE_13),
	.validadorJogador(SYNTHESIZED_WIRE_14),
	.jogadorVGA(SYNTHESIZED_WIRE_15),
	.resetGeral(reset),
	.colisor_addr(SYNTHESIZED_WIRE_16),
	.colisor_data(SYNTHESIZED_WIRE_17),
	.data_memoria_jogadorDois(data_memoria_dois),
	.data_memoria_jogadorUm(data_memoria_um),
	
	.validador_addr(SYNTHESIZED_WIRE_18),
	.validador_data(SYNTHESIZED_WIRE_19),
	.vga_readAddr(SYNTHESIZED_WIRE_20),
	.wrenP1(wren_p1_geral),
	.wrenP2(wren_p2_geral),
	.addr(addr_memoria),
	.data(data_memoria_salvar),
	.dataReadColisor(SYNTHESIZED_WIRE_136),
	
	.dataReadValidador(SYNTHESIZED_WIRE_132),
	.dataReadVGA(SYNTHESIZED_WIRE_123));
	defparam	b2v_controladorMemoria.CalculandoPontuacaoPlayerDois = 4'b0110;
	defparam	b2v_controladorMemoria.CalculandoPontuacaoPlayerUm = 4'b0101;
	defparam	b2v_controladorMemoria.ColidindoPlayerDois = 4'b0100;
	defparam	b2v_controladorMemoria.ColidindoPlayerUm = 4'b0011;
	defparam	b2v_controladorMemoria.Idle = 4'b0000;
	defparam	b2v_controladorMemoria.TransmitindoVgaPlayerDois = 4'b1000;
	defparam	b2v_controladorMemoria.TransmitindoVgaPlayerUm = 4'b0111;
	defparam	b2v_controladorMemoria.ValidandorPlayerDois = 4'b0010;
	defparam	b2v_controladorMemoria.ValidandorPlayerUm = 4'b0001;


ExecutandoJogo	b2v_executandoJogo(
	.enable(SYNTHESIZED_WIRE_139),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_22),
	
	.qtd_P1(SYNTHESIZED_WIRE_23),
	.qtd_P2(SYNTHESIZED_WIRE_24),
	.ready(SYNTHESIZED_WIRE_140),
	.jogador(SYNTHESIZED_WIRE_135),
	.coord_tiroX(SYNTHESIZED_WIRE_4),
	.coord_tiroY(SYNTHESIZED_WIRE_5));
	defparam	b2v_executandoJogo.end_game = 4'b1010;
	defparam	b2v_executandoJogo.p1_atacandox = 4'b0000;
	defparam	b2v_executandoJogo.p1_atacandoy = 4'b0001;
	defparam	b2v_executandoJogo.p1_vencedor = 4'b1000;
	defparam	b2v_executandoJogo.p2_atacandox = 4'b0100;
	defparam	b2v_executandoJogo.p2_atacandoy = 4'b0101;
	defparam	b2v_executandoJogo.p2_vencedor = 4'b1001;
	defparam	b2v_executandoJogo.verificando_acertop1 = 4'b0010;
	defparam	b2v_executandoJogo.verificando_acertop2 = 4'b0011;
	defparam	b2v_executandoJogo.verificando_vidap1 = 4'b0110;
	defparam	b2v_executandoJogo.verificando_vidap2 = 4'b0111;

assign	SYNTHESIZED_WIRE_26 =  ~SYNTHESIZED_WIRE_140;

assign	SYNTHESIZED_WIRE_139 = SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_141;


VGA_Mapa	b2v_inst13(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.rgb_r(SYNTHESIZED_WIRE_94),
	.rgb_g(SYNTHESIZED_WIRE_106),
	.rgb_b(SYNTHESIZED_WIRE_118));


VGA_Submarino	b2v_inst14(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_34),
	.rgb_r(SYNTHESIZED_WIRE_85),
	.rgb_g(SYNTHESIZED_WIRE_97),
	.rgb_b(SYNTHESIZED_WIRE_109));
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

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_35 & SYNTHESIZED_WIRE_140;

assign	SYNTHESIZED_WIRE_35 =  ~SYNTHESIZED_WIRE_137;


ContagemPecas	b2v_inst18(
	.enable(SYNTHESIZED_WIRE_38),
	.clk(clk),
	
	
	.ready(SYNTHESIZED_WIRE_39),
	
	.qtd_P1(SYNTHESIZED_WIRE_23),
	.qtd_P2(SYNTHESIZED_WIRE_24));

assign	SYNTHESIZED_WIRE_41 =  ~SYNTHESIZED_WIRE_39;

assign	SYNTHESIZED_WIRE_38 = SYNTHESIZED_WIRE_139 & SYNTHESIZED_WIRE_41;


VGA_Submarino	b2v_inst21(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_45),
	.rgb_r(SYNTHESIZED_WIRE_84),
	.rgb_g(SYNTHESIZED_WIRE_96),
	.rgb_b(SYNTHESIZED_WIRE_108));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_49),
	.rgb_r(SYNTHESIZED_WIRE_83),
	.rgb_g(SYNTHESIZED_WIRE_95),
	.rgb_b(SYNTHESIZED_WIRE_107));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_53),
	.rgb_r(SYNTHESIZED_WIRE_88),
	.rgb_g(SYNTHESIZED_WIRE_100),
	.rgb_b(SYNTHESIZED_WIRE_112));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_57),
	.rgb_r(SYNTHESIZED_WIRE_87),
	.rgb_g(SYNTHESIZED_WIRE_99),
	.rgb_b(SYNTHESIZED_WIRE_111));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_61),
	.rgb_r(SYNTHESIZED_WIRE_86),
	.rgb_g(SYNTHESIZED_WIRE_98),
	.rgb_b(SYNTHESIZED_WIRE_110));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_65),
	.rgb_r(SYNTHESIZED_WIRE_90),
	.rgb_g(SYNTHESIZED_WIRE_102),
	.rgb_b(SYNTHESIZED_WIRE_114));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_69),
	.rgb_r(SYNTHESIZED_WIRE_89),
	.rgb_g(SYNTHESIZED_WIRE_101),
	.rgb_b(SYNTHESIZED_WIRE_113));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_73),
	.rgb_r(SYNTHESIZED_WIRE_91),
	.rgb_g(SYNTHESIZED_WIRE_103),
	.rgb_b(SYNTHESIZED_WIRE_115));
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
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_77),
	.rgb_r(SYNTHESIZED_WIRE_93),
	.rgb_g(SYNTHESIZED_WIRE_105),
	.rgb_b(SYNTHESIZED_WIRE_117));
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

assign	SYNTHESIZED_WIRE_145 = SYNTHESIZED_WIRE_78 & enable;


VGA_PortaAvioes	b2v_inst30(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_82),
	.rgb_r(SYNTHESIZED_WIRE_92),
	.rgb_g(SYNTHESIZED_WIRE_104),
	.rgb_b(SYNTHESIZED_WIRE_116));
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

assign	rgb_r = SYNTHESIZED_WIRE_83 | SYNTHESIZED_WIRE_84 | SYNTHESIZED_WIRE_85 | SYNTHESIZED_WIRE_86 | SYNTHESIZED_WIRE_87 | SYNTHESIZED_WIRE_88 | SYNTHESIZED_WIRE_89 | SYNTHESIZED_WIRE_90 | SYNTHESIZED_WIRE_91 | SYNTHESIZED_WIRE_92 | SYNTHESIZED_WIRE_93 | SYNTHESIZED_WIRE_94;

assign	rgb_g = SYNTHESIZED_WIRE_95 | SYNTHESIZED_WIRE_96 | SYNTHESIZED_WIRE_97 | SYNTHESIZED_WIRE_98 | SYNTHESIZED_WIRE_99 | SYNTHESIZED_WIRE_100 | SYNTHESIZED_WIRE_101 | SYNTHESIZED_WIRE_102 | SYNTHESIZED_WIRE_103 | SYNTHESIZED_WIRE_104 | SYNTHESIZED_WIRE_105 | SYNTHESIZED_WIRE_106;

assign	rgb_b = SYNTHESIZED_WIRE_107 | SYNTHESIZED_WIRE_108 | SYNTHESIZED_WIRE_109 | SYNTHESIZED_WIRE_110 | SYNTHESIZED_WIRE_111 | SYNTHESIZED_WIRE_112 | SYNTHESIZED_WIRE_113 | SYNTHESIZED_WIRE_114 | SYNTHESIZED_WIRE_115 | SYNTHESIZED_WIRE_116 | SYNTHESIZED_WIRE_117 | SYNTHESIZED_WIRE_118;


VGA_Compositor	b2v_inst5(
	.clk(pll_clk),
	.resetGeral(reset),
	.readyExecutandoJogo(SYNTHESIZED_WIRE_139),
	.readyPosicionandoPecas(SYNTHESIZED_WIRE_145),
	.jogadorExecutandoJogo(SYNTHESIZED_WIRE_135),
	.jogadorPosicionandoPecas(SYNTHESIZED_WIRE_146),
	.data_memoria(SYNTHESIZED_WIRE_123),
	
	.jogadorVGA(SYNTHESIZED_WIRE_15),
	.addr(SYNTHESIZED_WIRE_20),
	.dataEmbarcacaoCruzadorDois(SYNTHESIZED_WIRE_65),
	.dataEmbarcacaoCruzadorUm(SYNTHESIZED_WIRE_61),
	.dataEmbarcacaoEncouracado(SYNTHESIZED_WIRE_77),
	.dataEmbarcacaoHidroaviaoDois(SYNTHESIZED_WIRE_73),
	.dataEmbarcacaoHidroaviaoUm(SYNTHESIZED_WIRE_69),
	.dataEmbarcacaoPortaAvioes(SYNTHESIZED_WIRE_82),
	.dataEmbarcacaoSubmarinoCinco(SYNTHESIZED_WIRE_57),
	.dataEmbarcacaoSubmarinoDois(SYNTHESIZED_WIRE_45),
	.dataEmbarcacaoSubmarinoQuatro(SYNTHESIZED_WIRE_53),
	.dataEmbarcacaoSubmarinoTres(SYNTHESIZED_WIRE_49),
	.dataEmbarcacaoSubmarinoUm(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst5.ExecutandoJogo = 3'b010;
	defparam	b2v_inst5.Idle = 3'b000;
	defparam	b2v_inst5.PosicionandoPecas = 3'b001;

assign	SYNTHESIZED_WIRE_78 =  ~SYNTHESIZED_WIRE_141;


VGASinc	b2v_inst8(
	.reset(reset),
	.clk(pll_clk),
	.h_sync(H_SYNC),
	.v_sync(V_SYNC),
	.regiaoAtiva(SYNTHESIZED_WIRE_142),
	.coluna(SYNTHESIZED_WIRE_143),
	.linha(SYNTHESIZED_WIRE_144));
	defparam	b2v_inst8.COLUNASATIVAS = 640;
	defparam	b2v_inst8.LINHASATIVAS = 480;
	defparam	b2v_inst8.TOTALCOLUNAS = 800;
	defparam	b2v_inst8.TOTALLINHAS = 524;


posicionandoPecasSwich	b2v_posicionandoPecas(
	.enable(SYNTHESIZED_WIRE_145),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(SYNTHESIZED_WIRE_126),
	.sw10(sw10),
	.sw11(sw11),
	.sw12(sw12),
	.sw13(sw13),
	.sw14(sw14),
	.sw15(sw15),
	.sw16(sw16),
	.sw17(sw17),
	.ready(SYNTHESIZED_WIRE_141),
	.valida(SYNTHESIZED_WIRE_138),
	.jogador(SYNTHESIZED_WIRE_146),
	.direcao(SYNTHESIZED_WIRE_129),
	.estado1(estado1),
	.estado2(estado2),
	.estado3(estado3),
	.estado4(estado4),
	.estado5(estado5),
	.estado6(estado6),
	.orientacao(SYNTHESIZED_WIRE_130),
	.tipo(SYNTHESIZED_WIRE_131),
	.X1(SYNTHESIZED_WIRE_133),
	.Y1(SYNTHESIZED_WIRE_134));
	defparam	b2v_posicionandoPecas.armazenaPeca = 4'b0110;
	defparam	b2v_posicionandoPecas.defineX = 4'b0011;
	defparam	b2v_posicionandoPecas.defineY = 4'b0100;
	defparam	b2v_posicionandoPecas.escolheDirecao = 4'b0001;
	defparam	b2v_posicionandoPecas.escolheOrientacao = 4'b0010;
	defparam	b2v_posicionandoPecas.verificaConflito = 4'b0101;


Validador	b2v_validador(
	.enable(SYNTHESIZED_WIRE_138),
	.jogador(SYNTHESIZED_WIRE_146),
	.direcao(SYNTHESIZED_WIRE_129),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_130),
	.tipo(SYNTHESIZED_WIRE_131),
	.vetor_leitura(SYNTHESIZED_WIRE_132),
	.x1(SYNTHESIZED_WIRE_133),
	.y1(SYNTHESIZED_WIRE_134),
	.ready(SYNTHESIZED_WIRE_10),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(SYNTHESIZED_WIRE_12),
	.wrep2(SYNTHESIZED_WIRE_13),
	.jogadorOut(SYNTHESIZED_WIRE_14),
	.conflito(SYNTHESIZED_WIRE_126),
	.addr(SYNTHESIZED_WIRE_18),
	.vetor(SYNTHESIZED_WIRE_19));
	defparam	b2v_validador.ConflitoBorda = 3'b010;
	defparam	b2v_validador.ConflitoMemoria = 3'b100;
	defparam	b2v_validador.CRUZADOR = 3'b011;
	defparam	b2v_validador.ENCOURACADO = 3'b001;
	defparam	b2v_validador.EstadoInicial = 3'b000;
	defparam	b2v_validador.HIDROAVIAO = 3'b010;
	defparam	b2v_validador.PORTA_AVIOES = 3'b000;
	defparam	b2v_validador.SalvandoPeca = 3'b101;
	defparam	b2v_validador.SUBMARINO = 3'b100;
	defparam	b2v_validador.VerificandoBorda = 3'b001;
	defparam	b2v_validador.VerificandoMemoria = 3'b011;


endmodule
