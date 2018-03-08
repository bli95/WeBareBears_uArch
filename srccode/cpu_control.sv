import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module cpu_control
(
    input clk,

	/* Datapath controls */
	input lc3b_opcode opcode,
	input logic branch_enable,
	input logic immOrA_bit,
	input logic jsr_bit,
	input logic D_bit,
	input logic write_hb,
	output logic load_pc,
	output logic load_ir,
	output logic load_regfile,
	output logic load_mar,
	output logic load_mdr,
	output logic load_cc,
	output logic [1:0] pcmux_sel,
	output logic adjmux_sel,
	output logic storemux_sel,
	output logic destmux_sel,
	output logic alumux1_sel,
	output logic [2:0] alumux2_sel,
	output logic [1:0] regfilemux_sel,
	output logic [1:0] marmux_sel,
	output logic [1:0] mdrmux_sel,
	output lc3b_aluop aluop,

	/* Memory signals */
	input mem_resp,
	output logic mem_read,
	output logic mem_write,
	output lc3b_mem_wmask mem_byte_enable
);

enum int unsigned {
   fetch1, fetch2, fetch3,
	decode,
	s_add, i_add,
	s_and, i_and,
	s_not,
	br, br_taken,
	jmp_ret,
	store_pc, jsr, jsrr,
	calc_addr,
	ld1, 
	ldb2,
	ldi2, ldi3, ldi4,
	ldr2,
	lea,
	shf,
	stb1, stb2,
	sti1, sti2, sti3, sti4,
	str1, str2,
	save_pc, trap1, trap2, trap3
} state, next_state;

always_comb
begin : state_actions
	load_pc = 1'b0;
	load_ir = 1'b0;
	load_regfile = 1'b0;
	load_mar = 1'b0;
	load_mdr = 1'b0;
	load_cc = 1'b0;
	pcmux_sel = 2'b00;
	adjmux_sel = 1'b0;
	storemux_sel = 1'b0;
	destmux_sel = 1'b0;
	alumux1_sel = 1'b0;
	alumux2_sel = 3'b000;
	regfilemux_sel = 2'b00;
	marmux_sel = 2'b00;
	mdrmux_sel = 2'b00;
	aluop = alu_add;
	mem_read = 1'b0;
	mem_write = 1'b0;
	mem_byte_enable = 2'b11;

	case(state)
		fetch1: begin
			/* MAR <= PC */
			marmux_sel = 1;
			load_mar = 1;

			/* PC <= PC + 2 */
			pcmux_sel = 0;
			load_pc = 1;
		end
		fetch2: begin
			/* Read memory */
			mem_read = 1;
			mdrmux_sel = 1;
			load_mdr = 1;
		end
		fetch3: begin
			/* Load IR */
			load_ir = 1;
		end
		decode: /* Do nothing */;
		s_add: begin
			/* DR <= SRA + SRB */
			aluop = alu_add;
			load_regfile = 1;
			load_cc = 1;
		end
		i_add: begin
			aluop = alu_add;
			load_regfile = 1;
			load_cc = 1;
			alumux2_sel = 3'b011;
		end
		s_and: begin
			aluop = alu_and;
			load_regfile = 1;
			load_cc = 1;
		end
		i_and: begin
			aluop = alu_and;
			load_regfile = 1;
			load_cc = 1;
			alumux2_sel = 3'b011;
		end
		s_not: begin
			aluop = alu_not;
			load_regfile = 1;
			load_cc = 1;
		end
		br: /* Do nothing */ ;
		br_taken: begin
			pcmux_sel = 1;
			load_pc = 1;
		end
		jmp_ret: begin
			pcmux_sel = 2'b10;
			load_pc = 1;
		end
		store_pc, save_pc: begin
			alumux1_sel = 1;
			aluop = alu_pass;
			destmux_sel = 1;
			load_regfile = 1;
		end
		jsr: begin
			adjmux_sel = 1;
			pcmux_sel = 2'b01;
			load_pc = 1;
		end
		jsrr: begin
			pcmux_sel = 2'b10;
			load_pc = 1;
		end
		calc_addr: begin
			if (opcode == op_ldb || opcode == op_stb)
				alumux2_sel = 3'b010;
			else
				alumux2_sel = 3'b001;
			aluop = alu_add;
			load_mar = 1;
		end
		ld1, ldi3, sti1, trap2: begin
			mem_read = 1;
			mdrmux_sel = 1;
			load_mdr = 1;
		end
		ldb2: begin
			regfilemux_sel = 2'b10;
			load_regfile = 1;
			load_cc = 1;
		end
		ldi2, sti2: begin
			marmux_sel = 2'b10;
			load_mar = 1;
		end
		ldr2, ldi4: begin
			regfilemux_sel = 1;
			load_regfile = 1;
			load_cc = 1;
		end
		lea: begin
			aluop = alu_add;
			load_regfile = 1;
			load_cc = 1;
			alumux1_sel = 1;
			alumux2_sel = 3'b101;
		end
		shf: begin
			alumux2_sel = 3'b100;
			if (D_bit == 0)
				aluop = alu_sll;
			else
				if (immOrA_bit == 0)
					aluop = alu_srl;
				else
					aluop = alu_sra;
			load_regfile = 1;
			load_cc = 1;
		end
		stb1: begin
			storemux_sel = 1;
			mdrmux_sel = 2'b10;
			load_mdr = 1;
		end
		stb2: begin
			if (write_hb == 0)
				mem_byte_enable = 2'b01;
			else
				mem_byte_enable = 2'b10;
			mem_write = 1;
		end
		sti3, str1: begin
			aluop = alu_pass;
			storemux_sel = 1;
			load_mdr = 1;
		end
		sti4, str2: begin
			mem_write = 1;
		end
		trap1: begin
			marmux_sel = 2'b11;
			load_mar = 1;
		end
		trap3: begin
			pcmux_sel = 2'b11;
			load_pc = 1;
		end
		default: /* Do nothing */;
	endcase
