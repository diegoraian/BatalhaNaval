/* Módulo para Execução do Jogo*/

/*
	Anotações:
  
  - Responsável por intermediar as dinâmicas durante a excução do jogo - ataque, tiro
  
  - A entrada acertou_tiro vem da Maquina Colisor
	    
  - A mudança dos estados verificando_acertop1 e verificando_acertop2 depende da borda de descida do enter, 
    do acertou_tiro ALTO e da borda de subida do clock. BUSCAR FORMA DISSO N DEPENDER MAIS DO ENTER.
g
	--------------------------------------------------------
  
*/

module ExecutandoJogo
(
  /*
	@param enable - Iniciar o módulo
	@param reset - zerar os valores
	@param enter - passa para uma proximo estado
	@param select - incrementa valor no contador
	@param clk - clock arbitrario definido para o sistema
	@param posicao_rnd - posicao aleatoria vinda do gerador aleaotorio para as coordenadas
	@param acertou tiro - se tiro do user acertou embarcao = 1, se nao = 0
	@param qtd_P1 - quantidade restante na memória de peças de P1
	@param qtd P2 - quantidade restante da memória de peças de P2
    
  */
	enable, reset, enter, select, clk, mode, posicao_rnd, acertou_tiro, qtd_P1, qtd_P2,
  
  /*
  
	 @param ready - reenvia sinal para ativar o colisor para verificacao de tiro
	 @param coord_tiroX - coordenada X do tiro
	 @param coord_tiroY - coordenada Y do tiro 
	 @param LEDR - vetor de leds vermelhos
	 @param LEDG - vetor de leds verdes
	 
  */
  
	ready, coord_tiroX, coord_tiroY
);

input	enable, reset, enter, select,mode, clk, acertou_tiro;
input [3:0] posicao_rnd;
input [3:0] qtd_P1;
input [3:0] qtd_P2;
output reg  ready;
output reg [3:0] coord_tiroX = 4'b0000;
output reg [3:0] coord_tiroY = 4'b0001;
  
/* Estado dos registradores */
	reg [3:0] E_A = 4'b0000;
	reg [3:0] E_F = 4'b0000;
	reg [7:0] LEDR = 8'd0;
	reg [7:0] LEDG = 8'd0;
	reg zeravalor;			// Usado para zerar o tiro(enable do tiro).
	reg [32:0] led_cont;	// contador usado para alteranar o valor dos leds

/* Declara Estados */
parameter p1_atacandox			    = 4'd0,
          p1_atacandoy			    = 4'd1,
          verificando_acertop1	 = 4'd2, 	
          verificando_acertop2	 = 4'd3,	
          p2_atacandox			    = 4'd4, 
          p2_atacandoy			    = 4'd5,       
          verificando_vidap1 	  	 = 4'd6,
          verificando_vidap2 	  	 = 4'd7,
			 p1_vencedor			    = 4'd8,	
			 p2_vencedor			    = 4'd9,
			 end_game				    = 4'd10;
 

/* Mudanca de Reg Estado */
always @(posedge clk or negedge reset or negedge enable) begin
	
	if (!enable) begin 
	end else begin
    if (!reset) begin
		//E_F <= p1_atacandox;// Caso reset voltar para o estado de direção 
		E_A <= p1_atacandox;// Caso reset voltar para o estado de direção 
    end
    else begin
      E_A <= E_F;
    end
	end
	
end

  /* 
  
  ______________________________________________________________________________________________________
  
  												ORIENTAÇÃO PROS LEDS GERAIS

		1 LED verdes acesos: P atacando X
		
		Apertou enter após definir X:

		2 LEDs verdes acesos: P atacando Y

		Apertou enter após definir Y: 

		4 LEDs verdes e 4 vermelhos piscando: indicando o estado VERIFICANDO ACERTO
    
		Apertou enter :

		8 verdes piscando: verificando vida (checando também se o player é vencedor)
		
		8 vermelhos piscando: passou a vez para o próximo jogador

	______________________________________________________________________________________________________
		
  */
 
