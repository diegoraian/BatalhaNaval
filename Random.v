module Random (
    input clock,
    input reset,
    output [2:0] rnd_posicao_orientacao,
	 output reg rnd_direcao = 1'b0
    );
 

 
reg [2:0] random = 3'b111, random_next, random_done;
reg [1:0] count =1'b0 , count_next; //to keep track of the shifts

//reg rnd_direcao = 1'b0;
wire feedback = random[2] ^ random[1];


always @ (posedge clock or posedge reset)
begin
 if (reset)
 begin
  random <= 3'b111; //An LFSR cannot have an all 0 state, thus reset to FF
  count <= 1'b0;
 end
  
 else
 begin
  if (count == 3)
	begin
		count <= 0;
		random_done <= random; //assign the random number to output after 13 shifts
	end
  random <= random_next;
  count <= count_next;
 end

 
end
 
always @ (*)
begin
  random_next = random; //default state stays the same
  count_next = count;
   
  random_next = {random[1:0], feedback}; //shift left the xor'd every posedge clock
  
  count_next = count + 1;
  
end
 
 
assign rnd_posicao_orientacao = random_done;


always@(posedge clock)
begin
	rnd_direcao = rnd_direcao +1'b1;
end

endmodule
