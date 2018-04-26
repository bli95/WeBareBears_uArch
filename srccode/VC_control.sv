import lc3b_types::*;

module VC_control
(
	input clk,
	
	input mem_ack, L2_read, L2_write, L2toPmem_busy,
	input VC_hit, L2_dirty_bit, VC_hit_dirty, VC_LRU_dirty,
	input [2:0] hit_way,
	input [23:0] LRU_out,
	input dirty_bits [7:0],
	input [2:0] wb_index_out,
	input [11:0] wb_address, L2_address,

	output logic load_LRU, load_VC, load_VC_dirty, VC_dirty_bit, load_index,
   output logic VC_ack, VC_write, foh, 
   output logic [2:0] read_index, write_index, wb_index_in
);

	logic write_begin, write_idle_begin, idle_read_hit;

	// during L2 idle periods, your vc should be evicting dirty entries and cleaning up the victim cache

	enum int unsigned {hold, write_mem, idle_write, mem_break} state, next_state;
	
	always_comb begin
	
      VC_ack = 1'b0;
      VC_write = 1'b0;
      load_VC = 1'b0;
      load_VC_dirty = 1'b0;
      load_LRU = 1'b0;
      VC_dirty_bit = VC_LRU_dirty;
		foh = 1'b0;
		write_begin = 1'b0;
		write_idle_begin = 1'b0;
		load_index = 1'b0;
		read_index = 3'b000;
		write_index = 3'b000;
		wb_index_in = 3'b000;
		idle_read_hit = 1'b0;
			
		case(state)
			hold:
			begin
				if (L2_write) begin
					if (VC_hit) begin // prioritize writing to matching address
						load_VC = 1;
						load_LRU = 1; 
						load_VC_dirty = 1;
						write_index = hit_way;
						VC_dirty_bit = VC_hit_dirty | L2_dirty_bit;
						VC_ack = 1; 
					end
					else if (!dirty_bits[LRU_out[2:0]]) begin // overwrite clean data on least-recently used line
						load_VC = 1;
						load_LRU = 1;
						load_VC_dirty = 1;
						write_index = LRU_out[2:0];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[2:0]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[2:0];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[5:3]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[5:3];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[8:6]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[8:6];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[11:9]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[11:9];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[14:12]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[14:12];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[17:15]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[17:15];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[20:18]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[20:18];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[23:21]]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[23:21];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else begin   // write back dirty data on least-recently used line
						load_index = 1;
						wb_index_in = LRU_out[2:0];
						write_begin = 1;
					end        
				end
				else if (L2_read) begin
					if (VC_hit) begin
						load_LRU = 1;
						read_index = hit_way;
						VC_ack = 1;
					end
					else begin
						foh = 1;
					end
				end
				else begin
					if (dirty_bits[LRU_out[2:0]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[2:0];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[5:3]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[5:3];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[8:6]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[8:6];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[11:9]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[11:9];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[14:12]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[14:12];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[17:15]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[17:15];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[20:18]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[20:18];
						write_idle_begin = 1;
					end
					else if (dirty_bits[LRU_out[23:21]] && !L2toPmem_busy) begin
						load_index = 1;
						wb_index_in = LRU_out[23:21];
						write_idle_begin = 1;
					end
				end
			end
			write_mem:
			begin
				VC_write = 1;
				if (mem_ack) begin
					load_VC_dirty = 1;
					VC_dirty_bit = 0;
					write_index = wb_index_out;
				end
			end
			idle_write:
			begin
				/*if (L2_read && !mem_ack && L2_address != wb_address) begin
						if (VC_hit) begin
							load_LRU = 1;
							read_index = hit_way;
							VC_ack = 1;
							idle_read_hit = 1;
						end
				end*/
				if (L2_write && !mem_ack) begin
					if (VC_hit && wb_index_out != hit_way) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = hit_way;
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					if (!dirty_bits[LRU_out[2:0]] && wb_index_out != LRU_out[2:0]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[2:0];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[5:3]] && wb_index_out != LRU_out[5:3]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[5:3];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[8:6]] && wb_index_out != LRU_out[8:6]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[8:6];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[11:9]] && wb_index_out != LRU_out[11:9]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[11:9];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[14:12]] && wb_index_out != LRU_out[14:12]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[14:12];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[17:15]] && wb_index_out != LRU_out[17:15]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[17:15];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[20:18]] && wb_index_out != LRU_out[20:18]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[20:18];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
					else if (!dirty_bits[LRU_out[23:21]] && wb_index_out != LRU_out[23:21]) begin
						load_VC = 1'b1;
						load_LRU = 1'b1;
						load_VC_dirty = 1;
						write_index = LRU_out[23:21];
						VC_dirty_bit = L2_dirty_bit;
						VC_ack = 1;
					end
				end
				VC_write = 1;
				if (mem_ack) begin
					load_VC_dirty = 1;
					VC_dirty_bit = 0;
					write_index = wb_index_out;
				end
			end
			mem_break: ;
		endcase
	end
	
	always_comb begin
		
      next_state = state;

		case (state)
			hold:
			begin
				if (write_begin) begin
					next_state = write_mem;
				end
				else if (write_idle_begin) begin
					next_state = idle_write;
				end
				else if (VC_ack) begin
					next_state = mem_break;
				end
			end
			write_mem:
			begin
				if (mem_ack) begin
					next_state = hold;
				end
			end
			idle_write:
			begin
				if (mem_ack) begin
					next_state = hold;
				end
			end
			mem_break:
			begin
				next_state = hold;
			end
		endcase
			
	end
		
	always_ff @(posedge clk) begin: next_state_assignment
		state <= next_state;
	end
	
endmodule : VC_control
