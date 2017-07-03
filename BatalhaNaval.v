module BatalhaNaval(
  on,     // corresponde SW0:Liga ou desliga jogo (ON)
  reset,
  enter,
  select,
  mode,   //corresponde SW1: Chave para seleção do modo de jogo (MODE)
  clk,
);
  
  //Entradas     
  input on, reset, enter, select, mode, clk;
  
  
  wire ACERTOU_TIRO_DB;
  wire [2:0] COORD_TIROX_DB;
  wire [2:0] COORD_TIROY_DB;
  wire [2:0] ORIENTACAO_DB;
  wire DIRECAO_DB;
  wire COLISAO_DB;
  wire GWE_DB;
  wire WE_DB;
  wire [2:0] VALIDA_DB;
  
//  reg [3:0] coord_tiroX;
//  reg [3:0] coord_tiroX;
//  
//  reg enablePosicionandoPecas; //
//  reg enableExecucaoJogo;
//  
  
//  
//  
//  always@(on or mode or reset) begin
//		if(on == 1) begin
//			enablePosicionandoPecas = 1;
//		end
//
//  end
//  
//  
//  
//ExecutandoJogo jogo(
//  //input
//  start.(),
//  reset.(reset), 
//  enter.(enter), 
//  select.(select), 
//  mode.(mode), 
//  clk.(clk), 
//  acertou_tiro.(),
//  
//  //output
//  out.(), 
//  coord_tiroX.(),
//  coord_tiroY.(),
//  valida.()
// );
//
//  
//gerencimentoMapa mapa(
// //input
//  tipo.(),
//  direcao.(),
//  orientacao.(),
//  x1.(),
//  y1.(),
//  mode.(mode),
//  clk.(clok),
//  gwe.(),
//  valida(),
//  
//  //output
//  colisao.(),
//  we.(WE_DB)
//  
//  );
//  
//  posicionandoPecas posPecas(
// //Input
//  on.(enablePosicionandoPecas),
//  reset.(reset),
//  enter.(enter),
//  select.(select),
//  mode.(mode),
//  clk.(clk),
//  colisao.(),
//  
//  //output
//  start.(), //vai para o executando jogo
//  valida.(), 
//  tipo.(),
//  gwe.(),
//  X1.(), 
//  Y1.(), 
//  direcao.(), 
//  orientacao.()
//  );
//
//  mapaMemoria memJog1(
//   //input
//   clk.(clk), 
//   we.(WE_DB),
//   addr.(), 
//   value_in.(),
//   
//   //output 
//   value_out.()
//   
//  );
//  
//  mapaMemoria memJog2(
//     //input
//   clk.(clk), 
//   we.(WE_DB),
//   addr.(), 
//   value_in.(),
//   
//   //output 
//   value_out.()
//  );
 
  
endmodule
