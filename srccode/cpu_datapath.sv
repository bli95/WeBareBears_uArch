import lc3b_types::*;

module cpu_datapath
(
   input clk,
	input lc3b_word isel_mask, dsel_mask,
	// only signals to L1 caches are external
	input icache_resp,
	input lc3b_datbus icache_rdata,
	input dcache_resp,
	input lc3b_datbus dcache_rdata,
	input lc3b_word counter_val_out,
	
	output lc3b_sel exme_sel,
	output lc3b_word icache_addr,
	output logic icache_read,
	output lc3b_word dcache_addr,
	output lc3b_datbus dcache_wdata,
	output logic dcache_we_on_req,
	output lc3b_word dcache_byte_en,
	output logic dcache_mem_req,
	
	output lc3b_word phase2_addr,
	output logic sti_zero_cntr,
	output logic br_in_exstage,
	output logic br_en_in_exstage,
	output logic global_stall
);

/* INTERNAL SIGNALS */
lc3b_word pc_plus2_out, pcmux_out, pc_out, instruction;
logic [1:0] pcmux_sel;

lc3b_word ifid_next_pc, adjmux_out, reg1_out, reg2_out, regAmux_out, immvalmux_out;
lc3b_word zext4_out, sext5_out, adj6_out, sext6_out, adj9_out, adj11_out, zadj8_out;
lc3b_opcode opcode;
logic bit_4, bit_5, bit_11;
lc3b_control_word ifid_ctrl_word;
lc3b_reg ifid_dest, ifid_src1, ifid_src2, sr1mux_out, sr2mux_out;
lc3b_offset4 ifid_imm4;
lc3b_offset5 ifid_imm5;
lc3b_offset6 ifid_offset6;
lc3b_offset9 ifid_offset9;
lc3b_offset11 ifid_offset11;
lc3b_byte ifid_trapvect8;

lc3b_word idex_next_pc, idex_pc_offset, idex_imm_val, br_adder_out, aluBmux_out; 
lc3b_word alu_out, stb_datmod_out, jsrmux_out, jmpmux_out, marmux_out, idex_regA, idex_regB;
logic br_en, jmp_en;
lc3b_reg idex_dest, idex_src1, idex_src2;
logic [2:0] fwdAmux_sel, fwdBmux_sel;
logic [1:0] fwdCmux_sel;
lc3b_word fwdAmux_out, fwdBmux_out, fwdCmux_out;
lc3b_control_word idex_ctrl_word;

lc3b_word exme_next_pc, exme_mar, exme_mdr, dcaddrmux_out, dcdatamux_out, wbdatamux_out, returned_data;
//lc3b_sel exme_sel;
logic dcaddrmux_sel, dcdatamux_sel;
lc3b_reg exme_dest, exme_src1, exme_src2;
lc3b_nzp cc_out;
lc3b_control_word exme_ctrl_word;

lc3b_sel stb_datmod_sel;
lc3b_word mewb_wbdata; 
lc3b_reg mewb_dest, mewb_src1, mewb_src2, destmux_out;
lc3b_control_word mewb_ctrl_word;

logic rst1, rst2;
assign rst1 = ((idex_ctrl_word.opcode == op_br) && br_en) || idex_ctrl_word.opcode==op_jsr || idex_ctrl_word.opcode==op_jmp;

logic stall1, stall2;
assign stall2 = ~icache_resp && idex_ctrl_word.opcode != op_jmp && idex_ctrl_word.opcode != op_jsr && ~((idex_ctrl_word.opcode == op_br) && br_en);
assign global_stall = stall1 | stall2;

/* IF STAGE */
pcmux_ctrlr pc_ctrl (.exme_opcode(exme_ctrl_word.opcode), .idex_opcode(idex_ctrl_word.opcode), .br_en, .pcmux_sel);
mux4 pcmux (.sel(pcmux_sel), .a(pc_plus2_out), .b(br_adder_out), .c(jsrmux_out), .d(returned_data), .z(pcmux_out));
register pc (.clk, .load(~stall1 & ~stall2), .in(pcmux_out), .out(pc_out));
plus pc_incr_2 (.in(pc_out), .out(pc_plus2_out));

