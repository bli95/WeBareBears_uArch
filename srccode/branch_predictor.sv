import lc3b_types::*;

module branch_predictor
(
	input clk,
	
	input load_BR,
	input BR_taken,
	input [8:0] target_offset,
	input [15:0] current_PC, idex_PC,
	
	output logic prediction,
	output logic [15:0] target_address
);

	logic [3:0] BHR_out, BHR_in;
	logic [15:0] adj_offset;
	
	logic [1:0] state, next_state;
	
	logic load_reg;
	
	assign BHR_in = {BHR_out[2:0], BR_taken};

	register #(.width(4)) BHR (.clk, .load(load_BR), .in(BHR_in), .out(BHR_out));
	
	BR_array #(.width(2)) PHT (.clk, .write(load_BR), .read_index({current_PC[5:4], BHR_out}), .write_index({idex_PC[5:4], BHR_out}), .datain(next_state), .dataout(state));
	
	assign prediction = state[1];
	
	adj #(.width(9)) CALC_OFFSET (.in(target_offset), .out(adj_offset));
	
	assign target_address = current_PC + adj_offset;
	
	always_comb begin
	
		next_state = state;
	
		case(state)
			2'b00:
			begin
				if (BR_taken && load_BR) begin
					 next_state = 2'b01;
				end
			end
			2'b01:
			begin
				if (BR_taken && load_BR) begin
					next_state = 2'b10;
				end
				else if (!BR_taken && load_BR) begin
					next_state = 2'b00;
				end
			end
			2'b10:
			begin
				if (BR_taken && load_BR) begin
					next_state = 2'b11;
				end
				else if (!BR_taken && load_BR) begin
					next_state = 2'b01;
				end
			end
			2'b11:
			begin
				if (!BR_taken && load_BR) begin
					next_state = 2'b10;
				end
			end
		endcase
	end
	
endmodule : branch_predictor
