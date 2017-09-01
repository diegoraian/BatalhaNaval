
/*
 enter    m21    key[1] 
 select   n21    key[2] 
 enable   ac28   sw[1] 
 reset    ac26   sw[7] 
 mode     ac27   sw[2]






*/






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
wire wren_p1_geral;
wire wren_p2_geral;
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
	.wren_p1_geral(wren_p1_geral),
	.wren_p2_geral(wren_p2_geral),
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
		//submarino
		//direcao
		#2000
		ativaEnter;//1 ->2
		//orientacao
		#200
		ativaEnter;//2->3
		//x base
		#50
		sw10 = 1'b1;

		//confirma x
		#200
		ativaEnter;//3->4
		//retira x
		#50
		sw10 = 1'b0;
		//y base
		sw15 = 1'b1;
		//confirmar y base
		#1000
		ativaEnter;// 4->5
		//peça armazenada
		#5000
		ativaEnter;// 5->6

		
		sw10 = 1'b0;
		sw15 = 1'b0;
		//nova peça
		
			//submarino
		//direcao
		//orientacao
//**************************************************		

		#200
		ativaEnter;//6->1
		//x base
		//#50
		//sw10 = 1'b1;
		
		//confirma x
		#200
		ativaEnter;//1->2
		//retira x
		//#50
		//sw10 = 1'b0;
		//y base
		//sw15 = 1'b1;
		//confirmar y base

		#200
		ativaEnter;//2->3
		#50
		sw15 = 1'b0;
		sw10 = 1'b1;


		#200
		ativaEnter;//3->4
		#50
		sw10 = 1'b0;
		sw15 = 1'b1;

		#200
		ativaEnter;//4->5
		
		

		#2000
		ativaEnter;//5->3
		sw10 = 1'b0;
		sw12 = 1'b1;
		sw15 = 1'b0;
		//peça armazenada
		#200
		ativaEnter;//3->4
//***********************************************

		#200
		ativaEnter;//4->5
		//retira x
		//#50
		//sw10 = 1'b0;
		//y base
		//sw15 = 1'b1;
		//confirmar y base

		#5000
		ativaEnter;//5->6
		#50
		sw15 = 1'b0;
		sw12 = 1'b1;


		#200
		ativaEnter;//3->4
		#50
		sw12 = 1'b0;
		sw15 = 1'b1;

		#200
		ativaEnter;//4->5
		
		

		#5000
		ativaEnter;//5->6



		//#100
		//leituramemoriaVga;

		//#200
		//leituraMemoriaValidador;

		//#200
		//escritaMemoriaValidador;






	end






	/*
	***************************************************
	*    Always que simula a leitura na memoria       *
	***************************************************
	*/
	always
	begin
		#10

		if(!wren_p1_geral && !wren_p2_geral)
		begin
			data_memoria_um = memoriaVectorJogadorUm[addr_memoria];
			data_memoria_dois = memoriaVectorJogadorDois[addr_memoria];
		end
		
		
	end


	/*
	***************************************************
	*    Always que simula a escrita na memoria       *
	***************************************************
	*/
	always
	begin
		#10

		if(wren_p1_geral)
		begin
			memoriaVectorJogadorUm[addr_memoria] = data_memoria_salvar;
		end
		else begin
			if(wren_p2_geral)
			begin
				memoriaVectorJogadorDois[addr_memoria] = data_memoria_salvar;
			end
		end
		
		
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