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
// CREATED		"Thu Aug 24 00:48:15 2017"

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

wire	SYNTHESIZED_WIRE_163;
wire	SYNTHESIZED_WIRE_164;
wire	[9:0] SYNTHESIZED_WIRE_165;
wire	[9:0] SYNTHESIZED_WIRE_166;
wire	[63:0] SYNTHESIZED_WIRE_4;
wire	[63:0] SYNTHESIZED_WIRE_9;
wire	[63:0] SYNTHESIZED_WIRE_14;
wire	[63:0] SYNTHESIZED_WIRE_19;
wire	[63:0] SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_167;
wire	[63:0] SYNTHESIZED_WIRE_168;
wire	[3:0] SYNTHESIZED_WIRE_29;
wire	[3:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_169;
wire	SYNTHESIZED_WIRE_32;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	[3:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_170;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_171;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_172;
wire	SYNTHESIZED_WIRE_173;
wire	SYNTHESIZED_WIRE_46;
wire	[63:0] SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_174;
wire	SYNTHESIZED_WIRE_175;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	[4:0] SYNTHESIZED_WIRE_65;
wire	[63:0] SYNTHESIZED_WIRE_66;
wire	[63:0] SYNTHESIZED_WIRE_67;
wire	[63:0] SYNTHESIZED_WIRE_68;
wire	[4:0] SYNTHESIZED_WIRE_69;
wire	[4:0] SYNTHESIZED_WIRE_70;
wire	[63:0] SYNTHESIZED_WIRE_71;
wire	[4:0] SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_75;
wire	SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
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
wire	SYNTHESIZED_WIRE_176;
wire	SYNTHESIZED_WIRE_111;
wire	[2:0] SYNTHESIZED_WIRE_112;
wire	[2:0] SYNTHESIZED_WIRE_113;
wire	[63:0] SYNTHESIZED_WIRE_114;
wire	[3:0] SYNTHESIZED_WIRE_115;
wire	[3:0] SYNTHESIZED_WIRE_116;
wire	[63:0] SYNTHESIZED_WIRE_121;
wire	SYNTHESIZED_WIRE_122;
wire	SYNTHESIZED_WIRE_125;
wire	SYNTHESIZED_WIRE_126;
wire	SYNTHESIZED_WIRE_127;
wire	[4:0] SYNTHESIZED_WIRE_177;
wire	[63:0] SYNTHESIZED_WIRE_178;
wire	SYNTHESIZED_WIRE_130;
wire	[63:0] SYNTHESIZED_WIRE_137;
wire	[63:0] SYNTHESIZED_WIRE_142;
wire	[63:0] SYNTHESIZED_WIRE_147;
wire	[63:0] SYNTHESIZED_WIRE_152;
wire	[63:0] SYNTHESIZED_WIRE_157;
wire	[63:0] SYNTHESIZED_WIRE_162;

assign	VGA_CLK = SYNTHESIZED_WIRE_163;




VGA_Cruzador	b2v_cruzador1(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_4),
	.rgb_r(SYNTHESIZED_WIRE_76),
	.rgb_g(SYNTHESIZED_WIRE_88),
	.rgb_b(SYNTHESIZED_WIRE_100));
	defparam	b2v_cruzador1.X1 = 10'b0000000001;
	defparam	b2v_cruzador1.X2 = 10'b0000000010;
	defparam	b2v_cruzador1.X3 = 10'b0000000011;
	defparam	b2v_cruzador1.X4 = 10'b0000000100;
	defparam	b2v_cruzador1.X5 = 10'b0000000101;
	defparam	b2v_cruzador1.X6 = 10'b0000000110;
	defparam	b2v_cruzador1.X7 = 10'b0000000111;
	defparam	b2v_cruzador1.X8 = 10'b0000001000;
	defparam	b2v_cruzador1.Y1 = 10'b0000000001;
	defparam	b2v_cruzador1.Y2 = 10'b0000000010;
	defparam	b2v_cruzador1.Y3 = 10'b0000000011;
	defparam	b2v_cruzador1.Y4 = 10'b0000000100;
	defparam	b2v_cruzador1.Y5 = 10'b0000000101;
	defparam	b2v_cruzador1.Y6 = 10'b0000000110;
	defparam	b2v_cruzador1.Y7 = 10'b0000000111;
	defparam	b2v_cruzador1.Y8 = 10'b0000001000;


VGA_Cruzador	b2v_cruzador2(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_9),
	.rgb_r(SYNTHESIZED_WIRE_80),
	.rgb_g(SYNTHESIZED_WIRE_92),
	.rgb_b(SYNTHESIZED_WIRE_104));
	defparam	b2v_cruzador2.X1 = 10'b0000000001;
	defparam	b2v_cruzador2.X2 = 10'b0000000010;
	defparam	b2v_cruzador2.X3 = 10'b0000000011;
	defparam	b2v_cruzador2.X4 = 10'b0000000100;
	defparam	b2v_cruzador2.X5 = 10'b0000000101;
	defparam	b2v_cruzador2.X6 = 10'b0000000110;
	defparam	b2v_cruzador2.X7 = 10'b0000000111;
	defparam	b2v_cruzador2.X8 = 10'b0000001000;
	defparam	b2v_cruzador2.Y1 = 10'b0000000001;
	defparam	b2v_cruzador2.Y2 = 10'b0000000010;
	defparam	b2v_cruzador2.Y3 = 10'b0000000011;
	defparam	b2v_cruzador2.Y4 = 10'b0000000100;
	defparam	b2v_cruzador2.Y5 = 10'b0000000101;
	defparam	b2v_cruzador2.Y6 = 10'b0000000110;
	defparam	b2v_cruzador2.Y7 = 10'b0000000111;
	defparam	b2v_cruzador2.Y8 = 10'b0000001000;


