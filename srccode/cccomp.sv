import lc3b_types::*;

module cccomp
(
	input lc3b_nzp cc_in,
	input lc3b_reg ir_src_cc,
	output logic branch_enable
);

always_comb
	branch_enable = (cc_in & ir_src_cc) ? 1'b1 : 1'b0;

endmodule : cccomp
