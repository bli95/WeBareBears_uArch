import lc3b_types::*;

module extend_128 (input [127:0] data_old_128,
						 input lc3b_word sel_mask,
						 input lc3b_word data_16,
						 output logic [127:0] data_new_128
						 );
				
		always_comb begin
		
		case (sel_mask) 
			16'h0000:
			begin
				data_new_128 = data_old_128;
			end
			16'h0001:
			begin
				data_new_128 = {data_old_128[127:8], data_16[7:0]};
			end
			16'h0002:
			begin
				data_new_128 = {data_old_128[127:16], data_16[15:8], data_old_128[7:0]};
			end
			16'h0003:
			begin
				data_new_128 = {data_old_128[127:16], data_16};
			end
			16'h0004:
			begin
				data_new_128 = {data_old_128[127:24], data_16[7:0], data_old_128[15:0]};
			end
			16'h0008:
			begin
				data_new_128 = {data_old_128[127:32], data_16[15:8], data_old_128[23:0]};
			end
			16'h000c:
			begin
				data_new_128 = {data_old_128[127:32], data_16, data_old_128[15:0]};
			end
			16'h0010:
			begin
				data_new_128 = {data_old_128[127:40], data_16[7:0], data_old_128[31:0]};
			end
			16'h0020:
			begin
				data_new_128 = {data_old_128[127:48], data_16[15:8], data_old_128[39:0]};
			end
			16'h0030:
			begin
				data_new_128 = {data_old_128[127:48], data_16, data_old_128[31:0]};
			end
			16'h0040:
			begin
				data_new_128 = {data_old_128[127:56], data_16[7:0], data_old_128[47:0]};
			end
			16'h0080:
			begin
				data_new_128 = {data_old_128[127:64], data_16[15:8], data_old_128[55:0]};
			end
			16'h00c0:
			begin
				data_new_128 = {data_old_128[127:64], data_16, data_old_128[47:0]};
			end
			16'h0100:
			begin
				data_new_128 = {data_old_128[127:72], data_16[7:0], data_old_128[63:0]};
			end
			16'h0200:
			begin
				data_new_128 = {data_old_128[127:80], data_16[15:8], data_old_128[71:0]};
			end
			16'h0300:
			begin
				data_new_128 = {data_old_128[127:80], data_16, data_old_128[63:0]};
			end
			16'h0400:
			begin
				data_new_128 = {data_old_128[127:88], data_16[7:0], data_old_128[79:0]};
			end
			16'h0800:
			begin
				data_new_128 = {data_old_128[127:96], data_16[15:8], data_old_128[87:0]};
			end
			16'h0c00:
			begin
				data_new_128 = {data_old_128[127:96], data_16, data_old_128[79:0]};
			end
			16'h1000:
			begin
				data_new_128 = {data_old_128[127:104], data_16[7:0], data_old_128[95:0]};
			end
			16'h2000:
			begin
				data_new_128 = {data_old_128[127:112], data_16[15:8], data_old_128[103:0]};
			end
			16'h3000:
			begin
				data_new_128 = {data_old_128[127:112], data_16, data_old_128[95:0]};
			end
			16'h4000:
			begin
				data_new_128 = {data_old_128[127:120], data_16[7:0], data_old_128[111:0]};
			end
			16'h8000:
			begin
				data_new_128 = {data_16[15:8], data_old_128[119:0]};
			end
			16'hc000:
			begin
				data_new_128 = {data_16, data_old_128[111:0]};
			end
			default:
			begin
				data_new_128 = data_old_128;
			end
		endcase
		
		end
		
endmodule : extend_128
