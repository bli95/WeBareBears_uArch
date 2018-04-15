import lc3b_types::*;

module cache 
(
	wishbone.master wb,
	wishbone.slave sb,
	input logic level,
	output logic got_hit_likah_bih, miss_me_wifdat_bs
);
				  
	logic clk;
				  
	/* Memory signals */
	logic mem_resp;
	logic mem_read, mem_write;
	logic [1:0] mem_byte_enable;
	lc3b_word mem_address;
	logic [127:0] mem_rdata, mem_wdata;
	logic mem_done;
				  
	/* Cache signals */
	logic cache_resp;
	logic cache_read, cache_write;
	logic [1:0] cache_byte_enable;
	lc3b_word cache_address;
	lc3b_word cache_rdata, cache_wdata_16;
	logic [127:0] cache_wdata_128;
	
		
   /* Internal signals */		
	logic load_data_1, load_data_2;
	logic dirty_bit, dirty_out, load_dirty_1, load_dirty_2;
	logic load_LRU, LRU_in, LRU_out;
	logic R_W;
	logic read_hit, write_hit;
	logic way1_hit, way2_hit;
	logic [127:0] data_out;
	
	lc3b_word sel_mask;
		
	assign clk = wb.CLK;
	assign mem_resp = wb.ACK;
	assign mem_rdata = wb.DAT_S;
		
	assign wb.DAT_M = mem_wdata;
	assign wb.ADR = mem_address[15:4];
	assign wb.WE = mem_write;
	assign wb.STB = (mem_read || mem_write) && !mem_done;
	assign wb.CYC = (mem_read || mem_write) && !mem_done;
	assign wb.SEL = sel_mask;
		
	assign cache_read = (sb.STB && sb.CYC) && !sb.WE;
	assign cache_write = sb.WE;
	assign cache_address = {{sb.ADR}, 4'h0};
	assign cache_wdata_16 = sb.DAT_M[15:0];
	assign cache_wdata_128 = sb.DAT_M;
	assign sel_mask = sb.SEL;
		
	assign sb.ACK = cache_resp;
	assign sb.DAT_S = data_out;
	
	cache_datapath CD (.*);
	cache_control CC (.*);
		
endmodule : cache
