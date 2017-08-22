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

module posicionandoPecas
(
  /*
    @param enable - Iniciar
    @param reset - zerar os valores
    @param enter - passa para uma proximo estado
    @param select - incrementa valor no contador
    @param mode - representa Player 1 x CPU, enquanto que 1 sinaliza Player 1 x Player 2.
    @param conflito - recebe de Validador um 1 - para conflito ou 0 - para não conflito
  */
  
  enable, reset, enter, select, mode, clk, conflito,
  
  /*
   @param readsy   - dá o sinal de start game para o ExecutandoJogo
   @param valida  - responsável por ativar o validador para verificação
   @param tipo    - passa o tipo da embarcaãço a ser gravado ao validador
   @param jogador - passa o tipo da jogador a ser gravado namemoria(jogador 0(memoria 0) ou jogador 1(memoria 1))
  */
  
  ready, valida, tipo, jogador, X1, Y1, direcao, orientacao,estado1,estado2,estado3,estado4,estado5,estado6
  
);
  
input enable, reset, enter, select, mode, clk, conflito;

output reg [3:0] X1    =  3'b000;
output reg [3:0] Y1    =  3'b000;
output reg [2:0] tipo  =  3'b000;
output reg direcao = 1'b0;
output reg [2:0] orientacao =3'b000;
output reg ready = 1'b0;
output reg valida;
output reg jogador = 1'b0;
output reg estado1 = 1'b0;
output reg estado2 = 1'b0;
output reg estado3 = 1'b0;
output reg estado4 = 1'b0;
output reg estado5 = 1'b0;
output reg estado6 = 1'b0;


reg [2:0] qtd_tipo = 3'b000;
reg [3:0] E_A   =  4'b0000;
reg [3:0] E_F   =  4'b0001;

reg incrementaQtdTipo = 1'b0;

/* Declara Estados */
parameter
          escolheDirecao    = 4'd1, 
          escolheOrientacao = 4'd2,
          defineX           = 4'd3, 
          defineY           = 4'd4, 
          verificaConflito  = 4'd5, 
          armazenaPeca      = 4'd6;
       
     
/* Mudanca de Reg Estado */
always @(posedge clk or negedge reset or negedge enable) 
begin
  if(!enable)begin
	//ashduahsd
  end else begin
	if (!reset) begin // Caso reset volte para o estado de direção
      E_A <= escolheDirecao;
   end else begin
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
    
    escolheDirecao: 
	 begin //escolher a direção(Vertical ou horizontal
        E_F = escolheOrientacao;
		  estado1 = 1'b1;
		  estado2 = 1'b0;
		  estado3 = 1'b0;
		  estado4 = 1'b0;
		  estado5 = 1'b0;
		  estado6 = 1'b0;
	end		
    escolheOrientacao: 
	 begin
        E_F = defineX;
			estado1 = 1'b0;
			estado2 = 1'b1;
			estado3 = 1'b0;
			estado4 = 1'b0;
			estado5 = 1'b0;
			estado6 = 1'b0;
		end
    defineX:			begin
        E_F = defineY;
			estado1 = 1'b0;
			estado2 = 1'b0;
			estado3 = 1'b1;
			estado4 = 1'b0;
			estado5 = 1'b0;
			estado6 = 1'b0;
		end
    defineY:  begin
        E_F <= verificaConflito;
			estado1 = 1'b0;
			estado2 = 1'b0;
			estado3 = 1'b0;
			estado4 = 1'b1;
			estado5 = 1'b0;
			estado6 = 1'b0;
			end               
    verificaConflito: begin
      if(conflito == 0) begin
        E_F <= armazenaPeca; 
      end else begin
        E_F <= defineX;
      end;
			estado1 = 1'b0;
			estado2 = 1'b0;
			estado3 = 1'b0;
			estado4 = 1'b0;
			estado5 = 1'b1;
			estado6 = 1'b0;
end			
    armazenaPeca: begin
        E_F <= escolheDirecao;
			estado1 = 1'b0;
			estado2 = 1'b0;
			estado3 = 1'b0;
			estado4 = 1'b0;
			estado5 = 1'b0;
			estado6 = 1'b1;
end			
        //incrementaQtdTipo = 1;
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
        tipo = 3'd0;      // Retorna o tipo ao inicial(Submarino)
        qtd_tipo = 3'd0;
      end
      endcase
    
    verificaConflito:
    begin
        valida = 1'b1;
        incrementaQtdTipo = 0;
    end
    
    armazenaPeca:
      begin
        valida = 1'b0;
        if(incrementaQtdTipo == 0) begin
          incrementaQtdTipo = 1;
          qtd_tipo = qtd_tipo + 1;
        end
      end
  endcase

end




always @ (negedge select ) begin
  case (E_A)
    
     escolheDirecao:
          direcao = direcao +1'b1;
        
    escolheOrientacao:
        if(orientacao ==  3'b100) begin //se orientação for 5 volta para o zero
         orientacao = 1'b0;
        end
        else begin
          orientacao = orientacao + 1'b1;
        end 
    defineX:
        X1 = X1 + 1'b1;
      
      
    defineY:
        Y1 = Y1 + 1'b1;

  endcase
end

endmodule