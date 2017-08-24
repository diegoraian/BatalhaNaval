module VGA_Submarino
(
	/*
	Objetivos: Desenhar uma embarcaçao na tela
	
	Inputs:
	@param clk			- clock do sistema
	@param areaAtiva	- area ativa na tela para exibicao de video
	@param linha		- linha da tela que sera ativada para exibicao
	@param coluna		- coluna da tela que sera ativada para exibicao
	@param posicoesEmbarcacao - recebe a posicao da embarcacaono mapa. Segue o padrao: Vetor_Posicoes = <Bits mais Significativos> [...] [18-:4] [14-:4] [10-:4] [6-:4] [2:0] <Bits menos Significativos>
	*/
	clk,
	areaAtiva,
	linha,
	coluna,
	posicoesEmbarcacao,
	/*
	Outputs:
	@param rgb_r		- canal de cor vermelho do RGB
	@param rgb_g		- canal de cor verdedo RGB
	@param rgb_b		- canal de cor azuldo RGB
	*/
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
reg [9:0] X;										// Recebe a coordenada X do Submarino
reg [9:0] Y;										// Recebe a coordenada Y do Submarino
reg [9:0] borderLeft;							// limite esquerdo da imagem da peca na tela
reg [9:0] borderDown;							// limite inferior da imagem da peca na tela
reg [9:0] largura = 10'd54;					// Largura de uma celula da embarcacao
reg [9:0] altura = 10'd49;						// Altura de uma celula da embarcacao

/*Parametros para os valores das POSICOES em X e em Y*/
parameter	X1 = 10'd1,
				X2 = 10'd2,
				X3 = 10'd3,
				X4 = 10'd4,
				X5 = 10'd5,
				X6 = 10'd6,
				X7 = 10'd7,
				X8 = 10'd8,

				Y8 = 10'd1,
				Y7 = 10'd2,
				Y6 = 10'd3,
				Y5 = 10'd4,
				Y4 = 10'd5,
				Y3 = 10'd6,
				Y2 = 10'd7,
				Y1 = 10'd8;

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

//always @(posedge clk and readEnabled) begin

//end


/* Responsavel pelo Mapeamento Jogo -> VGA */
always @ (posedge clk) begin
	 
	 X = posicoesEmbarcacao[6 -:4];
	 Y = posicoesEmbarcacao[10 -:4];
	case(X)
		X1:
		begin
			borderLeft = 10'd16;
		end

		X2:
		begin
			borderLeft = 10'd78;
		end
		
		X3:
		begin
			borderLeft = 10'd140;
		end
		
		X4:
		begin
			borderLeft = 10'd202;
		end
		
		X5:
		begin
			borderLeft = 10'd264;
		end
		
		X6:
		begin
			borderLeft = 10'd326;
		end
		
		X7:
		begin
			borderLeft = 10'd388;	
		end
		
		X8:
		begin
			borderLeft = 10'd450;
		end
	endcase
	
	case(Y)
		Y1:
		begin
			borderDown = 10'd16;
		end

		Y2:
		begin
			borderDown = 10'd73;
		end
		
		Y3:
		begin
			borderDown = 10'd130;
		end
		
		Y4:
		begin
			borderDown = 10'd187;
		end
		
		Y5:
		begin
			borderDown = 10'd244;
		end
		
		Y6:
		begin
			borderDown = 10'd301;
		end
		
		Y7:
		begin
			borderDown = 10'd358;
		end
		
		Y8:
		begin
			borderDown = 10'd415;
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

assign rgb_r = 1'b0;
					
assign rgb_g =
					((linha > borderDown && linha < (borderDown + altura))&& (coluna > borderLeft && coluna < (borderLeft + largura)))? 1'b1:
					1'b0;
endmodule
