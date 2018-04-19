import lc3b_types::*;

module LRU_stack
(
	input [7:0] old_LRU,
	input [1:0] way,
	output logic [7:0] new_LRU
);

	always_comb begin

		if (way == old_LRU[1:0]) begin
			new_LRU = {{way}, {old_LRU[7:2]}};
		end
		else if (way == old_LRU[3:2]) begin
		   new_LRU = {{way}, {old_LRU[7:4]}, {old_LRU[1:0]}}; 
		end
		else if (way == old_LRU[5:4]) begin
			new_LRU = {{way}, {old_LRU[7:6]}, {old_LRU[3:0]}};
		end
		else begin
			new_LRU = old_LRU;
		end
		
	end
	
endmodule : LRU_stack
