module VGA_Teste
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
output posicoesEmbarcacao;

/*Relativo ao teste de um submarino*/
assign posicoesEmbarcacao =
					(leftArrow == 1'b1 && rightArrow == 1'b0 && upArrow == 1'b0 && downArrow == 1'b0)? 1'b0000000000000000000000000000000000000000000000000000001010100000: // Posicao Esquerda XA = 4, YA=5
					(leftArrow == 1'b0 && rightArrow == 1'b1 && upArrow == 1'b0 && downArrow == 1'b0)? 1'b0000000000000000000000000000000000000000000000000000001010110000: // Posicao Direita XA =6, YA=5
					(leftArrow == 1'b0 && rightArrow == 1'b0 && upArrow == 1'b1 && downArrow == 1'b0)? 1'b0000000000000000000000000000000000000000000000000000001100101000: // Posicao Em cima XA =5, YA=6
					(leftArrow == 1'b0 && rightArrow == 1'b0 && upArrow == 1'b0 && downArrow == 1'b1)? 1'b0000000000000000000000000000000000000000000000000000001000101000: // Posicao Em Baixo XA = 5, YA=4
					1'b0000000000000000000000000000000000000000000000000000001010101000; // Posicao Padrao XA = 5, YA=5
					
					
endmodule
