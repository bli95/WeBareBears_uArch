import lc3b_types::*;

module pcmux_ctrlr
(
	input lc3b_opcode exme_opcode, idex_opcode,
	input br_en, prediction, idex_prediction,
	input [2:0] idex_dest, 
	input [3:0] pc_opcode,
	output logic [2:0] pcmux_sel
);

always_comb
begin

	// for most instructions except when pc needs to "jump" from trap/br/etc
	
	if (exme_opcode == op_trap) begin
		pcmux_sel = 3'b011;
	end
	else if (idex_opcode == op_jsr || idex_opcode == op_jmp) begin
		pcmux_sel = 3'b010;
	end
	else if (idex_opcode == op_br && br_en && !idex_prediction) begin
		pcmux_sel = 3'b001;
	end
	else if (idex_opcode == op_br && !br_en && idex_prediction && idex_dest != 3'b000) begin
		pcmux_sel = 3'b101;
	end
	else if (pc_opcode == op_br && prediction == 1'b1) begin
		pcmux_sel = 3'b100;
	end 
	else begin
		pcmux_sel = 3'b000; 
	end
	/*begin
		unique case(idex_opcode)
			op_jsr,op_jmp: begin
				pcmux_sel = 2'b10;
			end
			op_br: begin
				if (br_en)
					pcmux_sel = 2'b01;
				// else, it's either a not-taken branch or a no op... so let pc mux increment
			end
		endcase
	end*/
end

endmodule : pcmux_ctrlr
