/*
		Detalhes da implementação:

		Para pontuação:
		-- O controlador de memoria tem que permancer nesse estado por um periodo minimo de 12 
		ciclos de clock. Para então assim poder acessar toda informação disponivel na memoria.

		Para VGA:
		-- O controlador da VGA deve permanecer nesse estado por um periodo minimo de (800(pixels horizontais) 
		x 524(linhas verticais)



*/










module ControladoMemoria
(
	input clk,

	//Dado lido da memoria
	input [63:0] data_memoria_jogadorUm, //Leitura da memoria jogador 1
	input [63:0] data_memoria_jogadorDois, //Leitura da memoria jogador 2
	
	//Input de Colisor. Faz leitura de apenas uma posição e escreve na msm posição
	input readyColisor,
	input colisor_wrep1,
	input colisor_wrep2,
	input jogadorColisor,
	input [4:0] colisor_addr,
	input [63:0] colisor_data,  //clear

	//input de Pontuação. Só faz leitura
	input readyCalculaPontuacao,
	input pontuacao_readaddr,
	input jogadorPontuacao,
	
	//Input do Validador faz leitura de toda memoria e escreve em uma posição.
	input readyValidador,
	input validador_wrep1,
	input validador_wrep2,
	input [63:0] validador_data,
	input [4:0] validador_addr,
	input validadorJogador,
	
	//Input de VGA. Só faz leitura
	input [4:0] vga_readAddr,
	input jogadorVGA,
	
	//Input reset
	input resetGeral,
	
	//output reg [63:0] data; // Dado q irá ser salvo na memoria do colisor e Validador
	output reg [63:0] dataReadColisor,   //data leitura do colisor
	output reg [63:0] dataReadValidador, //data leitura do validador
	output reg [63:0] dataReadVGA,			 //data leitura da VGA
	output reg [63:0] data,               //conencta com a memoria a e b 
	output reg [4:0]  addr, 				 //endereço de leitura ou escrita
	output reg  wrenP1,
	output reg  wrenP2	

);

parameter
			  Idle								  =  4'b0000,
			  ValidandorPlayerUm            =  4'b0001,
			  ValidandorPlayerDois          =  4'b0010,
			  ColidindoPlayerUm             =  4'b0011,
			  ColidindoPlayerDois           =  4'b0100,
			  CalculandoPontuacaoPlayerUm   =  4'b0101,
			  CalculandoPontuacaoPlayerDois =  4'b0110,
			  TransmitindoVgaPlayerUm       =  4'b0111,
			  TransmitindoVgaPlayerDois     =  4'b1000;

reg [3:0]E_A;
reg [3:0]E_F = Idle;

always@(posedge clk)
begin
	if(!resetGeral)begin
		E_A <= Idle;
	end else begin
		E_A <= E_F;
	end
	
	
end





//******** decodificador de proximo estado
always@(posedge clk)
begin

	if(!resetGeral)begin
			E_F<=Idle;
	end else begin
		
		case (E_A)
	
			Idle:begin
			
				if(readyValidador)begin
				
					if(!validadorJogador)begin
						E_F <= ValidandorPlayerUm;
					end else begin
						E_F <= ValidandorPlayerDois;
					end
					
				end else begin
					if(!jogadorVGA)begin
						E_F <= TransmitindoVgaPlayerUm;
					end else begin
						E_F <= TransmitindoVgaPlayerDois;
					end
					
				end
			end
			
			ValidandorPlayerUm: begin
			
				if(readyValidador)begin
					if(!validadorJogador)
						E_F <= ValidandorPlayerUm;
				   else 
						E_F <= ValidandorPlayerDois;
				end else begin
					if(!jogadorVGA)
						E_F<= TransmitindoVgaPlayerUm;
				   else 
						E_F <= TransmitindoVgaPlayerDois;
				end
			
			end
			
			ValidandorPlayerDois: begin
			
				if(readyValidador)begin
					if(!validadorJogador)
						E_F <= ValidandorPlayerUm;
					else 
						E_F <= ValidandorPlayerDois;
				end else begin
					if(!jogadorVGA)
						E_F<= TransmitindoVgaPlayerUm;
					else
						E_F <= TransmitindoVgaPlayerDois;
				end
			
			end
			
			ColidindoPlayerUm:begin
				if(readyColisor)begin
					if(!jogadorColisor)
						E_F <= ColidindoPlayerUm;
					else 
						E_F <= ColidindoPlayerDois;
				end else begin
					if(!jogadorVGA)
						E_F<= TransmitindoVgaPlayerUm;
					else
						E_F <= TransmitindoVgaPlayerDois;
				end
			
			end
			
			
			
			ColidindoPlayerDois: begin
			
				if(readyColisor)begin
					if(!jogadorColisor)
						E_F <= ColidindoPlayerUm;
					else 
						E_F <= ColidindoPlayerDois;
					
				end else begin
					if(!jogadorVGA) 
						E_F<= TransmitindoVgaPlayerUm;
					else 
						E_F <= TransmitindoVgaPlayerDois;
				end
			
			end
			
