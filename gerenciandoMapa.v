/* Modulo de Gerenciamento do Mapa */
/*
	Anotações:
	
  - Responsavel por fazer o armazenamento das peças
  
  - Verificar se a posição de inserção é válida(Colisões de borda e outras peças)
  
  
  **DOCS http://verilog.renerta.com/source/vrg00004.htm


  Uma máquina de Mealey depende de ambos os estados e os
	os inputs.  Quando os inputs mudam, os outputs são atualizados
  imediatamente,sem esperar a borda do clock. Os outputs
	podem ser escritos mais de uma vez por estado ou por
	ciclo de clock.
*/

module gerenciandoMapa
(
  /*
	@tipo - tipo de embarcação(qual embarcação é)
   @direcao - zerar os valores
   @orientacao- passa para uma proximo estado
   @x1 - incrementa valor no contador
   @y1 - incrementa valor no contador
   @mode- PvP ou PvCom
	@clk
  */
	tipo, direcao, orientacao, x1, y1, mode, clk,
  
  /*@out avança para o próximo estado (proposito geral)*/
	colisao, vetor
);

input	[2:0] tipo;
input direcao,mode, clk; 
input [2:0] orientacao;
input [2:0] x1;
input [2:0] y1;

output reg colisao;

  output reg [35:0] vetor = 36'd0;	//Vetor a ser armazenado na memoria  [0-2(tipo), 3-32(posições), 33-35(Peças disponiveis na embarcação) ex: Porta aviões inicia com 5 peças, caso chegue a zero todas as embarcações são destruidas.
reg [2:0]	x;		// Variavel auxiliar para armazenar o valor de x1
reg [2:0]	y;		// Variavel auxiliar para armazenar o valor de y1
wire [35:0] value_out;		// Valor que armazena a leitura de memoria
reg [3:0] addr;				//Endereco para armazenar na memoria
reg we;

integer cont;		// Contador para armazenar quanto eh o passo ao percorrermos o vetor
integer i;			// Contador de posicoes

  
parameter PORTA_AVIOES  = 3'd0, 
          ENCOURACADO   = 3'd1,
          HIDROAVIAO		= 3'd2,	
          CRUZADOR		= 3'd3,	
          SUBMARINO		= 3'd4; 
			 
