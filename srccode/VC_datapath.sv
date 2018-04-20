import lc3b_types ::*;

module VC_datapath
(
	input clk,
	
	input [2:0] data_index,
	input [11:0] L2_address,
	input [127:0] L2_data,
	
	output [11:0] wb_address,
	output [127:0] wb_data
);

   logic [23:0] LRU_in, LRU_out;
	
	VC_LRU_stack (.old_LRU(LRU_out), .way(LRU_out[2:0]), .new_LRU(LRU_in));
	VC_LRUarray (.clk, .write(load_LRU), .datain(LRU_in), dataout(LRU_out));	
	
	VCarray VC_DATA (.clk, .write(load_VC), .index(data_index), .datain(L2_data), .dataout(wb_data));

	VCarray #(.width(12)) VC_ADR1 (.clk, .write(load_VC), .datain(L2_address), .dataout(way1_address));
   VCarray #(.width(12)) VC_ADR2 (.clk, .write(load_VC), .datain(L2_address), .dataout(way2_address));
	VCarray #(.width(12)) VC_ADR3 (.clk, .write(load_VC), .datain(L2_address), .dataout(way3_address));
   VCarray #(.width(12)) VC_ADR4 (.clk, .write(load_VC), .datain(L2_address), .dataout(way4_address));
	VCarray #(.width(12)) VC_ADR5 (.clk, .write(load_VC), .datain(L2_address), .dataout(way5_address));
	VCarray #(.width(12)) VC_ADR6 (.clk, .write(load_VC), .datain(L2_address), .dataout(way6_address));
	VCarray #(.width(12)) VC_ADR7 (.clk, .write(load_VC), .datain(L2_address), .dataout(way7_address));
	VCarray #(.width(12)) VC_ADR8 (.clk, .write(load_VC), .datain(L2_address), .dataout(way8_address));
	
	comparator #(.width(12)) ADR1_CHECK (.a(L2_address), .b(way1_address), .f(way1_hit));
	comparator #(.width(12)) ADR2_CHECK (.a(L2_address), .b(way2_address), .f(way2_hit));
	comparator #(.width(12)) ADR3_CHECK (.a(L2_address), .b(way3_address), .f(way3_hit));
	comparator #(.width(12)) ADR4_CHECK (.a(L2_address), .b(way4_address), .f(way4_hit));
	comparator #(.width(12)) ADR5_CHECK (.a(L2_address), .b(way5_address), .f(way5_hit));
	comparator #(.width(12)) ADR6_CHECK (.a(L2_address), .b(way6_address), .f(way6_hit));
	comparator #(.width(12)) ADR7_CHECK (.a(L2_address), .b(way7_address), .f(way7_hit));
	comparator #(.width(12)) ADR8_CHECK (.a(L2_address), .b(way8_address), .f(way8_hit));
	
	
	
endmodule : VC_datapath