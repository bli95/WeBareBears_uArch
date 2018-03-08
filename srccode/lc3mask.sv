import lc3b_types::*;

module lc3mask #(parameter outwidth = 8)
(
    input lc3b_word in,
	 input logic byte_select,
    output logic [outwidth-1:0] out
);

always_comb
begin
	case(outwidth)
		8: begin
			// for MDR byte extracting
			if (byte_select == 0)
				out = in[7:0];
			else
				out = in[15:8];
		end
		16: begin
			// for SR1 byte storing
			if (byte_select == 0)
				out = {8'h00, in[7:0]};
			else
				out = {in[7:0], 8'h00};
		end
		default: out = 'z;
	endcase
end

endmodule : lc3mask