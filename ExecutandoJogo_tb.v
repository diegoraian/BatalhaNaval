module ExecutandoJogo_tb;
/*

Modulo para Test Bench do ExecutandoJogo

*/

//Entradas
reg enable;
reg reset;
reg enter;
reg select;
reg clk;
reg mode;
reg [3:0] posicao_rnd;
reg acertou_tiro;
reg [3:0] qtd_P1;
reg [3:0] qtd_P2;

//Saidas
wire ready;
wire [3:0] coord_tiroX;
wire [3:0] coord_tiroY;
wire [7:0] LEDR;
wire [7:0] LEDG;

//Registradores internos
reg [3:0] E_A;
reg [3:0] E_F;

/* Declara Estados */
parameter p1_atacandox			= 4'd0,
          p1_atacandoy			= 4'd1,
          verificando_acertop1	= 4'd2, 	
          verificando_acertop2	= 4'd3,	
          p2_atacandox			= 4'd4, 
          p2_atacandoy			= 4'd5,       
          verificando_vidap1	= 4'd6,
          verificando_vidap2	= 4'd7,
		  p1_vencedor			= 4'd8,	
		  p2_vencedor			= 4'd9,
		  end_game				= 4'd10;

ExecutandoJogo DUT(		// DUT - Device Under Test

	//Entradas
	.enable(enable), 
	.reset(reset), 
	.enter(enter), 
	.select(select), 
	.clk(clk), 
	.mode(mode), 
	.posicao_rnd(posicao_rnd), 
	.acertou_tiro(acertou_tiro), 
	.qtd_P1(qtd_P1), 
	.qtd_P2(qtd_P2),
	
	//Saidas
	.ready(ready), 
	.coord_tiroX(coord_tiroX), 
	.coord_tiroY(coord_tiroY), 
	.LEDR(LEDR), 
	.LEDG(LEDG)

);

initial begin
	clk = 1'b0;
	enable = 1'b1;
	reset = 1'b1;
	enter = 1'b1;
	select = 1'b1;
	mode = 1'b1;					// Modo Player vs Player
	posicao_rnd  = 4'b0000;
	acertou_tiro = 1'b0; 
	qtd_P1		 = 4'b0010;			// Iniciamos cada Player com 2 pecas apenas, e como exemplo, utilizamos submarinos que possuem so uma posicao
	qtd_P2		 = 4'b0010;
end

always
	#10 clk= ~clk;

