module Validador_tb;

reg enable,clk,direcao,jogador;
reg [2:0] tipo;
reg [2:0] orientacao;
reg [3:0] x1;
reg [3:0] y1;
reg [63:0] vetor_leitura;

wire conflitoMemoria_out;
wire conflitoBorda_out;
wire conflito;  
wire wrep1;
wire wrep2;
wire [63:0]vetor;        
wire [4:0] write_addr;         //Endereco para armazenar na memoria
wire [4:0] read_addr;   // contaria as 11 posicoes verificando se ha conlfito de posições na memoria
wire ready;


Validador validador(
	//input
	.enable(enable),
	.tipo(tipo),
	.direcao(direcao),
	.orientacao(orientacao),
	.x1(x1),
	.y1(y1),
	.clk(clk), 
	.jogador(jogador),
	.vetor_leitura(vetor_leitura),
	
	 //output
	.ready(ready), 
	.conflitoMemoria_out(conflitoMemoria_out),
	.conflitoBorda_out(conflitoBorda_out), 
	.wrep1(wrep1), 
	.wrep2(wrep2), 
	.vetor(vetor), 
	.read_addr(read_addr), 
	.write_addr(write_addr), 
	.conflito(conflito)
);


	initial
	begin
			clk =0;
			enable =0;
			forever #10 clk = !clk;
	end
	
	
	initial
	begin
		//***** _Primeiro Teste de Bordas) *******	
		$display("Iserção do porta avião em 7,0"); 
		tipo = 1'b0;
		direcao = 1'b0;
		orientacao = 1'b0;
		x1 = 4'd7;
		y1 = 4'b0;
		jogador = 1'b0;
		
		vetor_leitura = 64'b0;
		
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
		
		vetor_leitura = 64'b0;
		
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
		
		//c
		vetor_leitura = 64'b0000000000000000001010001010100010100000100110001001000010001000;
		
		#100 enable = 1;



	
	end
	
	always
	begin 
		#5
		if(conflitoMemoria_out == 1) begin
			$display("Conflito de Memoria "); 
			
		end

		if(conflitoBorda_out == 1) begin
			$display("Conflito de Bordas "); 
			
		end

	end
	

	
	//initial
	//begin
	//	$display("\t\ttime,\tclk,\tenable"); 
	//	$monitor("%d,\t%b,\t%b",$time,clk,enable); 
	//end

	//initial
		//#100  $finish; 

	
endmodule