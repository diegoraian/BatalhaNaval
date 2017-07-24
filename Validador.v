/* Modulo de Validação de Peças */
/*
  Anotações:
  
  - Responsavel por fazer a construção e validação das peças
  
  - Verificar se a posição de inserção é válida - colisões de borda e outras peças
  
  --------------------------------------------------------
  
  **DOCS http://verilog.renerta.com/source/vrg00004.htm
  
*/

module Validador
(
  /*
    @enable - habilita o módulo
    @param tipo - tipo de embarcação(qual embarcação é)
    @param direcao - zerar os valores
    @param orientacao- passa para uma proximo estado
    @param x1   - incrementa valor no contador
    @param y1   - incrementa valor no contador
    @param clk  - clock do sistema
	 @param jogador - Jogador para fazer o armazenamento na memoria
	 @param vetor_leitura - vetor de leitura da memoria para validar as pecas
	  
  */
  enable, tipo, direcao, orientacao, x1, y1, jogador, clk  , vetor_leitura, 
  
  /*
  	 @param ready - passa a atribuição de volta ao módulo que o chamou
    @param conflito - se a posição verificada já existe na memória conflito é 1, se não conflito é 0 
    @param wrep1 - write enable para p1
    @param wrep2 - write enable para p2
    @param vetor - vetor de saída com a posicao das peças
    @param read_addr - endereço para armazenamento das pecas na memoria(leitura)
    @param write_addr - endereço para armazenamento das pecas na memoria(escrita)
  */
  ready, conflitoMemoria_out, conflitoBorda_out, wrep1, wrep2, vetor, read_addr, write_addr, conflito
);

input  [2:0] tipo;
input direcao, clk,enable; 
input [2:0] orientacao;
input [3:0] x1;
input [3:0] y1;
input jogador;
input [63:0] vetor_leitura;

output reg conflitoMemoria_out = 1'b0;
output reg conflitoBorda_out   = 1'b0;
output  conflito;  
output reg wrep1;
output reg wrep2;
output reg [63:0]vetor;         //Vetor a ser armazenado na memoria  [0-2(tipo), 3-32(posições), 33-35(Peças disponiveis na embarcação) ex: Porta aviões inicia com 5 peças, caso chegue a zero todas as embarcações são destruidas.
output reg [4:0] write_addr = 5'b00000;         //Endereco para armazenar na memoria
output reg [4:0] read_addr= 5'b00000 ;   // contaria as 11 posicoes verificando se ha conlfito de posições na memoria
output reg ready;

  
reg  [3:0]   x;                // Variavel auxiliar para armazenar o valor de x1
reg  [3:0]   y;                // Variavel auxiliar para armazenar o valor de y1
wire [63:0] value_out;         // Valor que armazena a leitura de memoria
reg			validaMemoria;     // quando 1 ferifica se a posição na memoria esta disponivel 
reg         memoriaConflito= 1'b0 ;
reg         bordaConflito  = 1'b0 ;
reg         auxMemo = 1'b0;
reg         auxZeraBordConflito = 1'b0;
reg 		auxGravou = 1'b0;
reg         auxZeraValidaMemoria = 1'b0;
reg         init = 1'b0;

  
  
  
parameter PORTA_AVIOES  = 3'd0, 
          ENCOURACADO   = 3'd1,
          HIDROAVIAO    = 3'd2,  
          CRUZADOR      = 3'd3,  
          SUBMARINO     = 3'd4;
  
//or orOut(coflito, conflitoBorda_out, conflitoMemoria_out);
      
