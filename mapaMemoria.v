module mapaMemoria
(
  /*
  clk - clock que define o período de escrita e leitura
  @we - Write enable( Se true leitura, false escrita)
  @addr - Endereço de leitura ou escrita
  @value_in - Valor de entrada, o valor que será armazenado
  @value_out - Valor de saida, o valor que seár lido
  */
	clk, we, addr, value_in, value_out
);

input clk,we;
input [3:0] addr;
input [35:0] value_in;
output [35:0]value_out;

/* Vetor de 11 posições cada uma com 36 bits */
reg [35:0] memoriaVector[10:0];

/* Endereço de leitura - Onde quer ler no vetor */
reg [3:0] read_addr;

always@(posedge clk) begin
	if(we) begin
			memoriaVector[addr]  <= value_in;
		end
	read_addr <= addr;
end

assign value_out = memoriaVector[read_addr];


endmodule