VGA_Encouracado	b2v_encouracado1(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_14),
	.rgb_r(SYNTHESIZED_WIRE_83),
	.rgb_g(SYNTHESIZED_WIRE_95),
	.rgb_b(SYNTHESIZED_WIRE_107));
	defparam	b2v_encouracado1.X1 = 10'b0000000001;
	defparam	b2v_encouracado1.X2 = 10'b0000000010;
	defparam	b2v_encouracado1.X3 = 10'b0000000011;
	defparam	b2v_encouracado1.X4 = 10'b0000000100;
	defparam	b2v_encouracado1.X5 = 10'b0000000101;
	defparam	b2v_encouracado1.X6 = 10'b0000000110;
	defparam	b2v_encouracado1.X7 = 10'b0000000111;
	defparam	b2v_encouracado1.X8 = 10'b0000001000;
	defparam	b2v_encouracado1.Y1 = 10'b0000000001;
	defparam	b2v_encouracado1.Y2 = 10'b0000000010;
	defparam	b2v_encouracado1.Y3 = 10'b0000000011;
	defparam	b2v_encouracado1.Y4 = 10'b0000000100;
	defparam	b2v_encouracado1.Y5 = 10'b0000000101;
	defparam	b2v_encouracado1.Y6 = 10'b0000000110;
	defparam	b2v_encouracado1.Y7 = 10'b0000000111;
	defparam	b2v_encouracado1.Y8 = 10'b0000001000;