initial begin		// Controla o sinal de reset

	/*Primeiro Teste - Rodada P1 - Onde o Player 1 efetua os movimentos */
	$display("\n*****Primeiro Teste - Rodada Player 1*****\n");
	$display("\nQueremos Verificar se o player 1 consegue atirar e acertar");
	#40
	select = 1'b0;	// Define a coordenada de X
	
	#40
	select = 1'b1;
	
	#40
	select = 1'b0;
	
	#40
	select = 1'b1; // Ao final, apertou select 2 vezes, esperamos que coord_X seja setado em 2
	
	#40
	enter = 1'b0;	// Confirmamos a coordenada com Enter
	
	#40
	enter = 1'b1;
	
	#40
	select = 1'b0;	// Define a coordenada de Y
	
	#40
	select = 1'b1;  // Ao final, apertou select 1 vez, esperamos que coord_Y seja setado em 1
	
	#40
	enter = 1'b0;	// Confirmamos a coordenada com Enter
	
	#40
	enter = 1'b1;	
	
	#10				// Espera prox borda de subida do clock
	acertou_tiro = 1'b1;
	
	#30
	enter = 1'b0;	// Apertou enter para Verificar certo
	
	#40
	enter = 1'b1;
	acertou_tiro = 1'b0;
	qtd_P1 = 4'b0010;	// O módulo recebe uma qtd de vida atualizada com o acerto de P1(-1 em vida de P2)
	qtd_P2 = 4'b0001;		
	
	#40
	enter = 1'b0;		// Apertou para verificar vida

	
	#40
	enter = 1'b1;
	
	/*Segundo Teste -  Rodada P2 - Onde o Player 2 efetua os movimentos*/
	$display("\n*****Segundo Teste -  Rodada Player 2*****\n");
	$display("\nQueremos Verificar se o player 2 consegue atirar e acertar");
	#40
	select = 1'b0;	// Define a coordenada de X
	
	#40
	select = 1'b1;
	
	#40
	select = 1'b0;	// Define a coordenada de Y
	
	#40
	select = 1'b1; // Ao final, apertou select 2 vezes, esperamos que coord_X seja setado em 2
	
	#40
	enter = 1'b0;	// Confirmamos a coordenada com Enter
	
	#40
	enter = 1'b1;
	
	#40
	select = 1'b0;
	
	#40
	select = 1'b1;  // Ao final, apertou select 1 vez, esperamos que coord_Y seja setado em 1
	
	#40
	enter = 1'b0;	// Confirmamos a coordenada com Enter
	
	#40
	enter = 1'b1;	
	
	#10				// Espera prox borda de subida do clock
	acertou_tiro = 1'b1;
	
	#30
	enter = 1'b0;	// Apertou enter para Verificar certo
	
	#40
	enter = 1'b1;
	acertou_tiro = 1'b0;
	qtd_P1 = 4'b0001;	// O módulo recebe uma qtd de vida atualizada com o acerto de P2(-1 em vida de P1)
	qtd_P2 = 4'b0001;		
	
	#40
	enter = 1'b0;	// Apertou para verificar vida
	
	#40
	enter = 1'b1;
	
	/*Terceiro Teste -  P1 Vencedor - Situação em que a Vida do Player 2 chegou a zero*/
	$display("\n*****Terceiro Teste - Player 1 Vence o Jogo*****\n");
	$display("\nQueremos verificar se é possível o player 1 vencer o jogo");
	
	#40
	select = 1'b0;			// Define a coordenada de X
	qtd_P1 = 4'b0001;		// O módulo recebe a atual quantidade de vida de P1
	qtd_P2 = 4'b0001;		// O módulo recebe a atual quantidade de vida de P2
		
	#40
	select = 1'b1;
	
	#40
	enter = 1'b0;			// Confirma a coordenada X
	
	#40
	enter = 1'b1;
	
	#40
	select = 1'b0;			//Define a coordenada de Y
	
	#40
	select = 1'b1;
		
	#40
	enter = 1'b0;			// Confirma a coordenada Y
	
	#40
	enter = 1'b1;	
	
	#10						// Espera prox borda de subida do clock
	acertou_tiro = 1'b1;
	
	#30
	enter = 1'b0;			// Apertou enter para verificar acerto do tiro
	
	#40
	enter = 1'b1;
	acertou_tiro = 1'b0;
	qtd_P1 = 4'b0001;		// O módulo recebe uma qtd de vida atualizada com o acerto de P2(-1 em vida de P1)
	qtd_P2 = 4'b0000;		
	
	#40
	enter = 1'b0;			// Apertou para verificar vida
	
	#40
	enter = 1'b1;
	
	/*Quarto Teste -  RESET do Jogo - Aperta-se RESET para reiniciar os estados do módulo*/
	$display("\n*****Quarto Teste -  RESET do Jogo*****\n");
	$display("\nQueremos Verificar que ao apertamos RESET retornamos para o estado inicial\n");
	#40
	reset = 1'b0;		// Aperta-se o RESET
	/*
		Retorna-se as qtds de vida para um estado anterior por motivos 
		de Teste. Interpreta-se isso como o RESET que outro módulo 
		responsável por tais quantidade sofreu. Frisa-se que aqui
		está sendo testada a execução correta deste módulo e o mesmo
		não trata da atualizacao de tais valores.
	*/
	qtd_P1 = 4'b0001;
	qtd_P2 = 4'b0001;
	
	#40
	reset = 1'b1;
	
	/*Quinto Teste -  P2 Vencedor - Situação em que a Vida do Player 1 chegou a zero*/
	$display("\n*****Quinto Teste -  Player 2 Vence o Jogo*****\n");
	$display("\nQueremos Verificar se é possível o player 2 vencer o jogo");
	#40
	enter = 1'b0;			// Confirma a coordenada X do tiro do Player 1
	
	#40
	enter = 1'b1;		
	
	#40
	enter = 1'b0;			// Confirma a coordenada Y do tiro do Player 1
	
	#40
	enter = 1'b1;
	
	#40
	enter = 1'b0;			// Verifica acerto do Player 1
	
	#40
	enter = 1'b1;			

	/*
	 Não há necessida de ir para verificando vida pois colocamos aqui 
	 que ele errou o tiro
	*/
	
	#40
	select = 1'b0;			// Define a coordenada X do tiro do Player 2
		
	#40
	select = 1'b1;
	
	#40
	enter = 1'b0;			// Confirma a coordenada X do tiro do Player 2
	
	#40
	enter = 1'b1;
	
	#40
	select = 1'b0;			//Define a coordenada de Y do tiro Player 2
	
	#40
	select = 1'b1;
		
	#40
	enter = 1'b0;			// Confirma a coordenada Y do tiro do Player 2
	
	#40
	enter = 1'b1;
		
	#10						// Espera prox borda de subida do clock
	acertou_tiro = 1'b1;
	
	#30
	enter = 1'b0;			// Apertou enter para verificar acerto do tiro
	
	#40
	enter = 1'b1;
	acertou_tiro = 1'b0;
	qtd_P1 = 4'b0000;		// O módulo recebe uma qtd de vida atualizada com o acerto de P2(-1 em vida de P1)
	qtd_P2 = 4'b0001;		
	
	#40
	enter = 1'b0;			// Apertou para verificar vida
	
	#40
	enter = 1'b1;

		
	/*Sexto Teste - ENABLE - O sinal de ENABLE desce, indicando a necessidade de desabilitar o módulo*/
	$display("\n*****Sexto Teste -  ENABLE*****\n");
	$display("\nQueremos verificar que com o ENABLE em 0 nenhuma outra entrada altera o Estado Atual\n");
	#40
	enable = 1'b0;			//Seta enable para 0
	
	#40
	reset = 1'b0;			// Aperta-se o RESET
	
	#40
	reset = 1'b1;
	
	#40
	enter = 1'b0;			// Aperta-se enter
	
	#40
	enter = 1'b1;

	#40
	select = 1'b0;			// Aperta-se select
	
	#40
	select = 1'b1;
	
	#120 $finish;			// Termina a simulacao
