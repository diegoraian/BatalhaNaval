/* Módulo para inserção de Peças */
/*
	Anotações
  - Lógica combinacional para relacionar entradas de qtd_tipo

  - DOCS http://verilog.renerta.com/source/vrg00004.htm
  
  	--------------------------------------------------------
    
    Uma máquina de Mealey depende de ambos os estados e os
    os inputs.  Quando os inputs mudam, os outputs são atualizados
    imediatamente,sem esperar a borda do clock. Os outputs
    podem ser escritos mais de uma vez por estado ou por
    ciclo de clock.

*/

module PosicionandoPecas
(
  /*
  	@param enable - Iniciar
    @param reset - zerar os valores
    @param enter - passa para uma proximo estado
    @param select - incrementa valor no contador
    @param mode - representa Player 1 x CPU, enquanto que 1 sinaliza Player 1 x Player 2.
    @param conflito - recebe de Validador um 1 - para conflito ou 0 - para não conflito
  */
  
	enable, reset, enter, select, mode, clk, conflito, posicaoRandomico, direcaoRandomico,
  
  /* 
   @param ready   - dá o sinal de start game para o ExecutandoJogo
   @param valida  - responsável por ativar o validador para verificação
   @param tipo    - passa o tipo da embarcaãço a ser gravado ao validador
	 @param jogador - passa o tipo da jogador a ser gravado namemoria(jogador 0(memoria 0) ou jogador 1(memoria 1))
  */
  
  ready, valida, tipo, jogador, X1, Y1, direcao, orientacao
  
);
  
input	enable, reset, enter, select, mode, clk, conflito;
input [2:0] posicaoRandomico;
input direcaoRandomico;

output reg [2:0] X1    =  3'b000;
output reg [2:0] Y1    =  3'b000;
output reg [2:0] tipo  =  3'b000;
output reg		   direcao;
output reg [2:0] orientacao;
output reg ready;
output reg valida;
output reg jogador = 0;


reg [3:0] qtd_total;
reg [2:0] qtd_tipo;
reg [3:0] E_A   =  4'b0000;
reg [3:0] E_F   =  4'b0000;

/* Declara Estados */
parameter
  			  escolheDirecao    = 4'd1, 
          escolheOrientacao = 4'd2,
          defineX           = 4'd3,	
          defineY				    =	4'd4,	
          verificaConflito  = 4'd5, 
          armazenaPeca      = 4'd6;
			 
		 
/* Mudanca de Reg Estado */
always @(posedge clk or negedge reset) 
begin
	if(enable)begin
	
    if (!reset) begin // Caso reset volte para o estado de direção
			E_A <= escolheOrientacao;
		end
		
		else begin
			E_A <= E_F;
		end
	end
end
  
/* 

Determina o output baseado apenas no estado atual
e na entrada (não espera pela borda do clock)

*/
always @ (negedge enter) 
begin
  
	case (E_A)
    
    escolheDirecao: //escolher a direção(Vertical ou horizontal
				E_F = escolheOrientacao;
		  
		escolheOrientacao:
      	E_F = defineX;
	
		defineX:
				E_F = defineY;
			
		defineY:
				E_F <= verificaConflito;
        	
		verificaConflito:
      if(conflito == 0) begin
        E_F <= armazenaPeca; 
      end else begin
      	E_F <= defineX;
      end
    
		armazenaPeca:
				E_F <= escolheDirecao;
				//qtd_tipo = qtd_tipo + 1;
    
	endcase
  
end


always@(posedge clk)
begin
  
  if(jogador ==  1'b1 && tipo == 3'd4 && qtd_tipo == 3'd1) begin
  	ready = 1'b1;
  end else if (jogador ==  1'b0 && tipo == 3'd4 && qtd_tipo == 3'd1) begin
  	jogador = 1'b1;
  end
  
  case(E_A)
     escolheDirecao:
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
        tipo = 3'd0;			// Retorna o tipo ao inicial(Submarino)
        qtd_tipo = 3'd0;
			end
      endcase
    
    verificaConflito:
		begin
      	valida = 1'b1;
		end
    
    armazenaPeca:
      begin
        valida = 1'b0;
      end
  endcase

end

always @ (negedge select ) begin
	case (E_A)
    
     escolheDirecao:
			if(jogador == 1'b1 && mode == 0) begin // verifica se  player vs cpu 
				direcao = direcaoRandomico;
			end else begin
				direcao = direcao +1'b1;
			end 
			
        
		escolheOrientacao:
			if(jogador == 1'b1 && mode == 0) begin // verifica se  player vs cpu 
				orientacao = direcaoRandomico;
			end else begin
				//direcao = direcao +1'b1;
			end
		
		
//			if(orientacao ==  3'b100) begin //se orientação for 5 volta para o zero
//				orientacao = 1'b0;
//			end else begin
//				orientacao = orientacao + 1'b1;
//			end;
			
			
		defineX:
			if(jogador == 1'b1 && mode == 0) begin // verifica se  player vs cpu 
				X1 = posicaoRandomico;
			end else begin
				X1 = X1 + 1'b1;
			end
			
			
		defineY:
			if(jogador == 1'b1 && mode == 0) begin // verifica se  player vs cpu 
				Y1 = posicaoRandomico;
			end else begin
				Y1 = Y1 + 1'b1;
			end

	endcase
end

endmodule
