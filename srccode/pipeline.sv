import lc3b_types::*;

module ifid_pipe
(
    input clk, load,
    input logic [31:0] in,
    
    output lc3b_word next_pc,
    output lc3b_reg dest, src1, src2,
	output logic bit4, bit5, bit11,
	output lc3b_offset4 imm4,
	output lc3b_offset5 imm5,
    output lc3b_offset6 offset6,
    output lc3b_offset9 offset9,
	output lc3b_offset11 offset11,
	output lc3b_byte trapvect8,
);

logic [31:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    next_pc = data[31:16];
    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];
    bit4 = data[4];
	bit5 = data[5];
	bit11 = data[11];
	imm4 = data[3:0];
	imm5 = data[4:0];
    offset6 = data[5:0];
    offset9 = data[8:0];
    offset11 = data[10:0];
	trapvect8 = data[7:0];
end

endmodule : ifid_pipe

module idex_pipe
(
    input clk, load,
    input logic [31:0] in,
    
    output lc3b_word next_pc, pc_plus_offset
    output lc3b_reg dest, src1, src2,
    output lc3b_reg regA, regB,
    output lc3b_word imm_val,
    output logic ctrl_word
);

logic [31:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    next_pc = data[31:16];
    pc_plus_offset = data[];
    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];
    regA = data[];
    regB = data[];
    imm_val = data[];
    ctrl_word = data[];
end

endmodule : idex_pipe

module exme_pipe
(
    input clk, load,
    input logic [31:0] in,
    
    output lc3b_word next_pc, mar, mdr, sel, 
    output lc3b_reg dest, src1, src2,
    output logic ctrl_word
);

logic [31:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    next_pc = data[31:16];
    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];
    mar = data[];
    mdr = data[];
    sel = data[];
    ctrl_word = data[];
end

endmodule : exme_pipe

module mewb_pipe
(
    input clk, load,
    input logic [31:0] in,
    
    output lc3b_word wbdata, 
    output lc3b_reg dest, src1, src2,
    output logic ctrl_word
);

logic [31:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    wbdata = data[];
    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];
    ctrl_word = data[];
end

endmodule : mewb_pipe

