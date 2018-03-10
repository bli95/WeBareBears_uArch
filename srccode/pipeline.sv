import lc3b_types::*;

module ifid_pipe
(
    input clk, load, reset,
    input logic [31:0] in,
    
    output lc3b_word ifid_next_pc,
    output lc3b_opcode opcode,
    output logic bit4, bit5, bit11,
    output lc3b_reg ifid_dest, ifid_src1, ifid_src2,
	output lc3b_offset4 ifid_imm4,
	output lc3b_offset5 ifid_imm5,
    output lc3b_offset6 ifid_offset6,
    output lc3b_offset9 ifid_offset9,
	output lc3b_offset11 ifid_offset11,
	output lc3b_byte ifid_trapvect8,
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
end

endmodule : ifid_pipe

module idex_pipe
(
    input clk, load, reset,
    input logic [112:0] in,
    
    output lc3b_word idex_next_pc, idex_pc_offset,
    output lc3b_reg idex_dest, idex_src1, idex_src2,
    output lc3b_word idex_regA, idex_regB,
    output lc3b_word idex_imm_val,
    output logic [23:0] idex_ctrl_word
);

logic [112:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = 113'b0;
end

always_comb
begin
    idex_next_pc = data[112:97];
    idex_pc_plus_offset = data[96:81];
    idex_dest = data[80:78];
    idex_src1 = data[77:75];
    idex_src2 = data[74:72];
    idex_regA = data[71:56];
    idex_regB = data[55:40];
    idex_imm_val = data[39:24];
    idex_ctrl_word = data[23:0];
end

endmodule : idex_pipe

module exme_pipe
(
    input clk, load, reset,
    input logic [96:0] in,
    
    output lc3b_word exme_next_pc, exme_mar, exme_mdr, exme_sel, 
    output lc3b_reg exme_dest, exme_src1, exme_src2,
    output logic [23:0] exme_ctrl_word
);

logic [96:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = 97'b0;
end

always_comb
begin
    exme_next_pc = data[96:81];
    exme_dest = data[80:78];
    exme_src1 = data[77:75];
    exme_src2 = data[74:72];
    exme_mar = data[71:56];
    exme_mdr = data[55:40];
    exme_sel = data[39:24];
    exme_ctrl_word = data[23:0];
end

endmodule : exme_pipe

module mewb_pipe
(
    input clk, load, reset,
    input logic [48:0] in,
    
    output lc3b_word mewb_wbdata, 
    output lc3b_reg mewb_dest, mewb_src1, mewb_src2,
    output logic [23:0] mewb_ctrl_word
);

logic [48:0] data;

always_ff @(posedge clk)
begin
    if (reset == 0) begin   
        if (load == 1) data = in;
    end
    else data = 49'b0;
end

always_comb
begin
    mewb_wbdata = data[48:33];
    mewb_dest = data[32:30];
    mewb_src1 = data[29:27];
    mewb_src2 = data[26:24];
    mewb_ctrl_word = data[23:0];
end

endmodule : mewb_pipe
