import lc3b_types::*;

module VC_control
(
	input clk,
	input L2_read, L2_write,
	input [2:0] way,
	
	output logic load_LRU,
);

	// during L2 idle periods, your vc should be evicting dirty entries and cleaning up the victim cache

	enum int unsigned {hold, write_mem, mem_break} state, next_state;
	
	always_comb begin
	
		case(state)
			hold:
			begin
				if (L2_write) begin
					// check if vc hit or not
						// if hit, then update line and return in 1 cycle
						// if not hit
							// check the LRU and get old entry
								// for entry, check if dirty bit is set or not
									// if d=0, update the line and LRU
									// if d=1, go to write mem stage to evict line to pmem
								// send ack back to L2
								
						
					// if dirty in L2 is 0 dont change dirty in vc
					// if dirty in L2 is 1, set dirty in vc to be 1 
				end
				else if (L2_read) begin
					// check if vc hit or not
						// if hit, return data in 1 cycle
						// if not hit, tell l2 to fuck off and let it know that it should request from phoe
						
				end
			end
			write_mem:
			begin
				
			end
		endcase
	end
	
	always_comb begin
		
		case (state)
			hold:
			begin
				
			end
		
			write_mem:
			begin
				
			end
		endcase
			
	end
		
	always_ff @(posedge clk) begin: next_state_assignment
		state <= next_state;
	end
	
endmodule : VC_control