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
    input logic [86:0] in,
    
    output lc3b_word next_pc, pc_plus_offset
    output lc3b_reg dest, src1, src2,
    output lc3b_reg regA, regB,
    output lc3b_word imm_val,
    output logic [23:0] ctrl_word
);

logic [86:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    next_pc = data[86:71];
    pc_plus_offset = data[70:55];
    dest = data[54:52];
    src1 = data[51:49];
    src2 = data[48:46];
    regA = data[45:43];
    regB = data[42:40];
    imm_val = data[39:24];
    ctrl_word = data[23:0];
end

endmodule : idex_pipe

module exme_pipe
(
    input clk, load,
    input logic [96:0] in,
    
    output lc3b_word next_pc, mar, mdr, sel, 
    output lc3b_reg dest, src1, src2,
    output logic [23:0] ctrl_word
);

logic [96:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    next_pc = data[96:81];
    dest = data[80:78];
    src1 = data[77:75];
    src2 = data[74:72];
    mar = data[71:56];
    mdr = data[55:40];
    sel = data[39:24];
    ctrl_word = data[23:0];
end

endmodule : exme_pipe

module mewb_pipe
(
    input clk, load,
    input logic [48:0] in,
    
    output lc3b_word wbdata, 
    output lc3b_reg dest, src1, src2,
    output logic [23:0] ctrl_word
);

logic [48:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    wbdata = data[48:33];
    dest = data[32:30];
    src1 = data[29:27];
    src2 = data[26:24];
    ctrl_word = data[23:0];
end

endmodule : mewb_pipe