/*

Define o comportamento dos LEDs

LEDR - representa os leds vermelhos

LEDG - representa os leds verdes

*/
always @ (posedge clk or negedge enable) begin

	if(!enable) begin
		LEDR[0] <= 1'b0;	//PIN_G19
		LEDR[1] <= 1'b0;	//PIN_F19
		LEDR[2] <= 1'b0;	//PIN_E19
		LEDR[3] <= 1'b0;	//PIN_F21
		LEDR[4] <= 1'b0;	//PIN_F18
		LEDR[5] <= 1'b0;	//PIN_E18
		LEDR[6] <= 1'b0;	//PIN_J19
		LEDR[7] <= 1'b0;	//PIN_H19
		
		LEDG[0] <= 1'b0;	//PIN_E21
		LEDG[1] <= 1'b0;	//PIN_E22
		LEDG[2] <= 1'b0;	//PIN_E25
		LEDG[3] <= 1'b0;	//PIN_E24
		LEDG[4] <= 1'b0;	//PIN_H21
		LEDG[5] <= 1'b0;	//PIN_G20
		LEDG[6] <= 1'b0;	//PIN_G22
		LEDG[7] <= 1'b0;	//PIN_G21

	end else begin
	
		case(E_A)
			p1_atacandox:
			begin
				led_cont = 1'b0;
				LEDR[7:0] <= 8'b00000000;	//LED RED
				
				LEDG[7:0] <= 8'b00000001;	// LED GREEN
			end
			
			p1_atacandoy:
			begin
				led_cont = 1'b0;
				LEDR[7:0] <= 8'b00000000;
				
				LEDG[7:0] <= 8'b00000011;
			end
			
			verificando_acertop1:		// Piscando 4 LED GREEN e 4 RED
			begin
				led_cont = led_cont + 1;
				LEDR[0] <= led_cont[23];	// A cada vez que ele chegar ao 23 o led vai pra 1
				LEDR[1] <= led_cont[23];
				LEDR[2] <= led_cont[23];
				LEDR[3] <= led_cont[23];
				
				LEDG[0] <= led_cont[23];
				LEDG[1] <= led_cont[23];
				LEDG[2] <= led_cont[23];
				LEDG[3] <= led_cont[23];
			end
			
			verificando_vidap2:			
			begin
				if(qtd_P2 == 0) begin	// Piscando 8 LED GREEN
					led_cont = led_cont + 1;
					LEDG[0] <= led_cont[23];
					LEDG[1] <= led_cont[23];
					LEDG[2] <= led_cont[23];
					LEDG[3] <= led_cont[23];
					LEDG[4] <= led_cont[23];
					LEDG[5] <= led_cont[23];
					LEDG[6] <= led_cont[23];
					LEDG[7] <= led_cont[23];
				end else begin				 //Pisca LED RED
					led_cont = led_cont + 1;
					LEDR[0] <= led_cont[23];
					LEDR[1] <= led_cont[23];
					LEDR[2] <= led_cont[23];
					LEDR[3] <= led_cont[23];
					LEDR[4] <= led_cont[23];
					LEDR[5] <= led_cont[23];
					LEDR[6] <= led_cont[23];
					LEDR[7] <= led_cont[23];
				end
			end
			
			
			p1_vencedor:		// Piscando 8 LED GREEN
			begin
				led_cont = led_cont + 1;
				LEDG[0] <= led_cont[23];
				LEDG[1] <= led_cont[23];
				LEDG[2] <= led_cont[23];
				LEDG[3] <= led_cont[23];
				LEDG[4] <= led_cont[23];
				LEDG[5] <= led_cont[23];
				LEDG[6] <= led_cont[23];
				LEDG[7] <= led_cont[23];
			end
			
			
			p2_atacandox:
			begin
				led_cont = 1'b0;
				LEDR[7:0] <= 8'b00000000;
				
				LEDG[7:0] <= 8'b00000001;
			end
			
			p2_atacandoy:
			begin
				led_cont = 1'b0;
				LEDR[7:0] <= 8'b00000000;
				
				LEDG[7:0] <= 8'b00000011;
			end
			
			verificando_acertop2:		// Piscando 4 LED GREEN e RED
			begin
				led_cont = led_cont + 1;
				LEDR[0] <= led_cont[23];
				LEDR[1] <= led_cont[23];
				LEDR[2] <= led_cont[23];
				LEDR[3] <= led_cont[23];
				
				LEDG[0] <= led_cont[23];
				LEDG[1] <= led_cont[23];
				LEDG[2] <= led_cont[23];
				LEDG[3] <= led_cont[23];
			end
			
			verificando_vidap1:		
			begin
				if(qtd_P1 == 0) begin	// Piscando 8 LED GREEN
					led_cont = led_cont + 1;
					LEDG[0] <= led_cont[23];
					LEDG[1] <= led_cont[23];
					LEDG[2] <= led_cont[23];
					LEDG[3] <= led_cont[23];
					LEDG[4] <= led_cont[23];
					LEDG[5] <= led_cont[23];
					LEDG[6] <= led_cont[23];
					LEDG[7] <= led_cont[23];
				end else begin 			//Pisca LED RED
					led_cont = led_cont + 1;
					LEDR[0] <= led_cont[23];
					LEDR[1] <= led_cont[23];
					LEDR[2] <= led_cont[23];
					LEDR[3] <= led_cont[23];
					LEDR[4] <= led_cont[23];
					LEDR[5] <= led_cont[23];
					LEDR[6] <= led_cont[23];
					LEDR[7] <= led_cont[23];
				end
			end
			
			p2_vencedor:		// Piscando 8 LED GREEN
			begin
				led_cont = led_cont + 1;
				LEDG[0] <= led_cont[23];
				LEDG[1] <= led_cont[23];
				LEDG[2] <= led_cont[23];
				LEDG[3] <= led_cont[23];
				LEDG[4] <= led_cont[23];
				LEDG[5] <= led_cont[23];
				LEDG[6] <= led_cont[23];
				LEDG[7] <= led_cont[23];
			end
			
			default:
			begin
				led_cont = 1'b0;
				LEDR[7:0] <= 8'b00000000;	
			
				LEDG[7:0] <= 8'b00000000;
			end
		endcase
	end
