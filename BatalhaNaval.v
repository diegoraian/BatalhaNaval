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
  wire CONFLITO_DB;
  wire [3:0] POSICAORANDO_DB;
  wire [3:0] DIRECAORANDO_DB;

  wire ENABLEPOSICIONANDO;
  wire VALIDA;
  wire TIPO;
  wire JOGADOR;
  wire POSICAOBASE_x;
  wire POSICAOBASE_Y;
  wire POSICAO_DIRECAO;
  wire POSICAO_ORIENTACAO;
  
  wire 
  
  reg [3:0] coord_tiroX;
  reg [3:0] coord_tiroY;
  
  reg  enablePosicionandoPecas; //
  reg  enableExecucaoJogo;
  
  
  
  
  
  
  always@(on or mode or reset) begin
		if(on == 1) begin
			enablePosicionandoPecas = 1;
		end

  end
 

 
 
PosicionandoPecas posPecas(
 //Input
  .enable(enablePosicionandoPecas),
  .reset(reset),
  .enter(enter),
  .select(select),
  .mode(mode),
  .clk(clk),
  .conflito(CONFLITO_DB),
  .posicaoRandomico(POSICAORANDO_DB),
  .direcaoRandomico(DIRECAORANDO_DB),
  
  //output
  .ready(ENABLEPOSICIONANDO), //vai para o executando jogo
  .valida(VALIDA), // enable em validador
  .tipo(TIPO),
  .jogador(JOGADOR),
  .X1(POSICAOBASE_x), 
  .Y1(POSICAOBASE_Y), 
  .direcao(POSICAO_DIRECAO), 
  .orientacao(POSICAO_ORIENTACAO)
  );
  
  
  PosicionandoPecas_Random posPecasRandon(
  .enable(enablePosicionandoPecas),
  .reset(reset),
  .clk(clk),
  .direcao_rnd(),
  .posicao_rnd(),
  .orientacao_rnd(),
  .conflito(),
  
  //output
  .ready(), //vai para o executando jogo
  .valida(), 
  .tipo(),
  .jogador(),
  .X1(), 
  .Y1(), 
  .direcao(), 
  .orientacao()
  );
  
  
  
Validador validador(
 //input
  .enable(VALIDAR),
  .tipo(TIPO),
  .direcao(POSICAO_DIRECAO),
  .orientacao(POSICAO_ORIENTACAO),
  .x1(POSICAOBASE_x),
  .y1(POSICAOBASE_Y),
  .clk(clok),
  .jogador(),
  .vetor_leitura(),
  
  //output
  .ready(),
  .conflitoMemoria_out(),
  .conflitoMemoria_out(),
  .wrep1(),
  .wrep2(),
  .vetor(),
  .read_addr(),
  .write_addr(),
  .conflito(CONFLITO_DB)
  
  );
  
  
  
  
ExecutandoJogo jogo(
  //input
  .start(ENABLEPOSICIONANDO),
  .reset(reset), 
  .enter(enter), 
  .select(select), 
  .mode(mode), 
  .clk(clk), 
  .acertou_tiro(),
  
  //output
  .out(), 
  .coord_tiroX(),
  .coord_tiroY(),
  .valida()
 );
 
 
 
 Colisor colisor(
  //input
  .enable(),
  .x(reset), 
  .y(enter), 
  .clk(select), 
  .jogador(mode), 
  .memoriaP1(clk), 
  .memoriaP2(),
  
  //output
  .ready(), 
  .hit(),
  .wrep1(),
  .wrep2(),
  .tiro(),
  .addr(),
  .clear()
 );
  
endmodule

