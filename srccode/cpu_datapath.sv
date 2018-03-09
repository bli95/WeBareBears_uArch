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
	output logic icache_req,
	output lc3b_word dcache_addr,
	output lc3b_datbus dcache_wdata,
	output logic dcache_wr_en,
	output lc3b_word dcache_wr_sel,
	output logic dcache_req
);

/* internal pipeline inter-stage signals */
lc3b_reg sr1;
lc3b_reg sr2;
lc3b_reg dest;
lc3b_reg storemux_out;
lc3b_reg destmux_out;
const lc3b_reg reg7 = 3'b111;

lc3b_offset6 offset6;
lc3b_offset9 offset9;
lc3b_offset11 offset11;
lc3b_offset5 imm5;
lc3b_offset4 imm4;
lc3b_byte trapvect8;
lc3b_word adj6_out;
lc3b_word adj9_out;
lc3b_word adj11_out;
lc3b_word sext5_out;
lc3b_word sext6_out;

lc3b_word sr1_out;
lc3b_word sr2_out;
lc3b_word pcmux_out;
lc3b_word alumux1_out;
lc3b_word alumux2_out;
lc3b_word regfilemux_out;
lc3b_word marmux_out;
lc3b_word mdrmux_out;
lc3b_word alu_out;
lc3b_word pc_out;
lc3b_word pc_plus2_out;
lc3b_word br_add_out;
lc3b_word jsr_add_out;
lc3b_word adjmux_out;

lc3b_nzp gencc_out;
lc3b_nzp cc_out;
lc3b_word intern_wdata;
lc3b_word intern_rdata;
lc3b_word zext8_out;
lc3b_word zadj8_out;
lc3b_byte mdrmask_out;
lc3b_word srmask_out;

mux4 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(adjmux_out),
	 .c(sr1_out),
	 .d(intern_wdata),
    .f(pcmux_out)
);
register pc
(
    .clk,
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);
plus pc_incr_2
(
	.in(pc_out),
	.out(pc_plus2_out)
);

adj #(.width(9)) adj9
(
	.in(offset9),
	.out(adj9_out)
);
adj_add_pc pc_branch
(
	.pc_in(pc_out),
	.adj_in(adj9_out),
	.add_out(br_add_out)
);
adj #(.width(11)) adj11
(
	.in(offset11),
	.out(adj11_out)
);
adj_add_pc pc_jsr
(
	.pc_in(pc_out),
	.adj_in(adj11_out),
	.add_out(jsr_add_out)
);
mux2 adjmux
(
	.sel(adjmux_sel),
	.a(br_add_out),
	.b(jsr_add_out),
	.f(adjmux_out)
);

ir instreg
(
	.clk,
	.load(load_ir),
	.in(intern_wdata),
	.opcode,
	.dest,
	.src1(sr1),
	.src2(sr2),
	.offset6,
	.offset9,
	.offset11,
	.imm5,
	.imm4,
	.trapvect8,
	.immOrA_bit,
	.jsr_bit,
	.D_bit
);

ext #(.width(5)) sext5
(
	.in(imm5),
	.out(sext5_out)
);
adj #(.width(6)) adj6
(
	.in(offset6),
	.out(adj6_out)
);
ext #(.width(6)) sext6
(
	.in(offset6),
	.out(sext6_out)
);

mux2 #(.width(3)) storemux
(
	.sel(storemux_sel),
	.a(sr1),
	.b(dest),
	.f(storemux_out)
);
mux2 #(.width(3)) destmux
(
	.sel(destmux_sel),
	.a(dest),
	.b(reg7),
	.f(destmux_out)
);

lc3mask mdrmask
(
	.in(intern_wdata),
	.byte_select(mem_address[0]),
	.out(mdrmask_out)
);
ext #(.sgn(0)) zext8
(
	.in(mdrmask_out),
	.out(zext8_out)
);
mux4 regfilemux
(
	.sel(regfilemux_sel),
	.a(alu_out),
	.b(intern_wdata),
	.c(zext8_out),
	.d(),
	.f(regfilemux_out)
);

regfile rf
(
	.clk,
	.load(load_regfile),
	.in(regfilemux_out),
	.src_a(storemux_out),
	.src_b(sr2),
	.dest(destmux_out),
	.reg_a(sr1_out),
	.reg_b(sr2_out)
);

mux2 alumux1
(
	.sel(alumux1_sel),
	.a(sr1_out),
	.b(pc_out),
	.f(alumux1_out)
);
mux8 alumux2
(
	.sel(alumux2_sel),
	.a(sr2_out),
	.b(adj6_out),
	.c(sext6_out),
	.d(sext5_out),
	.e({12'h000, imm4}),
	.f(adj9_out),
	.g(),
	.h(),
	.z(alumux2_out)
);
alu alu
(
	.aluop,
	.a(alumux1_out),
	.b(alumux2_out),
	.f(alu_out)
);
gencc gcc
(
	.in(regfilemux_out),
	.out(gencc_out)
);
register #(.width(3)) cc
(
    .clk,
    .load(load_cc),
    .in(gencc_out),
    .out(cc_out)
);

lc3mask #(.outwidth(16)) srmask
(
	.in(sr1_out),
	.byte_select(mem_address[0]),
	.out(srmask_out)
);
assign write_hb = mem_address[0];

adj #(.sgn(0)) zadj8
(
	.in(trapvect8),
	.out(zadj8_out)
);

// extract word from bus based on (unchanged since read) MAR
assign intern_rdata = lc3b_word'(mem_rdata >> {mem_address[3:1],4'h0});
// hand memory data in word placement indicated by the 16 SEL bits
assign mem_wdata = intern_wdata << {mem_address[3:1],4'h0};

mux4 marmux
(
	.sel(marmux_sel),
	.a(alu_out),
	.b(pc_out),
	.c(intern_wdata),
	.d(zadj8_out),
	.f(marmux_out)
);
mux4 mdrmux
(
	.sel(mdrmux_sel),
	.a(alu_out),
	.b(intern_rdata),
	.c(srmask_out),
	.d(),
	.f(mdrmux_out)
);
register mar
(
	.clk,
	.load(load_mar),
	.in(marmux_out),
	.out(mem_address)
);
register mdr
(
	.clk,
	.load(load_mdr),
	.in(mdrmux_out),
	.out(intern_wdata)
);

endmodule : cpu_datapath