end
  
always @ (negedge enter or negedge enable) begin
	
	if(!enable) begin
		//Nao faca nada
	end else begin
		case (E_A)
			p1_atacandox:
			begin
				E_F = p1_atacandoy;
			end
		 
			p1_atacandoy:
			begin
				E_F = verificando_acertop1;
			  ready = 1'b1;
			end
		 
			/* Verifica se Player 1 acertou seu tiro */
			verificando_acertop1:
			begin
				if(acertou_tiro == 1'b1) begin
					E_F = verificando_vidap2;
				end	else begin
					E_F = p2_atacandox;
				end
			end
			
			/* Verifica se Player 2 ainda tem vida */
			verificando_vidap2:
			begin
				ready = 1'b0;
				zeravalor = zeravalor+1'b1;  
				if(qtd_P2 == 4'd0) begin //Se a quantidade de embarcacoes de P2 for iguais a zero
					E_F = p1_vencedor;	
				end	else begin
					E_F = p2_atacandox;
				end
			end
		 
			p2_atacandox:
			begin
				E_F = p2_atacandoy;
			end
		 
			p2_atacandoy:
			begin
				E_F = verificando_acertop2;
				ready = 1'b1;
			end
		 
			/* Verifica se Player 2 acertou seu tiro */
			verificando_acertop2:
			begin
				if(acertou_tiro == 1'b1) begin
					E_F = verificando_vidap1;
				end else begin
					E_F = p1_atacandox;
				end
			end
		 
		 /* Verifica se Player 1 ainda tem vida */
			verificando_vidap1:
			begin
				ready = 1'b0;
				zeravalor = zeravalor+1'b1;  
				if( qtd_P1 == 4'd0 ) begin //Se a qtd de embarcações de P1 forem iguais zero
					E_F = p2_vencedor;
				end else begin
					E_F = p1_atacandox;
				end
			end
		 
			default:
			begin
				E_F = end_game;
			end
		 
		endcase
  end
end

always @ (negedge select or posedge zeravalor or negedge enable or posedge mode) begin

	if(!enable) begin
		//Nao faca nada
	end else begin
		case (E_A)
		/* Escolhe a coordenada X do tiro */
			p1_atacandox:
		
			if(coord_tiroX == 4'b1001) begin
				coord_tiroX = 4'b0001; 
			end else begin
				if(mode) begin			// Se PvP
					coord_tiroX = coord_tiroX + 4'b0001;
				end else begin			// Se PvC
					coord_tiroX = posicao_rnd;
				end
			end
	 
			/* Escolhe a coordenada Y do tiro */
			p1_atacandoy:
		
			if(coord_tiroY == 4'b1001) begin
				coord_tiroY = 4'b0001; 
			end else begin
				if(mode) begin
					coord_tiroY = coord_tiroY + 4'b0001;
				end else begin
					coord_tiroY = posicao_rnd;
				end
			end
	 
			/*  Incrementa para valor 'out range' as coordenadas do Tiro */
			verificando_vidap2:
			begin
				coord_tiroX = 4'b0000;
				coord_tiroY = 4'b0000;
			end
	 
			/* Escolhe a coordenada X do tiro */
			p2_atacandox:
				if(coord_tiroX == 4'b1001) begin
					coord_tiroX = 4'b0001; 
				end else begin
					if(mode) begin
						coord_tiroX = coord_tiroX + 4'b0001;
					end else begin
						coord_tiroX = posicao_rnd;
					end
				end
	 
			/* Escolhe a coordenada Y do tiro */
			p2_atacandoy:
			if(coord_tiroY == 4'b1001) begin
				coord_tiroY = 4'b0001; 
			end else begin
				if(mode) begin
					coord_tiroY = coord_tiroY + 4'b0001;
				end else begin
					coord_tiroY = posicao_rnd;
				end
			end
	 
			/* Incrementa para valor 'out range' as coordenadas do Tiro */
			verificando_vidap1:
			begin
				coord_tiroX = 4'b0000;
				coord_tiroY = 4'b0000;
			end
	 
			default:
			begin
			end
		endcase
	end
end

endmodule
