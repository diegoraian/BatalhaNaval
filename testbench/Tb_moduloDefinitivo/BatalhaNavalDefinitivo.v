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
// CREATED		"Wed Aug 30 09:24:00 2017"

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
	wren_p1,
	wren_p2,
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
output wire	wren_p1;
output wire	wren_p2;
output wire	[4:0] addr_memoria;
output wire	[63:0] data_memoria_salvar;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_138;
wire	[63:0] SYNTHESIZED_WIRE_139;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_140;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_141;
wire	SYNTHESIZED_WIRE_142;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[4:0] SYNTHESIZED_WIRE_16;
wire	[63:0] SYNTHESIZED_WIRE_17;
wire	[4:0] SYNTHESIZED_WIRE_18;
wire	[63:0] SYNTHESIZED_WIRE_19;
wire	[4:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_143;
wire	SYNTHESIZED_WIRE_22;
wire	[3:0] SYNTHESIZED_WIRE_23;
wire	[3:0] SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_144;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_145;
wire	SYNTHESIZED_WIRE_146;
wire	[9:0] SYNTHESIZED_WIRE_147;
wire	[9:0] SYNTHESIZED_WIRE_148;
wire	[63:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_42;
wire	[63:0] SYNTHESIZED_WIRE_46;
wire	[63:0] SYNTHESIZED_WIRE_50;
wire	[63:0] SYNTHESIZED_WIRE_54;
wire	[63:0] SYNTHESIZED_WIRE_58;
wire	[63:0] SYNTHESIZED_WIRE_62;
wire	[63:0] SYNTHESIZED_WIRE_66;
wire	[63:0] SYNTHESIZED_WIRE_70;
wire	[63:0] SYNTHESIZED_WIRE_74;
wire	[63:0] SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
wire	[63:0] SYNTHESIZED_WIRE_83;
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
wire	SYNTHESIZED_WIRE_119;
wire	SYNTHESIZED_WIRE_149;
wire	SYNTHESIZED_WIRE_150;
wire	[63:0] SYNTHESIZED_WIRE_124;
wire	SYNTHESIZED_WIRE_126;
wire	SYNTHESIZED_WIRE_127;
wire	SYNTHESIZED_WIRE_129;
wire	SYNTHESIZED_WIRE_132;
wire	[2:0] SYNTHESIZED_WIRE_133;
wire	[2:0] SYNTHESIZED_WIRE_134;
wire	[63:0] SYNTHESIZED_WIRE_135;
wire	[3:0] SYNTHESIZED_WIRE_136;
wire	[3:0] SYNTHESIZED_WIRE_137;

assign	VGA_CLK = pll_clk;




Colisor	b2v_colisor(
	.enable(SYNTHESIZED_WIRE_0),
	.jogadorAtirador(SYNTHESIZED_WIRE_138),
	.clk(clk),
	.memoriaP1(SYNTHESIZED_WIRE_139),
	.memoriaP2(SYNTHESIZED_WIRE_139),
	.x(SYNTHESIZED_WIRE_4),
	.y(SYNTHESIZED_WIRE_5),
	.ready(SYNTHESIZED_WIRE_140),
	.hit(SYNTHESIZED_WIRE_22),
	.wrep1(SYNTHESIZED_WIRE_7),
	.wrep2(SYNTHESIZED_WIRE_8),
	.jogadorAlvo(SYNTHESIZED_WIRE_9),
	.addr(SYNTHESIZED_WIRE_16),
	.clear(SYNTHESIZED_WIRE_17)
	);


ControladoMemoria	b2v_controladorMemoria(
	.clk(clk),
	.readyColisor(SYNTHESIZED_WIRE_140),
	.colisor_wrep1(SYNTHESIZED_WIRE_7),
	.colisor_wrep2(SYNTHESIZED_WIRE_8),
	.jogadorColisor(SYNTHESIZED_WIRE_9),
	
	
	.readyValidador(SYNTHESIZED_WIRE_141),
	.enableValidador(SYNTHESIZED_WIRE_142),
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
	.wrenP1(wren_p1),
	.wrenP2(wren_p2),
	.addr(addr_memoria),
	.data(data_memoria_salvar),
	.dataReadColisor(SYNTHESIZED_WIRE_139),
	
	.dataReadValidador(SYNTHESIZED_WIRE_135),
	.dataReadVGA(SYNTHESIZED_WIRE_124));
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
	.enable(SYNTHESIZED_WIRE_143),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_22),
	
	.qtd_P1(SYNTHESIZED_WIRE_23),
	.qtd_P2(SYNTHESIZED_WIRE_24),
	.ready(SYNTHESIZED_WIRE_144),
	.jogador(SYNTHESIZED_WIRE_138),
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

assign	SYNTHESIZED_WIRE_26 =  ~SYNTHESIZED_WIRE_144;

assign	SYNTHESIZED_WIRE_143 = SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_145;


VGA_Mapa	b2v_inst13(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.rgb_r(SYNTHESIZED_WIRE_95),
	.rgb_g(SYNTHESIZED_WIRE_107),
	.rgb_b(SYNTHESIZED_WIRE_119));


VGA_Submarino	b2v_inst14(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_34),
	.rgb_r(SYNTHESIZED_WIRE_86),
	.rgb_g(SYNTHESIZED_WIRE_98),
	.rgb_b(SYNTHESIZED_WIRE_110));
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

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_35 & SYNTHESIZED_WIRE_144;

