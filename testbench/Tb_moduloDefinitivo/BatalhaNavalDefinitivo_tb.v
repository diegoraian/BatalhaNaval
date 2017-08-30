module BatalhaNavalDefinitivo_tb;

reg clk;
reg enable;
reg reset;
reg enter;
reg select;
reg mode;
reg sw10;
reg sw11;
reg sw12;
reg sw13;
reg sw14;
reg sw15;
reg sw16;
reg sw17;
reg pll_clk;
reg [63:0] data_memoria_dois;
reg [63:0] data_memoria_um;

wire conflitoMemoria;
wire conflitoBorda;
wire VGA_CLK;
wire rgb_r;
wire rgb_g;
wire rgb_b;
wire H_SYNC;
wire V_SYNC;
wire estado1;
wire estado2;
wire estado3;
wire estado4;
wire estado5;
wire estado6;
wire wren_p1;
wire wren_p2;
wire [4:0] addr_memoria;
wire [63:0] data_memoria_salvar;




BatalhaNavalDefinitivo DUT(
	.clk(clk),
	.enable(enable),
	.reset(reset),
	.enter(enter),
	.select(select),
	.mode(mode),
	.sw10(sw10),
	.sw11(sw11),
	.sw12(sw12),
	.sw13(sw13),
	.sw14(sw14),
	.sw15(sw15),
	.sw16(sw16),
	.sw17(sw17),
	.pll_clk(pll_clk),
	.data_memoria_dois(data_memoria_dois),
	.data_memoria_um(data_memoria_um),

	.conflitoMemoria(conflitoMemoria),
	.conflitoBorda(conflitoBorda),
	.VGA_CLK(VGA_CLK),
	.rgb_r(rgb_r),
	.rgb_g(rgb_g),
	.rgb_b(rgb_b),
	.H_SYNC(H_SYNC),
	.V_SYNC(V_SYNC),
	.estado1(estado1),
	.estado2(estado2),
	.estado3(estado3),
	.estado4(estado4),
	.estado5(estado5),
	.estado6(estado6),
	.wren_p1(wren_p1),
	.wren_p2(wren_p1),
	.addr_memoria(addr_memoria),
	.data_memoria_salvar(data_memoria_salvar)
);

reg [63:0] memoriaVectorJogadorUm[10:0] ; // Memoria para jogador Um
reg [63:0] memoriaVectorJogadorDois[10:0] ; //Memoria para jogador Dois
integer memoriaInd, size;

	/***************************
	 *     iNICIA CLK_PLACA	   *
	 ***************************/
	initial
	begin
			clk =0;
			//enable =0;
			forever #25 clk = !clk;
	end


	/***************************
	 *     iNICIA CLK_PLLL	   *
	 ***************************/
	initial
	begin
			 pll_clk=0;
			//enable =0;
			forever #50 pll_clk = !pll_clk;
	end


	/********************************
	 *      iNICIA CONFIGURAÇÕES	*
	 ********************************/
	initial
	begin
			 enable = 1'b1;
			 reset = 1'b1;
			 mode  = 1'b0;
			 sw10  = 1'b0;
			 sw11  = 1'b0;
			 sw12  = 1'b0;
			 sw13  = 1'b0;
			 sw14  = 1'b0;
			 sw15  = 1'b0;
			 sw16  = 1'b0;
			 sw17  = 1'b0;
	end


	initial
	begin
		initMemoriaRam;


		#2000
		ativaEnter;

		#200
		ativaEnter;

		#50
		sw10 = 1'b1;


		#200
		ativaEnter;

		#50
		sw10 = 1'b0;

		sw15 = 1'b1;



		#200
		ativaEnter;

		//#100
		//leituramemoriaVga;

		//#200
		//leituraMemoriaValidador;

		//#200
		//escritaMemoriaValidador;


	end






	/*
	***************************************************
	*    Always que simula a escrita na memoria       *
	***************************************************
	*/
	always
	begin
		#10

		if(!wren_p1 && !wren_p2)
		begin
			data_memoria_um = memoriaVectorJogadorUm[addr_memoria];
			data_memoria_dois = memoriaVectorJogadorDois[addr_memoria];
		end
		
		
	end


	// /*
	// ***************************************************
	// *    Always que simula a escrita na memoria       *
	// ***************************************************
	// */
	// always
	// begin
	// 	#10
	// 	case ({validador_wrep1,validador_wrep2,colisor_wrep1,colisor_wrep2})


	// 	4'b1xxx: memoriaVectorJogadorUm[validador_addr] = validador_data;
	// 	4'bx1xx: memoriaVectorJogadorDois[validador_addr] = validador_data;
	// 	4'bxx1x: memoriaVectorJogadorUm[colisor_wrep1] = colisor_data;
	// 	4'bxxx1: memoriaVectorJogadorDois[colisor_wrep2] = colisor_data;

	// 	endcase
		
		
	// end




//criar uma task pra iniciar leitura vga;





// criar uma task pra validacao







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
endmodule