VGA_Hidroaviao	b2v_hidroaviao(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_19),
	.rgb_r(SYNTHESIZED_WIRE_79),
	.rgb_g(SYNTHESIZED_WIRE_91),
	.rgb_b(SYNTHESIZED_WIRE_103));
	defparam	b2v_hidroaviao.X1 = 10'b0000000001;
	defparam	b2v_hidroaviao.X2 = 10'b0000000010;
	defparam	b2v_hidroaviao.X3 = 10'b0000000011;
	defparam	b2v_hidroaviao.X4 = 10'b0000000100;
	defparam	b2v_hidroaviao.X5 = 10'b0000000101;
	defparam	b2v_hidroaviao.X6 = 10'b0000000110;
	defparam	b2v_hidroaviao.X7 = 10'b0000000111;
	defparam	b2v_hidroaviao.X8 = 10'b0000001000;
	defparam	b2v_hidroaviao.Y1 = 10'b0000000001;
	defparam	b2v_hidroaviao.Y2 = 10'b0000000010;
	defparam	b2v_hidroaviao.Y3 = 10'b0000000011;
	defparam	b2v_hidroaviao.Y4 = 10'b0000000100;
	defparam	b2v_hidroaviao.Y5 = 10'b0000000101;
	defparam	b2v_hidroaviao.Y6 = 10'b0000000110;
	defparam	b2v_hidroaviao.Y7 = 10'b0000000111;
	defparam	b2v_hidroaviao.Y8 = 10'b0000001000;


VGA_Hidroaviao	b2v_hidroaviao2(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_24),
	.rgb_r(SYNTHESIZED_WIRE_81),
	.rgb_g(SYNTHESIZED_WIRE_93),
	.rgb_b(SYNTHESIZED_WIRE_105));
	defparam	b2v_hidroaviao2.X1 = 10'b0000000001;
	defparam	b2v_hidroaviao2.X2 = 10'b0000000010;
	defparam	b2v_hidroaviao2.X3 = 10'b0000000011;
	defparam	b2v_hidroaviao2.X4 = 10'b0000000100;
	defparam	b2v_hidroaviao2.X5 = 10'b0000000101;
	defparam	b2v_hidroaviao2.X6 = 10'b0000000110;
	defparam	b2v_hidroaviao2.X7 = 10'b0000000111;
	defparam	b2v_hidroaviao2.X8 = 10'b0000001000;
	defparam	b2v_hidroaviao2.Y1 = 10'b0000000001;
	defparam	b2v_hidroaviao2.Y2 = 10'b0000000010;
	defparam	b2v_hidroaviao2.Y3 = 10'b0000000011;
	defparam	b2v_hidroaviao2.Y4 = 10'b0000000100;
	defparam	b2v_hidroaviao2.Y5 = 10'b0000000101;
	defparam	b2v_hidroaviao2.Y6 = 10'b0000000110;
	defparam	b2v_hidroaviao2.Y7 = 10'b0000000111;
	defparam	b2v_hidroaviao2.Y8 = 10'b0000001000;


Colisor	b2v_inst(
	.enable(SYNTHESIZED_WIRE_25),
	.jogadorAtirador(SYNTHESIZED_WIRE_167),
	.clk(clk),
	.memoriaP1(SYNTHESIZED_WIRE_168),
	.memoriaP2(SYNTHESIZED_WIRE_168),
	.x(SYNTHESIZED_WIRE_29),
	.y(SYNTHESIZED_WIRE_30),
	.ready(SYNTHESIZED_WIRE_172),
	.hit(SYNTHESIZED_WIRE_32),
	.wrep1(SYNTHESIZED_WIRE_55),
	.wrep2(SYNTHESIZED_WIRE_56),
	.jogadorAlvo(SYNTHESIZED_WIRE_57),
	.addr(SYNTHESIZED_WIRE_65),
	.clear(SYNTHESIZED_WIRE_66)
	);


ExecutandoJogo	b2v_inst1(
	.enable(SYNTHESIZED_WIRE_169),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_32),
	
	.qtd_P1(SYNTHESIZED_WIRE_33),
	.qtd_P2(SYNTHESIZED_WIRE_34),
	.ready(SYNTHESIZED_WIRE_170),
	.jogador(SYNTHESIZED_WIRE_167),
	.coord_tiroX(SYNTHESIZED_WIRE_29),
	.coord_tiroY(SYNTHESIZED_WIRE_30));
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

