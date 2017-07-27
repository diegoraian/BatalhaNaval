module VGA_MapaGame
(
	//inputs
	clk,
	areaAtiva,
	linha,
	coluna,
	
	//output
	rgb_r,
	rgb_g,
	rgb_b

);

input clk,areaAtiva;
input [9:0] linha;
input [9:0] coluna;


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
assign rgb_b = ((coluna >20 && coluna < 30) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >95 && coluna < 105) && (linha> 40 && linha <440 ))? 1'b1:
					((coluna >170 && coluna < 180) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >245 && coluna < 235) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >320 && coluna < 330) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >395 && coluna < 405) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >470 && coluna < 480) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >545 && coluna < 555) && (linha> 40 && linha <440 )) ? 1'b1:
					((coluna >620 && coluna < 630) && (linha> 40 && linha <440 )) ? 1'b1:
					//linhas horizontais do mapa 
					((linha >40 && linha < 50) && (coluna >20 && coluna < 620))? 1'b1:
					((linha >90 && linha < 100)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >140 && linha < 150)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >190 && linha < 200)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >240 && linha < 250)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >290 && linha < 300)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >340 && linha < 350)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >390 && linha < 400)&& (coluna >20 && coluna < 620))? 1'b1:
					((linha >440 && linha < 450)&& (coluna >20 && coluna < 620))? 1'b1:
					1'b0
					;
					
assign rgb_r = 1'b0;

assign rgb_g = 1'b0;


endmodule
