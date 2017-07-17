/* Modulo de Gerenciamento de Colisao */
/*
  Anotações:
  
  - Verifica o acerto de tiro na embarcação inimiga
  
  - Exclui da memória caso a coordenada seja encontrada
  
  
  --------------------------------------------------------
*/

module Colisor
(
  /*
  
   @param clk - clock do sistema
   @enable    - habilita o módulo
   @param x   - coordenad x do tiro
   @param y   - coordenad y do tiro
   @param memoriaP1 - vetor de coordenadas lido da memoria do player 1
	 @param memoriaP2 - vetor de coordenadas lido da memoria do player 2
	 @param jogador - Jogador que atirou
    
  */
  enable, x, y, clk, jogador, memoriaP1, memoriaP2,
  
  /*
  
  	@param ready - passa a atribuicao de volta ao módulo que o chamou
    @param hit - se a posicao verificada ja existe na memoria tiro eh 1, se nao conflito eh 0 
    @param wrep1 - write enable player 1
    @param wrep2 - write enable player 2
    @param tiro - vetor de saída com a coordenada do tiro
    @param addr - endereço para ler na memoria
	  @param clear - vetor que ira substituir por zero um endereco ja atingido em memoriaP1 ou  memoriaP2

	 
  */
  ready, hit, wrep1, wrep2, tiro, addr, clear
);


/*

Vetor lido da memoria
[0-2(tipo), 3-44(posições), 45-47(Peças disponiveis na embarcacao)]
O resto das posicoes, de 48 a 64 sao vazias, com 0
Ex.: Porta aviões inicia com 5 peças, caso chegue a zero todas as embarcações são destruidas.

*/
input [63:0] memoriaP1;
input [63:0] memoriaP2;
input clk, enable; 
input [3:0] x;
input [3:0] y;
input jogador;

output reg ready;
output reg hit;
output reg wrep1;
output reg wrep2;
output reg [7:0] tiro;
output reg [4:0] addr;
output reg [7:0] clear;



always @ (posedge clk or negedge enable) begin		
	
	if (enable == 0) begin
		addr = 5'd0;
	end else begin
		if (addr == 5'd11) begin	// se endereco chegou ao ultimo
			addr = 5'd0;						// zera o endereco
			ready = 1'b1;						// informa que terminou a tarefa
		end else begin
			addr = addr + 5'd1;			// incrementa o endereço para verificar na memoria. Em um total de 11 pulsos de clock ele verifica a memoria inteira
		end

		if(hit == 1'b1) begin
			if(jogador == 0) begin
				wrep1 = 1'b1;				// habilita a escrita na memoria
			end else begin
				wrep2 = 1'b1;				// habilita a escrita na memoria
			end
		end else begin
			wrep1 = 1'b0;					// desabilita escrita em memoria
			wrep2 = 1'b0;					// desabilita escrita em memoria
		end
	
		if((wrep1 == 1'b1) || (wrep2 == 1'b1)) begin			// se escrita eh permitida
			addr = addr - 5'd1;										// seta o endereco para o ultimo cujo tiro atingiu
			clear = 8'b00000000;										// insere vetor clear na posicao de memoria a ser apagada
			ready = 1'b1;												// informa que terminou a tarefa
		end
	end
end


/*Buscar na memoria todas os vetores e verificar se a posição ja esta ocupada */

always @(enable or addr) begin
		
	if((enable == 1) && (hit == 0)) begin
		tiro[3 -:4] = x;
		tiro[6 -:4] = y;
		
		if(jogador == 0) begin				// Se for o player 1
      case (tiro[7 -:8])
			
				memoriaP1[10 -:8]:
				begin
					hit = 1'b1;					// Seta o tiro para player 1
				end
					
        memoriaP1[18 -:8]:
				begin
					hit = 1'b1;
				end
					
        memoriaP1[26 -:8]:
				begin
					hit = 1'b1;
				end
					
        memoriaP1[34 -:8]:
				begin
					hit = 1'b1;
				end
					
        memoriaP1[44 -:8]:
				begin
					hit = 1'b1;
				end
			
				default:
				begin
					hit = 1'b0;
				end
			endcase
			
		end else if(jogador == 1) begin			// Se for o player 2
			case (tiro[7 -:8])
			
				memoriaP2[10 -:8]:
				begin
					hit = 1'b1;							// Seta o tiro para player 2
				end
					
        memoriaP2[18 -:8]:
				begin
					hit = 1'b1;
				end
					
        memoriaP2[26 -:8]:
				begin
					hit = 1'b1;
				end
					
        memoriaP2[34 -:8]:
				begin
					hit = 1'b1;
				end
					
        memoriaP2[44 -:8]:
				begin
					hit = 1'b1;
				end
			
				default:
				begin
					hit = 1'b0;
				end
					
			endcase
		end
				
	end

	else begin											// caso enable nao esteja habilitado
		hit = 1'b0;
    tiro[3 -:4] = 4'd0;
    tiro[7 -:4] = 4'd0;
	end
end
  
endmodule

