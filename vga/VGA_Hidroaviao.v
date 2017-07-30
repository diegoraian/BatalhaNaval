module VGA_Encouracado
(
	//inputs
	clk,
	areaAtiva,
	linha,
	coluna,
	posicoesEmbarcacao, // Para o submarino, as posicoes X e Y. Varia de 3-10 bits, 4 primeiros para X e 4 ultimos para Y, totalizando 8 bits
	
	//outputs
	rgb_r,
	rgb_g,
	rgb_b

);

input clk,areaAtiva;
input [9:0] linha;
input [9:0] coluna;

/*Vetor de posicoes da embarcacao, armazena todas as coordenadas da embarcacao */
input [63:0] posicoesEmbarcacao;

/* Canais de Cores para VGA*/
output rgb_r, rgb_g , rgb_b;


/*Registradores Internos*/
reg [9:0] XA;										// Recebe a coordenada XA do Encouracado
reg [9:0] YA;										// Recebe a coordenada YA do Encouracado
reg [9:0] XB;										// Recebe a coordenada XB do Encouracado
reg [9:0] YB;										// Recebe a coordenada YB do Encouracado
reg [9:0] XC;										// Recebe a coordenada XC do Encouracado
reg [9:0] YC;										// Recebe a coordenada YC do Encouracado

reg [9:0] borderLeftA;							// limite esquerdo da celula A da peca na tela
reg [9:0] borderDownA;							// limite inferior da celula A da peca na tela
reg [9:0] borderLeftB;							// limite esquerdo da celula B da peca na tela
reg [9:0] borderDownB;							// limite inferior da celula B da peca na tela
reg [9:0] borderLeftC;							// limite esquerdo da celula C da peca na tela
reg [9:0] borderDownC;							// limite inferior da celula C da peca na tela

reg [9:0] largura = 10'd54;					// Largura de uma celula da embarcacao
reg [9:0] altura = 10'd49;					// Altura de uma celula da embarcacao

/*Parametros para os valores das POSICOES em X e em Y*/
parameter	X1 = 10'd1,
				X2 = 10'd2,
				X3 = 10'd3,
				X4 = 10'd4,
				X5 = 10'd5,
				X6 = 10'd6,
				X7 = 10'd7,
				X8 = 10'd8,

				Y1 = 10'd1,
				Y2 = 10'd2,
				Y3 = 10'd3,
				Y4 = 10'd4,
				Y5 = 10'd5,
				Y6 = 10'd6,
				Y7 = 10'd7,
				Y8 = 10'd8;

/* MAPEAMENTO JOGO->VGA */
/*

TAMANHO MAPA : 8X8
RESOLUCAO VGA: 640X480
LARGURA GRADE DO MAPA_VGA:(E a largura em pixel de quanto a grade do mapa na tela imprime)

		** MATRIZ DE POSICOES 8x8 **
		Y
		8|
		7| 
		6|
		5|
		4|
		3|
		2|
		1|
		----------------------------------
		X-> 1	2	3	 4	  5	6	 7	 8	 | Unidade
		
		
		** MATRIZ EQUIVALENTE DE POSICOES 640 X 480 **
		Y(pixels)
		415|
		358| 
		301|
		244|
		187|
		130|
		 73|
		 16|
		-----------------------------------
X(pixels) - -	1  2 	 2   3 	3   4 | Centena
			 1	7	4	0 	 6	  2   8   5	| Dezena
			 6	8	0	2	 4	  6   8   0	| Unidade

			Intervalo de X = 54
			Intervalo de Y = 49
*/


/* Responsavel pelo Mapeamento Jogo -> VGA */
always @ (posedge clk) begin
	 XA = posicoesEmbarcacao[6 -:4];
	 YA = posicoesEmbarcacao[10 -:4];
	 
	 XB = posicoesEmbarcacao[14 -:4];
	 YB = posicoesEmbarcacao[18 -:4];

	 XC = posicoesEmbarcacao[22 -:4];
	 YC = posicoesEmbarcacao[26 -:4];
	 
/*Primeira Coordenada X da Embarcaçao*/
	case(XA)
		X1:
		begin
			borderLeftA = 10'd16;
		end

		X2:
		begin
			borderLeftA = 10'd78;
		end
		
		X3:
		begin
			borderLeftA = 10'd140;
		end
		
		X4:
		begin
			borderLeftA = 10'd202;
		end
		
		X5:
		begin
			borderLeftA = 10'd264;
		end
		
		X6:
		begin
			borderLeftA = 10'd326;
		end
		
		X7:
		begin
			borderLeftA = 10'd388;	
		end
		
		X8:
		begin
			borderLeftA = 10'd450;
		end
	endcase
