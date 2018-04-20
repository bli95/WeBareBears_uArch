import lc3b_types::*;

module VC_control
(
	input clk,
	input mem_ack, L2_read, L2_write,
	input VC_hit, L2_dirty_bit, VC_hit_dirty, VC_LRU_dirty,
	input [2:0] way,
    input [23:0] LRU_out,

	output logic load_LRU, load_VC, load_VC_dirty, VC_dirty_bit,
    output logic VC_ack, VC_req, VC_busy,
    output logic [2:0] data_index
);

	// during L2 idle periods, your vc should be evicting dirty entries and cleaning up the victim cache

	enum int unsigned {hold, write_mem, mem_break} state, next_state;
	
	always_comb begin
	
        VC_ack = 1'b0;
        VC_req = 1'b0;
        VC_busy = 1'b0;
        load_VC = 1'b0;
        load_VC_dirty = 1'b0;
        vc_resp = 1'b0;
        load_LRU = 1'b0;
        data_index = LRU_out[2:0];
        VC_dirty_bit = VC_LRU_dirty;

		case(state)
			hold:
			begin
				if (L2_write) begin
					if (hit) begin
						load_VC = 1;
                        load_LRU = 1; 
						load_VC_dirty = 1;
						data_index = way;
						VC_dirty_bit = VC_hit_dirty | L2_dirty_bit;
                        VC_ack = 1; 
					end
					else if (!VC_LRU_dirty) begin
                        load_VC = 1;
                        load_LRU = 1;
						load_VC_dirty = 1;
						data_index = LRU[2:0];
						VC_dirty_bit = L2_dirty_bit;
                        VC_ack = 1;
                    end
                    else begin                                   // this is a write miss and dirty
                        data_index = LRU[2:0]; 
                        VC_req = 1;
                    end        
				end
				else if (L2_read) begin
                    if (hit) begin
                        load_LRU = 1;
                        data_index = way;
                        VC_ack = 1;
                    end
                    else begin
                        foh = 1;
                    end
                end
			end
			write_mem:
			begin
                data_index = LRU[2:0];
                VC_req = 1;
                //VC_busy = 1;
                if (mem_ack) begin
                    load_VC_dirty = 1;
                    VC_dirty_bit = 0;
                end
			end
		endcase
	end
	
	always_comb begin
		
        next_state = state;

		case (state)
			hold:
			begin
		        if (VC_req) begin
                    next_state = write_mem;
                end
			end
			write_mem:
			begin
                if (mem_ack) begin
                    next_state = hold;
                end
			end
		endcase
			
	end
		
	always_ff @(posedge clk) begin: next_state_assignment
		state <= next_state;
	end
	
endmodule : VC_control
