import lc3b_types::*;

module stall_generator 
(
	input lc3b_opcode exme_opcode, idex_opcode,
	input br_en,
	input iwait, dwait,
	
	output logic pc_stall,
	output logic ifid_stall,
	output logic idex_stall,
	output logic exme_stall,
	output logic mewb_stall
);

	always_comb begin

		/*if (iwait || (dwait && exme_opcode == op_trap)) begin
			pc_stall = 1'b1;
		end
		else begin
			pc_stall = 1'b0;
		end
		
		if (iwait || idex_stall) begin
			ifid_stall = 1'b1;
		end
		else begin
			ifid_stall = 1'b0;
		end
		
		if ((exme_stall && (idex_opcode != op_br && idex_opcode != op_jmp)) || (pc_stall && (((idex_opcode == op_br) && br_en) || idex_opcode == op_jmp))) begin
			idex_stall = 1'b1;
		end
		else begin
			idex_stall = 1'b0;
		end
		
		if (dwait || (pc_stall && exme_opcode == op_trap)) begin
			exme_stall = 1'b1;
		end
		else begin
			exme_stall = 1'b0;
		end
		
		mewb_stall = 1'b0;
		*/
		
		if (iwait || dwait) begin
			pc_stall = 1'b1;
		end
		else begin
			pc_stall = 1'b0;
		end
		
		if (iwait || dwait) begin
			ifid_stall = 1'b1;
		end
		else begin
			ifid_stall = 1'b0;
		end
		
		if (dwait || iwait) begin
			idex_stall = 1'b1;
		end
		else begin
			idex_stall = 1'b0;
		end
		
		if (dwait || iwait) begin
			exme_stall = 1'b1;
		end
		else begin
			exme_stall = 1'b0;
		end
		
		mewb_stall = 1'b0;
	end
	
endmodule : stall_generator