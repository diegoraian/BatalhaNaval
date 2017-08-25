/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.20
-- Input file was: ..\..\..\..\OneDrive\1 - UFBA 5 semestre mexer aquiii\ENGG52 - Lab Integrado 1\PARA A ATIVIDADE 2\PARA O RELAT. TECNICO\modulo_principal_vhdl.vhd
-- Command line was: D:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\..\OneDrive\1 - UFBA 5 semestre mexer aquiii\ENGG52 - Lab Integrado 1\PARA A ATIVIDADE 2\PARA O RELAT. TECNICO\modulo_principal_vhdl.vhd -ncc
-- Date Created: Sun Aug 06 15:35:59 2017

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


module Principal_comp_quart (
   CLOCK_50,
   Reset,
   H_SYNC,
   V_SYNC,
   R,
   G,
   B);
 

input   CLOCK_50; 
input   Reset; 
output   H_SYNC; 
output   V_SYNC; 
output   R; 
output   G; 
output   B; 

reg     H_SYNC; 
reg     V_SYNC; 
reg     R; 
reg     G; 
reg     B; 

// Índice da linha/coluna atual
wire    [9:0] CURRENT_ROW; 
wire    [10:0] CURRENT_COLUMN; 
wire    DISP_ENABLE; 
wire    HSYNC; 
wire    VSYNC; 
wire    Rp; 
wire    Gp; 
wire    Bp; 

// Módulo de sincronismo

VGASinc VGA (.RESET(Reset),
          .F_CLOCK(CLOCK_50),
          .F_HSYNC(HSYNC),
          .F_VSYNC(VSYNC),
          .F_ROW(CURRENT_ROW),
          .F_COLUMN(CURRENT_COLUMN),
          .F_DISP_ENABLE(DISP_ENABLE));
			 
Pixelgen_compilado_quartus PIXELS (	
// Módulo para gerar os pixels
          .RESET(Reset),
          .F_CLOCK(CLOCK_50),
          .F_ON(DISP_ENABLE),
          .F_ROW(CURRENT_ROW),
          .F_COLUMN(CURRENT_COLUMN),
          .R_OUT(Rp),
          .G_OUT(Gp),
          .B_OUT(Bp));

always @(posedge CLOCK_50)
   begin : process_1
   V_SYNC <= VSYNC;   
   H_SYNC <= HSYNC;   
   R <= Rp;   
   G <= Gp;   
   B <= Bp;   
   end


endmodule // module Principal_novo_compilado_quartus

