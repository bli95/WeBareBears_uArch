import lc3b_types::*;

module cpu
(
    wishbone.master icache,
	 wishbone.master dcache
);

assign clk = icache.CLK;

/* icache signals */
assign icache_resp = icache.ACK;
assign icache_rdata = icache.DAT_S;
assign icache.DAT_M = 128'hx;
assign icache.ADR = icache_addr[15:4];
assign icache.STB = icache_read;
assign icache.CYC = icache.STB;	// effectively disregarded bc 1 transfer sufficient
assign icache.WE = 0;
assign icache.SEL = 2'b11 << {imem_address[3:1],1'b0};

/* dcache signals */
assign dcache_resp = dcache.ACK;
assign dcache_rdata = dcache.DAT_S;
assign dcache.DAT_M = dcache_wdata;
assign dcache.ADR = dcache_addr[15:4];
assign dcache.STB = dcache_read | dcache_write;
assign dcache.CYC = dcache.STB;	
assign dcache.WE = dcache_write;
assign dcache.SEL = dcache_byte_en << {dcache_addr[3:1],1'b0};

cpu_datapath pl_datpath
(
	
);

endmodule : cpu
