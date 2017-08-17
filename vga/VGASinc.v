/*
		Dados da Vga:
		- Resolução:            640 x 480.
		- frequência clock pll:     25mhz.
		
		Pixels Horizontal:(Clks)
		Área ativa:   640.(A)
		FrontPorch:    16.(B)
		Sync(H_sync):  96.(C)
		BackPorch:     48.(D)
		-------------------
	total(Pixels):   800.
		
		
		Pixels Vertical:(Linhas)
		Área ativa:   480.(E)
		FrontPorch:    11.(F)
		Sync(V_sync):   2.(G)
		BackPorch:     31.(H)
		-------------------
	total(linhas):   524.
	
	
	
	Será necessário a utilização de contadores para se delimitar em que posição da linha e ativar 
	em 0 o h_sinc e o v_sinc:
	
	-coutHorizonta [9:0]( até 1024 mas ira apenas até a 799).
	(0 - 639)   Area ativa.
	(639 - 655) FrontPorch.
	(655 - 751) Sync(h_sync eh colocado em 0 nesse intervalo).
	(751 - 799) BackPorch.
	
	-coutVertical [9:0]( até 1024 mas ira apenas até 523).
	(0 - 479)   Area ativa.
	(479 - 490) FrontPorch.
	(490 - 492) Sync(h_sync eh colocado em 0 nesse intervalo).
	(492 - 523) BackPorch.
	
	
	
*/








module VGASinc
#(

  parameter TOTALLINHAS = 524,
  parameter LINHASATIVAS = 480,

  parameter TOTALCOLUNAS = 800,
  parameter COLUNASATIVAS = 640

)
(
	reset,
	clk,         //Clock de entrada da PLL(25mhz)
	h_sync,	    //sinal de controle da vga:h_sync
	v_sync,	    //sinal de controle da vga:v_sync
	linha,       //indice da linha
	coluna,      //indice da coluna
	regiaoAtiva  //inidica se esta na regiao ativa do frame
);


parameter A = 640; //área ativa
parameter B =  16; //FrontPorch
parameter C =  96; //Sync(H_sync)
parameter D =  48; //BackPorch

parameter E = 480; //área ativa
parameter F =  11; //FrontPorch
parameter G =   2; //Sync(H_sync)
parameter H =  31; //BackPorch

input reset, clk;

output h_sync,v_sync,regiaoAtiva;
output reg [9:0] linha = 10'b0;
output reg [9:0] coluna = 10'b0;



wire H_localA ; //Indica se o contador Horizontal esta em A(área ativa)
wire H_localB ; //Indica se o contador Horizontal esta em B(FrontPorch) 
wire H_localC ; //Indica se o contador Horizontal esta em C(Sync(H_sync))
wire H_localD ; //Indica se o contador Horizontal esta em D(BackPorch)
wire h_sync_next;
reg  h_sync_prev = 1'b1;

wire V_localE ; //Indica se o contador Horizontal esta em A(área ativa)
wire V_localF ; //Indica se o contador Horizontal esta em B(FrontPorch) 
wire V_localG ; //Indica se o contador Horizontal esta em C(Sync(H_sync))
wire V_localH ; //Indica se o contador Horizontal esta em D(BackPorch)
wire v_sync_next;
reg  v_sync_prev = 1'b1;

//Comparações

//----------------    Horizontal   ---------------
assign H_localA = (coluna == A-1) ?  1'b1 : 1'b0 ;

assign H_localB = (coluna == (A+B)-1) ?  1'b1 : 1'b0 ;

assign H_localC = (coluna == (A+B+C)-1) ?  1'b1 : 1'b0 ;

assign H_localD = (coluna == (A+B+C+D)-1) ?  1'b1 : 1'b0 ;


//----------------    Vertical  --------------------

assign V_localE = (linha == E-1) ?  1'b1 : 1'b0 ;

assign V_localF = (linha == (E+F)-1) ?  1'b1 : 1'b0 ;

assign V_localG = (linha == (E+F+G)-1) ?  1'b1 : 1'b0 ;

assign V_localH = (linha == (E+F+G+H)-1) ?  1'b1 : 1'b0 ;




always @(posedge clk)
begin
	if(!reset)begin
		linha <= 0;
		coluna <= 0;
		h_sync_prev <=0;
	end
	else begin
		if(coluna == TOTALCOLUNAS - 1)begin
		
			if(linha == TOTALLINHAS - 1)begin
				linha <= 0;
			end else begin
				linha <= linha + 1;
			end
			coluna <= 0;

		end else begin
			coluna <= coluna +1;
		end
	end


	h_sync_prev <= h_sync_next;
	v_sync_prev <= v_sync_next;
end




//
assign h_sync_next = (H_localB == 1 ) ? 1'b0: (H_localC == 1)? 1'b1: h_sync_prev ;

assign v_sync_next = (V_localF == 1) ? 1'b0: (V_localG == 1)? 1'b1 : v_sync_prev;


assign regiaoAtiva = ((coluna < A)&&(linha < E)) ? 1'b1 : 1'b0 ;





//----------    Sinais de Controle  ----------
assign h_sync = h_sync_prev ;
assign v_sync = v_sync_prev ;

endmodule	