//			CalculandoPontuacaoPlayerUm: begin
//			
//			
//			end
//			
//			CalculandoPontuacaoPlayerDois: begin
//			
//			end
			
			TransmitindoVgaPlayerUm: begin
			
				if(readyValidador)begin
					if(!validadorJogador)
						E_F <= ValidandorPlayerUm;
					else
						E_F <= ValidandorPlayerDois;
				end else begin
					if(readyColisor)begin
						if(!jogadorColisor)
							E_F<= ColidindoPlayerUm;
					   else
							E_F<= ColidindoPlayerDois;
							
					end else begin
						//Colocar calculando Pontuacao Tambem
						if(!jogadorVGA)
							E_F <= TransmitindoVgaPlayerUm;
						else
							E_F <= TransmitindoVgaPlayerDois;
					end
				end
				
			
			end
			
			TransmitindoVgaPlayerDois: begin
			
				if(readyValidador)begin
					if(!validadorJogador)
						E_F <= ValidandorPlayerUm;
					else 
						E_F <= ValidandorPlayerDois;
				end else begin
					if(readyColisor)begin
						if(!jogadorColisor)
							E_F<= ColidindoPlayerUm;
						else 
							E_F<= ColidindoPlayerDois;	
					end else begin
						//Colocar calculando Pontuacao Tambem
						if(!jogadorVGA)
							E_F <= TransmitindoVgaPlayerUm;
						else
							E_F <= TransmitindoVgaPlayerDois;
					end
				end			 
			 
			 end
			
//			default:begin
//					E_F <= idle;
//			end
	
		endcase	
		
	end


end



//******* decodificador De Saida ********
always@*
begin
	case (E_A)
	
//		Idle:begin
//	
//		
//		end
		
		ValidandorPlayerUm: begin
		
			wrenP1 = validador_wrep1;
			if(validador_wrep1)begin
				//salvar na memoria
				addr = validador_addr;
				data = validador_data;
			end else begin
				addr = validador_addr;
			end
	
			dataReadValidador = data_memoria_jogadorUm;
		
		
		end
		
		ValidandorPlayerDois: begin
			wrenP2 = validador_wrep2;
			if(validador_wrep2)begin
				//salvar na memoria
				addr = validador_addr;
				data = validador_data;
			end else begin
				addr = validador_addr;
			end
			
	
			dataReadValidador = data_memoria_jogadorDois;
		
		end
		
		ColidindoPlayerUm:begin
			wrenP1 = colisor_wrep1;
			if(colisor_wrep1)begin
			
				addr = colisor_addr;
				data = colisor_data;
			
			end else begin
				addr = colisor_addr;
			
			end
		
			dataReadColisor  = data_memoria_jogadorUm;	
		
		end
		
		ColidindoPlayerDois: begin
			wrenP2 = colisor_wrep2;
			if(colisor_wrep2)begin
			
				addr = colisor_addr;
				data = colisor_data;
			
			end else begin
				addr = colisor_addr;
			
			end
		
			dataReadColisor  = data_memoria_jogadorDois;
		
		end
		
		CalculandoPontuacaoPlayerUm: begin
		
		
		end
		
		CalculandoPontuacaoPlayerDois: begin
		
		end
		
		TransmitindoVgaPlayerUm: begin
		
			addr = vga_readAddr;
		
			dataReadVGA = data_memoria_jogadorUm;
		
		end
		
		TransmitindoVgaPlayerDois: begin
			//colocar algo para indicar qual memoria(P1 ou P2)
			
			addr = vga_readAddr;
		
			dataReadVGA = data_memoria_jogadorDois;
				
		end
		
//		default:begin
//				
//		end
		
	endcase
end

endmodule