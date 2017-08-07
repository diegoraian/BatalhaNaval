module ControladoMemoria_tb;

reg clk;
reg resetGeral;

//Dado lido da memoria
reg [63:0] data_memoria_jogadorUm; //Leitura da memoria jogador 1 ou 2
reg [63:0] data_memoria_jogadorDois; //Leitura da memoria jogador 1 ou 2

//reg do Validador faz leitura de toda memoria e escreve em uma posição.
reg readyValidador;
reg validador_wrep1;
reg validador_wrep2;
reg validadoJogador;
reg [4:0] validador_addr;
//reg [4:0] validador_writeaddr;
reg [63:0] validador_data; // dado a ser inserido na memoria

//reg de Colisor. Faz leitura de apenas uma posição e escreve na msm posição
reg readyColisor;
reg colisor_wrep1;
reg colisor_wrep2;
reg jogadorColisor;
reg [4:0] colisor_addr;

reg [63:0] colisor_data;  //clear


//reg de Pontuação. Só faz leitura
reg readyCalculaPontuacao;
reg pontuacao_readaddr;
reg jogadorPontuacao;

//reg de VGA. Só faz leitura
reg [4:0] vga_readAddr;
reg jogadorVGA;


//output reg [63:0] data; // Dado q irá ser salvo na memoria do colisor e Validador
wire  [63:0] dataReadValidador; //data leitura do validador
wire  [63:0] dataReadColisor;   //data leitura do colisor
wire  [63:0] dataReadVGA;			 //data leitura da VGA
wire  [63:0] data;               //conencta com a memoria a e b 
wire  [4:0]  addr; 				 //endereço de leitura ou escrita
wire   wrenP1;
wire   wrenP2;


ControladoMemoria controladoMemoria(
	 .clk(clk),
	 .resetGeral(resetGeral),
	
	 .data_memoria_jogadorUm(data_memoria_jogadorUm), //Leitura da memoria jogador 1 ou 2
	 .data_memoria_jogadorDois(data_memoria_jogadorDois), //Leitura da memoria jogador 1 ou 2
	
	 .readyValidador(readyValidador),
	 .validador_wrep1(validador_wrep1),
	 .validador_wrep2(validador_wrep2),
	 .validadoJogador(validadoJogador),
	 .validador_addr(validador_addr),
	 .validador_data(validador_data),
	
	// de Colisor. Faz leitura de apenas uma posição e escreve na msm posição
	 .readyColisor(readyColisor),
	 .colisor_wrep1(colisor_wrep1),
	 .colisor_wrep2(colisor_wrep2),
	 .jogadorColisor(jogadorColisor),
	 .colisor_addr(colisor_addr),
	 .colisor_data(colisor_data),  //clear

	
	// de Pontuação. Só faz leitura
	 .readyCalculaPontuacao(readyCalculaPontuacao),
	 .pontuacao_readaddr(pontuacao_readaddr),
	 .jogadorPontuacao(jogadorPontuacao),
	
	// de VGA. Só faz leitura
	 .vga_readAddr(vga_readAddr),
	 .jogadorVGA(jogadorVGA),
	

	//output reg [63:0] data; // Dado q irá ser salvo na memoria do colisor e Validador
	 .dataReadValidador(dataReadValidador), //data leitura do validador
	 .dataReadColisor(dataReadColisor),   //data leitura do colisor
	 .dataReadVGA(dataReadVGA),			 //data leitura da VGA
	 .data(data),               //conencta com a memoria a e b 
	 .addr(addr), 				 //endereço de leitura ou escrita
	 .wrenP1(wrenP1),
	 .wrenP2(wrenP2)

	);

reg [63:0] memoriaVectorJogadorUm[10:0] ; // Memoria para jogador Um
reg [63:0] memoriaVectorJogadorDois[10:0] ; //Memoria para jogador Dois
integer memoriaInd, size;


	initial
	begin
			clk =0;
			//enable =0;
			forever #25 clk = !clk;
	end


	initial
	begin
		initMemoriaRam;

		#100
		leituramemoriaVga;

		#200
		leituraMemoriaValidador;

		#200
		escritaMemoriaValidador;


	end



	/*
	***************************************************
	*    Always que simula a escrita na memoria       *
	***************************************************
	*/
	always
	begin
		#10
		case ({validador_wrep1,validador_wrep2,colisor_wrep1,colisor_wrep2})


		4'b1xxx: memoriaVectorJogadorUm[validador_addr] = validador_data;
		4'bx1xx: memoriaVectorJogadorDois[validador_addr] = validador_data;
		4'bxx1x: memoriaVectorJogadorUm[colisor_wrep1] = colisor_data;
		4'bxxx1: memoriaVectorJogadorDois[colisor_wrep2] = colisor_data;

		endcase
		
		
	end




//criar uma task pra iniciar leitura vga;
task leituramemoriaVga;
	begin
			for(memoriaInd = 0 ; memoriaInd<12 ; memoriaInd = memoriaInd + 1 )
			begin
				#50
				vga_readAddr = memoriaInd;
				jogadorVGA   = 0;
			end
	end
endtask




// criar uma task pra validacao
task leituraMemoriaValidador;
	begin

			readyValidador = 1'b1;
			#10	
			validadoJogador= 1'b0;
			for(memoriaInd = 0 ; memoriaInd<12 ; memoriaInd = memoriaInd + 1 )
			begin
				#50	
				validador_addr = memoriaInd;
				
				data_memoria_jogadorUm =  memoriaVectorJogadorUm[memoriaInd];
			end

			readyValidador = 1'b0;
			
	end
endtask

task escritaMemoriaValidador;
	begin

			readyValidador = 1'b1;
			#10	
			validadoJogador= 1'b0;

			memoriaInd = $urandom%11;

			validador_data = 64'hffffffffffffffff;
			
			//memoriaVectorJogadorUm[memoriaInd] = validador_data;

			validador_wrep1 = 1;

			#200
			readyValidador = 1'b0;
			validador_wrep1 = 0;
	end
endtask

//criar uma task para colisor
always 
begin
	#10
	data_memoria_jogadorUm = memoriaVectorJogadorUm[addr];

	data_memoria_jogadorDois = memoriaVectorJogadorDois[addr];
end

task initMemoriaRam;
	begin
		for(size = 0;size < 12; size = size +1)
		begin
			//memoriaVectorJogadorUm[size] = 64'hffffffffffffffff;
			memoriaVectorJogadorUm[size] = 64'b0;
			
			//memoriaVectorJogadorDois[size] = 64'hffffffffffffffff;
			memoriaVectorJogadorDois[size] = 64'b0;
		end
	end
	endtask

endmodule