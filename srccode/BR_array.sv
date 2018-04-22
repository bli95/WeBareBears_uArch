import lc3b_types::*;

module BR_array #(parameter width = 2) 
(
	input clk,
	input write,
	input [5:0] read_index, 
	input [5:0] write_index, 
	input [width-1:0] datain,
	output logic [width-1:0] dataout
);
														  
	logic [width-1:0] data [63:0];
		
	/* Initialize array */
	initial begin
		for (int i = 0; i < $size(data); i++) begin
			data[i] = 1'b0;
		end
	end
		
	always_ff @(posedge clk) begin
		if (write == 1) begin
			data[write_index] = datain;
		end
	end
		
	assign dataout = data[read_index];
		
endmodule : BR_array
