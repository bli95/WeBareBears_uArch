import lc3b_types::*;

module control_rom
(
	input lc3b_opcode opcode,
	input bit_11, bit_5, bit_4,
	output lc3b_control_word ctrl
);

always_comb
begin
	/* Default assignments */
	ctrl.opcode = opcode;
	ctrl.instr_bit11 = bit_11;
	ctrl.pcmux_sel = 2'b00;
	ctrl.adjmux_sel = 1'b0;
	ctrl.sr1mux_sel = 1'b0;
	ctrl.sr2mux_sel = 1'b0;
	ctrl.immmux_sel = 2'b00;
	ctrl.regAmux_sel = 1'b0;
	ctrl.aluBmux_sel = 1'b0;
	ctrl.aluop = alu_pass;
	ctrl.jsrmux_sel = 1'b0;
	ctrl.marmux_sel = 1'b0;
	ctrl.wbdatamux_sel = 1'b0;
	ctrl.load_cc = 1'b0;
	
	/* Assign control signals based on opcode */
	case(opcode)
		op_add: begin
			if (bit_5)
				ctrl.aluBmux_sel = 1'b1;
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1'b1;
		end
		op_and: begin
			if (bit_5)
				ctrl.aluBmux_sel = 1'b1;
			ctrl.aluop = alu_and;
			ctrl.load_cc = 1'b1;
		end
		op_br: begin

		end
		op_jmp: begin    /* also RET */

		end
		op_jsr: begin    /* also JSRR */

		end
		op_ldb: begin

		end
		op_ldi: begin

		end
		op_ldr: begin

		end
		op_lea: begin

		end
		op_not: begin

		end
		op_shf: begin

		end
		op_stb: begin

		end
		op_sti: begin

		end
		op_str: begin

		end
		op_trap: begin

		end
		/* ... other opcodes ... */
		default: begin
			ctrl = 0; /* Unknown opcode, set control word to zero */
		end
	endcase
end

endmodule : control_rom