import lc3b_types::*;

module victim_cache
(
    input clk,
    input logic [127:0] L2_data,
	input logic [11:0] L2_address,
	input logic mem_ack, L2_read, L2_write, L2_busy,
    input L2_dirty_bit,
	
	output logic [127:0] wb_data,
	output logic [11:0] wb_address,
	output logic VC_ack, VC_req, VC_busy
);
				  
	logic [2:0] data_index;
	logic load_VC, load_VC_dirty, load_LRU, VC_dirty_bit;
	
    logic VC_hit, VC_hit_dirty, VC_LRU_dirty;
    logic [2:0] way;
    logic [23:0] LRU_out;
	
	VC_control VCC (.*);
	VC_datapath VCD (.*);
	
endmodule : victim_cache
	
