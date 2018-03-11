import lc3b_types::*;

module ifid_pipe
(
    input clk, load, reset,
    input logic [31:0] in,
    
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

logic [31:0] data = '0;	// initializes interstage regs to 0 so prog starts correctly

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1)	// not stalling, aka normal operations per cycle  
			data = in;
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
		/* squashing register values for br/jmp/jsr and trap, etc. */
		data = '0;
end

always_comb
begin
   ifid_next_pc = data[31:16];
   ifid_dest = data[11:9];
   ifid_src1 = data[8:6];
   ifid_src2 = data[2:0];
	ifid_imm4 = data[3:0];
	ifid_imm5 = data[4:0];
   ifid_offset6 = data[5:0];
   ifid_offset9 = data[8:0];
   ifid_offset11 = data[10:0];
	ifid_trapvect8 = data[7:0];
	
	opcode = lc3b_opcode'(data[15:12]);
	bit_4 = data[4];
	bit_5 = data[5];
	bit_11 = data[11];
end

endmodule : ifid_pipe

module idex_pipe
(
    input clk, load, reset,
    input logic [111:0] in,
    
    output lc3b_word idex_next_pc, idex_pc_offset,
    output lc3b_reg idex_dest, idex_src1, idex_src2,
    output lc3b_word idex_regA, idex_regB,
    output lc3b_word idex_imm_val,
    output logic [22:0] idex_ctrl_word
);

logic [111:0] data = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1)	// not stalling, aka normal operations per cycle  
			data = in;
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
		/* squashing register values for br/jmp/jsr and trap, etc. */
		data = '0;
end

always_comb
begin
    idex_ctrl_word = data[111:89];
    idex_next_pc = data[88:73];
    idex_pc_offset = data[72:57];
    idex_dest = data[56:54];
    idex_src1 = data[53:51];
    idex_src2 = data[50:48];
    idex_regA = data[47:32];
    idex_regB = data[31:16];
    idex_imm_val = data[15:0];
end

endmodule : idex_pipe

module exme_pipe
(
    input clk, load, reset,
    input logic [81:0] in,
    
    output lc3b_word exme_next_pc, exme_mar, exme_mdr,
	 output lc3b_sel exme_sel, 
    output lc3b_reg exme_dest, exme_src1, exme_src2,
    output logic [22:0] exme_ctrl_word
);

logic [81:0] data = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1)	// not stalling, aka normal operations per cycle  
			data = in;
		// for stalls when waiting for dcache to respond; nothing happens bc we want to retain data
	end
	else
		/* squashing register values for br/jmp/jsr and trap, etc. */
		data = '0;
end

always_comb
begin
    exme_ctrl_word = data[81:59];
    exme_next_pc = data[58:43];
    exme_dest = data[42:40];
    exme_src1 = data[39:37];
    exme_src2 = data[36:34];
    exme_mar = data[33:18];
    exme_sel = data[17:16];
    exme_mdr = data[15:0];
end

endmodule : exme_pipe

module mewb_pipe
(
    input clk, load, reset,
    input logic [47:0] in,
    
    output lc3b_word mewb_wbdata, 
    output lc3b_reg mewb_dest, mewb_src1, mewb_src2,
    output logic [22:0] mewb_ctrl_word
);

logic [47:0] data = '0;

always_ff @(posedge clk)
begin
	if (reset == 0) begin
		if (load == 1)	// not stalling, aka normal operations per cycle  
			data = in;
		// for stalls when waiting for dcache to finish retrieval; THIS IS OPTIONAL
	end
	else
		data = '0;
end

always_comb
begin
    mewb_ctrl_word = data[47:25];
    mewb_wbdata = data[24:9];
    mewb_dest = data[8:6];
    mewb_src1 = data[5:3];
    mewb_src2 = data[2:0];
end

endmodule : mewb_pipe
