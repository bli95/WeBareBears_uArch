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

logic [31:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = 32'b0;
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
    input logic [113:0] in,
    
    output lc3b_word idex_next_pc, idex_pc_offset,
    output lc3b_reg idex_dest, idex_src1, idex_src2,
    output lc3b_word idex_regA, idex_regB,
    output lc3b_word idex_imm_val,
    output logic [24:0] idex_ctrl_word
);

logic [113:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = '0;
end

always_comb
begin
    idex_next_pc = data[113:98];
    idex_pc_offset = data[97:82];
    idex_dest = data[81:79];
    idex_src1 = data[78:76];
    idex_src2 = data[75:73];
    idex_regA = data[72:57];
    idex_regB = data[56:41];
    idex_imm_val = data[40:25];
    idex_ctrl_word = data[24:0];
end

endmodule : idex_pipe

module exme_pipe
(
    input clk, load, reset,
    input logic [83:0] in,
    
    output lc3b_word exme_next_pc, exme_mar, exme_mdr,
	 output lc3b_sel exme_sel, 
    output lc3b_reg exme_dest, exme_src1, exme_src2,
    output logic [24:0] exme_ctrl_word
);

logic [83:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = '0;
end

always_comb
begin
    exme_next_pc = data[83:68];
    exme_ctrl_word = data[67:43];
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
    input logic [49:0] in,
    
    output lc3b_word mewb_wbdata, 
    output lc3b_reg mewb_dest, mewb_src1, mewb_src2,
    output logic [24:0] mewb_ctrl_word
);

logic [49:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = '0;
end

always_comb
begin
    mewb_wbdata = data[49:34];
    mewb_ctrl_word = data[33:9];
    mewb_dest = data[8:6];
    mewb_src1 = data[5:3];
    mewb_src2 = data[2:0];
end

endmodule : mewb_pipe
