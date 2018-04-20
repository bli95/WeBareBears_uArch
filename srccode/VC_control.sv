import lc3b_types::*;

module VC_control
(
	input clk,
	
	input [2:0] way,
	
	output logic load_LRU,
	

);

	enum int unsigned {hold, write_mem, mem_break} state, next_state;
	
	always_comb begin
	
		case(state)
			hold:
			begin
				if (L2_read && )
			end
			write_mem:
			begin
			end
			mem_break:
			begin
			end
		endcase
	end