assign	SYNTHESIZED_WIRE_36 =  ~SYNTHESIZED_WIRE_170;

assign	SYNTHESIZED_WIRE_169 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_171;


VGA_Mapa	b2v_inst13(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.rgb_r(SYNTHESIZED_WIRE_84),
	.rgb_g(SYNTHESIZED_WIRE_96),
	.rgb_b(SYNTHESIZED_WIRE_108));

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_42 & SYNTHESIZED_WIRE_170;

assign	SYNTHESIZED_WIRE_42 =  ~SYNTHESIZED_WIRE_172;

assign	SYNTHESIZED_WIRE_125 =  ~SYNTHESIZED_WIRE_173;


Pontuacao	b2v_inst18(
	.enable(SYNTHESIZED_WIRE_46),
	.clk(clk),
	.reset(reset),
	.jogadorIn(SYNTHESIZED_WIRE_167),
	.memoria(SYNTHESIZED_WIRE_48),
	.ready(SYNTHESIZED_WIRE_174),
	.jogadorOut(SYNTHESIZED_WIRE_59),
	.addr(SYNTHESIZED_WIRE_69),
	
	
	.qtdP1(SYNTHESIZED_WIRE_33),
	.qtdP2(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst18.calculandoPontos = 4'b0010;
	defparam	b2v_inst18.calculandoQtdRestante = 4'b0011;
	defparam	b2v_inst18.Idle = 4'b0000;
	defparam	b2v_inst18.lendoMemoria = 4'b0001;

assign	SYNTHESIZED_WIRE_53 =  ~SYNTHESIZED_WIRE_174;


posicionandoPecas	b2v_inst2(
	.enable(SYNTHESIZED_WIRE_175),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(SYNTHESIZED_WIRE_51),
	.ready(SYNTHESIZED_WIRE_171),
	.valida(SYNTHESIZED_WIRE_126),
	.jogador(SYNTHESIZED_WIRE_176),
	.direcao(SYNTHESIZED_WIRE_111),
	
	
	
	
	
	
	.orientacao(SYNTHESIZED_WIRE_112),
	.tipo(SYNTHESIZED_WIRE_113),
	.X1(SYNTHESIZED_WIRE_115),
	.Y1(SYNTHESIZED_WIRE_116));
	defparam	b2v_inst2.armazenaPeca = 4'b0110;
	defparam	b2v_inst2.defineX = 4'b0011;
	defparam	b2v_inst2.defineY = 4'b0100;
	defparam	b2v_inst2.escolheDirecao = 4'b0001;
	defparam	b2v_inst2.escolheOrientacao = 4'b0010;
	defparam	b2v_inst2.verificaConflito = 4'b0101;

assign	SYNTHESIZED_WIRE_46 = SYNTHESIZED_WIRE_169 & SYNTHESIZED_WIRE_53;


ControladoMemoria	b2v_inst3(
	.clk(clk),
	.readyColisor(SYNTHESIZED_WIRE_172),
	.colisor_wrep1(SYNTHESIZED_WIRE_55),
	.colisor_wrep2(SYNTHESIZED_WIRE_56),
	.jogadorColisor(SYNTHESIZED_WIRE_57),
	.readyPontuacao(SYNTHESIZED_WIRE_174),
	.jogadorPontuacao(SYNTHESIZED_WIRE_59),
	.readyValidador(SYNTHESIZED_WIRE_173),
	
	.validador_wrep1(SYNTHESIZED_WIRE_61),
	.validador_wrep2(SYNTHESIZED_WIRE_62),
	.validadorJogador(SYNTHESIZED_WIRE_63),
	.jogadorVGA(SYNTHESIZED_WIRE_64),
	.resetGeral(reset),
	.colisor_addr(SYNTHESIZED_WIRE_65),
	.colisor_data(SYNTHESIZED_WIRE_66),
	.data_memoria_jogadorDois(SYNTHESIZED_WIRE_67),
	.data_memoria_jogadorUm(SYNTHESIZED_WIRE_68),
	.pontuacao_addr(SYNTHESIZED_WIRE_69),
	.validador_addr(SYNTHESIZED_WIRE_70),
	.validador_data(SYNTHESIZED_WIRE_71),
	.vga_readAddr(SYNTHESIZED_WIRE_72),
	.wrenP1(SYNTHESIZED_WIRE_127),
	.wrenP2(SYNTHESIZED_WIRE_130),
	.addr(SYNTHESIZED_WIRE_177),
	.data(SYNTHESIZED_WIRE_178),
	.dataReadColisor(SYNTHESIZED_WIRE_168),
	.dataReadPontuacao(SYNTHESIZED_WIRE_48),
	.dataReadValidador(SYNTHESIZED_WIRE_114),
	.dataReadVGA(SYNTHESIZED_WIRE_121));
	defparam	b2v_inst3.CalculandoPontuacaoPlayerDois = 4'b0110;
	defparam	b2v_inst3.CalculandoPontuacaoPlayerUm = 4'b0101;
	defparam	b2v_inst3.ColidindoPlayerDois = 4'b0100;
	defparam	b2v_inst3.ColidindoPlayerUm = 4'b0011;
	defparam	b2v_inst3.Idle = 4'b0000;
	defparam	b2v_inst3.TransmitindoVgaPlayerDois = 4'b1000;
	defparam	b2v_inst3.TransmitindoVgaPlayerUm = 4'b0111;
	defparam	b2v_inst3.ValidandorPlayerDois = 4'b0010;
	defparam	b2v_inst3.ValidandorPlayerUm = 4'b0001;

assign	rgb_r = SYNTHESIZED_WIRE_73 | SYNTHESIZED_WIRE_74 | SYNTHESIZED_WIRE_75 | SYNTHESIZED_WIRE_76 | SYNTHESIZED_WIRE_77 | SYNTHESIZED_WIRE_78 | SYNTHESIZED_WIRE_79 | SYNTHESIZED_WIRE_80 | SYNTHESIZED_WIRE_81 | SYNTHESIZED_WIRE_82 | SYNTHESIZED_WIRE_83 | SYNTHESIZED_WIRE_84;

assign	rgb_g = SYNTHESIZED_WIRE_85 | SYNTHESIZED_WIRE_86 | SYNTHESIZED_WIRE_87 | SYNTHESIZED_WIRE_88 | SYNTHESIZED_WIRE_89 | SYNTHESIZED_WIRE_90 | SYNTHESIZED_WIRE_91 | SYNTHESIZED_WIRE_92 | SYNTHESIZED_WIRE_93 | SYNTHESIZED_WIRE_94 | SYNTHESIZED_WIRE_95 | SYNTHESIZED_WIRE_96;

assign	rgb_b = SYNTHESIZED_WIRE_97 | SYNTHESIZED_WIRE_98 | SYNTHESIZED_WIRE_99 | SYNTHESIZED_WIRE_100 | SYNTHESIZED_WIRE_101 | SYNTHESIZED_WIRE_102 | SYNTHESIZED_WIRE_103 | SYNTHESIZED_WIRE_104 | SYNTHESIZED_WIRE_105 | SYNTHESIZED_WIRE_106 | SYNTHESIZED_WIRE_107 | SYNTHESIZED_WIRE_108;


Validador	b2v_inst4(
	.enable(SYNTHESIZED_WIRE_109),
	.jogador(SYNTHESIZED_WIRE_176),
	.direcao(SYNTHESIZED_WIRE_111),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_112),
	.tipo(SYNTHESIZED_WIRE_113),
	.vetor_leitura(SYNTHESIZED_WIRE_114),
	.x1(SYNTHESIZED_WIRE_115),
	.y1(SYNTHESIZED_WIRE_116),
	.ready(SYNTHESIZED_WIRE_173),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(SYNTHESIZED_WIRE_61),
	.wrep2(SYNTHESIZED_WIRE_62),
	.jogadorOut(SYNTHESIZED_WIRE_63),
	.conflito(SYNTHESIZED_WIRE_51),
	.addr(SYNTHESIZED_WIRE_70),
	.vetor(SYNTHESIZED_WIRE_71));
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
	.readyExecutandoJogo(SYNTHESIZED_WIRE_169),
	.readyPosicionandoPecas(SYNTHESIZED_WIRE_175),
	.jogadorExecutandoJogo(SYNTHESIZED_WIRE_167),
	.jogadorPosicionandoPecas(SYNTHESIZED_WIRE_176),
	.data_memoria(SYNTHESIZED_WIRE_121),
	
	.jogadorVGA(SYNTHESIZED_WIRE_64),
	.addr(SYNTHESIZED_WIRE_72),
	.dataEmbarcacaoCruzadorDois(SYNTHESIZED_WIRE_9),
	.dataEmbarcacaoCruzadorUm(SYNTHESIZED_WIRE_4),
	.dataEmbarcacaoEncouracado(SYNTHESIZED_WIRE_14),
	.dataEmbarcacaoHidroaviaoDois(SYNTHESIZED_WIRE_24),
	.dataEmbarcacaoHidroaviaoUm(SYNTHESIZED_WIRE_19),
	.dataEmbarcacaoPortaAvioes(SYNTHESIZED_WIRE_137),
	.dataEmbarcacaoSubmarinoCinco(SYNTHESIZED_WIRE_162),
	.dataEmbarcacaoSubmarinoDois(SYNTHESIZED_WIRE_147),
	.dataEmbarcacaoSubmarinoQuatro(SYNTHESIZED_WIRE_157),
	.dataEmbarcacaoSubmarinoTres(SYNTHESIZED_WIRE_152),
	.dataEmbarcacaoSubmarinoUm(SYNTHESIZED_WIRE_142));
	defparam	b2v_inst5.ExecutandoJogo = 3'b010;
	defparam	b2v_inst5.Idle = 3'b000;
	defparam	b2v_inst5.PosicionandoPecas = 3'b001;

