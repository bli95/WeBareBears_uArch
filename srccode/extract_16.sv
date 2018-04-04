import lc3b_types::*;

module extract_16 (input [127:0] data_128,
						 input lc3b_word sel_mask,
						 output logic [15:0] data_16
						 );
					
		always_comb begin
		
			case (sel_mask) 
				16'h0001: data_16 = {8'h00, data_128[7:0]};
				16'h0002: data_16 = {data_128[15:8], 8'h00};
				16'h0003: data_16 = data_128[15:0];
				16'h0004: data_16 = {8'h00, data_128[23:16]};
				16'h0008: data_16 = {data_128[31:24], 8'h00};
				16'h000c: data_16 = data_128[31:16];
				16'h0010: data_16 = {8'h00, data_128[39:32]};
				16'h0020: data_16 = {data_128[47:40], 8'h00};
				16'h0030: data_16 = data_128[47:32];
				16'h0040: data_16 = {8'h00, data_128[55:48]};
				16'h0080: data_16 = {data_128[63:56], 8'h00};
				16'h00c0: data_16 = data_128[63:48];
				16'h0100: data_16 = {8'h00, data_128[71:64]};
				16'h0200: data_16 = {data_128[79:72], 8'h00};
				16'h0300: data_16 = data_128[79:64];
				16'h0400: data_16 = {8'h00, data_128[87:80]};
				16'h0800: data_16 = {data_128[95:88], 8'h00};
				16'h0c00: data_16 = data_128[95:80];
				16'h1000: data_16 = {8'h00, data_128[103:96]};
				16'h2000: data_16 = {data_128[111:104], 8'h00};
				16'h3000: data_16 = data_128[111:96];
				16'h4000: data_16 = {8'h00, data_128[119:112]};
				16'h8000: data_16 = {data_128[127:120], 8'h00};
				16'hc000: data_16 = data_128[127:112];
				default: data_16 = 16'hxxxx;
			endcase
		
		end
		
endmodule : extract_16