always@(posedge clk or posedge enable ) begin


	if(enable == 1'b1) begin
		if (conflitoBorda_out == 0 && auxGravou == 0 && init == 1) begin
			vetor = 64'd0;
			validaMemoria = 0;
			bordaConflito =1;
			case(tipo)
				PORTA_AVIOES:
				begin
					if(direcao == 0) begin  // Se é Horizontal
						if(x1 < 5) begin       //verificacao de borda
							vetor = 46'd0;
							x = x1;
							y = y1;


							vetor[2 -: 3] = PORTA_AVIOES;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;

							vetor[14 -: 4] = x + 4'd1;
							vetor[18 -: 4] = y;

							vetor[22 -: 4]  = x + 4'd2;
							vetor[26 -: 4]  = y;


							vetor[30 -: 4]  = x + 4'd3;
							vetor[34 -: 4]  = y;

							vetor[38 -: 4]  = x + 4'd4;
							vetor[42 -: 4]  = y;

							vetor [46-:4] = 4'd5;


							bordaConflito = 1'b0;
							validaMemoria = 1'b1;
						end
					end else begin            
						
						if(y1 < 5) begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = PORTA_AVIOES;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;

							vetor[14 -: 4] = x;
							vetor[18 -: 4] = y+ 4'd1;

							vetor[22 -: 4]  = x;
							vetor[26 -: 4]  = y + 4'd2;


							vetor[30 -: 4]  = x;
							vetor[34 -: 4]  = y + 4'd3;

							vetor[38 -: 4]  = x;
							vetor[42 -: 4]  = y + 4'd4;

							vetor [46-:4] = 4'd5;

							bordaConflito = 1'b0;
							validaMemoria = 1'b1;
						end
					end
				end
				
				ENCOURACADO:	
				begin 
					if(direcao == 0) begin  // Se é Horizontal
						if(x1 < 6) begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = ENCOURACADO;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;

							vetor[14 -: 4] = x + 4'd1;
							vetor[18 -: 4] = y;

							vetor[22 -: 4]  = x + 4'd2;
							vetor[26 -: 4]  = y;


							vetor[30 -: 4]  = x + 4'd3;
							vetor[34 -: 4]  = y;

							//Posicções vazias  
							vetor[38 -: 4]  = 4'd0;
							vetor[42 -: 4]  = 4'd0;
						
							//Posicao do Tipo de Embarcacao
							vetor [46-:4] = 4'd4;
				 
							bordaConflito = 1'b0;
							validaMemoria = 1'b1;
						end
					end else begin
						if(y1 < 6) begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = ENCOURACADO;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;
						
							vetor[14 -: 4] = x;
							vetor[18 -: 4] = y+ 4'd1;

							vetor[22 -: 4]  = x;
							vetor[26 -: 4]  = y + 4'd2;


							vetor[30 -: 4]  = x;
							vetor[34 -: 4]  = y + 4'd3;

							//Posicções vazias  
							vetor[38 -: 4]  = 4'd0;
							vetor[42 -: 4]  = 4'd0;
							
							//Posicao do Tipo de Embarcacao
							vetor [46-:4] = 4'd4;
						
							bordaConflito = 1'b0;
							validaMemoria = 1'b1;
						end
					end
				end
					
				HIDROAVIAO:
				begin	//horizontal
					if(direcao == 0) begin //DIREÇÃO 0 é HORIZONTAL
						if(orientacao == 0)begin //ORIENTAÇÃO é default(aponta pra cima)
							if(x1<6 && y1>1) begin
								vetor = 46'd0;
								x = x1;
								y = y1;

								vetor[2 -: 3] = HIDROAVIAO;

								vetor[6 -: 4]  = x;
								vetor[10 -: 4] = y;

								vetor[14 -: 4] = x + 4'd1;
								vetor[18 -: 4] = y + 4'd1;

								vetor[22 -: 4]  = x +4'd2;
								vetor[26 -: 4]  = y;
								
								//Posicoes vazias
								vetor[30 -: 4]  = 4'd0;
								vetor[34 -: 4]  = 4'd0;
								vetor[38 -: 4]  = 4'd0;
								vetor[42 -: 4]  = 4'd0;
								
								//Posicao do Tipo de Embarcacao
								vetor [46-:4] = 3'd3;
						 
								bordaConflito = 1'b0;
								validaMemoria = 1'b1;
							end
						end
						
						if(orientacao == 1)begin
							if(x1<7 && y1 < 8)begin
								vetor = 46'd0;
								x = x1;
								y = y1;

								vetor[2 -: 3] = HIDROAVIAO;

								vetor[6 -: 4]  = x;
								vetor[10 -: 4] = y;

								vetor[14 -: 4] = x + 4'd1;
								vetor[18 -: 4] = y - 4'd1;

								vetor[22 -: 4]  = x + 4'd2;
								vetor[26 -: 4]  = y;

								//Posicções vazias
								vetor[30 -: 4]  = 4'd0;
								vetor[34 -: 4]  = 4'd0;
								vetor[38 -: 4]  = 4'd0;
								vetor[42 -: 4]  = 4'd0;
						 
								//Posicao do Tipo de Embarcacao
								vetor [46-:4] = 4'd3;
						 
								bordaConflito = 1'b0;
								validaMemoria = 1'b1;	
						end
					end
				end else begin//vertical
					if(orientacao == 2)begin
						if(y1<7 && x1<8)begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = HIDROAVIAO;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;

							vetor[14 -: 4] = x + 4'd1;
							vetor[18 -: 4] = y + 4'd1;

							vetor[22 -: 4]  = x;
							vetor[26 -: 4]  = y + 4'd2;

							//Posicoes vazias
							vetor[30 -: 4]  = 4'd0;
							vetor[34 -: 4]  = 4'd0;
							vetor[38 -: 4]  = 4'd0;
							vetor[42 -: 4]  = 4'd0;
						 
							
							//Posicao do Tipo de Embarcacao
							vetor [46-:4] = 4'd3;
						 
							bordaConflito =1'b0;
							validaMemoria = 1'b1;
						end
					end
					  if(orientacao == 3)begin
						if(y1<7 && x1>1)begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = HIDROAVIAO;

							vetor[6 -: 4]  = x; //3
							vetor[10 -: 4] = y; //3

							vetor[14 -: 4] = x - 4'd1; //2
							vetor[18 -: 4] = y + 4'd1; //4

							vetor[22 -: 4]  = x ; //3
							vetor[26 -: 4]  = y + 4'd2; //5

							//Posições vazias
							vetor[30 -: 4]  = 4'd0;
							vetor[34 -: 4]  = 4'd0;
							vetor[38 -: 4]  = 4'd0;
							vetor[42 -: 4]  = 4'd0;
						 
							//Posicao do Tipo de Embarcacao
							vetor [46-:4] = 4'd3;
						 
							bordaConflito = 1'b0;
							validaMemoria = 1'b1; 
						end
					end
				end
			end
				 
			CRUZADOR:
				begin
					if(direcao == 0) begin  // Se é Horizontal
						if(x1 < 8) begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = CRUZADOR;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;

							vetor[14 -: 4] = x + 4'd1;
							vetor[18 -: 4] = y;

							//Posicoes 	Vazias    
							vetor[22 -: 4]  =  4'd0;
							vetor[26 -: 4]  =  4'd0;
							vetor[30 -: 4]  =  4'd0;
							vetor[34 -: 4]  =  4'd0;
							vetor[38 -: 4]  =  4'd0;
							vetor[42 -: 4]  =  4'd0;
							
							//Posicao do Tipo de Embarcacao
							vetor [46-:4] = 4'd2;
							
							bordaConflito = 1'b0;
							validaMemoria = 1'b1;
						end
					end else begin
						if(y1 < 8) begin
							vetor = 46'd0;
							x = x1;
							y = y1;

							vetor[2 -: 3] = CRUZADOR;

							vetor[6 -: 4]  = x;
							vetor[10 -: 4] = y;
							
							vetor[14 -: 4] = x;
							vetor[18 -: 4] = y+ 4'd1;
					 
							//Posicoes vazias
							vetor[22 -: 4]  =  4'd0;
							vetor[26 -: 4]  =  4'd0;
							vetor[30 -: 4]  =  4'd0;
							vetor[34 -: 4]  =  4'd0;
							vetor[38 -: 4]  =  4'd0;
							vetor[42 -: 4]  =  4'd0;
							
							//Posicao do Tipo de Embarcacao
							vetor [46-:4] = 4'd2;
							
							bordaConflito = 1'b0;
							validaMemoria = 1'b1;
						end
					end
				end
				
				SUBMARINO:
				begin
					vetor = 46'd0;
					x = x1;
					y = y1;
					  
					vetor[2 -: 3] = SUBMARINO;
						 
					vetor[6 -: 4]  = x;
					vetor[10 -: 4] = y;
					
					//Posições Vazias    
					vetor[14 -: 4] =   4'd0;
					vetor[18 -: 4] =   4'd0;
							  
					vetor[22 -: 4]  =  4'd0;
					vetor[26 -: 4]  =  4'd0;
							  
					vetor[30 -: 4]  =  4'd0;
					vetor[34 -: 4]  =  4'd0;
							  
					vetor[38 -: 4]  =  4'd0;
					vetor[42 -: 4]  =  4'd0;
					 
					vetor [46-:4] = 4'd1;
					  
					bordaConflito = 1'b0;
					validaMemoria = 1'b1;
					  
				 end
				 
				 default:
				 begin
				 end

			  endcase
		  end
			  

		if(bordaConflito == 1'b1) begin
			conflitoBorda_out = 1'b1;// acende o led de conflito de bordar
		end
		
	end else begin
	
		if(auxZeraBordConflito)begin
			conflitoBorda_out <= 1'b0;
		end

		if(auxZeraValidaMemoria) begin
			validaMemoria <= 1'b0;
		end
	
	
	end
	
	
end


always @(posedge enable or posedge auxGravou) begin
	if(enable) begin
		init =1;
		if(conflitoBorda_out) begin
			auxZeraBordConflito = 1;
		end 
	end 
	if (auxGravou) begin
			write_addr = write_addr + 5'd1;
			init=0;
			if(write_addr == 5'd11) begin
				write_addr = 5'd0;  
			end
	end	


end

always@(enable or tipo or direcao or orientacao or x1 or y1 or jogador) begin
  if(wrep1 == 1 || wrep2 == 1)begin
    auxMemo = 1;
  end else begin
    auxMemo = 0;
  end
end


/* Buscar na memoria todas os vetores e verificar se a posição ja esta ocupada */
always @(posedge clk) begin

  if(auxMemo) begin
		wrep1 <= 0;
		wrep2 <= 0;
		auxGravou <=0;
  end
  if(!enable)begin
  	conflitoMemoria_out <= 0;
  	memoriaConflito <= 0;
  end

  if(validaMemoria == 1'b1 && conflitoMemoria_out == 1'b0) begin
  			auxGravou <= 0;
			case (vetor_leitura[10 -:8])
			
					vetor[10 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[18 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[26 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[34 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[44 -:6]:
					begin
						memoriaConflito <= 1'b1;
					end

					default:
					begin
					end

			endcase
			
			case (vetor_leitura[18 -:8])
			
					vetor[10 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[18 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[26 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[34 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[44 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					default:
					begin
					end


			endcase
			
			case (vetor_leitura[26 -:8])
			
					vetor[10 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[18 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[26 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[34 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[44 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					default:
					begin
					end


			endcase
			
			case ({vetor_leitura[32 -:8]})
			
					vetor[10 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[18 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[26 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[34 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[44 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					default:
					begin
					end


			endcase
			
    	case (vetor_leitura[44 -:8])
			
					vetor[10 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[18 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[26 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[34-:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					vetor[44 -:8]:
					begin
						memoriaConflito <= 1'b1;
					end
					
					default:
					begin
					end

		endcase
			
      //Adiciona um para a proxima posicao de memoria
		if(read_addr == 4'd11) begin
			read_addr = 4'd0; //vetor ja pode ser salvo na memoria
			if(memoriaConflito == 1'b0) begin
				//verificar em qual memoria (memoria do jogador)
				//zero a valida memoria
				auxZeraValidaMemoria<=1;

				if(jogador == 1'b0) begin	
					wrep1 <= 1'b1;          	
				end else begin
					wrep2 <= 1'b1;
				end
				auxGravou <= 1'b1;
			end else begin
						conflitoMemoria_out <= 1'b1;
						memoriaConflito <= 1'b0;
			end
		end else begin
			wrep1 <= 1'b0;
			wrep2 <= 1'b0;
			read_addr = read_addr + 4'd1;
		end
	end
	else begin
		//conflitoMemoria_out = 0;

	end
end


assign conflito = (conflitoBorda_out == 1'b1 || conflitoMemoria_out ==1'b1) ? 1'b1 :1'b0 ;



endmodule