/*Primeira Coordenada Y da Embarcaçao*/	
	case(YA)
		Y1:
		begin
			borderDownA = 10'd16;
		end

		Y2:
		begin
			borderDownA = 10'd73;
		end
		
		Y3:
		begin
			borderDownA = 10'd130;
		end
		
		Y4:
		begin
			borderDownA = 10'd187;
		end
		
		Y5:
		begin
			borderDownA = 10'd244;
		end
		
		Y6:
		begin
			borderDownA = 10'd301;
		end
		
		Y7:
		begin
			borderDownA = 10'd358;
		end
		
		Y8:
		begin
			borderDownA = 10'd415;
		end
	endcase
/*Segunda Coordenada X da Embarcaçao*/
	case(XB)
		X1:
		begin
			borderLeftB = 10'd16;
		end

		X2:
		begin
			borderLeftB = 10'd78;
		end
		
		X3:
		begin
			borderLeftB = 10'd140;
		end
		
		X4:
		begin
			borderLeftB = 10'd202;
		end
		
		X5:
		begin
			borderLeftB = 10'd264;
		end
		
		X6:
		begin
			borderLeftB = 10'd326;
		end
		
		X7:
		begin
			borderLeftB = 10'd388;	
		end
		
		X8:
		begin
			borderLeftB = 10'd450;
		end
	endcase
/*Segunda Coordenada Y da Embarcaçao*/
	case(YB)
		Y1:
		begin
			borderDownB = 10'd16;
		end

		Y2:
		begin
			borderDownB = 10'd73;
		end
		
		Y3:
		begin
			borderDownB = 10'd130;
		end
		
		Y4:
		begin
			borderDownB = 10'd187;
		end
		
		Y5:
		begin
			borderDownB = 10'd244;
		end
		
		Y6:
		begin
			borderDownB = 10'd301;
		end
		
		Y7:
		begin
			borderDownB = 10'd358;
		end
		
		Y8:
		begin
			borderDownB = 10'd415;
		end
	endcase	
/*Terceira Coordenada X da Embarcaçao*/	
	case(XC)
			Y1:
			begin
				borderDownA = 10'd16;
			end

			Y2:
			begin
				borderDownA = 10'd73;
			end
			
			Y3:
			begin
				borderDownA = 10'd130;
			end
			
			Y4:
			begin
				borderDownA = 10'd187;
			end
			
			Y5:
			begin
				borderDownA = 10'd244;
			end
			
			Y6:
			begin
				borderDownA = 10'd301;
			end
			
			Y7:
			begin
				borderDownA = 10'd358;
			end
			
			Y8:
			begin
				borderDownA = 10'd415;
			end
		endcase
/*Terceira Coordenada Y da Embarcaçao*/	
	case(YC)
			Y1:
			begin
				borderDownA = 10'd16;
			end

			Y2:
			begin
				borderDownA = 10'd73;
			end
			
			Y3:
			begin
				borderDownA = 10'd130;
			end
			
			Y4:
			begin
				borderDownA = 10'd187;
			end
			
			Y5:
			begin
				borderDownA = 10'd244;
			end
			
			Y6:
			begin
				borderDownA = 10'd301;
			end
			
			Y7:
			begin
				borderDownA = 10'd358;
			end
			
			Y8:
			begin
				borderDownA = 10'd415;
			end
		endcase

end


/* ESQUEMA DE CORES DAS EMBARCAÇOES*/
/*
 Submarino =  Verde
 
 Cruzador = Vermelho
 
 Hidroaviao = Amarelo
 
 Encouracado = Violeta
 
 Porta-avioes = Ciano

*/
assign rgb_b = 1'b0;
					
assign rgb_r = 
					((linha > borderLeftA && linha < (borderLeftA + largura))&& (coluna > borderDownA && coluna < (borderDownA + altura)))? 1'b1:
					((linha > borderLeftB && linha < (borderLeftB + largura))&& (coluna > borderDownB && coluna < (borderDownB + altura)))? 1'b1:
					((linha > borderLeftC && linha < (borderLeftC + largura))&& (coluna > borderDownC && coluna < (borderDownC + altura)))? 1'b1:
					1'b0;

assign rgb_g =
					((linha > borderLeftA && linha < (borderLeftA + largura))&& (coluna > borderDownA && coluna < (borderDownA + altura)))? 1'b1:
					((linha > borderLeftB && linha < (borderLeftB + largura))&& (coluna > borderDownB && coluna < (borderDownB + altura)))? 1'b1:
					((linha > borderLeftC && linha < (borderLeftC + largura))&& (coluna > borderDownC && coluna < (borderDownC + altura)))? 1'b1:
					1'b0;

endmodule
