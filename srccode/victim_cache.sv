import lc3b_types::*;

module victim_cache
(
    input clk,
	 
    input logic [127:0] L2_data,
	 input logic [11:0] L2_address,
	 input logic mem_ack, L2_read, L2_write, L2toPmem_busy,
    input L2_dirty_bit,
	
	 output logic [127:0] wb_data, rb_data,
	 output logic [11:0] wb_address,
	 output logic VC_ack, VC_write, foh
);
				  
	logic [2:0] read_index, write_index, wb_index_in, wb_index_out;
	logic load_VC, load_VC_dirty, load_LRU, VC_dirty_bit;
	logic load_index;
	
	logic dirty_bits [7:0];
	
   logic VC_hit, VC_hit_dirty, VC_LRU_dirty;
   logic [2:0] hit_way;
   logic [23:0] LRU_out;
	
	VC_control VCC (.*);
	VC_datapath VCD (.*);
	
endmodule : victim_cache
	
