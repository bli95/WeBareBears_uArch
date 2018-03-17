import lc3b_types::*;

module cpu
(
    wishbone.master icache,
	 wishbone.master dcache
);

/* redefine some cpu output signals to wishbone scheme*/
lc3b_word icache_addr, dcache_addr;
lc3b_word sel_mask;
sel_bytes SB (.mem_address(icache_addr), .mem_byte_enable(2'b11), .sel_mask);

/* set defaults for indirect cache interface signals */
assign icache.DAT_M = 'z;
assign icache.ADR = icache_addr[15:4];
assign icache.CYC = icache.STB;				// effectively disregarded bc 1 transfer sufficient
assign icache.WE = 0;
assign icache.SEL = sel_mask;							// instructions should never be written to or changed

/* dcache.CLK ignored because it's the same as icache.CLK
   .RTY also ignored for both bus because exclusive */
assign dcache.ADR = dcache_addr[15:4];
assign dcache.CYC = dcache.STB;


cpu_datapath pl_datpath
(
	.clk(icache.CLK),
	.icache_resp(icache.ACK),
	.icache_rdata(icache.DAT_S),
	.dcache_resp(dcache.ACK),
	.dcache_rdata(dcache.DAT_S),
	.icache_addr,
	.icache_read(icache.STB),
	.dcache_addr,
	.dcache_wdata(dcache.DAT_M),
	.dcache_we_on_req(dcache.WE),
	.dcache_byte_en(dcache.SEL),
	.dcache_mem_req(dcache.STB)
);

endmodule : cpu
