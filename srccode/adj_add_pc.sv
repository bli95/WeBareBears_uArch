import lc3b_types::*;

module adj_add_pc
(
	input lc3b_word pc_in,
	input lc3b_word adj_in,
	output lc3b_word add_out
);

assign add_out = pc_in + adj_in;

endmodule : adj_add_pc