assign	SYNTHESIZED_WIRE_175 = SYNTHESIZED_WIRE_122 & enable;

assign	SYNTHESIZED_WIRE_122 =  ~SYNTHESIZED_WIRE_171;


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

assign	SYNTHESIZED_WIRE_109 = SYNTHESIZED_WIRE_125 & SYNTHESIZED_WIRE_126;


memoriaA	b2v_memoriaA(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_127),
	.address(SYNTHESIZED_WIRE_177),
	.data(SYNTHESIZED_WIRE_178),
	.q(SYNTHESIZED_WIRE_68));


memoriaB	b2v_memoriaB(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_130),
	.address(SYNTHESIZED_WIRE_177),
	.data(SYNTHESIZED_WIRE_178),
	.q(SYNTHESIZED_WIRE_67));


VGA_PortaAvioes	b2v_portaavioes(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_137),
	.rgb_r(SYNTHESIZED_WIRE_82),
	.rgb_g(SYNTHESIZED_WIRE_94),
	.rgb_b(SYNTHESIZED_WIRE_106));
	defparam	b2v_portaavioes.X1 = 10'b0000000001;
	defparam	b2v_portaavioes.X2 = 10'b0000000010;
	defparam	b2v_portaavioes.X3 = 10'b0000000011;
	defparam	b2v_portaavioes.X4 = 10'b0000000100;
	defparam	b2v_portaavioes.X5 = 10'b0000000101;
	defparam	b2v_portaavioes.X6 = 10'b0000000110;
	defparam	b2v_portaavioes.X7 = 10'b0000000111;
	defparam	b2v_portaavioes.X8 = 10'b0000001000;
	defparam	b2v_portaavioes.Y1 = 10'b0000000001;
	defparam	b2v_portaavioes.Y2 = 10'b0000000010;
	defparam	b2v_portaavioes.Y3 = 10'b0000000011;
	defparam	b2v_portaavioes.Y4 = 10'b0000000100;
	defparam	b2v_portaavioes.Y5 = 10'b0000000101;
	defparam	b2v_portaavioes.Y6 = 10'b0000000110;
	defparam	b2v_portaavioes.Y7 = 10'b0000000111;
	defparam	b2v_portaavioes.Y8 = 10'b0000001000;