always@(posedge clk) begin
  
  
  case(tipo)
	
		PORTA_AVIOES:
      	
        if(direcao == 0) begin	// Se é Horizontal
				we=0;
          if(x1 < 4) begin       //verificação de borda
            vetor = 36'd0;
            x = x1;
            y = y1;

						
            vetor[2 -: 3] = PORTA_AVIOES;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x + 3'd1;
            vetor[14 -: 3] = y;

            vetor[17 -: 3]  = x + 3'd2;
            vetor[20 -: 3]  = y;


            vetor[23 -: 3]  = x + 3'd3;
            vetor[26 -: 3]  = y;

            vetor[29 -: 3]  = x + 3'd4;
            vetor[32 -: 3]  = y;
            
            vetor [35-:3] = 3'd5;
            addr = 0;
            we = 1;
          end
        end else begin
          if(y1 < 4) begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = PORTA_AVIOES;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x;
            vetor[14 -: 3] = y+ 3'd1;

            vetor[17 -: 3]  = x;
            vetor[20 -: 3]  = y + 3'd2;


            vetor[23 -: 3]  = x;
            vetor[26 -: 3]  = y + 3'd3;

            vetor[29 -: 3]  = x;
            vetor[32 -: 3]  = y + 3'd4;
            
            vetor [35-:3] = 3'd5;
            addr = 0;
            we = 1;
          end
        end
      

		
		ENCOURACADO:
			//horizontal
      if(direcao == 0) begin	// Se é Horizontal
        if(x1 < 5) begin
          vetor = 36'd0;
          x = x1;
          y = y1;

          vetor[2 -: 3] = ENCOURACADO;

          vetor[5 -: 3]  = x;
          vetor[8 -: 3] = y;

          vetor[11 -: 3] = x + 3'd1;
          vetor[14 -: 3] = y;

          vetor[17 -: 3]  = x + 3'd2;
          vetor[20 -: 3]  = y;


          vetor[23 -: 3]  = x + 3'd3;
          vetor[26 -: 3]  = y;

          //Poscções vazias	
          vetor[29 -: 3]  = 0;
          vetor[32 -: 3]  = 0;
          
          vetor [35-:3] = 3'd4;
			 addr = 1;
			 we = 1;
          end
      end else begin
        if(y1 < 5) begin
          vetor = 36'd0;
          x = x1;
          y = y1;

          vetor[2 -: 3] = ENCOURACADO;

          vetor[5 -: 3]  = x;
          vetor[8 -: 3] = y;

          vetor[11 -: 3] = x;
          vetor[14 -: 3] = y+ 3'd1;

          vetor[17 -: 3]  = x;
          vetor[20 -: 3]  = y + 3'd2;


          vetor[23 -: 3]  = x;
          vetor[26 -: 3]  = y + 3'd3;

          //posicoes vazias 	
          vetor[29 -: 3]  = 0;
          vetor[32 -: 3]  = 0;
          
          vetor [35-:3] = 3'd4;
			 addr = 1;
          we = 1;
        end
      end
      
		HIDROAVIAO:
			//horizontal
      if(direcao == 0) begin //DIREÇÃO 0 é HORIZONTAL
        if(orientacao == 0)begin //ORIENTAÇÃO é default(aponta pra cima)
          if(x1<6 && y1>0) begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = HIDROAVIAO;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x + 3'd1;
            vetor[14 -: 3] = y + 3'd1;

            vetor[17 -: 3]  = x + 3'd2;
            vetor[20 -: 3]  = y;

            //Poscções vazias
            vetor[23 -: 3]  = 0;
            vetor[26 -: 3]  = 0;


            vetor[29 -: 3]  = 0;
            vetor[32 -: 3]  = 0;
            
            vetor [35-:3] = 3'd3;
          end
        end
        if(orientacao == 1)begin
          if(x1<6 && y1 < 7)begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = HIDROAVIAO;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x + 3'd1;
            vetor[14 -: 3] = y - 3'd1;

            vetor[17 -: 3]  = x + 3'd2;
            vetor[20 -: 3]  = y;

            //Poscções vazias
            vetor[23 -: 3]  = 0;
            vetor[26 -: 3]  = 0;


            vetor[29 -: 3]  = 0;
            vetor[32 -: 3]  = 0;
            
            vetor [35-:3] = 3'd3;
        	end
        end

			end
    //vertical
			else begin
        if(orientacao == 2)begin
          if(y1<6 && x1<7)begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = HIDROAVIAO;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x + 3'd1;
            vetor[14 -: 3] = y + 3'd1;

            vetor[17 -: 3]  = x;
            vetor[20 -: 3]  = y + 3'd2;

                //Poscções vazias
            vetor[23 -: 3]  = 0;
            vetor[26 -: 3]  = 0;


            vetor[29 -: 3]  = 0;
            vetor[32 -: 3]  = 0;
            
            vetor [35-:3] = 3'd3;
        	end
        end
        if(orientacao == 3)begin
          if(y1<6 && x1>0)begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = HIDROAVIAO;

            vetor[5 -: 3]  = x; //3
            vetor[8 -: 3] = y; //3

            vetor[11 -: 3] = x - 3'd1; //2
            vetor[14 -: 3] = y + 3'd1; //4

            vetor[17 -: 3]  = x ; //3
            vetor[20 -: 3]  = y + 3'd2; //5

            //Posições vazias
            vetor[23 -: 3]  = 0;
            vetor[26 -: 3]  = 0;


            vetor[29 -: 3]  = 0;
            vetor[32 -: 3]  = 0;
            
            vetor [35-:3] = 3'd3;
        	end
        end
			end
    
    
		CRUZADOR:
      
        if(direcao == 0) begin	// Se é Horizontal
          if(x1 < 7) begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = CRUZADOR;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x + 3'd1;
            vetor[14 -: 3] = y;

            //Poscções vazias		
            vetor[17 -: 3]  =  0;
            vetor[20 -: 3]  =  0;

            vetor[23 -: 3]  =  0;
            vetor[26 -: 3]  =  0;

            vetor[29 -: 3]  =  0;
            vetor[32 -: 3]  =  0;
            
            vetor [35-:3] = 3'd2;
          end
        end else begin
          if(y1 < 7) begin
            vetor = 36'd0;
            x = x1;
            y = y1;

            vetor[2 -: 3] = CRUZADOR;

            vetor[5 -: 3]  = x;
            vetor[8 -: 3] = y;

            vetor[11 -: 3] = x;
            vetor[14 -: 3] = y+ 3'd1;
            //posicoes vazias 	
            vetor[17 -: 3]  =  0;
            vetor[20 -: 3]  =  0;

            vetor[23 -: 3]  =  0;
            vetor[26 -: 3]  =  0;

            vetor[29 -: 3]  =  0;
            vetor[32 -: 3]  =  0;
            
            vetor [35-:3] = 3'd2;
          end
        
      end
    SUBMARINO:
		begin
				vetor = 36'd0;
				x = x1;
				y = y1;
				
				vetor[2 -: 3] = SUBMARINO;
					
				vetor[5 -: 3]  = x;
				vetor[8 -: 3] = y;
				//Poscções vazias		
				vetor[11 -: 3] =  0;
				vetor[14 -: 3] =  0;
							
			   vetor[17 -: 3]  =  0;
				vetor[20 -: 3]  =  0;
							
				vetor[23 -: 3]  =  0;
				vetor[26 -: 3]  =  0;
							
				vetor[29 -: 3]  =  0;
				vetor[32 -: 3]  =  0;
			 
				vetor [35-:3] = 3'd1;
		end
				
			
		
	endcase

end	
  
mapaMemoria mem0(clk, we, addr, vetor, value_out);

endmodule

            
            