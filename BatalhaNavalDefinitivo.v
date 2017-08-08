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
// CREATED		"Mon Jul 24 10:37:35 2017"

module BatalhaNavalDefinitivo(
	clk,
	enable,
	reset,
	enter,
	select,
	mode,
	conflitoMemoria,
	conflitoBorda
);


input wire	clk;
input wire	enable;
input wire	reset;
input wire	enter;
input wire	select;
input wire	mode;
output wire	conflitoMemoria;
output wire	conflitoBorda;

wire	conflitoValidador_wire;
wire	[63:0] gdfx_temp0;
wire	[63:0] gdfx_temp1;
wire	[4:0] gdfx_temp2;
wire	wrep1_wire;
wire	wrep2_wire;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_49;
wire	[3:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[2:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	[2:0] SYNTHESIZED_WIRE_55;
wire	[2:0] SYNTHESIZED_WIRE_56;
wire	[3:0] SYNTHESIZED_WIRE_57;
wire	[3:0] SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;





Colisor	b2v_inst(
	.enable(SYNTHESIZED_WIRE_0),
	.clk(clk),
	.jogador(SYNTHESIZED_WIRE_1),
	.memoriaP1(gdfx_temp0),
	.memoriaP2(gdfx_temp0),
	.x(SYNTHESIZED_WIRE_2),
	.y(SYNTHESIZED_WIRE_3),
	.ready(SYNTHESIZED_WIRE_18),
	.hit(SYNTHESIZED_WIRE_5),
	.wrep1(wrep1_wire),
	.wrep2(wrep2_wire),
	.addr(gdfx_temp2),
	.clear(gdfx_temp1)
	);


ExecutandoJogo	b2v_inst1(
	.enable(SYNTHESIZED_WIRE_48),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_5),
	.posicao_rnd(SYNTHESIZED_WIRE_49),
	.qtd_P1(SYNTHESIZED_WIRE_7),
	.qtd_P2(SYNTHESIZED_WIRE_8),
	.ready(SYNTHESIZED_WIRE_52),
	.jogador(SYNTHESIZED_WIRE_1),
	.coord_tiroX(SYNTHESIZED_WIRE_2),
	.coord_tiroY(SYNTHESIZED_WIRE_3));
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

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_50 | SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_12 =  ~SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_15 =  ~SYNTHESIZED_WIRE_50;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_16 & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_16 =  ~SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_46 =  ~SYNTHESIZED_WIRE_19;


ContagemPecas	b2v_inst18(
	.enable(SYNTHESIZED_WIRE_20),
	.clk(clk),
	.memoriaP1(gdfx_temp0),
	.memoriaP2(gdfx_temp0),
	.ready(SYNTHESIZED_WIRE_21),
	.addr(gdfx_temp2),
	.qtd_P1(SYNTHESIZED_WIRE_7),
	.qtd_P2(SYNTHESIZED_WIRE_8));

assign	SYNTHESIZED_WIRE_24 =  ~SYNTHESIZED_WIRE_21;


posicionandoPecas	b2v_inst2(
	.enable(SYNTHESIZED_WIRE_22),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(conflitoValidador_wire),
	.ready(SYNTHESIZED_WIRE_51),
	.valida(SYNTHESIZED_WIRE_45),
	.jogador(SYNTHESIZED_WIRE_54),
	.direcao(SYNTHESIZED_WIRE_53),
	.orientacao(SYNTHESIZED_WIRE_55),
	.tipo(SYNTHESIZED_WIRE_56),
	.X1(SYNTHESIZED_WIRE_57),
	.Y1(SYNTHESIZED_WIRE_58));
	defparam	b2v_inst2.armazenaPeca = 4'b0110;
	defparam	b2v_inst2.defineX = 4'b0011;
	defparam	b2v_inst2.defineY = 4'b0100;
	defparam	b2v_inst2.escolheDirecao = 4'b0001;
	defparam	b2v_inst2.escolheOrientacao = 4'b0010;
	defparam	b2v_inst2.verificaConflito = 4'b0101;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_48 & SYNTHESIZED_WIRE_24;


PosicionandoPecas_Random	b2v_inst3(
	.enable(SYNTHESIZED_WIRE_25),
	.reset(reset),
	.clk(clk),
	.direcao_rnd(SYNTHESIZED_WIRE_26),
	
	.orientacao_rnd(SYNTHESIZED_WIRE_27),
	.posicao_rnd(SYNTHESIZED_WIRE_49),
	.ready(SYNTHESIZED_WIRE_50),
	.valida(SYNTHESIZED_WIRE_44),
	.direcao(SYNTHESIZED_WIRE_53),
	.jogador(SYNTHESIZED_WIRE_54),
	.orientacao(SYNTHESIZED_WIRE_55),
	.tipo(SYNTHESIZED_WIRE_56),
	.x1(SYNTHESIZED_WIRE_57),
	.y1(SYNTHESIZED_WIRE_58));
	defparam	b2v_inst3.armazenaPeca = 4'b0110;
	defparam	b2v_inst3.defineX = 4'b0011;
	defparam	b2v_inst3.defineY = 4'b0100;
	defparam	b2v_inst3.escolheDirecao = 4'b0001;
	defparam	b2v_inst3.escolheOrientacao = 4'b0010;
	defparam	b2v_inst3.verificaConflito = 4'b0101;


Validador	b2v_inst4(
	.enable(SYNTHESIZED_WIRE_29),
	.direcao(SYNTHESIZED_WIRE_53),
	.jogador(SYNTHESIZED_WIRE_54),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_55),
	.tipo(SYNTHESIZED_WIRE_56),
	.vetor_leitura(gdfx_temp0),
	.x1(SYNTHESIZED_WIRE_57),
	.y1(SYNTHESIZED_WIRE_58),
	.ready(SYNTHESIZED_WIRE_19),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(wrep1_wire),
	.wrep2(wrep2_wire),
	.conflito(conflitoValidador_wire),
	.read_addr(gdfx_temp2),
	.vetor(gdfx_temp1),
	.write_addr(gdfx_temp2));
	defparam	b2v_inst4.CRUZADOR = 3'b011;
	defparam	b2v_inst4.ENCOURACADO = 3'b001;
	defparam	b2v_inst4.HIDROAVIAO = 3'b010;
	defparam	b2v_inst4.PORTA_AVIOES = 3'b000;
	defparam	b2v_inst4.SUBMARINO = 3'b100;


Random	b2v_inst5(
	.clock(clk),
	.reset(reset),
	.rnd_direcao(SYNTHESIZED_WIRE_26),
	.rnd_orientacao(SYNTHESIZED_WIRE_27),
	.rnd_posicao(SYNTHESIZED_WIRE_49));

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_42 & enable;

assign	SYNTHESIZED_WIRE_42 =  ~SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_47 = SYNTHESIZED_WIRE_44 | SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_46 & SYNTHESIZED_WIRE_47;


memoriaA	b2v_memoriaA(
	.clock(clk),
	.wren(wrep1_wire),
	.address(gdfx_temp2),
	.data(gdfx_temp1),
	.q(gdfx_temp0));


memoriaB	b2v_memoriaB(
	.clock(clk),
	.wren(wrep2_wire),
	.address(gdfx_temp2),
	.data(gdfx_temp1),
	.q(gdfx_temp0));


endmodule
