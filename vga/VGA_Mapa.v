module VGA_Mapa
(
	/*
	Objetivos: Desenhar o mapa na tela a partir de um conjunto de posicoes previamente estabelcidas
	
	Inputs:
	@param clk			- clock do sistema
	@param areaAtiva	- area ativa na tela para exibicao de video
	@param linha		- linha da tela que sera ativada para exibicao
	@param coluna		- coluna da tela que sera ativada para exibicao
	*/
	clk,
	areaAtiva,
	linha,
	coluna,
	
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

/* Canais de Cores para VGA*/
output rgb_r, rgb_g , rgb_b;



/*Registradores Internos*/
reg  [9:0] espessura = 10'd4;							// Recebe a espessura da grade/mapa em pixels


/*  COR DO MAPA = BRANCO */
assign rgb_b = 
					/*Linhas Verticais do Mapa*/
					((coluna > 10'd10 && coluna  < (10'd10 + espessura))   && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd72 && coluna  < (10'd72 + espessura))   && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd134 && coluna < (10'd134 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd196 && coluna < (10'd196 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd258 && coluna < (10'd258 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd320 && coluna < (10'd320 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd382 && coluna < (10'd382 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd444 && coluna < (10'd444 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd506 && coluna < (10'd506 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					
					/*Linhas Horizontais do Mapa*/ 
					((linha > 10'd10   && linha < (10'd10 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd67   && linha < (10'd67 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd124  && linha < (10'd124 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd181  && linha < (10'd181 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd238  && linha < (10'd238 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd295  && linha < (10'd295 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd352  && linha < (10'd352 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd409  && linha < (10'd409 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd466  && linha < (10'd466 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					1'b0
					;
					
assign rgb_r =
					/*Linhas Verticais do Mapa*/
					((coluna > 10'd10 && coluna  < (10'd10 + espessura))   && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd72 && coluna  < (10'd72 + espessura))   && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd134 && coluna < (10'd134 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd196 && coluna < (10'd196 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd258 && coluna < (10'd258 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd320 && coluna < (10'd320 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd382 && coluna < (10'd382 + espessura))  && (linha > 10'd10 && linha < 10'd460 )) ? 1'b1:
					((coluna > 10'd444 && coluna < (10'd444 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd506 && coluna < (10'd506 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					
					/*Linhas Horizontais do Mapa*/ 
					((linha > 10'd10   && linha < (10'd10 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd67   && linha < (10'd67 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd124  && linha < (10'd124 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd181  && linha < (10'd181 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd238  && linha < (10'd238 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd295  && linha < (10'd295 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd352  && linha < (10'd352 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd409  && linha < (10'd409 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd466  && linha < (10'd466 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					1'b0
					;

assign rgb_g = 
					/*Linhas Verticais do Mapa*/
					((coluna > 10'd10 && coluna  < (10'd10 + espessura))   && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd72 && coluna  < (10'd72 + espessura))   && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd134 && coluna < (10'd134 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd196 && coluna < (10'd196 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd258 && coluna < (10'd258 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd320 && coluna < (10'd320 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd382 && coluna < (10'd382 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd444 && coluna < (10'd444 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					((coluna > 10'd506 && coluna < (10'd506 + espessura))  && (linha > 10'd10 && linha < 10'd466 )) ? 1'b1:
					
					/*Linhas Horizontais do Mapa*/ 
					((linha > 10'd10   && linha < (10'd10 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd67   && linha < (10'd67 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd124  && linha < (10'd124 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd181  && linha < (10'd181 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd238  && linha < (10'd238 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd295  && linha < (10'd295 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd352  && linha < (10'd352 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd409  && linha < (10'd409 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					((linha > 10'd466  && linha < (10'd466 + espessura))	&& (coluna > 10'd10 && coluna < 10'd510)) ? 1'b1:
					1'b0
					;
endmodule
