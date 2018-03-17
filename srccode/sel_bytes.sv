import lc3b_types::*;

module sel_bytes
(
	input lc3b_word mem_address,
	input [1:0] mem_byte_enable,
	output lc3b_word sel_mask
);

	always_comb begin
	
		case (mem_address[3:0])
			4'h0: 
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h0003;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h0002;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h0001;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'h1:
			begin
				sel_mask = 16'h0002;
			end
			4'h2: 
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h000c;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h0008;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h0004;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'h3:
			begin
				sel_mask = 16'h0008;
			end
			4'h4:
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h0030;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h0020;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h0010;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'h5:
			begin
				sel_mask = 16'h0020;
			end
			4'h6: 
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h00c0;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h0080;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h0040;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'h7:
			begin
				sel_mask = 16'h0080;
			end
			4'h8:
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h0300;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h0200;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h0100;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'h9:
			begin
				sel_mask = 16'h0200;
			end
			4'ha:
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h0c00;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h0800;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h0400;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'hb:
			begin
				sel_mask = 16'h0800;
			end
			4'hc: 
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'h3000;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h2000;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h1000;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'hd:
			begin
				sel_mask = 16'h2000;
			end
			4'he: 
			begin
				if (mem_byte_enable == 2'b11) begin
					sel_mask = 16'hc000;
				end
				else if (mem_byte_enable == 2'b10) begin
					sel_mask = 16'h8000;
				end
				else if (mem_byte_enable == 2'b01) begin
					sel_mask = 16'h4000;
				end
				else begin
					sel_mask = 16'h0000;
				end
			end
			4'hf:
			begin
				sel_mask = 16'h8000;
			end
			default: sel_mask = 16'hxxxx;
		endcase
	
	end
	
endmodule : sel_bytes