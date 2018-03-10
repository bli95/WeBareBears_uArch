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
lc3b_word instruction,

/* IF STAGE */

mux4 pcmux (.sel(pcmux_sel), .a(pc_plus2_out), .b(brmux_out), .c(jsrmux_out), .d(wbdata), .f(pcmux_out));
register pc (.clk, .load(~stall), .in(pcmux_out), .out(pc_out));
plus pc_incr_2 (.in(pc_out), .out(pc_plus2_out));

assign icache_addr = pc_out;
assign icache_read = 1 & ~stall;
assign instruction = lc3b_word'(icache_rdata >> {icache_addr[3:1],4'h0});

/* IF/ID REGISTER */
register #(.width(32)) IF_ID (.clk, .load(~stall), .in({pc_plus2_out, instruction}), .out(if_id_out));

/* ID STAGE */

ext #(.width(5)) sext5 (.in(if_id_out[4:0]), .out(sext5_out));
ext #(.width(6)) sext6 (.in(if_id_out[5:0]), .out(sext6_out));
adj #(.width(6)) adj6 (.in(if_id_out[5:0]), .out(adj6_out));
adj #(.width(9)) adj9 (.in(if_id_out[8:0]), .out(adj9_out));
adj #(.sgn(0)) zadj8 (.in(if_id_out[7:0]), .out(zadj8_out));
adj #(.width(11)) adj11 (.in(if_id_out[10:0]), .out(adj11_out));

mux2 adjmux (.sel(adj_sel), .a(adj9_out), b(adj11_out), .z(adjmux_out));
mux2 #(.width(3)) sr1mux (.sel(sr1_sel), .a(if_id_out[8:6]), b(if_id_out[11:9]), .z(sr1mux_out));
mux2 #(.width(3)) sr2mux (.sel(sr2_sel), .a(if_id_out[2:0]), b(if_id_out[11:9]), .z(sr2mux_out));
mux2 #(.width(3)) destmux (.sel(dest_sel), .a(if_id_out[11:9]), b(3'b111), .z(destmux_out));

mux2 regAmux (.sel(regA_sel), .a(reg1_out), b(zadj8_out), .z(regAmux_out));
mux4 immvalmux (.sel(imm_sel), .a(sext5_out), b({12'h000, imm4}), .c(adj6_out), .d(sext6_out), .z(immvalmux_out));

regfile rf (.clk, .load(load_regfile), .in(regfilemux_out), .src_a(sr1mux_out), .src_b(sr2mux_out), 
				.dest(destmux_out), .reg_a(reg1_out), .reg_b(reg2_out));

/* ID/EX REGISTER */
register #(.width(89+ctrl_word) ID_EX (.clk, .load(~stall), 
			  .in({if_id_out[31:16], adjmux_out, if_id_out[11:6], if_id_out[2:0], regAmux_out, reg2_out, immvalmux_out, ctrl_word}), 
			  .out(id_ex_out));

/* EX STAGE */

adj_add_pc pc_branch (.pc_in(id_ex_out[first16bits]), .adj_in(id_ex_out[second16bits]), .add_out(addr_out));

mux2 brmux (.sel(br_en), .a(id_ex_out[first16bit]+3'b100), b(addr_out), .z(sr1mux_out));

mux2 sr1mux (.sel(sr1_sel), .a(if_id_out[8:6]), b(if_id_out[11:9]), .z(sr1mux_out));
mux2 sr1mux (.sel(sr1_sel), .a(if_id_out[8:6]), b(if_id_out[11:9]), .z(sr1mux_out));

mux2 #(.width(3)) aluBmux (.sel(aluB_sel), .a(id_ex_out[regB]), b(id_ex_out[imm_val]), .z(aluBmux_out)); 

mux2 #(.width(3)) mux (.sel(sr1_sel), .a(if_id_out[8:6]), b(if_id_out[11:9]), .z(sr1mux_out));

alu alu (.aluop, .a(id_ex_out[regA]), .b(aluBmux_out), .f(alu_out));



/* EX/ME REGISTER */
register #(.width(5)) EX_ME ();

/* ME STAGE */

/* ME_WB REGISTER */
register #(.width(5)) ME_WB ();

/* WB STAGE */



/* EVERYTHING BELOW HERE IS OLD SHIT----IGNORE! */


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