assign icache_addr = pc_out;
assign icache_read = 1;
extract_16 GET_INSTRUCTION (icache_rdata, isel_mask, instruction);
//assign instruction = lc3b_word'(icache_rdata >> {icache_addr[3:1],4'h0});

/* IF/ID PIPELINE */
ifid_pipe IF_ID (.clk, .load(~stall1 & ~stall2), .reset((rst1 | rst2) && (~stall1 & ~stall2)), .*);

/* ID STAGE */
ext #(.width(4), .sgn(0)) zext4 (.in(ifid_imm4), .out(zext4_out));
ext #(.width(5)) sext5 (.in(ifid_imm5), .out(sext5_out));
ext #(.width(6)) sext6 (.in(ifid_offset6), .out(sext6_out));
adj #(.width(6)) adj6 (.in(ifid_offset6), .out(adj6_out));
adj #(.width(9)) adj9 (.in(ifid_offset9), .out(adj9_out));
adj #(.sgn(0)) zadj8 (.in(ifid_trapvect8), .out(zadj8_out));
adj #(.width(11)) adj11 (.in(ifid_offset11), .out(adj11_out));

mux2 adjmux (.sel(ifid_ctrl_word.adjmux_sel), .a(adj9_out), .b(adj11_out), .z(adjmux_out));
mux2 #(.width(3)) sr1mux (.sel(ifid_ctrl_word.sr1mux_sel), .a(ifid_src1), .b(ifid_dest), .z(sr1mux_out));
mux2 #(.width(3)) sr2mux (.sel(ifid_ctrl_word.sr2mux_sel), .a(ifid_src2), .b(ifid_dest), .z(sr2mux_out));

mux2 regAmux (.sel(ifid_ctrl_word.regAmux_sel), .a(reg1_out), .b(zadj8_out), .z(regAmux_out));
mux4 immvalmux (.sel(ifid_ctrl_word.immmux_sel), .a(sext5_out), .b(zext4_out), .c(adj6_out), .d(sext6_out), .z(immvalmux_out));

regfile rf (.clk, .load(mewb_ctrl_word.load_dst), .in(mewb_wbdata), .src_a(sr1mux_out), .src_b(sr2mux_out), 
			.dest(destmux_out), .reg_a(reg1_out), .reg_b(reg2_out));
			
logic [19:0] hold_reg_out;
register #(.width(20)) hold_reg (.clk, .load(mewb_ctrl_word.load_dst && ~stall1 & ~stall2), .in({{mewb_ctrl_word.load_dst}, {destmux_out}, {mewb_wbdata}}), .out(hold_reg_out));

control_rom ctrl_rom (.opcode, .bit_4, .bit_5, .bit_11, .ctrl(ifid_ctrl_word));

/* ID/EX REGISTER */
idex_pipe ID_EX (.clk, .load(~stall1 & ~stall2), .reset((rst1 | rst2) && (~stall1 & ~stall2)), .*);

