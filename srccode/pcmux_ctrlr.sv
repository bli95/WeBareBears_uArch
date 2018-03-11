import lc3b_types::*;

module pcmux_ctrlr
(
	input lc3b_opcode exme_opcode, idex_opcode,
	input br_en,
	output logic [1:0] pcmux_sel
);

always_comb
begin
	pcmux_sel = 2'b00; // for most instructions except when pc needs to "jump" from trap/br/etc
	
	if (exme_opcode == op_trap)
		pcmux_sel = 2'b11;
	else
	begin
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
	end
end

endmodule : pcmux_ctrlr