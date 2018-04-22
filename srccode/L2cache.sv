import lc3b_types::*;

module L2cache 
(
	wishbone.master wb,
	wishbone.slave sb,
	output logic got_hit_likah_bih, miss_me_wifdat_bs, L2_dirty_bit
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
	lc3b_word cache_rdata;
	logic [127:0] cache_wdata;
		
   /* Internal signals */		
	logic load_data_1, load_data_2, load_data_3, load_data_4;
	logic dirty_bit, dirty_out, load_dirty_1, load_dirty_2, load_dirty_3, load_dirty_4;
	logic valid_out_1, valid_out_2, valid_out_3, valid_out_4;
	logic load_LRU;
	logic [1:0] LRU_way; 
	logic [7:0] LRU_in, LRU_out;
	logic R_W;
	logic read_hit, write_hit;
	logic way1_hit, way2_hit, way3_hit, way4_hit;
	logic [127:0] data_out;
	
	assign clk = wb.CLK;
	assign mem_resp = wb.ACK;
	assign mem_rdata = wb.DAT_S;
		
	assign wb.DAT_M = mem_wdata;
	//assign wb.ADR = mem_address[15:4];
	assign wb.WE = mem_write;
	assign wb.STB = (mem_read || mem_write);
	assign wb.CYC = (mem_read || mem_write);
	assign wb.SEL = 16'hffff;
	
	assign cache_read = (sb.STB && sb.CYC) && !sb.WE;
	assign cache_write = sb.WE;
	assign cache_address = {{sb.ADR}, 4'h0};
	assign cache_wdata = sb.DAT_M;
		
	assign sb.ACK = cache_resp;
	assign sb.DAT_S = data_out;
	
	register #(.width(12)) outgoing_addr (.clk, .load(1'b1), .in(mem_address[15:4]), .out(wb.ADR));
	
	L2cache_datapath CD (.*);
	L2cache_control CC (.*);
		
endmodule : L2cache
