module Validador
(

	//Input
	 input  enable, 
	 input [2:0] tipo,
	 input jogador,
	 input [3:0] x1, 
	 input [3:0] y1, 
	 input direcao, 
	 input [2:0] orientacao, 
	 input  clk  , 
	 input [63:0] vetor_leitura, 

		
	//Output
	 output ready,
	 output reg conflitoMemoria_out = 1'b0,
	 output reg conflitoBorda_out   = 1'b0,
	 output reg wrep1,
	 output reg wrep2,
	 output reg [63:0] vetor,
	 output reg [4:0] addr  = 5'b00000,
	 output reg jogadorOut,	// qual jogador que esta validando a pecano momento
    output conflito

);



//***********     Estados da Maquina    *************
parameter  EstadoInicial        = 3'b000,
			  VerificandoBorda     = 3'b001,
			  ConflitoBorda        = 3'b010,
			  VerificandoMemoria   = 3'b011,
			  ConflitoMemoria      = 3'b100,
			  SalvandoPeca         = 3'b101;
			  
			  
parameter PORTA_AVIOES  = 3'd4, 
          ENCOURACADO   = 3'd3,
          HIDROAVIAO    = 3'd2,  
          CRUZADOR      = 3'd1,  
          SUBMARINO     = 3'd0;
 
 reg [63:0] vetor_Leitura_jogador_atual;
 reg [4:0] read_addr    = 5'b00000;
 reg [4:0] write_addr_jogadorUm   = 5'b00000;
 reg [4:0] write_addr_jogadorDois = 5'b00000;
 
 // registradores para verificação de confito de Borda
 reg bordaConflito;
 reg verificandoBordaConflito;
 
 
 // registradores para verificação de confito de Memoria
 reg memoriaConflito;
 reg verificandoMemoriaConflito;
 
 // reg para indicar se ocorreu salvamento na memroia
 reg salvouMemoria;
 
 
 
 
 
reg [2:0] E_A;
reg [2:0] E_F = EstadoInicial;
reg [3:0] x;
reg [3:0] y;
 
 
 
 
 
 
 
 always@(posedge clk)
 begin
	jogadorOut = jogador;
	E_A <= E_F;
 
 end
 
 
 
 // Decodificador de proximo estado
 
 always@(posedge clk)
 begin
	case(E_A)
	
	EstadoInicial:
	begin
		if(enable)
			E_F <= VerificandoBorda;
		else
			E_F <= EstadoInicial;
	end
	
	VerificandoBorda:
	begin
		if(verificandoBordaConflito)
		begin
			E_F <=  VerificandoBorda;
		end else 
		begin 
			if(bordaConflito)
				E_F <= ConflitoBorda;
			else 
				E_F <= VerificandoMemoria;
		end	
	end
	
	
	ConflitoBorda:
	begin
		if(enable)
			E_F <= ConflitoBorda;
		else
			E_F <= EstadoInicial;
	
	end
	
	VerificandoMemoria:
	begin
		if(verificandoMemoriaConflito)
			begin
				E_F <= VerificandoMemoria;
			end	
		else begin 
			if(memoriaConflito)
				E_F <= ConflitoMemoria;
			else
				E_F <= SalvandoPeca;
		end
	end
	
	ConflitoMemoria:
	begin
		if(enable)
			E_F <= ConflitoMemoria;
		else
			E_F <= EstadoInicial;
	
	end
	
	SalvandoPeca:
	begin
		if(enable)
			E_F <= SalvandoPeca;
		else
			E_F <= EstadoInicial;
	
	end
	endcase
 end
 
 
 //  *****  Decodificador de Saidas   *****
 
 
 always@(posedge clk)
 begin
	
	
	case(E_A)
	
	EstadoInicial:begin
		verificandoBordaConflito = 1'b1;
		verificandoMemoriaConflito = 1'b1;
		
		conflitoMemoria_out = 1'b0;
	   conflitoBorda_out   = 1'b0;
		
		bordaConflito   = 1'b0;
		memoriaConflito = 1'b0;
		
		read_addr  = 5'b00000;
	   //write_addr = 5'b00000;
		
		salvouMemoria = 1'b0;
		
		wrep1 = 0;
		wrep2 = 0;
		
	
		
		
		
	end
	
	
	