end

always
begin
	#40
	E_A = DUT.E_A;
	E_F = DUT.E_F;
	$monitor($time, "ps\n Enable= %b\n Ready= %b\n Reset = %b\n X = %d \n Y =%d \n Verde= %b\n Vermelho = %b\n Tiro: %b\n Select = %b \n Enter = %b\n Qtd. Restante Vida P1 = %d \n Qtd. Restante Vida P2 = %d \n",enable, ready, reset, coord_tiroX, coord_tiroY,  LEDG, LEDR, acertou_tiro, select, enter, qtd_P1, qtd_P2);
	case(E_A)
		
		p1_atacandox:
			$display(" E_A = P1 Escolhe Tiro X\n");
		
		p1_atacandoy:
			$display(" E_A = P1 Escolhe Tiro Y\n");
		
		verificando_acertop1:
			$display(" E_A = Sistema Verifica Acerto de P1\n");
		
		verificando_vidap2:
			$display(" E_A = Sistema Verifica Vida Restante de P2\n");
			
		p2_atacandox:
			$display(" E_A = P2 Escolhe Tiro X \n");
		
		p2_atacandoy:
			$display(" E_A =  P2 Escolhe Tiro Y");
		
		verificando_acertop2:
			$display(" E_A =  Sistema Verifica Acerto de P2\n");	
		
		verificando_vidap1:
			$display(" E_A = Sistema Verifica Vida Restante de P1\n");
		
		p1_vencedor:
			$display(" E_A = P1 Venceu\n");
		
		p2_vencedor:
			$display(" E_A = P2 Venceu\n");
		
		end_game:
			$display(" E_A = Fim de Jogo\n");
	endcase
	
	$display("-------------------------- \n");

end


endmodule
