/* *
Objetivo: Busca os dados das embarcações na memória e dispoe nos 
        módulos que possuem as embarcacoes com as informações de cada posição de embarcação 
        os dados de linha e coluna do vga_sing 
        -Entradas
        @Linhas - Linha corrente do HSync
        @Colunas -  Coluna corrente do VSync
        @jogador - direciona para a memória que deve ser lida
        @clk (25 mhz)
        @clk50mhz (50 mhz) O acesso a memoria para direcionar as peças deve ser com o clock de 25 hz
        @dados - barramento de dados
        -- Saídas
        @dados - retorna a saída com os dados da embarcação sincronizados em 50mHz
        @enSubmarinoA - Habilita o submarino A
        @enSubmarinoB - Habilita o submarino B
        @enSubmarinoC - Habilita o submarino C
        @enSubmarinoD - Habilita o submarino D
        @enSubmarinoE - Habilita o submarino E
        @enCruzadorA  - Habilita o cruzador A 
        @enCruzadorB  - Habilita o cruzador B
        @enHidroaviaoA - Habilita o hidroaviao A
        @enHidroaviaoB  - Habilita o hidroaviao B
        @enEncouracadoA - Habilita o encouracao A
        @enPortaAvioes  -  Habilita o portaAvioes B; 
*/      

module VGA_rederiza_jogador(enabled,clk,clk50mhz,jogador,linha,coluna,posicoesEmbarcacao,endereco, wrenA,wrenB);
    input wire clk;
    input wire clk50mhz;
    input wire enabled;
    input [63:0] posicoesEmbarcacao;
    reg reset;
    reg [3:0] EA   =  4'b0000;
    reg [3:0] EF   =  4'b0001;
    output wire enSubmarinoA = 1'd1,
        enSubmarinoB = 1'd0,
        enSubmarinoC = 1'd0,
        enSubmarinoD = 1'd0,
        enSubmarinoE = 1'd0,
        enCruzadorA = 1'd0,
        enCruzadorB = 1'd0,
        enHidroaviaoA = 1'd0,
        enHidroaviaoB = 1'd0,
        enEncouracado  = 1'd0,
        enPortaAvioes = 1'd0;
    output wire [4:0] endereco = 5'd0;

    parameter   
        submarinoA = 4'd1,
        submarinoB = 4'd2,
        submarinoC = 4'd3,
        submarinoD = 4'd4,
        submarinoE = 4'd5,
        cruzadorA = 4'd6,
        cruzadorB = 4'd7,
        hidroaviaoA = 4'd8,
        hidroaviaoB = 4'd9,
        encouracado = 4'd10,
        portaAvioes = 4'd11;

//Seleciona qual memoria esta sendo acionada dependendo do jogador
always @ (posedge jogador) begin
    if(enabled) begin
        if (jogador) begin
            wrenA = 1'd1;
            wrenB = 1'd0;
        end else begin
            wrenA = 1'd0;
            wrenB = 1'd1;
        end
    end
end

//Controla o preenchimento dos registradores dos modulos de entrada
//e o fluxo de leitura na memória;
always @ (posedge clk50mhz) begin
    if(enabled) begin
        dados = posicoesEmbarcacao;
        if(EF == submarinoA) begin
            endereco = 0000;
            EA <= submarinoA;
        end else begin
            endereco =  endereco + 4'b0001;
            EA <= EF;
        end;
    case (EA)
        submarinoA:
            enPortaAvioes =  1'd0;
            enSubmarinoA =  1'd1;
            EF <= submarinoB;
        submarinoB:
            enSubmarinoA = 1'd0;
            enSubmarinoB =  1'd1;
            EF <= submarinoC;
        submarinoC:
            enSubmarinoB = 1'd0;
            enSubmarinoC =  1'd1;
            EF <= submarinoD;
        submarinoD:
            enSubmarinoC = 1'd0;
            enSubmarinoD =  1'd1;
            EF <= submarinoE;
        submarinoE:
            enSubmarinoD = 1'd0;
            enSubmarinoE =  1'd1;
            EF <= cruzadorA;            
        cruzadorA:
            enSubmarinoE = 1'd0;
            enCruzadorA =  1'd1;
            EF <= cruzadorB;
        cruzadorB:
            enCruzadorA = 1'd0;
            enCruzadorB =  1'd1;
            EF <= hidroaviaoA; 
        hidroaviaoA:
            enCruzadorB = 1'd0;
            enHidroaviaoA =  1'd1;
            EF <= hidroaviaoB;
        hidroaviaoB:
            enHidroaviaoA = 1'd0;
            enHidroaviaoB =  1'd1;
            EF <= encouracado;
        encouracado:
            enHidroaviaoB = 1'd0;
            enEncouracado =  1'd1;
            EF <= portaAvioes;
        portaAvioes:
            enEncouracado = 1'd0;
            enPortaAvioes =  1'd1;
            EF <= submarinoA; 
    end;
end 

end module