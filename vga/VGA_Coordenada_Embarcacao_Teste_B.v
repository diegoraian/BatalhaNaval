module VGA_Coordenada_Embarcacao_Teste_B
(
	/*
	Objetivos: Este modulo se destina a testar os modulos de desenho de embarcacoes na VGA.
				  Ele ira simular o envio do vetor de posicoes da memoria para os modulos de embarcacoes.
				  A embarcacao teste para esse modulo e o SUBMARINO.
	
	inputs
	@param leftArrow - sinal que representa um switch para mover a embarcacao para esquerda
	@param rightArrow - sinal que representa  um switch para mover a embarcacao para direita
	@param upArrow - sinal que representa  um switch para mover a embarcacao para cima
	@param downArrow - sinal que representa um switch para mover a embarcacao para baixo
	*/
	
	leftArrow,
	rightArrow,
	upArrow,
	downArrow,
	
	/*outputs
	@param posicoesEmbarcacao - Vetor de posicoes X e Y. Varia de 3-42 bits, 4 primeiros para X , os 4 seguintes para Y, e assim vai
	*/
	posicoesEmbarcacao

);

input leftArrow, rightArrow, upArrow, downArrow;
output [63:0] posicoesEmbarcacao;

/*Relativo ao teste de um submarino*/
assign posicoesEmbarcacao =
					(leftArrow == 1'b1 && rightArrow == 1'b0 && upArrow == 1'b0 && downArrow == 1'b0)? 64'b0000000000000000000000000000000000000000000000000000000100001000: // Posicao Esquerda XA = 1, YA =2
					(leftArrow == 1'b0 && rightArrow == 1'b1 && upArrow == 1'b0 && downArrow == 1'b0)? 64'b0000000000000000000000000000000000000000000000000000000100011000: // Posicao Direita XA = 3, YA = 2
					(leftArrow == 1'b0 && rightArrow == 1'b0 && upArrow == 1'b1 && downArrow == 1'b0)? 64'b0000000000000000000000000000000000000000000000000000000110010000: // Posicao Em cima XA = 2, YA = 3
					(leftArrow == 1'b0 && rightArrow == 1'b0 && upArrow == 1'b0 && downArrow == 1'b1)? 64'b0000000000000000000000000000000000000000000000000000000010010000: // Posicao Em Baixo XA = 2, YA = 1
					64'b0000000000000000000000000000000000000000000000000000000100010000; // Posicao Padrao XA = 2, YA=2
					
					
endmodule
