import lc3b_types::*;

module dcache_ctrlr
(
	input clk,
	input [3:0] opcode,
	input rw_resp,
	output logic stall,
	output logic addrmux_sel,
	output logic req_rw,
	output logic w_en
);

logic dbreq_state = 0;	// used as a 2-states bit for sti/ldi ops

always_ff @(posedge clk)
begin
	if (rw_resp == 1)		// NOTE: currently assume magic memory that responds immediately
		dbreq_state = ~dbreq_state;
end

always_comb
begin
	stall = 0;
	addrmux_sel = 0;
	req_rw = 0;
	w_en = 0;

	case(opcode)
		op_str, op_stb: begin
			req_rw = 1;
			w_en = 1;
		end
		op_sti: begin
			// read first, then use as addr to write to; addrmux chooses based on state
			req_rw = 1;
			addrmux_sel = dbreq_state;
			if (dbreq_state == 0)
				stall = 1;		// NOTE: currently assume 2nd req (when state=1) returns very next cycle
			else//if (dbreq_state != 0)
				w_en = 1;
		end
		op_ldr, op_ldb: begin
			req_rw = 1;
		end
		op_ldi: begin
			// read first, then use as addr to read (again) from
			req_rw = 1;
			addrmux_sel = dbreq_state;
			if (dbreq_state == 0)
				stall = 1;
		end
		default: /* no other instr should require data from memory */;
	endcase
end

endmodule : dcache_ctrlr