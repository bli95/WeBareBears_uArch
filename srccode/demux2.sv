module demux2 #(parameter width = 128)
(
	input sel,
	input [width-1:0] a,
	output logic [width-1:0] y, z
);

always_comb
begin
	 y = '0;
	 z = '0;
	 
    unique case(sel)
        1'b0: y = a;
        1'b1: z = a;
	endcase
end

endmodule : demux2
