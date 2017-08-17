/*
		Modulo resposavel pelo acesso a memoria das posições das embacações de acordo com o jogador
		que esta excecutando o jogo ou posicionando suas peças



*/



module VGA_Compositor
(
	input clk,
	input resetGeral,

	input readyExecutandoJogo,
	input readyPosicionandoPecas,

	input jogadorExecutandoJogo,
	input jogadorPosicionandoPecas,

	//Dado lido da memoria
	input [63:0] data_memoria, //Leitura da memoria jogador 
	

	//output reg [63:0] data; // Dado q irá ser salvo na memoria do colisor e Validador
	output reg exibeMapa,
	output reg [4:0] addr,
	output reg jogadorVGA,
	output reg [63:0] dataEmbarcacaoSubmarinoUm,
	
	output reg [63:0] dataEmbarcacaoSubmarinoDois,
	output reg [63:0] dataEmbarcacaoSubmarinoTres,
	output reg [63:0] dataEmbarcacaoSubmarinoQuatro,
	output reg [63:0] dataEmbarcacaoSubmarinoCinco,
	output reg [63:0] dataEmbarcacaoCruzadorUm,
	output reg [63:0] dataEmbarcacaoCruzadorDois,
	output reg [63:0] dataEmbarcacaoHidroaviaoUm,
	output reg [63:0] dataEmbarcacaoHidroaviaoDois,
	output reg [63:0] dataEmbarcacaoEncouracado,
	output reg [63:0] dataEmbarcacaoPortaAvioes  //data leitura do colisor
	

);

parameter
			  Idle						    =  3'b000,
			  PosicionandoPecas             =  3'b001,
			  ExecutandoJogo                =  3'b010;



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
			
				if(readyPosicionandoPecas)begin
					E_F <= PosicionandoPecas;
				end else begin
					if(readyExecutandoJogo)begin
						E_F <= ExecutandoJogo;
					end 
					
				end
			end
			
			PosicionandoPecas: begin
			
				if(readyPosicionandoPecas)begin
						E_F <= PosicionandoPecas;
				end else begin
						E_F<= Idle;
				end
			
			end
			
			ExecutandoJogo: begin
			
				if(readyExecutandoJogo)begin
					E_F <= ExecutandoJogo;
				end else begin
					E_F<= Idle;
				end
			
			end
			
			
			
//			default:begin
//					E_F <= idle;
//			end
	
		endcase	
		
	end

end





//******* decodificador De Saida ********
always@(posedge clk)
begin
	case (E_A)
	
		Idle:begin
			addr = 1'b0;
			exibeMapa = 1'b0;
		
		end
		
		PosicionandoPecas, ExecutandoJogo: begin

			case (addr)

				(4'b0000):begin
					dataEmbarcacaoSubmarinoUm = data_memoria;
				end
				(4'b0001):begin
					dataEmbarcacaoSubmarinoDois = data_memoria;
				end
				(4'b0010):begin
					dataEmbarcacaoSubmarinoTres = data_memoria;
				end
				(4'b0011):begin
					dataEmbarcacaoSubmarinoQuatro = data_memoria;
				end
				(4'b0100):begin
					dataEmbarcacaoSubmarinoCinco = data_memoria;
				end
				(4'b0101):begin
					dataEmbarcacaoCruzadorUm = data_memoria;
				end
				(4'b0110):begin
					dataEmbarcacaoCruzadorDois = data_memoria;
				end
				(4'b0111):begin
					dataEmbarcacaoHidroaviaoUm = data_memoria;
				end
				(4'b1000):begin
					dataEmbarcacaoHidroaviaoDois = data_memoria;
				end
				(4'b1001):begin
					dataEmbarcacaoEncouracado = data_memoria;
				end
				(4'b1010):begin
					dataEmbarcacaoPortaAvioes = data_memoria;
				end
			endcase

			if(E_A == PosicionandoPecas) jogadorVGA = jogadorPosicionandoPecas;
			else jogadorVGA = jogadorExecutandoJogo;
			
			exibeMapa = 1'b1;
			addr = addr + 1;
		
			if(addr == 12) addr = 0;
			
		end
		
		// ExecutandoJogo: begin
			
		// 	jogadorVGA = jogadorExecutandoJogo;

		// 	dataEmbarcacao = data_memoria;


		// 	addr = addr + 1;
		// 	if(addr == 12) addr = 0;


		// end
		
		
		
//		default:begin
//				
//		end
		
	endcase
end

endmodule