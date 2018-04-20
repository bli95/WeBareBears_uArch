import lc3b_types ::*;

module VC_LRU_stack
(
	input [23:0] old_LRU,
	input [2:0] way,
	output logic [23:0] new_LRU
);

	always_comb begin

		if (way == old_LRU[2:0]) begin
			new_LRU = {{way}, {old_LRU[23:3]}};
		end
		else if (way == old_LRU[5:3]) begin
		   new_LRU = {{way}, {old_LRU[23:6]}, {old_LRU[2:0]}}; 
		end
		else if (way == old_LRU[8:6]) begin
			new_LRU = {{way}, {old_LRU[23:9]}, {old_LRU[5:0]}};
		end
		else if (way == old_LRU[11:9]) begin
			new_LRU = {{way}, {old_LRU[23:12]}, {old_LRU[8:0]}};
		end
		else if (way == old_LRU[14:12]) begin
			new_LRU = {{way}, {old_LRU[23:15]}, {old_LRU[11:0]}};
		end
		else if (way == old_LRU[17:15]) begin
			new_LRU = {{way}, {old_LRU[23:18]}, {old_LRU[14:0]}};
		end
		else if (way == old_LRU[20:18]) begin
			new_LRU = {{way}, {old_LRU[23:21]}, {old_LRU[17:0]}};
		end
		else begin
			new_LRU = old_LRU;
		end
	end
	
endmodule : VC_LRU_stack