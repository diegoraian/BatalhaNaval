module Debouncer
(
	input clk,
	input psh_btn,
	output reg psh_stable = 1'b1 
);


reg PB_sync;
reg PB_sync_compare;
reg [3:0] count= 1'b0;

always @(posedge clk) begin

	if(!psh_btn) begin
		count = 4'b0;
		psh_stable = 1'b0;
	end else begin
		if(count == 4'b1111 ) begin
			psh_stable = 1'b1;
			count = 4'b0;

		end

		count = count +1'b1;
	end


 
 end

 endmodule 