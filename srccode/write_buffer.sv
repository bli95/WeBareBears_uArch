import lc3b_types::*;

module write_buffer
(
	input clk,
	input logic [127:0] w_data_in,
	input logic [11:0] w_addr_in,
	input logic mem_ack, L2_req, 
	
	output logic [127:0] w_data_out,
	output logic [11:0] w_addr_out,
	output logic EWB_ack, EWB_req
);

	logic valid_bit, load_v, load_d;
	
	enum int unsigned {hold_nbd, hold_sbd, mem_write, mem_break_1, mem_break_2} state, next_state;
	
	always_comb begin
		
		load_v = 1'b0;
		load_d = 1'b0;
		EWB_ack = 1'b0;
			
		case(state)
			hold_nbd:
			begin
				if (L2_req) begin
					load_v = 1'b1;
					load_d = 1'b1;
					EWB_ack = 1'b1;
				end
			end	
			mem_write:
			begin
				if (mem_ack) begin
					load_v = 1;
				end
			end
			hold_sbd, mem_break_1, mem_break_2: ;
		endcase
	end
	
	always_comb begin
		
		case(state)
			hold_nbd:
			begin
				if (L2_req) begin
					next_state = mem_break_1;
				end
				else begin
					next_state = state;
				end
			end
			hold_sbd:
			begin
				if (mem_ack) begin
					next_state = mem_break_2;
				end
				else begin
					next_state = state;
				end
			end
			mem_write:
			begin
				if (mem_ack) begin
					next_state = hold_nbd;
				end
				else begin
					next_state = state;
				end
			end
			mem_break_1:
			begin
				next_state = hold_sbd;
			end
			mem_break_2:
			begin
				next_state = mem_write;
			end
		endcase
	end
	
	register #(.width(1)) EWB_VALID_1 (.clk, .load(load_v), .in(!valid_bit), .out(valid_bit));
	register #(.width(12)) EWB_ADDR_1 (.clk, .load(load_d), .in(w_addr_in), .out(w_addr_out));
	register #(.width(128)) EWB_DATA_1 (.clk, .load(load_d), .in(w_data_in), .out(w_data_out));

endmodule : write_buffer