assign	SYNTHESIZED_WIRE_35 =  ~SYNTHESIZED_WIRE_140;

assign	SYNTHESIZED_WIRE_126 =  ~SYNTHESIZED_WIRE_141;


ContagemPecas	b2v_inst18(
	.enable(SYNTHESIZED_WIRE_39),
	.clk(clk),
	
	
	.ready(SYNTHESIZED_WIRE_40),
	
	.qtd_P1(SYNTHESIZED_WIRE_23),
	.qtd_P2(SYNTHESIZED_WIRE_24));

assign	SYNTHESIZED_WIRE_42 =  ~SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_39 = SYNTHESIZED_WIRE_143 & SYNTHESIZED_WIRE_42;


VGA_Submarino	b2v_inst21(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_46),
	.rgb_r(SYNTHESIZED_WIRE_85),
	.rgb_g(SYNTHESIZED_WIRE_97),
	.rgb_b(SYNTHESIZED_WIRE_109));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_50),
	.rgb_r(SYNTHESIZED_WIRE_84),
	.rgb_g(SYNTHESIZED_WIRE_96),
	.rgb_b(SYNTHESIZED_WIRE_108));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_54),
	.rgb_r(SYNTHESIZED_WIRE_89),
	.rgb_g(SYNTHESIZED_WIRE_101),
	.rgb_b(SYNTHESIZED_WIRE_113));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_58),
	.rgb_r(SYNTHESIZED_WIRE_88),
	.rgb_g(SYNTHESIZED_WIRE_100),
	.rgb_b(SYNTHESIZED_WIRE_112));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_62),
	.rgb_r(SYNTHESIZED_WIRE_87),
	.rgb_g(SYNTHESIZED_WIRE_99),
	.rgb_b(SYNTHESIZED_WIRE_111));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_66),
	.rgb_r(SYNTHESIZED_WIRE_91),
	.rgb_g(SYNTHESIZED_WIRE_103),
	.rgb_b(SYNTHESIZED_WIRE_115));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_70),
	.rgb_r(SYNTHESIZED_WIRE_90),
	.rgb_g(SYNTHESIZED_WIRE_102),
	.rgb_b(SYNTHESIZED_WIRE_114));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_74),
	.rgb_r(SYNTHESIZED_WIRE_92),
	.rgb_g(SYNTHESIZED_WIRE_104),
	.rgb_b(SYNTHESIZED_WIRE_116));
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
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_78),
	.rgb_r(SYNTHESIZED_WIRE_94),
	.rgb_g(SYNTHESIZED_WIRE_106),
	.rgb_b(SYNTHESIZED_WIRE_118));
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

assign	SYNTHESIZED_WIRE_149 = SYNTHESIZED_WIRE_79 & enable;


VGA_PortaAvioes	b2v_inst30(
	.clk(pll_clk),
	.areaAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_83),
	.rgb_r(SYNTHESIZED_WIRE_93),
	.rgb_g(SYNTHESIZED_WIRE_105),
	.rgb_b(SYNTHESIZED_WIRE_117));
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

assign	rgb_r = SYNTHESIZED_WIRE_84 | SYNTHESIZED_WIRE_85 | SYNTHESIZED_WIRE_86 | SYNTHESIZED_WIRE_87 | SYNTHESIZED_WIRE_88 | SYNTHESIZED_WIRE_89 | SYNTHESIZED_WIRE_90 | SYNTHESIZED_WIRE_91 | SYNTHESIZED_WIRE_92 | SYNTHESIZED_WIRE_93 | SYNTHESIZED_WIRE_94 | SYNTHESIZED_WIRE_95;

assign	rgb_g = SYNTHESIZED_WIRE_96 | SYNTHESIZED_WIRE_97 | SYNTHESIZED_WIRE_98 | SYNTHESIZED_WIRE_99 | SYNTHESIZED_WIRE_100 | SYNTHESIZED_WIRE_101 | SYNTHESIZED_WIRE_102 | SYNTHESIZED_WIRE_103 | SYNTHESIZED_WIRE_104 | SYNTHESIZED_WIRE_105 | SYNTHESIZED_WIRE_106 | SYNTHESIZED_WIRE_107;

assign	rgb_b = SYNTHESIZED_WIRE_108 | SYNTHESIZED_WIRE_109 | SYNTHESIZED_WIRE_110 | SYNTHESIZED_WIRE_111 | SYNTHESIZED_WIRE_112 | SYNTHESIZED_WIRE_113 | SYNTHESIZED_WIRE_114 | SYNTHESIZED_WIRE_115 | SYNTHESIZED_WIRE_116 | SYNTHESIZED_WIRE_117 | SYNTHESIZED_WIRE_118 | SYNTHESIZED_WIRE_119;