/* EX STAGE */
adj_add_pc pc_branch (.pc_in(idex_next_pc), .adj_in(idex_pc_offset), .add_out(br_adder_out));
band_and_neq_comp brcomp (.a(idex_dest), .b(cc_out), .c(idex_dest), .d(3'b000), .true(br_en));
eq_and_neq_comp jmpcomp (.a(idex_src1), .b(3'b111), .c(idex_ctrl_word.opcode), .d(4'b1100), .true(jmp_en));
alu alu (.aluop(idex_ctrl_word.aluop), .a(fwdAmux_out), .b(fwdBmux_out), .f(alu_out));
cpu_rwmod stb_datmod (.in(fwdCmux_out), .opcode(idex_ctrl_word.opcode), .lsb(alu_out[0]), .wrsel(stb_datmod_sel), .out(stb_datmod_out));

mux2 aluBmux (.sel(idex_ctrl_word.aluBmux_sel), .a(idex_regB), .b(idex_imm_val), .z(aluBmux_out)); 
mux2 jmpmux (.sel(jmp_en), .a(idex_regA), .b(idex_next_pc), .z(jmpmux_out));
mux2 jsrmux (.sel(idex_ctrl_word.jsrmux_sel), .a(jmpmux_out), .b(br_adder_out), .z(jsrmux_out)); 
mux4 marmux (.sel(idex_ctrl_word.marmux_sel), .a(alu_out), .b(br_adder_out), .c(idex_next_pc), .d(), .z(marmux_out));

assign br_in_exstage = (idex_ctrl_word.opcode == op_br) && (idex_dest != 3'b000);
assign br_en_in_exstage = br_en;

/* FORWARDING */
fwd_unit fwd (.exme_ld_dest(exme_ctrl_word.load_dst), .mewb_ld_dest(mewb_ctrl_word.load_dst), .idex_opcode(idex_ctrl_word.opcode), .bit_5(idex_ctrl_word.aluBmux_sel), .bit_11(idex_ctrl_word.jsrmux_sel), .*);
mux8 fwdAmux (.sel(fwdAmux_sel), .a(idex_regA), .b(exme_mar), .c(wbdatamux_out), .d(mewb_wbdata), .e(hold_reg_out[15:0]), .z(fwdAmux_out));
mux8 fwdBmux (.sel(fwdBmux_sel), .a(aluBmux_out), .b(exme_mar), .c(wbdatamux_out), .d(mewb_wbdata), .e(hold_reg_out[15:0]), .z(fwdBmux_out));
mux4 fwdCmux (.sel(fwdCmux_sel), .a(idex_regB), .b(wbdatamux_out), .c(mewb_wbdata), .d(hold_reg_out[15:0]), .z(fwdCmux_out));

/* EX/ME REGISTER */
exme_pipe EX_ME (.clk, .load(~stall1 & ~stall2), .reset((rst2) && (~stall1 & ~stall2)), .*);

/* ME STAGE */
mux2 dcaddrmux (.sel(dcaddrmux_sel), .a(exme_mar), .b(phase2_addr), .z(dcaddrmux_out));
mux4 wbdatamux (.sel(exme_ctrl_word.wbdatamux_sel), .a(exme_mar), .b(dcdatamux_out), .c(exme_next_pc), .d(), .z(wbdatamux_out));
gencc cc (.in(wbdatamux_out), .load(exme_ctrl_word.load_cc), .out(cc_out));
dcache_ctrlr stldtr_ctrl (.clk, .opcode(exme_ctrl_word.opcode), .rw_resp(dcache_resp), .resp_data_addr(returned_data), .stall1, .addrmux_sel(dcaddrmux_sel), 
                          .datamux_sel(dcdatamux_sel), .req_rw(dcache_mem_req), .wr_en(dcache_we_on_req), .phase2_addr, .rst2);

mux2 dcdatamux (.sel(dcdatamux_sel), .a(returned_data), .b(counter_val_out), .z(dcdatamux_out));
assign sti_zero_cntr = (exme_ctrl_word.opcode == op_sti);

assign dcache_addr = dcaddrmux_out;
assign dcache_wdata = {8{exme_mdr}}; //<< {dcaddrmux_out[3:1],4'h0};
assign dcache_byte_en = dsel_mask;//exme_sel << {dcaddrmux_out[3:1],1'b0};
extract_16 GET_DATA (dcache_rdata, dsel_mask, returned_data);
//assign returned_data = lc3b_word'(dcache_rdata >> {dcaddrmux_out[3:1],4'h0});

/* ME_WB REGISTER */
mewb_pipe ME_WB (.clk, .load(~stall1 & ~stall2), .reset(1'b0), .*);

/* WB STAGE */
mux2 #(.width(3)) destmux (.sel(mewb_ctrl_word.dstmux_sel), .a(mewb_dest), .b(3'b111), .z(destmux_out));

endmodule : cpu_datapath