end

always_comb
begin : next_state_logic
	 next_state = state;
    case(state)
		fetch1: next_state = fetch2;
		fetch2: begin
			if (mem_resp == 0)
				next_state = fetch2;
			else
				next_state = fetch3;
		end
		fetch3: next_state = decode;
		decode: begin
			case(opcode)
				op_add: begin
					if (immOrA_bit == 0)
						next_state = s_add;
					else
						next_state = i_add;
				end
				op_and: begin
					if (immOrA_bit == 0)
						next_state = s_and;
					else
						next_state = i_and;
				end
				op_not: next_state = s_not;
				op_br:  next_state = br;
				op_jmp: next_state = jmp_ret;
				op_jsr: next_state = store_pc;
				op_ldb: next_state = calc_addr;
				op_ldi: next_state = calc_addr;
				op_ldr: next_state = calc_addr;
				op_lea: next_state = lea;
				op_shf: next_state = shf;
				op_stb: next_state = calc_addr;
				op_sti: next_state = calc_addr;
				op_str: next_state = calc_addr;
				op_trap: next_state = save_pc;
				default: /* nada */;
			endcase
		end
		s_add: next_state = fetch1;
		i_add: next_state = fetch1;
		s_and: next_state = fetch1;
		i_and: next_state = fetch1;
		s_not: next_state = fetch1;
		br: begin
			if (branch_enable == 1)
				next_state = br_taken;
			else
				next_state = fetch1;
		end
		br_taken: next_state = fetch1;
		jmp_ret: next_state = fetch1;
		store_pc: begin
			if (jsr_bit == 0)
				next_state = jsrr;
			else
				next_state = jsr;
		end
		jsr: next_state = fetch1;
		jsrr: next_state = fetch1;
		calc_addr: begin
			case(opcode)
				op_ldr, op_ldb, op_ldi: next_state = ld1;
				op_str: next_state = str1;
				op_stb: next_state = stb1;
				op_sti: next_state = sti1;
				default: /* nada */;
			endcase
		end
		ld1, sti1, trap2: begin
			if (mem_resp == 0)
				next_state = state;
			else
				case(opcode)
					op_ldb: next_state = ldb2;
					op_ldi: next_state = ldi2;
					op_ldr: next_state = ldr2;
					op_sti: next_state = sti2;
					op_trap: next_state = trap3;
					default: /* nada */;
				endcase
		end
		ldb2: next_state = fetch1;
		ldi2: next_state = ldi3;
		ldi3: begin
			/* "ldi1" used the op_ldi case in ld1 block above,
				hence this extra block is necessary. */
			if (mem_resp == 0)
				next_state = ldi3;
			else
				next_state = ldi4;
		end
		ldi4: next_state = fetch1;
		ldr2: next_state = fetch1;
		lea: next_state = fetch1;
		shf: next_state = fetch1;
		stb1: next_state = stb2;
		sti2: next_state = sti3;
		sti3: next_state = sti4;
		str1: next_state = str2;
		stb2, sti4, str2: begin
			if (mem_resp == 0)
				next_state = state;
			else
				next_state = fetch1;
		end
		save_pc: next_state = trap1;
		trap1: next_state = trap2;
		trap3: next_state = fetch1;
		default: /* nada */;
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    state <= next_state;
end

endmodule : cpu_control
