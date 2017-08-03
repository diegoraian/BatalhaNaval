# BatalhaNaval

RESOLVIDOS
3.0 RESOLVIDO) Tiro:(
		3.1 (RESOLVIDO) Criar novo módulo específico para validação de tiro	, Colisor;
    
    6.0 (RESOLVIDO)Input ENABLED em todos os módulos: (RESOLVIDO)
		6.1 (RESOLVIDO)Fazer com que ele habilite ou não o módulo;

7. (RESOLVIDO) Output READY em todos os módulos: (RESOLVIDO)
		7.1 (RESOLVIDO)Definir a rotina para esse output;
    
    8.0 (RESOLVIDO) Loop Players:
		8.1 (RESOLVIDO) Criar loop para inserção de peças do segundo player em PosicionandoPecas;
    
10.0 (RESOLVIDO) Leds:
		10.1 (RESOLVIDO) Criar lógica de leds para ajudar na indicação do andamento do jogo;
    
4.0 (RESOLVIDO)Memória:
		4.1 (RESOLVIDO) Definir a interface de acesso a memória - busca de elementos;
    
(RESOLVIDO) 5.0 Validador:
		5.1 (RESOLVIDO) Criar a lógica da saida CONFLITO para o módulo Validador; (Felipe)
    5.2 (RESOLVIDO) Ajuste de acesso a memoria dos Jogadores (Felipe)
    (PARECE RESOOLVIDO) 5.3 Ajustar Enable (Douglas)
______________________________________________________________________________________________
Pendências (DE 03.07 ÀS 00:13)

/*
	* Ler memoria e verificar se embarcação já foi destruida  
  * 
*/
1.0 Pontuação (DOUGLAS RESPONSÁVEL: USAR SOMAS REPETITIVAS NO CÓDIGO E MAPEAMENTO DE LCD/7-SEG ooouuu INDICAÇÃO DA PONTUAÇÃO PELOS LEDs (poluido)
		2.1 CRIAR MODULO DE PONTUAÇÃO SENSIVEL A CADA PULSO QUE:
		* terá regs de qtd_P1 e qtd_P2 e a saída desse módulo vai pra outras máquinas

2.0 Rever Posicionawndo Peças(Douglas/Felipe). ELE DEPENDE DO RANDOM, QUE ESTÁ FEITO, daí, precisa-se:
		0.1 Adcionar as opções de entrada posições aleatórias da cpu.
    0.2 Acrescentar LEDs 

3.0 TOP LEVEL BATALHA NAVAL E ligação de todos os módulos.
		Atualizar o código em: https://codeshare.io/BatalhaNaval1996 (RETIRANDO MAPA MEMÓRIA, GERENCIANDO MAPA E ADICIONANDO NOVAS ENTRADAS/SAIDAS,
    FIOS E A LARGURA DE BITS DE CADA UM DELES)

4.0 Aleatoriedade: (Diego/Felipe) 
		5.1 Criar módulo de aleatoriedade para (P1 x CPU);


5.0 LEDS de Exec Jogo (linhas 131 em diante, 168 em diante): Os resultados estão corretos no waveform? Como controlar a intensidade/tempo que o 
    LED pisca? Talvez seja melhor usar só acesso direto (invés de piscar).
 
6.0 Test Bench:(Todos)
    11.1 FAZER


