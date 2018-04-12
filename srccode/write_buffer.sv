import lc3b_types::*;

module write_buffer
(
	input logic [127:0] wdata,
	input logic [11:0] w_address,
	input logic mem_ack, w_req, 
	
	output logic EWB_ack,
);

	logic [127:0] data_1;
	logic [11:0] addr_1;
	logic valid_1, load_1;
	
	enum int unsigned {hold_nbd, hold_sbd, mem_write, mem_break} state, next_state;
	
	always_comb begin
		
		load_1 = 1'b0;
		EWB_data_found = 1'b0;
	
		case(state)
			hold_nbd:
			begin
				if (w_req) begin
					load_1 = 1'b1;
					EWB_ack = 1'b1;
				end
				else begin
					EWB_ack = 1'b0;
				end
			end
			hold_sbd:
			begin
				EWB_ack = 1'b0;
			end
			mem_write:
			begin
				if (mem_ack) begin
					EWB_ack = 1'b1;
				end
				else begin
					EWB_ack = 1'b0;
				end
			end
			mem_break:
			begin
				EWB_ack = 1'b0;
			end
		endcase
	end
	
	always_comb begin
		
		case(state)
			hold_nbd:
			begin
				if (w_req) begin
					next_state = mem_break;
				end
				else begin
					next_state = hold_nbd;
				end
			end
			hold_sbd:
			begin
				if (mem_ack) begin
					next_state = mem_write;
				end
				else begin
					next_state = hold_sbd;
				end
			end
			mem_write:
			begin
				if (mem_ack) begin
					next_state = mem_break;
				end
				else begin
					next_state = mem_write;
				end
			end
			mem_break:
			begin
				next_state = hold_sbd;
			end
		endcase
	end
	
	register #(.width(1)) EWB_VALID_1 (.clk, .load(load_1), .in(), .out(valid_1));
	
	register #(.width(12)) EWB_ADDR_1 (.clk, .load(load_1), .in(w_address), .out(addr_out_1));

	register #(.width(128)) EWB_DATA_1 (.clk, .load(load_1), .in(wdata), .out(data_out_1));

endmodule : write_buffer
