module VGA_Coordenada
(
	/*
	Objetivos: Este modulo se destina a testar os modulos de desenho de embarcacoes na VGA.
				  Ele ira simular o envio do vetor de posicoes da memoria para os modulos de embarcacoes.
				  A embarcacao teste para esse modulo e o SUBMARINO.
	
	inputs
	@reset - sinal de reset para o modulo
	@param select - sinal que representa um botao para mover a embarcacao horizontalmente
	@param enter - sinal que representa um botao para mover a embarcacao verticalmente
	*/
	
	input reset,
	input select,
	input enter,

	/*outputs
	@param posicoesEmbarcacao - Vetor de posicoes X e Y. Varia de 3-42 bits, 4 primeiros para X , os 4 seguintes para Y, e assim vai
	*/
	output [63:0] posicoesEmbarcacao

);

/*Registradores Internos*/
reg [6:0] X;						// Coordenada X da embarcação
reg [10:0] Y;						// Coordenada X da embarcação
reg [63:0] posicoesEmbarcacaoLocal;	// Para uso localmente no modulo

initial begin
	posicoesEmbarcacaoLocal = 64'b0000000000000000000000000000000000000000000000000000000000000000;
	X = 7'b0000000;
	Y = 11'b00000000000;
end

/*Move embarcação*/
always@(negedge reset or negedge select or negedge enter) begin
	if(!reset) begin							// Reseta as posicoes da embarcaçao
		X = 7'b0000000;
		Y = 11'b00000000000;
		posicoesEmbarcacaoLocal = 64'b0000000000000000000000000000000000000000000000000000000000000000;
	end else if(!select) begin				// Move Horizontalmente
		if(X == 7'b1111000) begin
			X = 7'b0001000;					// X = Posicao 1 Horizontal
		end else begin
			X = X + 7'b0001000;				// Se move para direita
		end
	end else begin								// Move Verticalmente
		if(Y == 11'b11110000000) begin
			Y = 11'b00010000000;				// Y = Posicao 1 Vertical
		end else begin
			Y = Y + 11'b00010000000;		// Se move para cima
		end
	end
end

/*Relativo ao teste de um submarino*/
assign posicoesEmbarcacao = posicoesEmbarcacaoLocal + X + Y;

endmodule
