import lc3b_types::*;

module cpu_datapath
(
   input clk,
	// only signals to L1 caches are external
	input icache_resp,
	input lc3b_datbus icache_rdata,
	input dcache_resp,
	input lc3b_datbus dcache_rdata,
	
	output lc3b_word icache_addr,
	output logic icache_read,
	output lc3b_word dcache_addr,
	output lc3b_datbus dcache_wdata,
	output logic dcache_write,
	output lc3b_mem_wmask dcache_byte_en,
	output logic dcache_read
);

/* INTERNAL SIGNALS */
lc3b_word pc_plus2_out, brmux_out, jsrmux_out, pcmux_out, pc_out;
lc3b_word instruction;
lc3b_sel stb_datmod_sel;
lc3b_word stb_datmod_out;
logic reset;

/* PIPELINE OUTPUTS */
lc3b_word ifid_next_pc;
lc3b_opcode opcode;
logic bit4, bit5, bit11;
lc3b_reg ifid_dest, ifid_src1, ifid_src2;
lc3b_offset4 ifid_imm4;
lc3b_offset5 ifid_imm5;
lc3b_offset6 ifid_offset6;
lc3b_offset9 ifid_offset9;
lc3b_offset11 ifid_offset11;
lc3b_byte ifid_trapvect8;

lc3b_word idex_next_pc, idex_pc_offset;
lc3b_reg idex_dest, idex_src1, idex_src2;
lc3b_reg idex_regA, idex_regB;
lc3b_word idex_imm_val;
logic [23:0] idex_ctrl_word;

lc3b_word exme_next_pc, exme_mar, exme_mdr, exme_sel;
lc3b_reg exme_dest, exme_src1, exme_src2;
logic [23:0] exme_ctrl_word;

lc3b_word mewb_wbdata; 
lc3b_reg mewb_dest, mewb_src1, mewb_src2;
logic [23:0] mewb_ctrl_word;

assign reset = ((idex_ctrl_word.opcode==op_br) && br_en) || idex_ctrl_word.ofpcode==op_jsr || idex_ctrl_word.opcode==op_jmp;
assign pcmux_sel = (exme_ctrl_word.opcode==op_trap) ? exme_ctrl_word.pcmux_sel : idex_ctrl_word.pcmux_sel;

/* IF STAGE */
mux4 pcmux (.sel(pcmux_sel), .a(pc_plus2_out), .b(brmux_out), .c(jsrmux_out), .d(ldb_datmod_out), .f(pcmux_out));
register pc (.clk, .load(~stall), .in(pcmux_out), .out(pc_out));
plus pc_incr_2 (.in(pc_out), .out(pc_plus2_out));

assign icache_addr = pc_out;
assign icache_read = 1 & ~stall;
assign instruction = lc3b_word'(icache_rdata >> {icache_addr[3:1],4'h0});

/* IF/ID PIPELINE */
ifid_pipe IF_ID (.clk, .load(~stall), .reset, in({pc_plus2_out, instruction}), .*);

/* ID STAGE */
ext #(.width(5)) sext5 (.in(ifid_imm5), .out(sext5_out));
ext #(.width(6)) sext6 (.in(ifid_offset6), .out(sext6_out));
adj #(.width(6)) adj6 (.in(ifid_offset6), .out(adj6_out));
adj #(.width(9)) adj9 (.in(ifid_offset9), .out(adj9_out));
adj #(.sgn(0)) zadj8 (.in(ifid_trapvect8), .out(zadj8_out));
adj #(.width(11)) adj11 (.in(ifid_offset11), .out(adj11_out));

mux2 adjmux (.sel(ifid_ctrl_word.adjmux_sel), .a(adj9_out), b(adj11_out), .z(adjmux_out));
mux2 #(.width(3)) sr1mux (.sel(ifid_ctrl_word.sr1mux_sel), .a(ifid_src1), b(ifif_dest), .z(sr1mux_out));
mux2 #(.width(3)) sr2mux (.sel(ifid_ctrl_word.sr2mux_sel), .a(ifid_src2), b(ifid_dest), .z(sr2mux_out));

