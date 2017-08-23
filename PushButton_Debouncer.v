module PushButton_Debouncer(
	/*	 
	@param clk - clock do sistema
	@param push_btn - Glitchy, assincrono ao clock, ativo em baixo
	*/
	input clk,
	input push_btn,
	
	/*
	@param push_btn_stable - sincronizado com o clock, ativo em alto
	*/
	output reg push_btn_stable
);

// Sincroniza o sinal do botao ao dominio do sinal de clock
reg push_btn_sync_0; always @ (posedge clk) push_btn_sync_0 <= ~ push_btn;	// ativa push_btn_sync0 em alto
reg push_btn_sync_1; always @ (posedge clk) push_btn_sync_1 <= push_btn_sync_0;	

// Contador de 16 bits, 65536 pulsos de clock para zerar
reg [15:0] count;


// Quando o botao eh pressionado ou solto, incrementamos o contador
// O contador tem que chegar ao seu valor maximo antes de decidirmos que o valor do stable deva mudar
//	Leva em torno de 0,00262144s para reagir a mudancas no estado do botao

wire idle = (push_btn_stable == push_btn_sync_1); // estado inativo se stable = sync1
wire count_max =& count; // verdade quando todos os bits de count sao 1

always @ (posedge clk) begin
	if(idle)	begin		// Se push_btn_stable = push_btn_sync1
		count <= 0;		// contador zera
	end else begin
		count <= count + 16'd1;	// Incrementa pois algo estao acontecendo
		if(count_max) begin	// se contador chegou ao maximo
			push_btn_stable  <= ~push_btn_stable;	// inverte-se o estado do botao
		end
	end
end

endmodule
