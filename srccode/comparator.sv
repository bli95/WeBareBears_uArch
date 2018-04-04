module comparator #(parameter width = 9) 
(
	input [width-1:0] a, b,
	output logic f
);
		
	always_comb begin
		if (a == b) begin
			f = 1;
		end
		else begin
			f = 0;
		end	
	end
		
endmodule : comparator
		