mux2 regAmux (.sel(ifid_ctrl_word.regAmux_sel), .a(reg1_out), b(zadj8_out), .z(regAmux_out));
mux4 immvalmux (.sel(ifid_ctrl_word.immmux_sel), .a(sext5_out), b({12'h000, imm4}), .c(adj6_out), .d(sext6_out), .z(immvalmux_out));

regfile rf (.clk, .load(load_regfile), .in(regfilemux_out), .src_a(sr1mux_out), .src_b(sr2mux_out), 
			.dest(destmux_out), .reg_a(reg1_out), .reg_b(reg2_out));

control_rom ctrl_rom (.opcode, .bit4, .bit5, .bit11, .ifid_ctrl_word);

/* ID/EX REGISTER */
idex_pipe ID_EX (.clk, .load(~stall), .reset, 
                 .in({ifid_next_pc, adjmux_out, ifid_dest, ifid_src1, ifid_src2, regAmux_out, reg2_out, immvalmux_out, ifid_ctrl_word}),
                 .*);

/* EX STAGE */
adj_add_pc pc_branch (.pc_in(idex_next_pc), .adj_in(idex_pc_offset), .add_out(addr_out));
eq_and_neq_comp #(.neqwidth(3)) brcomp (.a(), .b(idex_dest), .c(), .d(3'b000), .true(br_en));
eq_and_neq_comp jmpcomp (.a(idex_src1), .b(3'b111), .c(idex_ctrl_word.opcode), .d(4'b1100), .true(jmp_en));
alu alu (.aluop, .a(idex_regA), .b(aluBmux_out), .f(alu_out));
cpu_rwmod stb_datmod (.in(idex_regB), .opcode(idex_ctrl_word.opcode), .lsb(alu_out[0]), .wrsel(stb_datmod_sel), .out(stb_datmod_out));

mux2 brmux (.sel(br_en), .a(idex_next_pc+3'b100), b(addr_out), .z(brmux_out));
mux2 aluBmux (.sel(idex_ctrl_word.aluBmux_sel), .a(idex_regB), b(idex_imm_val), .z(aluBmux_out)); 
mux2 jmpmux (.sel(jmp_en), .a(idex_regA), .b(idex_next_pc) .z(jmpmux_out));
mux2 jsrmux (.sel(idex_ctrl_word.jsrmux_sel), .a(jmpmux_out), .b(addr_out), .z(jsrmux_out)); 
mux4 marmux (.sel(idex_ctrl_word.marmux_sel), .a(alu_out), .b(addr_out), .c(idex_next_pc), .d(16'hxxxx), .z(marmux_out));

/* EX/ME REGISTER */
exme_pipe EX_ME (.clk, .load(), .reset(0),
                 .in({idex_next_pc, idex_ctrl_word, idex_dest, idex_src1, idex_src2, marmux_out, stb_datmod_sel, stb_datmod_out}),
                 .*);
/* ME STAGE */
mux2 dcaddrmux (.sel(dcaddrmux_sel), .a(exme_mar), .b(), .z(dcaddrmux_out));
mux2 wbdatamux (.sel(exme_ctrl_word.wbdatamux_sel), .a(exme_mar), .b(ldb_datmod_out), .c(exme_next_pc), .d(16'hxxxx) .z(wbdatamux_out));
register cc (.clk, .load(exme_ctrl_word.load_cc), .in(gencc_out), .out(cc_out));
gencc gencc (.in(wbdatamux_out), .out(gencc_out));
dcache_ctrlr stldtr_ctrl (.clk, .opcode(exme_ctrl_word.opcode), .rw_resp(dcache_resp), .stall, .addrmux_sel(dcaddrmux_sel), 
                          .req_rw(dcache_read), .w_en(dcache_write));
cpu_rwmod ldb_datmod (.in(dcache_rdata), .opcode(exme_ctrl_word.opcode, .lsb(exme_mar[0]), .out(ldb_datmod_out));

assign dcache_addr = dcaddrmux_out;
assign dcache_wdata = exme_mdr;
assign dcache_sel = exme_sel;

/* ME_WB REGISTER */
mewb_pipe ME_WB (.clk, .load(~stall), .reset(0),
                 .in({wbdatamux_out, exme_dest, exme_src1, exme_src2, exme_ctrl_word}),
                 .*);

/* WB STAGE */
mux2 #(.width(3)) destmux (.sel(mewb_ctrl_word.destmux_sel), .a(mewb_dest), b(3'b111), .z(destmux_out));

endmodule : cpu_datapath
