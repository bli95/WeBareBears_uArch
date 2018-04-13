import lc3b_types::*;

module cache_control 
(
	input clk,
	
	input mem_resp,
	input cache_read, cache_write,
	input read_hit, write_hit,
	input way1_hit, way2_hit,
	input LRU_out, dirty_out,
	
	output logic cache_resp,		
	output logic mem_read, mem_write, mem_done,
	output logic R_W, 	
	output logic load_data_1, load_data_2,
	output logic dirty_bit,
	output logic load_dirty_1, load_dirty_2,
	output logic load_LRU, LRU_in,
	output logic got_hit_likah_bih, miss_me_wifdat_bs
);
								 
	enum int unsigned {hold, read_mem, write_mem, mem_break} state, next_state;
	logic visited_miss_state = 0;
		
	always_comb begin
			
		load_data_1 = 1'b0;
		load_data_2 = 1'b0;
		dirty_bit = 1'b0;
		load_dirty_1 = 1'b0;
		load_dirty_2 = 1'b0;
		R_W = 1'b0;
		load_LRU = 1'b0;
		LRU_in = 1'b0;
		cache_resp = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		mem_done = 1'b0;
			
		case (state) 
			hold:
			begin
				if (read_hit) begin
					load_LRU = 1'b1;
					LRU_in = way1_hit && ~way2_hit;
					cache_resp = 1'b1;
				end
				else if (write_hit) begin
					R_W = 1'b1;
					dirty_bit = 1'b1;
					if (way1_hit) begin
						load_data_1 = 1'b1;
						load_dirty_1 = 1'b1;
						load_LRU = 1'b1;
						LRU_in = 1'b1;
					end
					else begin
						load_data_2 = 1'b1;
						load_dirty_2 = 1'b1;
						load_LRU = 1'b1;
						LRU_in = 1'b0;
					end
					cache_resp = 1'b1;
				end
			end
			read_mem:
			begin
				mem_read = 1'b1;
				if (mem_resp) begin
					dirty_bit = 1'b0;
					if (LRU_out == 1'b0) begin
						load_data_1 = 1'b1;
						load_dirty_1 = 1'b1;
					end
					else begin
						load_data_2 = 1'b1;
						load_dirty_2 = 1'b1;
					end
				end
			end
			write_mem:
			begin
				R_W = 1'b1;
				mem_write = 1'b1;
			end
			mem_break:
			begin
				mem_done = 1'b1;
			end
		endcase
			
	end
	
	always_ff @(posedge clk)
	begin
		miss_me_wifdat_bs = 0;
		got_hit_likah_bih = 0;
		
		case(state)
			hold: begin
				if (read_hit | write_hit) begin
					if (visited_miss_state) begin
						miss_me_wifdat_bs = 1;
						visited_miss_state = 0;		// reset so that very next req, if hit, won't be mistaken for a miss
					end
					else
						got_hit_likah_bih = 1;
				end
			end
			read_mem:
				visited_miss_state = 1;	// assumes that any cache miss would cause this state to be visited at some point
			default: ;
		endcase
	end
			
	always_comb begin
		
		case (state)
			hold:
			begin
				if ((!read_hit && cache_read) || (!write_hit && cache_write)) begin
					if (dirty_out) begin
						next_state = write_mem;
					end
					else begin
						next_state = read_mem;
					end
				end
				else begin
					next_state = hold;
				end
			end
			read_mem:
			begin
				if (mem_resp) begin
					next_state = hold;
				end
				else begin
					next_state = read_mem;
				end
			end
			write_mem:
			begin
				if (mem_resp) begin
					next_state = mem_break;
				end
				else begin
					next_state = write_mem;
				end
			end
			mem_break:
			begin
				next_state = read_mem;
			end
		endcase
			
	end
		
	always_ff @(posedge clk) begin: next_state_assignment
		state <= next_state;
	end
		
endmodule : cache_control
