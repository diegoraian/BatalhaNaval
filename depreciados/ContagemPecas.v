/* Modulo de Contagem de Pecas */
/*
  Anotações:
  
  - Conta a qtd de embarcacoes restantes
  - Verifica na memoria a cada ciclo de clk essa qtd
  - Leva 11 pulsos de clock para percorrer toda memoria
  
  --------------------------------------------------------
*/

module ContagemPecas
(
  /*
	@param enable -  habilita o módulo
   @param clk - clock do sistema
   @param memoriaP1 - vetor de coordenadas lido da memoria do player 1
	@param memoriaP2 - vetor de coordenadas lido da memoria do player 2

  */
  enable, clk, memoriaP1, memoriaP2,
  
  /*
	@param ready - passa a atribuicao de volta ao módulo que o chamou
	@param qtd_P1 - quantidade restante na memória de peças de P1
	@param qtd P2 - quantidade restante da memória de peças de P2
	@param addr - endereço para ler na memoria
  */
  ready, qtd_P1, qtd_P2, addr
);


input clk, enable; 
input [63:0] memoriaP1;
input [63:0] memoriaP2;

output reg ready;
output reg [3:0] qtd_P1;
output reg [3:0] qtd_P2;
output reg [4:0] addr;

/*Incrementa o endereco addr e habilit/desabilita o sinal de ready*/
always @ (posedge clk or negedge enable) begin

	if (!enable) begin
		//Nao faca nada
	end else begin
		if (addr == 5'd11) begin		// se endereco chegou ao ultimo
			addr = 5'd0;					// zera o endereco
			ready = 1'b1;					// informa que terminou a tarefa
		end else begin
			addr = addr + 5'd1;			// incrementa o endereço para verificar na memoria. Em um total de 11 pulsos de clock ele verifica a memoria inteira
		end
	end
end

/*Decrementa contador da qtd de embarcacoes*/
always @ (enable or addr) begin
	
	if(enable) begin
		
		/*Qtd do Player 1*/
		if(memoriaP1[42-:40] == 40'd0) begin
				qtd_P1 = qtd_P1 - 4'd1;
		end
		
		/*Qtd do Player 2*/
		if(memoriaP2[42-:40] == 40'd0) begin
				qtd_P2 = qtd_P2 - 4'd1;
		end
		
	/* Apos enable ser desabilitado ele reseta as qtds para o valor original, no prox enable ele volta a contar*/
	end else begin 
		qtd_P1 = 4'd11;
		qtd_P2 = 4'd11;
	end
end
endmodule