//	******************************************	
// *             VERIFICA BORDA             *
// ******************************************	
	VerificandoBorda:
	begin
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
							verificandoBordaConflito = 1'b0;
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
							verificandoBordaConflito = 1'b0;
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
							verificandoBordaConflito = 1'b0;
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
							verificandoBordaConflito = 1'b0;
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
								verificandoBordaConflito = 1'b0;
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
								verificandoBordaConflito = 1'b0;	
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
							verificandoBordaConflito = 1'b0;
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
							verificandoBordaConflito = 1'b0; 
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
							verificandoBordaConflito = 1'b0;
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
							verificandoBordaConflito = 1'b0;
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
					verificandoBordaConflito = 1'b0;
					  
				 end
				 
				 default:
				 begin
				 end

			  endcase
			  
			  if(bordaConflito)
				verificandoBordaConflito = 1'b0;
	
		end


//	******************************************	
// *            CONFLITO BORDA              *
// ******************************************
			
		ConflitoBorda:
		begin
			conflitoBorda_out = 1'b1;
			
		
		end
		
		
		

		
//	******************************************	
// *             VERIFICA MEMORIA           *
// ******************************************
		
		VerificandoMemoria:
		
		begin
			
			addr = read_addr;
			vetor_Leitura_jogador_atual = vetor_leitura;
			
		
		
			
		
			case (vetor[2-:3])			
					
					SUBMARINO:
					begin
					
						case(vetor[10-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase	
					end
					
					CRUZADOR:
					begin
					
						case(vetor[10-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						case(vetor[18-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
					
						
					end
					
					HIDROAVIAO:
					begin
					
						case(vetor[10-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						case(vetor[18-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						case(vetor[26-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
					
					
					
					end
					
					ENCOURACADO:
					begin
						
						case(vetor[10-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						case(vetor[18-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						
						case(vetor[26-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						
						case(vetor[34-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
					
					end
					
					PORTA_AVIOES:
					begin
					
						case(vetor[10-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						case(vetor[18-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						
						case(vetor[26-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
						
						case(vetor[34-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						case(vetor[42-:8])
						
							vetor_Leitura_jogador_atual[10-:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[18 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[26 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[34 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							vetor_Leitura_jogador_atual[42 -:8]:
							begin
								memoriaConflito <= 1'b1;
							end
							
							default:
							begin
								//memoriaConflito <= 1'b0;
							end
							
						endcase
						
						
					end
					
					
					
					
					
					default:
					begin
						//memoriaConflito <= 1'b0;
					end

			endcase
			
			
			//00000000000000000 [0001] [0000 0000] [0000 0000] [0000 0000] [0000 0000] [0100 0110] 000
			
			
			
			if(memoriaConflito) begin
				verificandoMemoriaConflito = 1'b0;
			end else begin
				if(read_addr == 5'd11) begin
					verificandoMemoriaConflito = 1'b0;
				end else begin
					read_addr = read_addr + 5'd1;
				end
			end
			
			
			
			
			
		
		end
		


		
//	******************************************	
// *           CONFLITO MEMORIA             *
// ******************************************

		ConflitoMemoria:
		begin
			conflitoMemoria_out = 1'b1;
		
		end
		
		
		
		
		
		
//	******************************************	
// *             SALVANDO PEÇA              *
// ******************************************
		
		
		SalvandoPeca:
		begin
			if(!salvouMemoria)begin
				salvouMemoria = 1'b1;
				if(!jogador) begin
					addr = write_addr_jogadorUm;
					wrep1 = 1;
					write_addr_jogadorUm = write_addr_jogadorUm + 1'b1;
				end else begin
					addr = write_addr_jogadorDois;
					wrep2 = 1;
					write_addr_jogadorDois = write_addr_jogadorDois +1'b1;	
				end
			end
		
		
		end
		
		
	endcase
 
 
 
 
 
 end
 
 
 
 
 
 assign conflito = (conflitoBorda_out == 1'b1 || conflitoMemoria_out ==1'b1) ? 1'b1 :1'b0 ;


 assign  ready  = (wrep1 == 1 || wrep2 == 1 )? 1'b1 : 1'b0  ;
			 
 endmodule
 