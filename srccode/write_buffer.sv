import lc3b_types::*;

module write_buffer
(
	input logic [127:0] wdata,
	input logic [11:0] w_address, r_address,
	input logic mem_ack, w_req, r_req,
	
	output logic [127:0] rdata,
	output logic EWB_ack, EWB_data_found,
);

	logic [127:0] data_out_1, data_out_2;
	logic [11:0] addr_out_1, addr_out_2;
	logic valid_1, valid_2;
	
	enum int unsigned {hold, imm_write, wait_write} state, next_state;
	
	always_comb begin
	
		EWB_ack = 1'b0;
		EWB_data_found = 1'b0;
	
		case(state)
			hold:
			begin
				EWB_ack = 1'b0;
			end
			imm_read:
			begin
				EWB_ack = 1'b1;
			end
			imm_write:
			begin
				EWB_ack = 1'b1;
			end
			wait_write:
			begin
				EWB_ack = 1'b0;
			end
		endcase
		
	end
	
	always_comb begin
		
		case(state)
			hold:
			begin
				if (r_req && (((r_address == addr_out_1) && valid_1) || ((r_address == addr_out_2) && valid_2)))) begin
					next_state = imm_read;
				end
				else if (w_req && (!valid_1 || !valid_2)) begin
					next_state = imm_wait;
				end
				else if (valid_1 || valid_2) begin
					next_state = wait_write;
				end
				else begin
					next_state = hold;
				end
			end
			imm_read:
			begin
				next_state = hold;
			end
			imm_write:
			begin
				next_state = hold;
			end
			wait_write:
			begin
				if (
			end
			
			
				
	
	
	
	register #(.width(1)) EWB_VALID_1 (.clk, .load(load_1), .in(), .out(valid_1));
	register #(.width(1)) EWB_VALID_2 (.clk, .load(load_2), .in(), .out(valid_2));
	
	register #(.width(12)) EWB_ADDR_1 (.clk, .load(load_1), .in(w_address), .out(addr_out_1));
	register #(.width(12)) EWB_ADDR_2 (.clk, .load(load_2), .in(w_address), .out(addr_out_2));

	register #(.width(128)) EWB_DATA_1 (.clk, .load(load_1), .in(wdata), .out(data_out_1));
	register #(.width(128)) EWB_DATA_2 (.clk, .load(load_2), .in(wdata), .out(data_out_2));