VGA_Compositor	b2v_inst5(
	.clk(pll_clk),
	.resetGeral(reset),
	.readyExecutandoJogo(SYNTHESIZED_WIRE_143),
	.readyPosicionandoPecas(SYNTHESIZED_WIRE_149),
	.jogadorExecutandoJogo(SYNTHESIZED_WIRE_138),
	.jogadorPosicionandoPecas(SYNTHESIZED_WIRE_150),
	.data_memoria(SYNTHESIZED_WIRE_124),
	
	.jogadorVGA(SYNTHESIZED_WIRE_15),
	.addr(SYNTHESIZED_WIRE_20),
	.dataEmbarcacaoCruzadorDois(SYNTHESIZED_WIRE_66),
	.dataEmbarcacaoCruzadorUm(SYNTHESIZED_WIRE_62),
	.dataEmbarcacaoEncouracado(SYNTHESIZED_WIRE_78),
	.dataEmbarcacaoHidroaviaoDois(SYNTHESIZED_WIRE_74),
	.dataEmbarcacaoHidroaviaoUm(SYNTHESIZED_WIRE_70),
	.dataEmbarcacaoPortaAvioes(SYNTHESIZED_WIRE_83),
	.dataEmbarcacaoSubmarinoCinco(SYNTHESIZED_WIRE_58),
	.dataEmbarcacaoSubmarinoDois(SYNTHESIZED_WIRE_46),
	.dataEmbarcacaoSubmarinoQuatro(SYNTHESIZED_WIRE_54),
	.dataEmbarcacaoSubmarinoTres(SYNTHESIZED_WIRE_50),
	.dataEmbarcacaoSubmarinoUm(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst5.ExecutandoJogo = 3'b010;
	defparam	b2v_inst5.Idle = 3'b000;
	defparam	b2v_inst5.PosicionandoPecas = 3'b001;

assign	SYNTHESIZED_WIRE_79 =  ~SYNTHESIZED_WIRE_145;


VGASinc	b2v_inst8(
	.reset(reset),
	.clk(pll_clk),
	.h_sync(H_SYNC),
	.v_sync(V_SYNC),
	.regiaoAtiva(SYNTHESIZED_WIRE_146),
	.coluna(SYNTHESIZED_WIRE_147),
	.linha(SYNTHESIZED_WIRE_148));
	defparam	b2v_inst8.COLUNASATIVAS = 640;
	defparam	b2v_inst8.LINHASATIVAS = 480;
	defparam	b2v_inst8.TOTALCOLUNAS = 800;
	defparam	b2v_inst8.TOTALLINHAS = 524;

assign	SYNTHESIZED_WIRE_142 = SYNTHESIZED_WIRE_126 & SYNTHESIZED_WIRE_127;


posicionandoPecasSwich	b2v_posicionandoPecas(
	.enable(SYNTHESIZED_WIRE_149),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(SYNTHESIZED_WIRE_129),
	.sw10(sw10),
	.sw11(sw11),
	.sw12(sw12),
	.sw13(sw13),
	.sw14(sw14),
	.sw15(sw15),
	.sw16(sw16),
	.sw17(sw17),
	.ready(SYNTHESIZED_WIRE_145),
	.valida(SYNTHESIZED_WIRE_127),
	.jogador(SYNTHESIZED_WIRE_150),
	.direcao(SYNTHESIZED_WIRE_132),
	.estado1(estado1),
	.estado2(estado2),
	.estado3(estado3),
	.estado4(estado4),
	.estado5(estado5),
	.estado6(estado6),
	.orientacao(SYNTHESIZED_WIRE_133),
	.tipo(SYNTHESIZED_WIRE_134),
	.X1(SYNTHESIZED_WIRE_136),
	.Y1(SYNTHESIZED_WIRE_137));
	defparam	b2v_posicionandoPecas.armazenaPeca = 4'b0110;
	defparam	b2v_posicionandoPecas.defineX = 4'b0011;
	defparam	b2v_posicionandoPecas.defineY = 4'b0100;
	defparam	b2v_posicionandoPecas.escolheDirecao = 4'b0001;
	defparam	b2v_posicionandoPecas.escolheOrientacao = 4'b0010;
	defparam	b2v_posicionandoPecas.verificaConflito = 4'b0101;


Validador	b2v_validador(
	.enable(SYNTHESIZED_WIRE_142),
	.jogador(SYNTHESIZED_WIRE_150),
	.direcao(SYNTHESIZED_WIRE_132),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_133),
	.tipo(SYNTHESIZED_WIRE_134),
	.vetor_leitura(SYNTHESIZED_WIRE_135),
	.x1(SYNTHESIZED_WIRE_136),
	.y1(SYNTHESIZED_WIRE_137),
	.ready(SYNTHESIZED_WIRE_141),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(SYNTHESIZED_WIRE_12),
	.wrep2(SYNTHESIZED_WIRE_13),
	.jogadorOut(SYNTHESIZED_WIRE_14),
	.conflito(SYNTHESIZED_WIRE_129),
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
