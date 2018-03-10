import lc3b_types::*;

module cpu_rwmod
(
    input lc3b_word in,
	input [3:0] opcode,
	input lsb,
	output lc3b_sel wrsel,
    output lc3b_word out
);

always_comb
begin
	out = in;
	wrsel = 2'b11;
	
	case(opcode)
		op_stb: begin
			// lc3 is little-endian, so if lsb of addr is not set, then write to lower byte pos, and reversed
			if (lsb == 0)
			begin
				out = {8'h00, in[7:0]};
				wrsel = 2'b01;
			end
			else
			begin
				out = {in[7:0], 8'h00};
				wrsel = 2'b10;
			end
		end
		op_ldb: begin
			// again, lsb of addr will determine whether to zext higher or lower byte
			if (lsb == 0)
				out = $unsigned(in[7:0]);
			else
				out = $unsigned(in[15:8]);
		end
		default: /* this module only mod r/w data passed thru if STB/LDB operation */;
	endcase
end

endmodule : cpu_rwmod
