module VGA_Encouracao_TB;

//input
reg clk,areaAtiva,linha,coluna,posicoesEmbarcacao;

//output
wire [2:0] rgb_r;
wire [2:0] rgb_g;
wire [2:0] rgb_b;  

VGA_Encouracado DUT
(
	//inputs
	.clk(clk),
	.areaAtiva(areaAtiva),
	.linha(linha),
	.coluna(coluna),
	.posicoesEmbarcacao(posicoesEmbarcacao), 
	
	//outputs
	.rgb_r(rgb_r),
	.rgb_g(rgb_g),
	.rgb_b(rgb_b)

);

    //Condições iniciais de execução
	initial
	begin
            clk = 0;
			rgb_r = 0;
			rgb_g = 0;
			rgb_b = 0;
			forever #25 clk = !clk;
	end
	
	//Simuçação do testBanch
	initial
	begin

		
	


	end



	// task ativaEnter;
	// begin
	// 	#20
	// 	enter = 1;
	// 	#20
	// 	enter = 0;
	// 	#20
	// 	enter = 1;
	// end
	// endtask

	// task ativaSelect;
	// begin
	// 	#20
	// 	select = 1;
	// 	#20
	// 	select = 0;
	// 	#20
	// 	select = 1;
	// end
	// endtask

	
	
endmodule