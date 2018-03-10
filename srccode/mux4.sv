module mux4 #(parameter width = 16)
(
	input [1:0] sel,
	input [width-1:0] a, b, c, d,
	output logic [width-1:0] z
);

always_comb
begin
	unique case(sel)
		2'b00: z = a;
		2'b01: z = b;
		2'b10: z = c;
		2'b11: z = d;
	endcase
end

endmodule : mux4