VGA_Submarino	b2v_submarino1(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_142),
	.rgb_r(SYNTHESIZED_WIRE_75),
	.rgb_g(SYNTHESIZED_WIRE_87),
	.rgb_b(SYNTHESIZED_WIRE_99));
	defparam	b2v_submarino1.X1 = 10'b0000000001;
	defparam	b2v_submarino1.X2 = 10'b0000000010;
	defparam	b2v_submarino1.X3 = 10'b0000000011;
	defparam	b2v_submarino1.X4 = 10'b0000000100;
	defparam	b2v_submarino1.X5 = 10'b0000000101;
	defparam	b2v_submarino1.X6 = 10'b0000000110;
	defparam	b2v_submarino1.X7 = 10'b0000000111;
	defparam	b2v_submarino1.X8 = 10'b0000001000;
	defparam	b2v_submarino1.Y1 = 10'b0000000001;
	defparam	b2v_submarino1.Y2 = 10'b0000000010;
	defparam	b2v_submarino1.Y3 = 10'b0000000011;
	defparam	b2v_submarino1.Y4 = 10'b0000000100;
	defparam	b2v_submarino1.Y5 = 10'b0000000101;
	defparam	b2v_submarino1.Y6 = 10'b0000000110;
	defparam	b2v_submarino1.Y7 = 10'b0000000111;
	defparam	b2v_submarino1.Y8 = 10'b0000001000;


