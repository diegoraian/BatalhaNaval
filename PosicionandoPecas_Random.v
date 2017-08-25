/* Módulo para Insercao de Pecas CPU */
/*
	Anotações

  - DOCS http://verilog.renerta.com/source/vrg00004.htm
  
  	--------------------------------------------------------

*/

module PosicionandoPecas_Random
(
  /*
  	 @param enable - Iniciar
    @param reset - zerar os valores
	 @param direcao_rnd - direcao vinda do gerador aleatorio
	 @param posicao_rnd - posicaovinda do gerador aleatorio
    @param conflito - recebe de Validador um 1 - para conflito ou 0 - para não conflito
  */
  
	enable, reset, clk, direcao_rnd, posicao_rnd, orientacao_rnd, conflito,
  
  /* 
   @param ready   - dá o sinal de start game para o ExecutandoJogo
   @param valida  - responsável por ativar o validador para verificação
   @param tipo    - passa o tipo da embarcaãço a ser gravado ao validador
	@param jogador - passa oo tipo de jogador(a CPU) a ser gravado na meoria
  */
  
  ready, valida, tipo, direcao, orientacao, x1, y1, jogador
  
);
  
input	enable, reset, direcao_rnd, clk, conflito;
input [2:0] orientacao_rnd;
input [3:0] posicao_rnd;

output reg [3:0] x1    =  4'b000;
output reg [3:0] y1    =  4'b000;
output reg [2:0] tipo  =  3'b000;
output reg		   direcao;
output reg [2:0] orientacao;
output reg ready;
output reg valida;
output reg jogador = 0;				// Ja define que o player eh 0, ou, seja, a cpu

reg [2:0] qtd_tipo;
reg [3:0] E_A   =  4'b0000;

/* Declara Estados */
parameter
  			 escolheDirecao    = 4'd1, 
          escolheOrientacao = 4'd2,
          defineX           = 4'd3,	
          defineY				 =	4'd4,	
          verificaConflito  = 4'd5, 
          armazenaPeca      = 4'd6;
			
/* Mudanca de Reg Estado */
always @(posedge clk or negedge reset or negedge enable) 
begin
	if(!enable)begin
		ready = 1'b0;
	end else begin
    if (!reset) begin // Caso reset volte para o estado de direção
			x1 = 4'b0000;
			y1    =  4'b0000;
			direcao = 1'b0;
			orientacao = 3'd0;
			qtd_tipo = 3'b000;
			valida = 1'b0;
			ready = 1'b0;
			E_A <= escolheOrientacao;
		end
		
		else begin
			if(tipo == 3'd4 && qtd_tipo == 3'd1) begin
				ready = 1'b1;
			end
			case (E_A)
    
				escolheDirecao:		//Define a direção(Vertical ou horizontal)
				begin
					direcao = direcao_rnd;
					
					case({qtd_tipo,tipo})
        
						/* Submarino */
						{3'd5,3'd0}:
						begin
							tipo = 3'd1;
							qtd_tipo = 3'd0;
						end
        
						/* Cruzador */
						{3'd2,3'd1}:				
						begin
							tipo = 3'd2;
							qtd_tipo =3'd0;
						end
        
						/* Hidroaviao */
						{3'd2,3'd2}:
						begin
							tipo = 3'd3;
							qtd_tipo =3'd0;
						end
			
						/* Encouracado */  
						{3'd1,3'd3}:
						begin
							tipo = 3'd4;
							qtd_tipo = 3'd0;
						end
      
						/* Porta-avioes */
						{3'd1,3'd4}:				
						begin
							tipo = 3'd0;		// Retorna o tipo ao inicial(Submarino)
							qtd_tipo = 3'd0;
						end
					endcase
					
					E_A = escolheOrientacao;
					
					
				end
				
				escolheOrientacao:		//Define a Orientacao(N, S, L, O)
				begin
					orientacao = orientacao_rnd;
					E_A = defineX;
				end
				
				defineX:						//Define a coordenada X
				begin
					x1 = posicao_rnd;
					E_A = defineY;
				end
				
				defineY:						//Define a coordenada Y
				begin
					y1 = posicao_rnd;
					E_A <= verificaConflito;
				end
				
				verificaConflito:			//Verifica se a peca inserida tem conflito no mapa
				begin
					valida = 1'b1;
					if(conflito == 0) begin
						E_A <= armazenaPeca; 
					end else begin
						E_A <= defineX;
					end
				end
    
				armazenaPeca:
				begin
					valida = 1'b0;
					E_A <= escolheDirecao;
				end
				
			endcase
		end
	end
end
endmodule
