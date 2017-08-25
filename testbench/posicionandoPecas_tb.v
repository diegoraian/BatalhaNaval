module posicionandoPecas_tb;

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


integer qtNavio = 5;
integer CoordenadaRandom;

posicionandoPecas DUT(
	//input
	 .enable(enable),
	 .reset(reset),
	 .enter(enter),
     .select(select),
     .mode(mode),
     .clk(clk),
     .conflito(conflito),

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
			mode=0;
			forever #25 clk = !clk;
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
		/*Ordem de inserção das Peças:
		   1-Submarino
		   2-Cruzador
		   3-Hidroaviao
		   4-Encouracado
		   5-Porta-aviões
		 */

		//Player UM (11 peças):
		//PrimeiraPeça(Submarino)
		for(qtNavio = 0;qtNavio < 5 ;qtNavio = qtNavio +1)
		begin
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelectRandomico;
			ativaEnter;

		// define Y
			ativaSelectRandomico;
			ativaEnter;

		// Verifica Conflito
		    conflito = 0;
		    #1000

			ativaEnter;

		// Armazena Peça 
			ativaEnter;

		end
			
		for(qtNavio = 0;qtNavio < 2 ;qtNavio = qtNavio +1)
		begin
		//Segunda(Cruzador)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelectRandomico;
			ativaEnter;

		// define Y
			ativaSelectRandomico;
			ativaEnter;

		// Verifica Conflito
			ativaEnter;

		// Armazena Peça 
			ativaEnter;
		end

		for(qtNavio = 0;qtNavio < 2 ;qtNavio = qtNavio +1)
		begin
		//Terceira(Hidroaviao Avião)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelectRandomico;
			ativaEnter;

		// define Y
			ativaSelectRandomico;
			ativaEnter;

		// Verifica Conflito
			ativaEnter;

		// Armazena Peça 
			ativaEnter;	
		end

	    //Quarta(Encouracado)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelectRandomico;
			ativaEnter;

		// define Y
			ativaSelectRandomico;
			ativaEnter;

		// Verifica Conflito
			ativaEnter;

		// Armazena Peça 
			ativaEnter;	



		//Quarta(Porta-Aviões)
		// esecolhe a direção
			//(direção 0 horizontal)
			ativaEnter;

		// escolhe Orientação
			ativaEnter;

		// define X
			ativaSelectRandomico;
			ativaEnter;

		// define Y
			ativaSelectRandomico;
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
		#200
		enter = 0;
		#200
		enter = 1;
	end
	endtask

	task ativaSelect;
	begin
		#20
		select = 1;
		#200
		select = 0;
		#200
		select = 1;
	end
	endtask

	task ativaSelectRandomico;
	integer i;
	begin
		#10
		CoordenadaRandom = $urandom%7;

		for(i = 0; i <CoordenadaRandom ; i = i +1 )
		begin
			ativaSelect;
		end
	end
	endtask


	task geraPosicaoRandomico;
	begin
		#20
		posicaoRandomico = $urandom%7;
	end
	endtask

	task geraDirecaoRandomico;
	begin
		#20
		posicaoRandomico = $urandom%1;
	end
	endtask
	
	
	
endmodule