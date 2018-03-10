module mux2 #(parameter width = 16)
(
	input sel,
	input [width-1:0] a, b,
	output logic [width-1:0] z
);

always_comb
begin
    unique case(sel)
        1'b0: z = a;
        1'b1: z = b;
	endcase
end

endmodule : mux2
