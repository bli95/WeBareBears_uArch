import lc3b_types::*;

module VCarray #(parameter width = 128) 
(
	input clk,
	input write,
	input [2:0] index,
	input [width-1:0] datain,
	output logic [width-1:0] dataout1, dataout2, dataout3, dataout4, dataout5, dataout6, dataout7, dataout8
);
														  
	logic [width-1:0] data [7:0];
	/* Initialize array */
	initial begin
		for (int i = 0; i < $size(data); i++) begin
			data[i] = 1'b0;
		end
	end
		
	always_ff @(posedge clk) begin
		if (write == 1) begin
			data[index] = datain;
		end
	end
		
	assign dataout1 = data[0];
	assign dataout2 = data[1];
	assign dataout3 = data[2];
	assign dataout4 = data[3];
	assign dataout5 = data[4];
	assign dataout6 = data[5];
	assign dataout7 = data[6];
	assign dataout8 = data[7];
    assign dataout = data[index];

endmodule : VCarray
		
