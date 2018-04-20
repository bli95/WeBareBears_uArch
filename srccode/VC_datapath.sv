import lc3b_types ::*;

module VC_datapath
(
	input clk,
	
	input [2:0] data_index,
	input [11:0] L2_address,
	input [127:0] L2_data,
	input load_VC, load_VC_dirty, load_LRU, VC_dirty_bit,
	
    output logic VC_hit, VC_hit_dirty, VC_LRU_dirty,
    output logic [2:0] way,
    output logic [23:0] LRU_out,
	output logic [11:0] wb_address,
	output logic [127:0] wb_data,
);

    logic [23:0] LRU_in, LRU_out;
	
    assign VC_LRU_dirty = way_dirty_out;

    VC_LRU_stack (.old_LRU(LRU_out), .way(data_index), .new_LRU(LRU_in));
	VC_LRUarray (.clk, .write(load_LRU), .datain(LRU_in), dataout(LRU_out));	
	
	VCarray VC_DATA (.clk, .write(load_VC), .index(data_index), .datain(L2_data), 
							.dataout1(way1_data), .dataout2(way2_data), .dataout3(way3_data), .dataout4(way4_data), 
							.dataout5(way5_data), .dataout6(way6_data), .dataout7(way7_data), .dataout8(way8_data), .dataout(way_data_out));

	VCarray #(.width(12)) VC_ADR (.clk, .write(load_VC), .index(data_index), .datain(L2_address), 
						 .dataout1(way1_address), .dataout2(way2_address), .dataout3(way3_address), .dataout4(way4_address), 
						 .dataout5(way5_address), .dataout6(way6_address), .dataout7(way7_address), .dataout8(way8_address), .dataout(way_addr_out));
	
	VCarray #(.width(1)) VC_VALID (.clk, .write(load_VC), .index(data_index), .datain(1'b1), 
						 .dataout1(way1_valid), .dataout2(way2_valid), .dataout3(way3_valid), .dataout4(way4_valid), 
						 .dataout5(way5_valid), .dataout6(way6_valid), .dataout7(way7_valid), .dataout8(way8_valid), .dataout(way_valid_out));
	
	VCarray #(.width(1)) VC_DIRTY (.clk, .write(load_VC_dirty), .index(data_index), .datain(VC_dirty_bit), 
						 .dataout1(way1_dirty), .dataout2(way2_dirty), .dataout3(way3_dirty), .dataout4(way4_dirty), 
						 .dataout5(way5_dirty), .dataout6(way6_dirty), .dataout7(way7_dirty), .dataout8(way8_dirty), .dataout(way_dirty_out));

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
        way = 3'b000;
        VC_hit_dirty = 0;

        if (way1_found & way1_valid) begin
            way = 3'b000;
            VC_hit_dirty = way1_dirty;
        end
        else if (way2_found & way2_valid) begin
            way = 3'b001;
            VC_hit_dirty = way2_dirty;
        end
        else if (way3_found & way3_valid) begin
            way = 3'b010;
            VC_hit_dirty = way3_dirty;
        end
        else if (way4_found & way4_valid) begin
            way = 3'b011;
            VC_hit_dirty = way4_dirty;
        end
        else if (way5_found & way5_valid) begin
            way = 3'b100;
            VC_hit_dirty = way5_dirty;
        end
        else if (way6_found & way6_valid) begin
            way = 3'b101;
            VC_hit_dirty = way6_dirty;
        end
        else if (way7_found & way7_valid) begin
            way = 3'b110;
            VC_hit_dirty = way7_dirty;
        end
        else if (way8_found & way8_valid) begin
            way = 3'b111;
            VC_hit_dirty = way8_dirty;
        end
        else begin
            VC_hit = 0;
        end
    
    end
    
endmodule : VC_datapath
