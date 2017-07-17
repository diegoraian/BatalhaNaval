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
// CREATED		"Sun Jul 16 23:54:25 2017"

module BatalhaNavalDefinitivo(
	clk,
	jogador,
	enable,
	reset,
	enter,
	select,
	mode,
	conflitoMemoria,
	conflitoBorda
);


input wire	clk;
input wire	jogador;
input wire	enable;
input wire	reset;
input wire	enter;
input wire	select;
input wire	mode;
output wire	conflitoMemoria;
output wire	conflitoBorda;

wire	conflitoValidador_wire;
wire	[3:0] gdfx_temp0;
wire	[63:0] gdfx_temp1;
wire	[4:0] gdfx_temp2;
wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[2:0] SYNTHESIZED_WIRE_19;
wire	[3:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	[2:0] SYNTHESIZED_WIRE_49;
wire	[2:0] SYNTHESIZED_WIRE_50;
wire	[3:0] SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_52;
wire	[63:0] SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;





Colisor	b2v_inst(
	.enable(SYNTHESIZED_WIRE_0),
	.clk(clk),
	.jogador(jogador),
	.memoriaP1(gdfx_temp1),
	.memoriaP2(gdfx_temp1),
	.x(SYNTHESIZED_WIRE_1),
	.y(SYNTHESIZED_WIRE_2),
	.ready(SYNTHESIZED_WIRE_14),
	.hit(SYNTHESIZED_WIRE_4),
	.wrep1(SYNTHESIZED_WIRE_52),
	.wrep2(SYNTHESIZED_WIRE_54),
	.addr(gdfx_temp2)
	
	);


ExecutandoJogo	b2v_inst1(
	.enable(SYNTHESIZED_WIRE_3),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_4),
	.posicao_rnd(gdfx_temp0),
	
	
	.ready(SYNTHESIZED_WIRE_46),
	.coord_tiroX(SYNTHESIZED_WIRE_1),
	.coord_tiroY(SYNTHESIZED_WIRE_2));
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

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_44 | SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_8 =  ~SYNTHESIZED_WIRE_46;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_11 =  ~SYNTHESIZED_WIRE_44;

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_46;

assign	SYNTHESIZED_WIRE_12 =  ~SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_36 =  ~SYNTHESIZED_WIRE_15;


posicionandoPecas	b2v_inst2(
	.enable(SYNTHESIZED_WIRE_16),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(conflitoValidador_wire),
	.ready(SYNTHESIZED_WIRE_45),
	.valida(SYNTHESIZED_WIRE_35),
	.jogador(SYNTHESIZED_WIRE_48),
	.direcao(SYNTHESIZED_WIRE_47),
	.orientacao(SYNTHESIZED_WIRE_49),
	.tipo(SYNTHESIZED_WIRE_50),
	.X1(gdfx_temp0),
	.Y1(SYNTHESIZED_WIRE_51));
	defparam	b2v_inst2.armazenaPeca = 4'b0110;
	defparam	b2v_inst2.defineX = 4'b0011;
	defparam	b2v_inst2.defineY = 4'b0100;
	defparam	b2v_inst2.escolheDirecao = 4'b0001;
	defparam	b2v_inst2.escolheOrientacao = 4'b0010;
	defparam	b2v_inst2.verificaConflito = 4'b0101;


PosicionandoPecas_Random	b2v_inst3(
	.enable(SYNTHESIZED_WIRE_17),
	.reset(reset),
	.clk(clk),
	.direcao_rnd(SYNTHESIZED_WIRE_18),
	
	.orientacao_rnd(SYNTHESIZED_WIRE_19),
	.posicao_rnd(SYNTHESIZED_WIRE_20),
	.ready(SYNTHESIZED_WIRE_44),
	.valida(SYNTHESIZED_WIRE_34),
	.direcao(SYNTHESIZED_WIRE_47),
	.jogador(SYNTHESIZED_WIRE_48),
	.orientacao(SYNTHESIZED_WIRE_49),
	.tipo(SYNTHESIZED_WIRE_50),
	.x1(gdfx_temp0),
	.y1(SYNTHESIZED_WIRE_51));
	defparam	b2v_inst3.armazenaPeca = 4'b0110;
	defparam	b2v_inst3.defineX = 4'b0011;
	defparam	b2v_inst3.defineY = 4'b0100;
	defparam	b2v_inst3.escolheDirecao = 4'b0001;
	defparam	b2v_inst3.escolheOrientacao = 4'b0010;
	defparam	b2v_inst3.verificaConflito = 4'b0101;


Validador	b2v_inst4(
	.enable(SYNTHESIZED_WIRE_21),
	.direcao(SYNTHESIZED_WIRE_47),
	.jogador(SYNTHESIZED_WIRE_48),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_49),
	.tipo(SYNTHESIZED_WIRE_50),
	.vetor_leitura(gdfx_temp1),
	.x1(gdfx_temp0),
	.y1(SYNTHESIZED_WIRE_51),
	.ready(SYNTHESIZED_WIRE_15),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(SYNTHESIZED_WIRE_52),
	.wrep2(SYNTHESIZED_WIRE_54),
	.conflito(conflitoValidador_wire),
	.read_addr(gdfx_temp2),
	.vetor(SYNTHESIZED_WIRE_53),
	.write_addr(gdfx_temp2));
	defparam	b2v_inst4.CRUZADOR = 3'b011;
	defparam	b2v_inst4.ENCOURACADO = 3'b001;
	defparam	b2v_inst4.HIDROAVIAO = 3'b010;
	defparam	b2v_inst4.PORTA_AVIOES = 3'b000;
	defparam	b2v_inst4.SUBMARINO = 3'b100;


Random	b2v_inst5(
	.clock(clk),
	.reset(reset),
	.rnd_direcao(SYNTHESIZED_WIRE_18),
	.rnd_orientacao(SYNTHESIZED_WIRE_19),
	.rnd_posicao(SYNTHESIZED_WIRE_20));

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_32 & enable;

assign	SYNTHESIZED_WIRE_32 =  ~SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_34 | SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_37;


memoriaA	b2v_memoriaA(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_52),
	.address(gdfx_temp2),
	.data(SYNTHESIZED_WIRE_53),
	.q(gdfx_temp1));


memoriaB	b2v_memoriaB(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_54),
	.address(gdfx_temp2),
	.data(SYNTHESIZED_WIRE_53),
	.q(gdfx_temp1));


endmodule