VGA_Submarino	b2v_submarino2(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_147),
	.rgb_r(SYNTHESIZED_WIRE_74),
	.rgb_g(SYNTHESIZED_WIRE_86),
	.rgb_b(SYNTHESIZED_WIRE_98));
	defparam	b2v_submarino2.X1 = 10'b0000000001;
	defparam	b2v_submarino2.X2 = 10'b0000000010;
	defparam	b2v_submarino2.X3 = 10'b0000000011;
	defparam	b2v_submarino2.X4 = 10'b0000000100;
	defparam	b2v_submarino2.X5 = 10'b0000000101;
	defparam	b2v_submarino2.X6 = 10'b0000000110;
	defparam	b2v_submarino2.X7 = 10'b0000000111;
	defparam	b2v_submarino2.X8 = 10'b0000001000;
	defparam	b2v_submarino2.Y1 = 10'b0000000001;
	defparam	b2v_submarino2.Y2 = 10'b0000000010;
	defparam	b2v_submarino2.Y3 = 10'b0000000011;
	defparam	b2v_submarino2.Y4 = 10'b0000000100;
	defparam	b2v_submarino2.Y5 = 10'b0000000101;
	defparam	b2v_submarino2.Y6 = 10'b0000000110;
	defparam	b2v_submarino2.Y7 = 10'b0000000111;
	defparam	b2v_submarino2.Y8 = 10'b0000001000;


