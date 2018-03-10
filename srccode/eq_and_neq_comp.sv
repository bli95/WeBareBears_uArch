module eq_and_neq_comp #(parameter eqwidth = 3, parameter neqwidth = 3)
(
    input [eqwidth-1:0] a,
    input [eqwidth-1:0] b,
	 input [neqwidth-1:0] c,
	 input [neqwidth-1:0] d,
    output logic true
);

assign true = (a == b) && (c != d);

endmodule : eq_and_neq_comp