module VGA_Submarino
(
	//inputs
	clk,
	areaAtiva,
	linha,
	coluna,
	lineLeft,
	lineRight,
	colUp,
	colDown,
	
	//output
	rgb_r,
	rgb_g,
	rgb_b

);

input clk,areaAtiva;
input [9:0] linha;
input [9:0] coluna;
input [9:0]	lineLeft;
input [9:0]	lineRight;
input [9:0] colDown;
input [9:0] colUp;

output rgb_r, rgb_g , rgb_b;




//reg [9:0]pix_x,[9:0]pix_y;


//reg [10:0] rom_addr;  // endereço completo a ser armazenado [10:4] char e [3:0] as linhas do caracter

//reg [6:0]  char_addr; // armazena o endereço dos caracteres que sera acessado pela memoria ram.

//reg [3:0]  row_addr;  // endereço correspondente a linha de representaçao do caracter   char_addr + row_add = rom_add

//reg [2:0]  bit_addr;  // bit de contagem de coluna(x)

//reg [7:0]  font_word; // quarda o q vem da memoria

//reg [2:0]  font_rgb;	 // vetor de cores. cada bit uma cor.

//reg text_on;          // indica a área para ser impresso o texto

//ROM_Chars memoria_rom(.address(rom_addr), .clock(clk), .q(font_word));

//assign text_on = ((linha >=224 && linha<=240) && (coluna>= 288 && coluna <=352) ) ? 1'b1:0'b0; // Primeira Linha(-> P1 x P2)
//assign text_on = ((linha >=241 && linha<=257) && (coluna>= 232 && coluna <=248 ) ) ? 1'b1:0'b0; // Primeira Linha(-> P1 x CPU)

//always @(posedge clock) begin
//end




					//linhas verticais do mapa
assign rgb_b =

					((linha >lineLeft && linha < lineRight)&& (coluna >colDown && coluna < colUp))? 1'b1:
					1'b0
					;
					
assign rgb_r = 1'b0;

assign rgb_g = 1'b0;


endmodule
