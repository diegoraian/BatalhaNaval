/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.20
-- Input file was: ..\..\..\pixelgen.vhd
-- Command line was: D:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\pixelgen.vhd -ncc
-- Date Created: Sun Aug 06 15:25:35 2017

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


module Pixelgen_compilado_quartus (
   RESET,
   F_CLOCK,
   F_ON,
   F_ROW,
   F_COLUMN,
   R_OUT,
   G_OUT,
   B_OUT);
 

input   RESET; 
input   F_CLOCK; 
input   F_ON; 
input   [9:0] F_ROW; 
input   [10:0] F_COLUMN; 
output   R_OUT; 
output   G_OUT; 
output   B_OUT; 

reg     R_OUT; 
reg     G_OUT; 

//  Componente B
reg     B_OUT; 

// Coordenadas X e Y do pixel atual
wire    [9:0] pix_x; 

// Endereço que será acessado na memória de caracteres
wire    [9:0] pix_y; 
wire    [10:0] rom_addr; 

// Código ASCII do caractere atual (parte do endereço)
wire    [6:0] char_addr; 

// Parte do caractere (0~15) que está sendo exibida na linha atual Y
wire    [3:0] row_addr; 

// Pixel relativo a coordenada X atual
wire    [2:0] bit_addr; 

// Conteúdo armazenado no endereço indicado por 'rom_addr'
wire    [7:0] font_word; 

// Valor do bit 'bit_addr' na palavra 'font_word'
wire    font_bit; 

// Valor das componentes rgb
wire    [2:0] font_rgb; 

// Flag que indica se a frase deve ser exibida
wire    txt_on; 

//  Coordenadas XY atuais

assign pix_x = F_COLUMN[9:0]; 
assign pix_y = F_ROW; 

//  Memória dos caracteres
font_rom font_unit (.clk(~F_CLOCK),
          .addr(rom_addr),
          .data(font_word));
assign row_addr = pix_y[3:0]; 
//  Determinação do endereço que será acessado
assign rom_addr = {char_addr, row_addr}; 
assign txt_on = pix_x >= 320 & pix_x <= 455 & 
      (pix_y >= 292 & pix_y <= 305) ? 1'b 1 : 
	1'b 0; 

//  p
//  o
//  r
//  t
//  a
//  l
// 
//  e
//  m
//  b
//  a
//  r
//  c
//  a
//  d
//  o
//  s
assign bit_addr = ~pix_x[2:0]; 
assign font_bit = font_word[
TO_INTEGER(bit_addr)]; 
assign font_rgb = font_bit === 1'b 1 ? 3'b 111 : 
	3'b 000; 

always @(F_ON or font_rgb or txt_on)
   begin : process_1
   if (F_ON === 1'b 0 | txt_on === 1'b 0)
      begin
      R_OUT <= 1'b 0;   
      G_OUT <= 1'b 0;   
      B_OUT <= 1'b 0;   
      end
   else
      begin
      R_OUT <= font_rgb[0];   
      G_OUT <= font_rgb[1];   
      B_OUT <= font_rgb[2];   
      end
   end

assign char_addr = pix_x[7:3] === 5'b 01000 ? 7'b 1110000 : 
	pix_x[7:3] === 5'b 01001 ? 7'b 1101111 : 
	pix_x[7:3] === 5'b 01010 ? 7'b 1110010 : 
	pix_x[7:3] === 5'b 01011 ? 7'b 1110100 : 
	pix_x[7:3] === 5'b 01100 ? 7'b 1100001 : 
	pix_x[7:3] === 5'b 01101 ? 7'b 1101100 : 
	pix_x[7:3] === 5'b 01110 ? 7'b 0000000 : 
	pix_x[7:3] === 5'b 01111 ? 7'b 1100101 : 
	pix_x[7:3] === 5'b 10000 ? 7'b 1101101 : 
	pix_x[7:3] === 5'b 10001 ? 7'b 1100010 : 
	pix_x[7:3] === 5'b 10010 ? 7'b 1100001 : 
	pix_x[7:3] === 5'b 10011 ? 7'b 1110010 : 
	pix_x[7:3] === 5'b 10100 ? 7'b 1100011 : 
	pix_x[7:3] === 5'b 10101 ? 7'b 1100001 : 
	pix_x[7:3] === 5'b 10110 ? 7'b 1100100 : 
	pix_x[7:3] === 5'b 10111 ? 7'b 1101111 : 
	pix_x[7:3] === 5'b 11000 ? 7'b 1110011 : 
	7'b 0000000; 

endmodule

