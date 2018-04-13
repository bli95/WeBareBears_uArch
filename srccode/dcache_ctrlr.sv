import lc3b_types::*;

module dcache_ctrlr
(
	input clk,
	input [3:0] opcode,
	input rw_resp,
	input lc3b_word resp_data_addr,
	output logic stall1,
	output logic addrmux_sel,
	output logic datamux_sel,
	output logic req_rw,
	output logic wr_en,
	output lc3b_word phase2_addr,
	output logic rst2
);
logic dbreq_state = 0;				// used as a 2-states bit for sti/ldi ops
lc3b_word stildi_p2addr = '0;		// temporary addr to feed into dcache's ADR mux port 1 during second phase of sti/ldi instructions

always_ff @(posedge clk)
begin
	// when cache is connected, move these signals to always_comb block to be compatible with same cycle ack
	req_rw = 0;
	wr_en = 0;
	addrmux_sel = 0;
	
	case(opcode)
		// on all stx/ldx & trap instr except sti/ldi, we just need one piece of data from mem
		op_str, op_stb: begin
			if (rw_resp == 0)
			begin
				req_rw = 1;
				wr_en = 1;
			end
		end
		op_ldr, op_ldb, op_trap: begin
			if (rw_resp == 0)
			begin
				req_rw = 1;
			end
		end
		
		op_sti: begin
			if (resp_data_addr < 16'hFFF6)
			begin
				// read first, then use as addr to write to; addr src and whether to write is based on our bit state
				if (rw_resp == 0)
				begin
					req_rw = 1;
					wr_en = dbreq_state;
					addrmux_sel = dbreq_state;
				end
				else
				begin
					// on a response, we flip our state to indicate 2nd mem op with retrived address (1) or reset it (0)
					dbreq_state = ~dbreq_state;
					stildi_p2addr = resp_data_addr;
				end
			end
			else
			begin
				dbreq_state = 0;	// reset our state bit because pre-defined addr doesn't refer to actual memory but to performance counter
				stildi_p2addr = resp_data_addr;
			end
		end
		op_ldi: begin
			if (resp_data_addr < 16'hFFF6)
			begin
				// read first, then use as addr to read (again) from
				if (rw_resp == 0)
				begin
					req_rw = 1;
					addrmux_sel = dbreq_state;
				end
				else
				begin
					dbreq_state = ~dbreq_state;
					stildi_p2addr = resp_data_addr;
				end
			end
			else
			begin
				dbreq_state = 0;
				stildi_p2addr = resp_data_addr;
			end
		end
		default: /* no other instr should require data from memory, or stalling */;
	endcase
end

always_comb
begin
	phase2_addr = stildi_p2addr;	// always
	// THIS IS IMPORTANT: squash the previous stages of ppln (similar to rst1) on trap instr returned from dcache
	rst2 = (opcode == op_trap) && (rw_resp == 1);
	
	stall1 = 0;
	datamux_sel = 0;

	case(opcode)
		// easy enough: stall interstage regs while awaiting data from memory
		op_str, op_stb: begin
			if (rw_resp == 0)
				stall1 = 1;
		end
		op_ldr, op_ldb, op_trap: begin
			if (rw_resp == 0)
				stall1 = 1;
		end
		
		/* We want to stall for sure any time when we are waiting for data to be returned from mem, but we also want to stall the one cycle of the first ACK for sti/ldi. 
			Note that ACK is returned the 1st time, our bit state is low, and is high the 2nd ACK, right before it flips so setting stall to its negation cleverly works. */
		op_sti: begin
			if (resp_data_addr < 16'hFFF6)
			begin
				if (rw_resp == 0)
					stall1 = 1;
				else
					stall1 = ~dbreq_state;
			end
		end
		op_ldi: begin
			if (resp_data_addr < 16'hFFF6)
			begin
				if (rw_resp == 0)
					stall1 = 1;
				else
					stall1 = ~dbreq_state;
			end
			else
				datamux_sel = 1; 	// flip ME/WB data register to use performance counter output as source instead of dcache on read
		end
		default: ;
	endcase
end

endmodule : dcache_ctrlr