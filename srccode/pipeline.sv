import lc3b_types::*;

module ifid_pipe
(
    input clk, load, reset,
    input lc3b_word pc_plus2_out, instruction,
    
    output lc3b_word ifid_next_pc,
    output lc3b_opcode opcode,
    output logic bit_4, bit_5, bit_11,
    output lc3b_reg ifid_dest, ifid_src1, ifid_src2,
	 output lc3b_offset4 ifid_imm4,
	 output lc3b_offset5 ifid_imm5,
    output lc3b_offset6 ifid_offset6,
    output lc3b_offset9 ifid_offset9,
	 output lc3b_offset11 ifid_offset11,
	 output lc3b_byte ifid_trapvect8
);

lc3b_word pc_plus2_int = '0;	// initializes interstage regs to 0 so prog starts correctly
lc3b_word instruction_int = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1) begin	// not stalling, aka normal operations per cycle  
			pc_plus2_int = pc_plus2_out;
			instruction_int = instruction;
		end
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
	begin
		/* squashing register values for br/jmp/jsr and trap, etc. */
		pc_plus2_int = '0;
		instruction_int = '0;
	end
end

always_comb
begin
   ifid_next_pc = pc_plus2_int;
   ifid_dest = instruction_int[11:9];
   ifid_src1 = instruction_int[8:6];
   ifid_src2 = instruction_int[2:0];
	ifid_imm4 = instruction_int[3:0];
	ifid_imm5 = instruction_int[4:0];
   ifid_offset6 = instruction_int[5:0];
   ifid_offset9 = instruction_int[8:0];
   ifid_offset11 = instruction_int[10:0];
	ifid_trapvect8 = instruction_int[7:0];
	
	opcode = lc3b_opcode'(instruction_int[15:12]);
	bit_4 = instruction_int[4];
	bit_5 = instruction_int[5];
	bit_11 = instruction_int[11];
end

endmodule : ifid_pipe

module idex_pipe
(
    input clk, load, reset,
    input lc3b_word ifid_next_pc, adjmux_out, regAmux_out, reg2_out, immvalmux_out,
	 input lc3b_reg ifid_dest, ifid_src1, ifid_src2,
	 input lc3b_control_word ifid_ctrl_word, 
    
    output lc3b_word idex_next_pc, idex_pc_offset,
    output lc3b_reg idex_dest, idex_src1, idex_src2,
    output lc3b_word idex_regA, idex_regB,
    output lc3b_word idex_imm_val,
    output lc3b_control_word idex_ctrl_word
);

lc3b_word idex_int_next_pc = '0, adjmux_int = '0, regAmux_int = '0, reg2_int = '0, immvalmux_int = '0;
lc3b_reg idex_int_dest = '0, idex_int_src1 = '0, idex_int_src2 = '0;
lc3b_control_word idex_int_ctrl_word = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1) begin	// not stalling, aka normal operations per cycle  
			idex_int_next_pc = ifid_next_pc; adjmux_int = adjmux_out; regAmux_int = regAmux_out; reg2_int = reg2_out; immvalmux_int = immvalmux_out;
			idex_int_dest = ifid_dest; idex_int_src1 = ifid_src1; idex_int_src2 = ifid_src2;
			idex_int_ctrl_word = ifid_ctrl_word;
		end
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
	begin
		/* squashing register values for br/jmp/jsr and trap, etc. */
		idex_int_next_pc = '0; adjmux_int = '0; regAmux_int = '0; reg2_int = '0; immvalmux_int = '0;
		idex_int_dest = '0; idex_int_src1 = '0; idex_int_src2 = '0;
		idex_int_ctrl_word = '0;
	end
end

always_comb
begin
    idex_next_pc = idex_int_next_pc; idex_pc_offset = adjmux_int;
    idex_dest = idex_int_dest; idex_src1 = idex_int_src1; idex_src2 = idex_int_src2;
    idex_regA = regAmux_int; idex_regB = reg2_int;
    idex_imm_val = immvalmux_int;
    idex_ctrl_word = idex_int_ctrl_word;
end

endmodule : idex_pipe

module exme_pipe
(
    input clk, load, reset,
    input lc3b_word idex_next_pc, marmux_out, stb_datmod_out,
	 input lc3b_sel stb_datmod_sel,
	 input lc3b_reg idex_dest, idex_src1, idex_src2,
	 input lc3b_control_word idex_ctrl_word,
    
    output lc3b_word exme_next_pc, exme_mar, exme_mdr,
	 output lc3b_sel exme_sel, 
    output lc3b_reg exme_dest, exme_src1, exme_src2,
    output lc3b_control_word exme_ctrl_word
);

lc3b_word idex_int_next_pc = '0, marmux_int = '0, stb_datmod_int = '0;
lc3b_sel stb_datmod_sel_int = '0;
lc3b_reg idex_int_dest = '0, idex_int_src1 = '0, idex_int_src2 = '0;
lc3b_control_word idex_int_ctrl_word = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1) begin	// not stalling, aka normal operations per cycle  
			idex_int_next_pc = idex_next_pc; marmux_int = marmux_out; stb_datmod_int = stb_datmod_out;
			stb_datmod_sel_int = stb_datmod_sel;
			idex_int_dest = idex_dest; idex_int_src1 = idex_src1; idex_int_src2 = idex_src2;
			idex_int_ctrl_word = idex_ctrl_word;
		end
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
	begin
		/* squashing register values for br/jmp/jsr and trap, etc. */
		idex_int_next_pc = '0; marmux_int = '0; stb_datmod_int = '0;
		stb_datmod_sel_int = '0;
		idex_int_dest = '0; idex_int_src1 = '0; idex_int_src2 = '0;
		idex_int_ctrl_word = '0;
	end
end

always_comb
begin
    exme_next_pc = idex_int_next_pc; exme_mar = marmux_int; exme_mdr = stb_datmod_int;
	 exme_sel = stb_datmod_sel_int; 
    exme_dest = idex_int_dest; exme_src1 = idex_int_src1; exme_src2 = idex_int_src2;
    exme_ctrl_word = idex_int_ctrl_word;
end

endmodule : exme_pipe

module mewb_pipe
(
    input clk, load, reset,
    input lc3b_word wbdatamux_out, 
	 input lc3b_reg exme_dest, exme_src1, exme_src2,
	 input lc3b_control_word exme_ctrl_word,
    
    output lc3b_word mewb_wbdata, 
    output lc3b_reg mewb_dest, mewb_src1, mewb_src2,
    output lc3b_control_word mewb_ctrl_word
);

lc3b_word wbdatamux_int = '0;
lc3b_reg exme_int_dest = '0, exme_int_src1 = '0, exme_int_src2 = '0;
lc3b_control_word exme_int_ctrl_word = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1) begin	// not stalling, aka normal operations per cycle  
			wbdatamux_int = wbdatamux_out;
			exme_int_dest = exme_dest; exme_int_src1 = exme_src1; exme_int_src2 = exme_src2;
			exme_int_ctrl_word = exme_ctrl_word;
		end
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
	begin
		/* squashing register values for br/jmp/jsr and trap, etc. */
		wbdatamux_int = '0;
		exme_int_dest = '0; exme_int_src1 = '0; exme_int_src2 = '0;
		exme_int_ctrl_word = '0;
	end
end

always_comb
begin
    mewb_wbdata = wbdatamux_int; 
    mewb_dest = exme_int_dest; mewb_src1 = exme_int_src1; mewb_src2 = exme_int_src2;
    mewb_ctrl_word = exme_int_ctrl_word;
end

endmodule : mewb_pipe
