import lc3b_types::*;

module L2cache_datapath
(
	input clk,

	input R_W, 
	input load_data_1, load_data_2, load_data_3, load_data_4,
	input dirty_bit, load_dirty_1, load_dirty_2, load_dirty_3, load_dirty_4,
	input load_LRU, 
	input [1:0] LRU_way,
	output logic way1_hit, way2_hit, way3_hit, way4_hit,
	output logic read_hit, write_hit,
	output logic [7:0] LRU_out,
 	output logic dirty_out,
	output logic [127:0] data_out,
							  
	input [127:0] mem_rdata,
	output lc3b_word mem_address,
	output [127:0] mem_wdata,
	output [1:0] mem_byte_enable,
							  
	input cache_read, cache_write,
	input [1:0] cache_byte_enable,
	input lc3b_word cache_address,
	input [127:0] cache_wdata,
	output lc3b_word cache_rdata,
	output logic L2_dirty_bit
);
							 
	logic [4:0] index;
	logic [6:0] tag;						 
	
	logic valid_out_1, valid_out_2, valid_out_3, valid_out_4;
	logic dirty_out_1, dirty_out_2, dirty_out_3, dirty_out_4;
	logic way1_found, way2_found, way3_found, way4_found;
	logic [6:0] tag_out_1, tag_out_2, tag_out_3, tag_out_4, tag_out;
	logic [7:0] LRU_in;
	logic [127:0] data_in;
	logic [127:0] data_out_1, data_out_2, data_out_3, data_out_4;
	logic [127:0] wdata_128, wdata_out;

	assign index = cache_address[8:4];
	assign tag = cache_address[15:9];
	
	L2array DATA_1 (.clk, .write(load_data_1), .index, .datain(data_in), .dataout(data_out_1));
	L2array DATA_2 (.clk, .write(load_data_2), .index, .datain(data_in), .dataout(data_out_2));
	L2array DATA_3 (.clk, .write(load_data_3), .index, .datain(data_in), .dataout(data_out_3));
	L2array DATA_4 (.clk, .write(load_data_4), .index, .datain(data_in), .dataout(data_out_4));
	
	L2array #(.width(7)) TAG_1 (.clk, .write(load_data_1), .index, .datain(tag), .dataout(tag_out_1));
	L2array #(.width(7)) TAG_2 (.clk, .write(load_data_2), .index, .datain(tag), .dataout(tag_out_2));
	L2array #(.width(7)) TAG_3 (.clk, .write(load_data_3), .index, .datain(tag), .dataout(tag_out_3));
	L2array #(.width(7)) TAG_4 (.clk, .write(load_data_4), .index, .datain(tag), .dataout(tag_out_4));
	
	L2array #(.width(1)) VALID_1 (.clk, .write(load_data_1), .index, .datain(1'b1), .dataout(valid_out_1));
	L2array #(.width(1)) VALID_2 (.clk, .write(load_data_2), .index, .datain(1'b1), .dataout(valid_out_2));
	L2array #(.width(1)) VALID_3 (.clk, .write(load_data_3), .index, .datain(1'b1), .dataout(valid_out_3));
	L2array #(.width(1)) VALID_4 (.clk, .write(load_data_4), .index, .datain(1'b1), .dataout(valid_out_4));
	 
	L2array #(.width(1)) DIRTY_1 (.clk, .write(load_dirty_1), .index, .datain(dirty_bit), .dataout(dirty_out_1));
	L2array #(.width(1)) DIRTY_2 (.clk, .write(load_dirty_2), .index, .datain(dirty_bit), .dataout(dirty_out_2));
	L2array #(.width(1)) DIRTY_3 (.clk, .write(load_dirty_3), .index, .datain(dirty_bit), .dataout(dirty_out_3));
	L2array #(.width(1)) DIRTY_4 (.clk, .write(load_dirty_4), .index, .datain(dirty_bit), .dataout(dirty_out_4));
	
	LRUarray #(.width(8)) LRU (.clk, .write(load_LRU), .index, .datain(LRU_in), .dataout(LRU_out));
	
	LRU_stack TRUE_LRU (.old_LRU(LRU_out), .way(LRU_way), .new_LRU(LRU_in));
	
	// Reading Process
	
	comparator #(.width(7)) CHECK_WAY1 (.a(tag_out_1), .b(tag), .f(way1_found));

	comparator #(.width(7)) CHECK_WAY2 (.a(tag_out_2), .b(tag), .f(way2_found));
	
	comparator #(.width(7)) CHECK_WAY3 (.a(tag_out_3), .b(tag), .f(way3_found));

	comparator #(.width(7)) CHECK_WAY4 (.a(tag_out_4), .b(tag), .f(way4_found));
	
	assign way1_hit = way1_found && valid_out_1;
	
	assign way2_hit = way2_found && valid_out_2;
	
	assign way3_hit = way3_found && valid_out_3;
	
	assign way4_hit = way4_found && valid_out_4;
	
	assign read_hit = (way1_hit || way2_hit || way3_hit || way4_hit) && cache_read;
	
	mux4 #(.width(128)) DATA_READ (.sel({{way3_hit || way4_hit}, {way2_hit || way4_hit}}), .a(data_out_1), .b(data_out_2), .c(data_out_3), .d(data_out_4), .z(data_out)); // picks data to read from
	
	mux4 #(.width(128)) DATA_WRITE (.sel(LRU_out[1:0]), .a(data_out_1), .b(data_out_2), .c(data_out_3), .d(data_out_4), .z(wdata_out)); // picks data to write back
	
	mux4 #(.width(7)) TAG_OUT (.sel(LRU_out[1:0]), .a(tag_out_1), .b(tag_out_2), .c(tag_out_3), .d(tag_out_4), .z(tag_out)); // picks tag to write back
	
	mux4 #(.width(1)) DIRTY_OUT (.sel(LRU_out[1:0]), .a(dirty_out_1), .b(dirty_out_2), .c(dirty_out_3), .d(dirty_out_4), .z(dirty_out)); 
	
	assign write_hit = (way1_hit || way2_hit || way3_hit || way4_hit) && cache_write;
	
	assign mem_wdata = wdata_out;
	
	mux2 #(.width(128)) DATA_IN (.sel(R_W), .a(mem_rdata), .b(cache_wdata), .z(data_in));
	
	mux2 #(.width(16)) MEM_ADDRESS (.sel(R_W), .a(cache_address), .b({{tag_out}, {index}, 4'h0}),  .z(mem_address));
	
	assign mem_byte_enable = 2'b11;
	
	always_comb begin
		
		case(LRU_way)
			2'b00: L2_dirty_bit = dirty_out_1;
			2'b01: L2_dirty_bit = dirty_out_2;
			2'b10: L2_dirty_bit = dirty_out_3;
			2'b11: L2_dirty_bit = dirty_out_4;
			default: L2_dirty_bit = 0;
		endcase
		
	end
	
endmodule : L2cache_datapath