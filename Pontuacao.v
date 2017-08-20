/* Modulo de Pontuacao */
/*
  Anotações:
  
  - Conta a qtd de embarcacoes restantes
  - Conta os pontos de cada player
  - Verifica na memoria a cada ciclo de clk essa qtd
  - Leva 11 pulsos de clock para percorrer toda memoria
  
  --------------------------------------------------------
*/

module Pontuacao
(
  /*
	@param enable -  habilita o módulo
   @param clk - clock do sistema
	@param reset - reseta o modulo para o seu estado inicial
   @param memoria - vetor de coordenadas lido da memoria do player 1 ou do player 2
	@param jogadroIn - indica qual jogador executou a ultima jogado no ExecutandoJogo
  */
  enable, clk, reset, jogadorIn, memoria,
  
  /*
	@param ready - passa a atribuicao de volta ao módulo que o chamou
	@param jogadorOut - indica de  qual jogador memoria sera lida
	@param qtdP1 - quantidade restante na memória de peças de P1
	@param qtdP2 - quantidade restante da memória de peças de P2
	@param pontosP1 - pontos do P1
	@param pontosP2 - pontos do P2
	@param addr - endereço para ler na memoria
  */
  ready, jogadorOut, qtdP1, qtdP2, pontosP1, pontosP2, addr
);


input clk, enable, reset, jogadorIn; 
input [63:0] memoria;

output reg ready;
output reg jogadorOut;
output reg [3:0] qtdP1;
output reg [3:0] qtdP2;
output reg [4:0] pontosP2;
output reg [4:0] pontosP1;
output reg [4:0] addr;


/*Registradores Internos*/
reg [3:0] E_A;
reg [3:0] E_F = Idle;
reg [3:0] qtdP1Local = 4'd0;
reg [3:0] qtdP2Local = 4'd0;
reg [4:0] pontosP2Local = 5'd11;
reg [4:0] pontosP1Local = 5'd11;

parameter	Idle					    =	4'b0000,
				lendoMemoria 	 	 	 = 4'b0001,
				calculandoPontos   	 = 4'b0010,
				calculandoQtdRestante = 4'b0011;
				
/*Transiçao de Estado*/			
always @ (posedge clk or negedge enable) begin
	if(!enable) begin
			E_A = Idle;
	end else begin
		if(!reset) begin
			E_A = Idle;
		end else begin
			E_A = E_F;
		end
	end
end


/*Decodificador de Proximo Estado*/
always @ (posedge clk or negedge enable) begin
	if (!enable) begin
			E_F = Idle;
	end else begin
		if (!reset) begin
			E_F = Idle;
		end else begin
			case(E_A)
				Idle: begin
					E_F = lendoMemoria;
				end
				
				lendoMemoria: begin
					E_F = calculandoPontos;
				end
				
				calculandoPontos: begin
					E_F = calculandoQtdRestante;
				end
			
				calculandoQtdRestante: begin
					E_F = lendoMemoria; 
				end
			endcase
		end
	end
end



/*Decodificador de Saida*/
always @ (posedge clk) begin

	jogadorOut <= !jogadorIn;	// Negando jogadorIn , obtem-se o jogadorOut: o jogador da memoria que sera lida
	
	case(E_A)
		Idle: begin
			addr <= 5'd0;
			qtdP1Local <= 4'd11;
			qtdP2Local <= 4'd11;
			pontosP1Local <= 5'd0;
			pontosP2Local <= 5'd0;
		end
		
		lendoMemoria: begin
			if (addr == 5'd11) begin		// se endereco chegou ao ultimo
				addr <= 5'd0;					// zera o endereco
				ready <= 1'b1;					// informa que terminou a tarefa
			end else begin
				addr = addr + 5'd1;			// incrementa o endereço para verificar na memoria. Em um total de 11 pulsos de clock ele verifica a memoria inteira
			end
		end
		
		calculandoPontos: begin
			/*Conta a Pontuacao do Player*/
			case({addr, memoria[42-:40]})
			
				/*5 Submarinos*/
				{5'd0, 40'd0}, {5'd1, 40'd0}, {5'd2, 40'd0}, {5'd3, 40'd0}, {5'd4, 40'd0}: begin
					if(!jogadorOut) begin // Player 1
						pontosP1Local = pontosP1Local + 5'd1;
					end else begin			// Player 2
						pontosP2Local = pontosP2Local + 5'd1;
					end
				end
				
				/*2 Cruzadores*/
				{5'd5, 40'd0}, {5'd6, 40'd0}: begin
					if(!jogadorOut) begin // Player 1
						pontosP1Local = pontosP1Local + 5'd2;
					end else begin			// Player 2
						pontosP2Local = pontosP2Local + 5'd2;
					end
				end
				
				/*2 Hidroavioes*/
				{5'd7, 40'd0}, {5'd8, 40'd0}: begin
					if(!jogadorOut) begin // Player 1
						pontosP1Local = pontosP1Local + 5'd3;
					end else begin			// Player 2
						pontosP2Local = pontosP2Local + 5'd3;
					end
				end
				
				/*1 Encouraçado*/
				{5'd9, 40'd0}: begin
					if(!jogadorOut) begin // Player 1
						pontosP1Local = pontosP1Local + 5'd4;
					end else begin			// Player 2
						pontosP2Local = pontosP2Local + 5'd4;
					end
				end
				
				/*1 Porta-Avioes*/
				{5'd11, 40'd0}: begin
					if(!jogadorOut) begin // Player 1
						pontosP1Local = pontosP1Local + 5'd5;
					end else begin			// Player 2
						pontosP2Local = pontosP2Local + 5'd5;
					end
				end
			endcase

				pontosP1 <= pontosP1Local;
				pontosP2 <= pontosP2Local;
		end
	
		calculandoQtdRestante: begin
			/*Conta Quantidade de Peças Restantes*/
			if(memoria[42-:40] == 40'd0) begin
					if(!jogadorOut) begin // Player 1
						qtdP1Local = qtdP1Local - 4'd1;
					end else begin			// Player 2
						qtdP2Local = qtdP2Local - 4'd1;
					end
				end
			qtdP1 <= qtdP1Local;
			qtdP2 <= qtdP2Local;
		end
	endcase	
end


endmodule
