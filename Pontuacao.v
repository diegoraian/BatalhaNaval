/* Modulo de Pontuaçao de Pecas */
/*
  Anotações:
  
  - Faz a ´pontuaçao para cada jogador
  - Verifica na memoria a cada ciclo de clk essa qtd
  - Leva 11 pulsos de clock para percorrer toda memoria
  
  --------------------------------------------------------
*/

module Pontuacao
(
  /*
	@param enable -  habilita o módulo
   @param clk - clock do sistema
   @param memoriaP1 - vetor de coordenadas lido da memoria do player 1
	@param memoriaP2 - vetor de coordenadas lido da memoria do player 2

  */
  enable, clk, memoriaP1, memoriaP2,
  
  /*
	@param ready - passa a atribuicao de volta ao módulo que o chamou
	@param pontuacao_P1 - pontuacao do player 1
	@param pontuacao_P2 - pontuacao do player 2
	@param addr - endereço para ler na memoria
  */
  ready, pontuacao_P1, pontuacao_P2, addr
);


input clk, enable; 
input [63:0] memoriaP1;
input [63:0] memoriaP2;

output reg ready;
output reg [3:0] pontuacao_P1;
output reg [3:0] pontuacao_P2;
output reg [4:0] addr;

/*Incrementa o endereco addr e habilit/desabilita o sinal de ready*/
always @ (posedge clk or negedge enable) begin

	if (!enable) begin

	//Nao faz nada
	end else begin
		if (addr == 5'd11) begin		// se endereco chegou ao ultimo
			addr = 5'd0;					// zera o endereco
			ready = 1'b1;					// informa que terminou a tarefa
		end else begin
			addr = addr + 5'd1;			// incrementa o endereço para verificar na memoria. Em um total de 11 pulsos de clock ele verifica a memoria inteira
		end
	end
end

/*Decrementa contador da qtd de embarcacoes*/
always @ ( posedge clk ) begin
	
	// if(enable) begin
	
        //Pontuação pra o Submarino
        if ((addr == 5'd0) || (addr == 5'd1) || (addr == 5'd2)  ||(addr == 5'd3)  || (addr == 5'd4)) begin
            if (memoriaP1[42-:40] == 40'd0) begin
                pontuacao_P1 = pontuacao_P1 + 4'd1;
            end else begin 
                pontuacao_P1 =  4'd0;
				end
				
            if (memoriaP2[42-:40] == 40'd0) begin
                pontuacao_P2 = pontuacao_P2 + 4'd1;
            end else begin
                pontuacao_P2 =  4'd0;
				end
        end
    //      //Pontuação pra o Cruzador
    //     if ((addr == 5'd5) || (addr == 5'd6 )) begin
    //         if (memoriaP1[42-:40] == 40'd0) begin
    //             pontuacao_P1 = pontuacao_P1 + 4'd2;
    //         end else begin 
    //             pontuacao_P1 =  4'd0;
	// 			end
				
    //         if (memoriaP2[42-:40] == 40'd0) begin
    //             pontuacao_P2 = pontuacao_P2 + 4'd2;
    //         end else begin
    //             pontuacao_P2 =  4'd0;
	// 			end
    //     end
    //      //Pontuação pra o Hidroaviao
    //     if ((addr == 5'd7) || (addr == 5'd8 )) begin
    //         if(memoriaP1[42-:40] == 40'd0) begin
    //             pontuacao_P1 = pontuacao_P1 + 4'd3;
    //         end else begin
    //             pontuacao_P1 =  4'd0;
	// 			end
    //         if(memoriaP2[42-:40] == 40'd0) begin
    //             pontuacao_P2 = pontuacao_P2 + 4'd3;
    //         end else begin
    //             pontuacao_P2 =  4'd0;
	// 			end
    //     end
	// 	//Pontuação pra o Encouraçado
    //     if (addr == 5'd9) begin
    //         if (memoriaP1[42-:40] == 40'd0) begin
    //             pontuacao_P1 = pontuacao_P1 + 4'd4;
    //         end else begin
    //             pontuacao_P1 =  4'd0;
	// 			end
    //         if (memoriaP2[42-:40] == 40'd0) begin
    //             pontuacao_P2 = pontuacao_P2 + 4'd4;
    //         end else begin
    //             pontuacao_P2 =  4'd0;
	// 			end
    //     end
    //     //Pontuação pra o Porta aviões
    //     if (addr == 5'd10) begin
    //         if (memoriaP1[42-:40] == 40'd0) begin
    //             pontuacao_P1 = pontuacao_P1 + 4'd5;
    //         end else begin
    //             pontuacao_P1 =  4'd0;
	// 		end
    //         if (memoriaP2[42-:40] == 40'd0) begin
    //             pontuacao_P2 = pontuacao_P2 + 4'd5;
    //         end else begin
    //             pontuacao_P2 =  4'd0;
	// 		end
    //     end
	// /* Apos enable ser desabilitado ele reseta as qtds para o valor original, no prox enable ele volta a contar*/
    // end else begin 
	// 	pontuacao_P1 = 4'd0;
	// 	pontuacao_P2 = 4'd0;
    // end
end
endmodule

