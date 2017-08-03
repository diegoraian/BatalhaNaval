module Validador_tb;

reg enable,clk,direcao,jogador;
reg [2:0] tipo;
reg [2:0] orientacao;
reg [3:0] x1;
reg [3:0] y1;
reg [63:0] vetor_leitura_jogadorUm;
reg [63:0] vetor_leitura_jogadorDois;

reg [63:0] memoriaVectorJogadorUm[10:0] ; // Memoria para jogador Um
reg [63:0] memoriaVectorJogadorDois[10:0] ; //Memoria para jogador Dois


wire conflitoMemoria_out;
wire conflitoBorda_out;
wire conflito;  
wire wrep1;
wire wrep2;
wire [63:0]vetor;        
wire [4:0] addr_jogadorUm;         //Endereco para armazenar na memoria
wire [4:0] addr_jogadorDois;   // contaria as 11 posicoes verificando se ha conlfito de posições na memoria
wire ready;


Validador_Novo validador(
	//input
	.enable(enable),
	.tipo(tipo),
	.direcao(direcao),
	.orientacao(orientacao),
	.x1(x1),
	.y1(y1),
	.clk(clk), 
	.jogador(jogador),
	.vetor_leitura_jogadorUm(vetor_leitura_jogadorUm),
	.vetor_leitura_jogadorDois(vetor_leitura_jogadorDois),
	
	 //output
	.ready(ready), 
	.conflitoMemoria_out(conflitoMemoria_out),
	.conflitoBorda_out(conflitoBorda_out), 
	.wrep1(wrep1), 
	.wrep2(wrep2), 
	.vetor(vetor), 
	.addr_jogadorUm(addr_jogadorUm), 
	.addr_jogadorDois(addr_jogadorDois), 
	.conflito(conflito)
);

integer qtNavio;
integer x,y;
integer size = 0;


	initial
	begin
			clk =0;
			//enable =0;
			forever #25 clk = !clk;
	end
	
	
	initial
	begin
		/*//***** _Primeiro Teste de Bordas) *******	
		$display("Iserção do porta avião em 7,0"); 
		tipo = 1'b0;
		direcao = 1'b0;
		orientacao = 1'b0;
		x1 = 4'd7;
		y1 = 4'b0;
		jogador = 1'b0;
		
		vetor_leitura_jogadorUm = 64'b0;
		
		#100 enable = 1;
		
		
		//***** _Primeiro Teste de Memoria) *******
		#200 enable = 0;
		$display("Iserção do porta avião em 0,0"); 
		tipo = 1'b0;
		direcao = 1'b0;
		orientacao = 1'b0;
		x1 = 4'b1;
		y1 = 4'b1;
		jogador = 1'b0;
		
		vetor_leitura_jogadorUm = 64'b0;
		
		#500 enable = 1;

		//simulando conflito de memoria com a peça anterior
		#500 enable = 0;
		$display("Iserção do porta avião em 0,0"); 
		tipo = 1'b1;	
		direcao = 1'b0;
		orientacao = 1'b0;
		x1 = 4'b1;
		y1 = 4'b1;
		jogador = 1'b0;
		
		
		//vetor_leitura = 64'b0000000000000000001010001010100010100000100110001001000010001000;


		//simulação de sisercao das 12 posicoes
		#500 enable = 1;

		
		#500 enable = 0;
		$display("Iserção do porta avião em 0,0"); 
		tipo = 2'b10;	
		direcao = 1'b0;
		orientacao = 1'b0;
		x1 = 4'd3;
		y1 = 4'd3;
		jogador = 1'b0;
		
		
		//vetor_leitura = 64'b0000000000000000001010001010100010100000100110001001000010001000;

		#500 enable = 1;

		//simulação de sisercao das 12 posicoes
		if (validador.auxGravou == 1) begin
			$display("Teste essa aquiiiddddi"); 
		end
		
		#100 enable = 1;

		//comentea*/


		initMemoriaRam;

		//	******************************************	
		//  *           Teste Jogador UM             *
		//  ******************************************

		//       Inserção Submarino(Jogador Um)
		#20 enable =0;
		for(qtNavio = 0;qtNavio < 5 ;qtNavio = qtNavio +1)
		begin
			tipo = 3'b0;
			direcao = 1'b0;
			orientacao = 1'b0;

			geraPosicaoRandomico;

			jogador = 1'b0;
		
			#100
			enable = 1 ;

			#500 enable = 0 ;
		end

		//       Inserção Cruzador(Jogador Um)
		#50 enable =0;
		for(qtNavio = 0;qtNavio < 2 ;qtNavio = qtNavio +1)
		begin
			tipo = 3'b001;
			geraDirecaoRandomico;
			orientacao = 1'b0;

			geraPosicaoRandomico;

			jogador = 1'b0;
		
			#500 enable = 1;
		end


		//       Inserção Hidroaviao(Jogador Um)
		#50 enable =0;
		for(qtNavio = 0;qtNavio < 2 ;qtNavio = qtNavio +1)
		begin
			tipo = 3'b010;
			geraDirecaoRandomico;
			geraOrientacaoRandomico;

			geraPosicaoRandomico;

			jogador = 1'b0;
		
			#100 enable = 1;
		end


		//       Inserção Encouracado(Jogador Um)
		#50 enable =0;
		tipo = 3'b011;
		geraDirecaoRandomico;
		orientacao = 1'b0;

		geraPosicaoRandomico;

		jogador = 1'b0;
	
		#100 enable = 1;

		//       Inserção Porta-Aviões(Jogador Um)
		#50 enable =0;
		tipo = 3'b100;
		geraDirecaoRandomico;
		orientacao = 1'b0;
		geraPosicaoRandomico;
		jogador = 1'b0;
	
		#100 enable = 1;
	
	end
	


	/*
	***************************************************
	*    Always que simula a escrita na memoria       *
	***************************************************
	*/
	always
	begin
		#10
		if(wrep1)
		begin
		 	memoriaVectorJogadorUm[addr_jogadorUm] = vetor;
		 end

		if (wrep2) begin
		  	memoriaVectorJogadorDois[addr_jogadorDois] = vetor;
	    end 
		

	end


	/*
	***************************************************
	*    Always que simula a leitura da memoria       *
	***************************************************
	*/
	always
	begin
		#10
		vetor_leitura_jogadorUm = memoriaVectorJogadorUm[addr_jogadorUm];

		vetor_leitura_jogadorDois = memoriaVectorJogadorDois[addr_jogadorDois];

	end
	
	task initMemoriaRam;
	begin
		for(size = 0;size < 12; size = size +1)
		begin
			memoriaVectorJogadorUm[size] = 64'hffffffffffffffff;
			memoriaVectorJogadorDois[size] = 64'hffffffffffffffff;
		end
	end
	endtask

	task geraPosicaoRandomico;
	begin
		//#20
		x1 = $urandom%7;
		y1 = $urandom%7;
	end
	endtask
	

	task geraDirecaoRandomico;
	begin
		//#20
		direcao = $urandom%1;
	end
	endtask

	task geraOrientacaoRandomico;
	begin
		//#20
		orientacao = $urandom%3;
	end
	endtask
	
	
endmodule