module Pontuacao_tb;

//input
reg clk, enable; 
reg [63:0] memoriaP1;
reg [63:0] memoriaP2;

//output
wire ready;
wire [3:0] pontuacao_P1;
wire [3:0] pontuacao_P2;
wire [4:0] addr;

Pontuacao DUT(
	//input
	 .clk(clk),
	 .enable(enable),
	 .memoriaP1(memoriaP1),
     .memoriaP2(memoriaP2),

	 //output
	.ready(ready), 
	.pontuacao_P1(pontuacao_P1),
	.pontuacao_P2(pontuacao_P2),
    .addr(addr)
);


	initial
	begin
			clk = 0;
			enable = 0;
			forever #10 clk = !clk;
	end
	
			
		// ------- Simulação Player vs Player -------
		/*Ordem de inserção das Peças:
		   0 - 4 Submarino
		   5 -6 Cruzador
		   3-Hidroaviao
		   4-Encouracado
		   5-Porta-aviões
		 */
	initial
	begin

		//inicia a 
		#40 
		ativaSelect;
	

	end

	task ativaSelect;
	begin
		#20
		enable = 0;
		#20
		enable = 1;
		#20
		enable = 0;
	end
	endtask

	
endmodule