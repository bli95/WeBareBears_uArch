import lc3b_types::*;

/*
 * SEXT[offset-n << 1]
 */
module adj #(parameter width = 8, parameter sgn = 1)
(
    input [width-1:0] in,
    output lc3b_word out
);

always_comb
begin
	if (sgn)
		out = $signed({in, 1'b0});
	else
		out = $unsigned({in, 1'b0});
end

endmodule : adj
