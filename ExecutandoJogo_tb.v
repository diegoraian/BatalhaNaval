module ExecutandoJogo_tb;
/*

Modulo para Test Bench do ExecutandoJogo

*/

reg enable;
reg reset;
reg enter;
reg select;
reg clk;
reg mode;
reg [3:0] posicao_rnd;
reg acertou_tiro;
reg [3:0] qtd_P1;
reg [3:0] qtd_P2;

wire ready;
wire [3:0] coord_tiroX;
wire [3:0] coord_tiroY;
wire [7:0] LEDR;
wire [7:0] LEDG;

ExecutandoJogo DUT(		//DUT - Device Under Test

	//Entradas
	.enable(enable), 
	.reset(reset), 
	.enter(enter), 
	.select(select), 
	.clk(clk), 
	.mode(mode), 
	.posicao_rnd(posicao_rnd), 
	.acertou_tiro(acertou_tiro), 
	.qtd_P1(qtd_P1), 
	.qtd_P2(qtd_P2),
	
	//Saidas
	.ready(ready), 
	.coord_tiroX(coord_tiroX), 
	.coord_tiroY(coord_tiroY), 
	.LEDR(LEDR), 
	.LEDG(LEDG)
);

initial
	clk = 1'b0;

always
	#10 clk= ~clk;

initial begin			// Controla o sinal de reset
	
	enable = 1'b1;
	reset = 1'b1;
	enter = 1'b1;
	select = 1'b1;
	mode = 1'b1;					//Modo Player vs Player
	
	posicao_rnd  = 4'b0000;
	acertou_tiro = 1'b0; 
	qtd_P1		 = 4'b1011;		// Cada Player comeca com 11 pecas
	qtd_P2		 =	4'b1011;

	/*Primeiro Teste - Tiro Certo o que ocorre?*/
	#40
	select = 1'b0;
	
	#40
	select = 1'b1;
	
	#40
	select = 1'b0;
	
	#40
	select = 1'b1; //Ao final, apertou select 2 vezes, esperamos que coord_X seja setado em 2
	
	#40
	enter = 1'b0;	// Confirmamos a coordenada com Enter
	
	#40
	enter = 1'b1;
	
	#40
	select = 1'b0;
	
	#40
	select = 1'b1;  //Ao final, apertou select 1 vez, esperamos que coord_Y seja setado em 1
	
	#40
	enter = 1'b0;	// Confirmamos a coordenada com Enter
	
	#40
	enter = 1'b1;	
	
	#10				//Espera prox borda de subida do clock
	acertou_tiro = 1'b1;
	
	#30
	enter = 1'b0;	// Apertou enter para Verificar certo
	
	#40
	enter = 1'b1;
	
	#40
	enter = 1'b0;
	
	#40
	enter = 1'b1;
	
	
	/*Segundo Teste -  Jogador Vencedor*/
	#40 $finish;		//Termina a simulacao
end

always
begin
	#10
	//$monitor("---------------------------\n");
	//$monitor($time, "Ready = %b\n", ready);
	$monitor($time, " \n Ready= %b \n X = %d \n Y =%d \n Verde= %b\n Vermelho = %b\n Tiro: %b\n Select = %b \n Enter %b \n-------------------------- \n",ready ,coord_tiroX, coord_tiroY,  LEDG, LEDR, acertou_tiro, select, enter);
	//$monitor($time, "Y = %d\n", coord_tiroY);
	//$monitor($time, "VERDE = %b\n", LEDR);
	//$monitor($time, "VERMELHO = %d\n", LEDG);
	//$monitor("---------------------------\n");
end


endmodule
