import lc3b_types::*;

module VC_LRUarray #(parameter width = 24) 
(
	input clk,
	input write,
	input [width-1:0] datain,
	output logic [width-1:0] dataout
);
														  
	logic [width-1:0] data;
		
	/* Initialize array */
	initial begin
		data = 24'b111110101100011010001000;
	end
		
	always_ff @(posedge clk) begin
		if (write == 1) begin
			data = datain;
		end
	end
		
	assign dataout = data;
		
endmodule : VC_LRUarray
		