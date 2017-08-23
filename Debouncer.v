module Debouncer
(
	input clk,
	input psh_btn,
	output reg psh_stable = 1'b1 
);


reg PB_sync;
reg PB_sync_compare;
reg [15:0] count= 16'd0;

always @(posedge clk) begin

	if(psh_btn) begin
		count = 16'd0;
		psh_stable = 1'b1;
	end else begin
		if(count == 16'b1111111111111111 ) begin		// 2^16 pulsos de clock = 65536 pulsos
			psh_stable = 1'b0;
			count = count + 16'd1;

		end

		count = 16'd0;	end
 end

 endmodule 