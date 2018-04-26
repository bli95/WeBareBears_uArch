import lc3b_types ::*;

module VC_datapath
(
	input clk,
	
	input [2:0] read_index, write_index, wb_index_in,
	input [11:0] L2_address,
	input [127:0] L2_data,
	input load_VC, load_VC_dirty, load_LRU, L2_read,
	input VC_dirty_bit, VC_write,
	input load_index,
	
   output logic VC_hit, VC_hit_dirty, VC_LRU_dirty,
   output logic [2:0] hit_way,
   output logic [23:0] LRU_out,
	output logic [11:0] wb_address,
	output logic [127:0] wb_data, 
	output logic [127:0] rb_data,
	output logic [2:0] wb_index_out,
	output logic dirty_bits [7:0]
);

   logic [23:0] LRU_in;
	logic [2:0] LRU_index;
	logic way1_found, way2_found, way3_found, way4_found, way5_found, way6_found, way7_found, way8_found;
	logic way1_valid, way2_valid, way3_valid, way4_valid, way5_valid, way6_valid, way7_valid, way8_valid, way_valid_out;
	logic way1_dirty, way2_dirty, way3_dirty, way4_dirty, way5_dirty, way6_dirty, way7_dirty, way8_dirty, way_dirty_out;
	logic [11:0] way1_address, way2_address, way3_address, way4_address, way5_address, way6_address, way7_address, way8_address, way_address_out, wb_temp;
	logic [127:0] way1_data, way2_data, way3_data, way4_data, way5_data, way6_data, way7_data, way8_data;

	assign VC_LRU_dirty = way_dirty_out;
	
	assign dirty_bits[0] = way1_dirty;
	assign dirty_bits[1] = way2_dirty;
	assign dirty_bits[2] = way3_dirty;
	assign dirty_bits[3] = way4_dirty;
	assign dirty_bits[4] = way5_dirty;
	assign dirty_bits[5] = way6_dirty;
	assign dirty_bits[6] = way7_dirty;
	assign dirty_bits[7] = way8_dirty;
	
	register #(.width(3)) SAVE_INDEX (.clk, .load(load_index), .in(wb_index_in), .out(wb_index_out)); 

	// PMEM ADDR
	
	mux2 #(.width(12)) select_ADR (.sel(VC_write), .a(L2_address), .b(way_address_out), .z(wb_temp));
	
	register #(.width(12)) pmem_MAR (.clk, .load(1'b1), .in(wb_temp), .out(wb_address));
	
	// LRU
	
	mux2 #(.width(3)) SEL_LRU_INDEX (.sel(L2_read), .a(write_index), .b(read_index), .z(LRU_index));
	
	VC_LRU_stack VC_STACK (.old_LRU(LRU_out), .way(LRU_index), .new_LRU(LRU_in));
	
	VC_LRU_array VC_TRUE_LRU (.clk, .write(load_LRU), .datain(LRU_in), .dataout(LRU_out));	
	
	// WAYS 1-8
	
	VCarray VC_DATA (.clk, .write(load_VC), .read_index, .write_index, .wb_index_out, .datain(L2_data), 
						  .dataout1(way1_data), .dataout2(way2_data), .dataout3(way3_data), .dataout4(way4_data), 
						  .dataout5(way5_data), .dataout6(way6_data), .dataout7(way7_data), .dataout8(way8_data), .rdataout(rb_data), .wdataout(wb_data));

	VCarray #(.width(12)) VC_ADR (.clk, .write(load_VC), .read_index, .write_index, .wb_index_out, .datain(L2_address), 
										   .dataout1(way1_address), .dataout2(way2_address), .dataout3(way3_address), .dataout4(way4_address), 
											.dataout5(way5_address), .dataout6(way6_address), .dataout7(way7_address), .dataout8(way8_address), .wdataout(way_address_out));
	
	VCarray #(.width(1)) VC_VALID (.clk, .write(load_VC), .read_index, .write_index, .wb_index_out, .datain(1'b1), 
											 .dataout1(way1_valid), .dataout2(way2_valid), .dataout3(way3_valid), .dataout4(way4_valid), 
											 .dataout5(way5_valid), .dataout6(way6_valid), .dataout7(way7_valid), .dataout8(way8_valid), .rdataout(way_valid_out));
	
	VCarray #(.width(1)) VC_DIRTY (.clk, .write(load_VC_dirty), .read_index, .write_index, .wb_index_out, .datain(VC_dirty_bit), 
											 .dataout1(way1_dirty), .dataout2(way2_dirty), .dataout3(way3_dirty), .dataout4(way4_dirty), 
											 .dataout5(way5_dirty), .dataout6(way6_dirty), .dataout7(way7_dirty), .dataout8(way8_dirty), .rdataout(way_dirty_out));
											 
	// check for VC hit (read or write)

	comparator #(.width(12)) ADR1_CHECK (.a(L2_address), .b(way1_address), .f(way1_found));
	comparator #(.width(12)) ADR2_CHECK (.a(L2_address), .b(way2_address), .f(way2_found));
	comparator #(.width(12)) ADR3_CHECK (.a(L2_address), .b(way3_address), .f(way3_found));
	comparator #(.width(12)) ADR4_CHECK (.a(L2_address), .b(way4_address), .f(way4_found));
	comparator #(.width(12)) ADR5_CHECK (.a(L2_address), .b(way5_address), .f(way5_found));
	comparator #(.width(12)) ADR6_CHECK (.a(L2_address), .b(way6_address), .f(way6_found));
	comparator #(.width(12)) ADR7_CHECK (.a(L2_address), .b(way7_address), .f(way7_found));
	comparator #(.width(12)) ADR8_CHECK (.a(L2_address), .b(way8_address), .f(way8_found));

   always_comb begin
        
		VC_hit = 1;
		hit_way = 3'b000;
      VC_hit_dirty = 0;

		if (way1_found & way1_valid) begin
			hit_way = 3'b000;
			VC_hit_dirty = way1_dirty;
		end
		else if (way2_found & way2_valid) begin
			hit_way = 3'b001;
			VC_hit_dirty = way2_dirty;
		end
		else if (way3_found & way3_valid) begin
			hit_way = 3'b010;
			VC_hit_dirty = way3_dirty;
		end
		else if (way4_found & way4_valid) begin
			hit_way = 3'b011;
			VC_hit_dirty = way4_dirty;
		end
		else if (way5_found & way5_valid) begin
			hit_way = 3'b100;
			VC_hit_dirty = way5_dirty;
		end
		else if (way6_found & way6_valid) begin
			hit_way = 3'b101;
			VC_hit_dirty = way6_dirty;
		end
		else if (way7_found & way7_valid) begin
			hit_way = 3'b110;
			VC_hit_dirty = way7_dirty;
		end
		else if (way8_found & way8_valid) begin
			hit_way = 3'b111;
			VC_hit_dirty = way8_dirty;
		end
		else begin
			VC_hit = 0;
		end
    
	end
    
endmodule : VC_datapath
