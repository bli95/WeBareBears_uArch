import lc3b_types::*;

module cpu
(
    wishbone.master icache,
	 wishbone.master dcache
);

// redefine some cpu output signals to wishbone scheme
logic icache_read, dcache_read, dcache_write;
lc3b_word icache_addr, dcache_addr;

/* set defaults for indirect cache interface signals */
assign icache.DAT_S = 'z;
assign icache.ADR = icache_addr[15:4];
assign icache.STB = icache_read;
assign icache.CYC = icache.STB;	// effectively disregarded bc 1 transfer sufficient
assign icache.WE = 0;
assign icache.SEL = 'z;		// instructions should never be written to or changed

assign dcache.ADR = dcache_addr[15:4];
assign dcache.STB = dcache_read | dcache_write;
assign dcache.CYC = dcache.STB;	
assign dcache.WE = dcache_write;

cpu_datapath pl_datpath
(
	.clk(icache.CLK),
	.icache_resp(icache.ACK),
	.icache_rdata(icache.DAT_M),
	.dcache_resp(dcache.ACK),
	.dcache_rdata(dcache.DAT_M),
	.icache_addr,
	.icache_read,
	.dcache_addr,
	.dcache_wdata(dcache.DAT_S),
	.dcache_write,
	.dcache_byte_en(dcache.SEL),
	.dcache_read
);

endmodule : cpu
