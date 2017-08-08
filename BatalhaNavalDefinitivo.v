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
// CREATED		"Tue Aug  8 12:08:44 2017"

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

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[63:0] SYNTHESIZED_WIRE_54;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[4:0] SYNTHESIZED_WIRE_30;
wire	[63:0] SYNTHESIZED_WIRE_31;
wire	[63:0] SYNTHESIZED_WIRE_32;
wire	[63:0] SYNTHESIZED_WIRE_33;
wire	[4:0] SYNTHESIZED_WIRE_34;
wire	[63:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	[2:0] SYNTHESIZED_WIRE_39;
wire	[2:0] SYNTHESIZED_WIRE_40;
wire	[63:0] SYNTHESIZED_WIRE_41;
wire	[3:0] SYNTHESIZED_WIRE_42;
wire	[3:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	[4:0] SYNTHESIZED_WIRE_60;
wire	[63:0] SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_51;





Colisor	b2v_inst(
	.enable(SYNTHESIZED_WIRE_0),
	.jogadorAtirador(SYNTHESIZED_WIRE_1),
	.clk(clk),
	.memoriaP1(SYNTHESIZED_WIRE_54),
	.memoriaP2(SYNTHESIZED_WIRE_54),
	.x(SYNTHESIZED_WIRE_4),
	.y(SYNTHESIZED_WIRE_5),
	.ready(SYNTHESIZED_WIRE_58),
	.hit(SYNTHESIZED_WIRE_7),
	.wrep1(SYNTHESIZED_WIRE_24),
	.wrep2(SYNTHESIZED_WIRE_25),
	.jogadorAlvo(SYNTHESIZED_WIRE_26),
	.addr(SYNTHESIZED_WIRE_30),
	.clear(SYNTHESIZED_WIRE_31)
	);


ExecutandoJogo	b2v_inst1(
	.enable(SYNTHESIZED_WIRE_55),
	.reset(reset),
	.enter(enter),
	.select(select),
	.clk(clk),
	.mode(mode),
	.acertou_tiro(SYNTHESIZED_WIRE_7),
	
	.qtd_P1(SYNTHESIZED_WIRE_8),
	.qtd_P2(SYNTHESIZED_WIRE_9),
	.ready(SYNTHESIZED_WIRE_56),
	.jogador(SYNTHESIZED_WIRE_1),
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

assign	SYNTHESIZED_WIRE_11 =  ~SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_55 = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_57;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_13 =  ~SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_46 =  ~SYNTHESIZED_WIRE_59;


ContagemPecas	b2v_inst18(
	.enable(SYNTHESIZED_WIRE_17),
	.clk(clk),
	
	
	.ready(SYNTHESIZED_WIRE_18),
	
	.qtd_P1(SYNTHESIZED_WIRE_8),
	.qtd_P2(SYNTHESIZED_WIRE_9));

assign	SYNTHESIZED_WIRE_22 =  ~SYNTHESIZED_WIRE_18;


posicionandoPecas	b2v_inst2(
	.enable(SYNTHESIZED_WIRE_19),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.clk(clk),
	.conflito(SYNTHESIZED_WIRE_20),
	.ready(SYNTHESIZED_WIRE_57),
	.valida(SYNTHESIZED_WIRE_47),
	.jogador(SYNTHESIZED_WIRE_37),
	.direcao(SYNTHESIZED_WIRE_38),
	.orientacao(SYNTHESIZED_WIRE_39),
	.tipo(SYNTHESIZED_WIRE_40),
	.X1(SYNTHESIZED_WIRE_42),
	.Y1(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst2.armazenaPeca = 4'b0110;
	defparam	b2v_inst2.defineX = 4'b0011;
	defparam	b2v_inst2.defineY = 4'b0100;
	defparam	b2v_inst2.escolheDirecao = 4'b0001;
	defparam	b2v_inst2.escolheOrientacao = 4'b0010;
	defparam	b2v_inst2.verificaConflito = 4'b0101;

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_55 & SYNTHESIZED_WIRE_22;


ControladoMemoria	b2v_inst3(
	.clk(clk),
	.readyColisor(SYNTHESIZED_WIRE_58),
	.colisor_wrep1(SYNTHESIZED_WIRE_24),
	.colisor_wrep2(SYNTHESIZED_WIRE_25),
	.jogadorColisor(SYNTHESIZED_WIRE_26),
	
	
	
	.readyValidador(SYNTHESIZED_WIRE_59),
	.validador_wrep1(SYNTHESIZED_WIRE_28),
	.validador_wrep2(SYNTHESIZED_WIRE_29),
	
	
	
	.colisor_addr(SYNTHESIZED_WIRE_30),
	.colisor_data(SYNTHESIZED_WIRE_31),
	.data_memoria_jogadorDois(SYNTHESIZED_WIRE_32),
	.data_memoria_jogadorUm(SYNTHESIZED_WIRE_33),
	.validador_addr(SYNTHESIZED_WIRE_34),
	.validador_data(SYNTHESIZED_WIRE_35),
	
	.wrenP1(SYNTHESIZED_WIRE_48),
	.wrenP2(SYNTHESIZED_WIRE_51),
	.addr(SYNTHESIZED_WIRE_60),
	.data(SYNTHESIZED_WIRE_61),
	.dataReadColisor(SYNTHESIZED_WIRE_54),
	.dataReadValidador(SYNTHESIZED_WIRE_41)
	);
	defparam	b2v_inst3.CalculandoPontuacaoPlayerDois = 4'b0110;
	defparam	b2v_inst3.CalculandoPontuacaoPlayerUm = 4'b0101;
	defparam	b2v_inst3.ColidindoPlayerDois = 4'b0100;
	defparam	b2v_inst3.ColidindoPlayerUm = 4'b0011;
	defparam	b2v_inst3.Idle = 4'b0000;
	defparam	b2v_inst3.TransmitindoVgaPlayerDois = 4'b1000;
	defparam	b2v_inst3.TransmitindoVgaPlayerUm = 4'b0111;
	defparam	b2v_inst3.ValidandorPlayerDois = 4'b0010;
	defparam	b2v_inst3.ValidandorPlayerUm = 4'b0001;


Validador	b2v_inst4(
	.enable(SYNTHESIZED_WIRE_36),
	.jogador(SYNTHESIZED_WIRE_37),
	.direcao(SYNTHESIZED_WIRE_38),
	.clk(clk),
	.orientacao(SYNTHESIZED_WIRE_39),
	.tipo(SYNTHESIZED_WIRE_40),
	.vetor_leitura(SYNTHESIZED_WIRE_41),
	.x1(SYNTHESIZED_WIRE_42),
	.y1(SYNTHESIZED_WIRE_43),
	.ready(SYNTHESIZED_WIRE_59),
	.conflitoMemoria_out(conflitoMemoria),
	.conflitoBorda_out(conflitoBorda),
	.wrep1(SYNTHESIZED_WIRE_28),
	.wrep2(SYNTHESIZED_WIRE_29),
	.conflito(SYNTHESIZED_WIRE_20),
	.addr(SYNTHESIZED_WIRE_34),
	.vetor(SYNTHESIZED_WIRE_35));
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

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_44 & enable;

assign	SYNTHESIZED_WIRE_44 =  ~SYNTHESIZED_WIRE_57;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_46 & SYNTHESIZED_WIRE_47;


memoriaA	b2v_memoriaA(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_48),
	.address(SYNTHESIZED_WIRE_60),
	.data(SYNTHESIZED_WIRE_61),
	.q(SYNTHESIZED_WIRE_33));


memoriaB	b2v_memoriaB(
	.clock(clk),
	.wren(SYNTHESIZED_WIRE_51),
	.address(SYNTHESIZED_WIRE_60),
	.data(SYNTHESIZED_WIRE_61),
	.q(SYNTHESIZED_WIRE_32));


endmodule
