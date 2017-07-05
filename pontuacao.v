module pontuacao ( 
	input clk,
	input enabled,
	input  [35:0] dadosA,
	input  [35:0] dadosB,
	output reg [3:0] enderecoMemo =  4'b0000,
	output reg [3:0] pontuacaoA  = 4'b0000,
	output reg [3:0] pontuacaoB = 4'b0000 );

	
	
always @ (posedge enabled )
begin
	
end

always @ (posedge clk )
begin 
	if (enabled) begin
		enderecoMemo = enderecoMemo + 4'b0001;
	end
	
	//VerificaSubmarino
	
	
	
end 

//assign 

endmodule