VGA_Submarino	b2v_submarino3(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_152),
	.rgb_r(SYNTHESIZED_WIRE_73),
	.rgb_g(SYNTHESIZED_WIRE_85),
	.rgb_b(SYNTHESIZED_WIRE_97));
	defparam	b2v_submarino3.X1 = 10'b0000000001;
	defparam	b2v_submarino3.X2 = 10'b0000000010;
	defparam	b2v_submarino3.X3 = 10'b0000000011;
	defparam	b2v_submarino3.X4 = 10'b0000000100;
	defparam	b2v_submarino3.X5 = 10'b0000000101;
	defparam	b2v_submarino3.X6 = 10'b0000000110;
	defparam	b2v_submarino3.X7 = 10'b0000000111;
	defparam	b2v_submarino3.X8 = 10'b0000001000;
	defparam	b2v_submarino3.Y1 = 10'b0000000001;
	defparam	b2v_submarino3.Y2 = 10'b0000000010;
	defparam	b2v_submarino3.Y3 = 10'b0000000011;
	defparam	b2v_submarino3.Y4 = 10'b0000000100;
	defparam	b2v_submarino3.Y5 = 10'b0000000101;
	defparam	b2v_submarino3.Y6 = 10'b0000000110;
	defparam	b2v_submarino3.Y7 = 10'b0000000111;
	defparam	b2v_submarino3.Y8 = 10'b0000001000;


VGA_Submarino	b2v_submarino4(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_157),
	.rgb_r(SYNTHESIZED_WIRE_78),
	.rgb_g(SYNTHESIZED_WIRE_90),
	.rgb_b(SYNTHESIZED_WIRE_102));
	defparam	b2v_submarino4.X1 = 10'b0000000001;
	defparam	b2v_submarino4.X2 = 10'b0000000010;
	defparam	b2v_submarino4.X3 = 10'b0000000011;
	defparam	b2v_submarino4.X4 = 10'b0000000100;
	defparam	b2v_submarino4.X5 = 10'b0000000101;
	defparam	b2v_submarino4.X6 = 10'b0000000110;
	defparam	b2v_submarino4.X7 = 10'b0000000111;
	defparam	b2v_submarino4.X8 = 10'b0000001000;
	defparam	b2v_submarino4.Y1 = 10'b0000000001;
	defparam	b2v_submarino4.Y2 = 10'b0000000010;
	defparam	b2v_submarino4.Y3 = 10'b0000000011;
	defparam	b2v_submarino4.Y4 = 10'b0000000100;
	defparam	b2v_submarino4.Y5 = 10'b0000000101;
	defparam	b2v_submarino4.Y6 = 10'b0000000110;
	defparam	b2v_submarino4.Y7 = 10'b0000000111;
	defparam	b2v_submarino4.Y8 = 10'b0000001000;


VGA_Submarino	b2v_submarino5(
	.clk(SYNTHESIZED_WIRE_163),
	.areaAtiva(SYNTHESIZED_WIRE_164),
	.coluna(SYNTHESIZED_WIRE_165),
	.linha(SYNTHESIZED_WIRE_166),
	.posicoesEmbarcacao(SYNTHESIZED_WIRE_162),
	.rgb_r(SYNTHESIZED_WIRE_77),
	.rgb_g(SYNTHESIZED_WIRE_89),
	.rgb_b(SYNTHESIZED_WIRE_101));
	defparam	b2v_submarino5.X1 = 10'b0000000001;
	defparam	b2v_submarino5.X2 = 10'b0000000010;
	defparam	b2v_submarino5.X3 = 10'b0000000011;
	defparam	b2v_submarino5.X4 = 10'b0000000100;
	defparam	b2v_submarino5.X5 = 10'b0000000101;
	defparam	b2v_submarino5.X6 = 10'b0000000110;
	defparam	b2v_submarino5.X7 = 10'b0000000111;
	defparam	b2v_submarino5.X8 = 10'b0000001000;
	defparam	b2v_submarino5.Y1 = 10'b0000000001;
	defparam	b2v_submarino5.Y2 = 10'b0000000010;
	defparam	b2v_submarino5.Y3 = 10'b0000000011;
	defparam	b2v_submarino5.Y4 = 10'b0000000100;
	defparam	b2v_submarino5.Y5 = 10'b0000000101;
	defparam	b2v_submarino5.Y6 = 10'b0000000110;
	defparam	b2v_submarino5.Y7 = 10'b0000000111;
	defparam	b2v_submarino5.Y8 = 10'b0000001000;


endmodule
