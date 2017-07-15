module PosicionandoPecas_tb;

//input
reg enable,clk,reset,select,enter,mode,conflito;
reg [2:0] posicaoRandomico;
reg direcaoRandomico;

//output
wire ready;
wire valida;
wire [2:0] tipo;  
wire jogador;
wire [2:0] X1;
wire [2:0] Y1;
wire direcao;
wire orientacao;

PosicionandoPecas DUT(
	//input
	 .enable(enable),
	 .reset(reset),
	 .enter(enter),
     .select(select),
     .mode(mode),
     .clk(clk),
     .conflito(conflito),
     .posicaoRandomico(posicaoRandomico),
     .direcaoRandomico(direcaoRandomico),

	 //output
	.ready(ready), 
	.valida(valida),
	.tipo(tipo),
    .jogador(jogador),
    .X1(X1),
	.Y1(Y1),
    .direcao(direcao),
    .orientacao(orientacao)
);


	initial
	begin
			clk = 0;
			enable = 0;
			reset = 0;
			enter = 1;
			select = 1;
			forever #10 clk = !clk;
	end
	
	
	initial
	begin

		//inicia a 
		#40 enable = 1;
		#40
		reset =1;
		#40
		reset =0;
		#40
		reset =1;
		#40
		
		// ------- Simulação Player vs Player -------


		//Player UM (11 peças):
		//PrimeiraPeça(Porta-Aviões)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// define Y
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// Verifica Conflito
		    conflito = 0;
			ativaEnter;

		// Armazena Peça 
			ativaEnter;

			

		//Segunda(Encouraçado)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// define Y
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// Verifica Conflito
			ativaEnter;

		// Armazena Peça 
			ativaEnter;


		//Terceira(Hidroaviao Avião)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// define Y
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// Verifica Conflito
			ativaEnter;

		// Armazena Peça 
			ativaEnter;	


	    // ------- Simulação Player vs CPU -------

		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;
		// escolhe Orientação
			ativaEnter;
		// define X
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// define Y
			ativaSelect;
			ativaSelect;
			ativaEnter;

		// Verifica Conflito
			ativaEnter;
		// Armazena Peça 
			ativaEnter;



	end



	task ativaEnter;
	begin
		#20
		enter = 1;
		#20
		enter = 0;
		#20
		enter = 1;
	end
	endtask

	task ativaSelect;
	begin
		#20
		select = 1;
		#20
		select = 0;
		#20
		select = 1;
	end
	endtask


	task geraPosicaoRandomico;
	begin
		#20
		posicaoRandomico = $random%7;
	end
	endtask

	task geraDirecaoRandomico;
	begin
		#20
		posicaoRandomico = $random%1;
	end
	endtask
	
	
	
endmodule