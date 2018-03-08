import lc3b_types::*;

module cpu
(
    wishbone.master icache_if,
	 wishbone.master dcache_if
);

logic load_pc, load_ir, load_regfile, load_mar, load_mdr, load_cc,
	adjmux_sel, storemux_sel, destmux_sel, alumux1_sel,
	branch_enable, immOrA_bit, jsr_bit, D_bit, write_hb;
logic [1:0] pcmux_sel, regfilemux_sel, marmux_sel, mdrmux_sel;
logic [2:0] alumux2_sel;
lc3b_aluop aluop;
lc3b_opcode opcode;

/* combinational logic for wishbone bus signals */
logic clk, mem_resp, mem_read, mem_write;
lc3b_datbus mem_rdata;
lc3b_mem_wmask mem_byte_enable;
lc3b_word mem_address;
lc3b_datbus mem_wdata;
// RTY safely ignored by cpu master here bc isolated bus
assign clk = bus.CLK;
assign mem_resp = bus.ACK;
assign mem_rdata = bus.DAT_S;
assign bus.DAT_M = mem_wdata;
assign bus.ADR = mem_address[15:4];
assign bus.STB = mem_read | mem_write;
assign bus.CYC = bus.STB;	// effectively disregarded bc 1 transfer sufficient
assign bus.WE = mem_write;
assign bus.SEL = mem_byte_enable << {mem_address[3:1],1'b0};

cpu_datapath dp
(
	.clk,
	.load_pc,
	.load_ir,
	.load_regfile, 
	.load_mar, 
	.load_mdr, 
	.load_cc,
	.pcmux_sel,
	.adjmux_sel,
	.storemux_sel,
	.destmux_sel,
	.alumux1_sel,
	.alumux2_sel, 
	.regfilemux_sel,
	.marmux_sel, 
	.mdrmux_sel,
	.aluop,
	.mem_rdata,
	.mem_wdata,
	.mem_address,
	.opcode,
	.branch_enable,
	.immOrA_bit,
	.jsr_bit,
	.D_bit,
	.write_hb
);

cpu_control ctr
(
	.clk,
	.opcode,
	.branch_enable,
	.immOrA_bit,
	.jsr_bit,
	.D_bit,
	.write_hb,
	.load_pc,
	.load_ir,
	.load_regfile, 
	.load_mar, 
	.load_mdr, 
	.load_cc,
	.pcmux_sel,
	.adjmux_sel,
	.storemux_sel,
	.destmux_sel,
	.alumux1_sel,
	.alumux2_sel, 
	.regfilemux_sel,
	.marmux_sel, 
	.mdrmux_sel,
	.aluop,
	.mem_resp,
	.mem_read,
	.mem_write,
	.mem_byte_enable
);

endmodule : cpu
