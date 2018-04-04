import lc3b_types::*;

module cache_datapath
(
	input clk,

	input R_W,
	input load_data_1, load_data_2,
	input dirty_bit, load_dirty_1, load_dirty_2,
	input load_LRU, LRU_in,
	input lc3b_word sel_mask,
	output way1_hit, way2_hit,
	output read_hit, write_hit,
	output LRU_out, dirty_out,
	output [127:0] data_out,
							  
	input [127:0] mem_rdata,
	output lc3b_word mem_address,
	output [127:0] mem_wdata,
	output [1:0] mem_byte_enable,
							  
	input cache_read, cache_write,
	input [1:0] cache_byte_enable,
	input lc3b_word cache_address,
	input lc3b_word cache_wdata,
	output lc3b_word cache_rdata
);
							 
	logic [2:0] index;
	logic [8:0] tag;						 
	
	logic valid_out_1, valid_out_2;
	logic dirty_out_1, dirty_out_2;
	logic way1_found, way2_found;
	logic [8:0] tag_out_1, tag_out_2, tag_out;
	logic [127:0] data_in;
	logic [127:0] data_out_1, data_out_2;
	logic [127:0] wdata_128, wdata_out;

	assign index = cache_address[6:4];
	assign tag = cache_address[15:7];
	
	array DATA_1 (.clk, .write(load_data_1), .index, .datain(data_in), .dataout(data_out_1));
	array DATA_2 (.clk, .write(load_data_2), .index, .datain(data_in), .dataout(data_out_2));
	
	array #(.width(9)) TAG_1 (.clk, .write(load_data_1), .index, .datain(tag), .dataout(tag_out_1));
	array #(.width(9)) TAG_2 (.clk, .write(load_data_2), .index, .datain(tag), .dataout(tag_out_2));
	
	array #(.width(1)) VALID_1 (.clk, .write(load_data_1), .index, .datain(1'b1), .dataout(valid_out_1));
	array #(.width(1)) VALID_2 (.clk, .write(load_data_2), .index, .datain(1'b1), .dataout(valid_out_2));
	 
	array #(.width(1)) DIRTY_1 (.clk, .write(load_dirty_1), .index, .datain(dirty_bit), .dataout(dirty_out_1));
	array #(.width(1)) DIRTY_2 (.clk, .write(load_dirty_2), .index, .datain(dirty_bit), .dataout(dirty_out_2));
	
	array #(.width(1)) LRU (.clk, .write(load_LRU), .index, .datain(LRU_in), .dataout(LRU_out));
	
	// Reading Process
	
	comparator CHECK_WAY1 (.a(tag_out_1), .b(tag), .f(way1_found));

	comparator CHECK_WAY2 (.a(tag_out_2), .b(tag), .f(way2_found));
	
	assign way1_hit = way1_found && valid_out_1;
	
	assign way2_hit = way2_found && valid_out_2;
	
	assign read_hit = (way1_hit || way2_hit) && cache_read;
	
	mux2 #(.width(128)) DATA_READ (.sel(~way1_hit && way2_hit), .a(data_out_1), .b(data_out_2), .z(data_out));
	
	mux2 #(.width(128)) DATA_WRITE (.sel(LRU_out), .a(data_out_1), .b(data_out_2), .z(wdata_out));
	
	extract_16 READ_WORD (.data_128(data_out), .sel_mask, .data_16(cache_rdata));
	
	// Writing Process
	
	mux2 #(.width(9)) TAG_OUT (.sel(LRU_out), .a(tag_out_1), .b(tag_out_2), .z(tag_out));
	
	mux2 #(.width(1)) DIRTY_OUT (.sel(~way1_hit && way2_hit), .a(dirty_out_1), .b(dirty_out_2), .z(dirty_out));
	
	assign write_hit = (way1_hit || way2_hit) && cache_write; 
	
	extend_128 WRITE_WORD (.data_old_128(data_out), .sel_mask, .data_16(cache_wdata), .data_new_128(wdata_128));
	
	assign mem_wdata = wdata_out;
	
	mux2 #(.width(128)) DATA_IN (.sel(R_W), .a(mem_rdata), .b(wdata_128), .z(data_in));
	
	mux2 #(.width(16)) MEM_ADDRESS (.sel(R_W), .a(cache_address), .b({{tag_out}, {index}, 4'h0}), .z(mem_address));
	
	assign mem_byte_enable = 2'b11;
	
endmodule : cache_datapath