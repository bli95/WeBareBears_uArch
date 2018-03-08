import lc3b_types::*;

module ext #(parameter width = 8, parameter sgn = 1)
(
    input [width-1:0] in,
    output lc3b_word out
);

always_comb
begin
	if (sgn)
		out = $signed(in);
	else
		out = $unsigned(in);
end

endmodule : ext