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
	ctrl.adjmux_sel = 1'b0;
	ctrl.sr1mux_sel = 1'b0;
	ctrl.sr2mux_sel = 1'b0;
	ctrl.immmux_sel = 2'b00;
	ctrl.regAmux_sel = 1'b0;
	ctrl.aluBmux_sel = 1'b0;
	ctrl.aluop = alu_pass;
	ctrl.jsrmux_sel = 1'b0;
	ctrl.marmux_sel = 2'b00;
	ctrl.wbdatamux_sel = 1'b0;
	ctrl.load_cc = 1'b0;
	ctrl.dstmux_sel = 1'b0;
	ctrl.load_dst = 1'b0;
	
	/* Assign control signals based on opcode */
	case(opcode)
		op_add: begin
			if (bit_5)
				ctrl.aluBmux_sel = 1;
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_and: begin
			if (bit_5)
				ctrl.aluBmux_sel = 1;
			ctrl.aluop = alu_and;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_br: begin
		end
		op_jmp: begin    /* also RET */
		end
		op_jsr: begin    /* also JSRR */
			ctrl.adjmux_sel = 1;
			ctrl.jsrmux_sel = bit_11;
			ctrl.marmux_sel = 2'b10;
			ctrl.dstmux_sel = 1;
			ctrl.load_dst = 1;
		end
		op_ldb: begin
			ctrl.immmux_sel = 2'b11;
			ctrl.aluBmux_sel = 1;
			ctrl.aluop = alu_add;
			ctrl.wbdatamux_sel = 2'b01;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_ldi,op_ldr: begin
			ctrl.immmux_sel = 2'b10;
			ctrl.aluBmux_sel = 1;
			ctrl.aluop = alu_add;
 		   ctrl.wbdatamux_sel = 2'b01;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_lea: begin
			ctrl.marmux_sel = 2'b01;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_not: begin
			ctrl.aluop = alu_not;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_shf: begin
			ctrl.immmux_sel = 2'b01;
			ctrl.aluBmux_sel = 1;
			if (bit_4 == 0)
				ctrl.aluop = alu_sll;
			else
				if (bit_5 == 0)
					ctrl.aluop = alu_srl;
				else
					ctrl.aluop = alu_sra;
			ctrl.load_cc = 1;
			ctrl.load_dst = 1;
		end
		op_stb: begin
			ctrl.sr2mux_sel = 1;
			ctrl.immmux_sel = 2'b11;
			ctrl.aluBmux_sel = 1;
			ctrl.aluop = alu_add;
		end
		op_sti,op_str: begin
			ctrl.sr2mux_sel = 1;
			ctrl.immmux_sel = 2'b10;
			ctrl.aluBmux_sel = 1;
			ctrl.aluop = alu_add;
		end
		op_trap: begin
			ctrl.regAmux_sel = 1;
			ctrl.wbdatamux_sel = 2'b10;
			ctrl.dstmux_sel = 1;
		end
		// op_rti not implemented
		default: begin
			ctrl = 0; /* Unknown opcode, set control word to zero */
		end
	endcase
end

endmodule : control_rom