import lc3b_types::*;

module cpu
(
    wishbone.master icache,
	 wishbone.master dcache,
	input icache_hit, icache_miss,
	input dcache_hit, dcache_miss,
	input l2cache_hit, l2cache_miss
);

/* redefine some cpu output signals to wishbone scheme*/
lc3b_word icache_addr, dcache_addr;
lc3b_word isel_mask, dsel_mask;
lc3b_sel exme_sel;
lc3b_word counter_val_out, stildi_p2addr;
logic sti_zero_cntr, br_in_exstage, br_en_in_exstage, global_stall;

sel_bytes ISB (.mem_address(icache_addr), .mem_byte_enable(2'b11), .sel_mask(isel_mask));
sel_bytes DSB (.mem_address(dcache_addr), .mem_byte_enable(exme_sel), .sel_mask(dsel_mask));

/* set defaults for indirect cache interface signals */
assign icache.DAT_M = 'z;
assign icache.ADR = icache_addr[15:4];
assign icache.CYC = icache.STB;				// effectively disregarded bc 1 transfer sufficient
assign icache.WE = 0;
assign icache.SEL = isel_mask;				// instructions should never be written to or changed

/* dcache.CLK ignored because it's the same as icache.CLK
   .RTY also ignored for both bus because exclusive */
assign dcache.ADR = dcache_addr[15:4];
assign dcache.CYC = dcache.STB;

cpu_datapath pl_datpath
(
	.clk(icache.CLK),
	.isel_mask, .dsel_mask,
	.icache_resp(icache.ACK),
	.icache_rdata(icache.DAT_S),
	.dcache_resp(dcache.ACK),
	.dcache_rdata(dcache.DAT_S),
	.counter_val_out,
	.exme_sel,
	.icache_addr,
	.icache_read(icache.STB),
	.dcache_addr,
	.dcache_wdata(dcache.DAT_M),
	.dcache_we_on_req(dcache.WE),
	.dcache_byte_en(dcache.SEL),
	.dcache_mem_req(dcache.STB),
	.phase2_addr(stildi_p2addr),
	.sti_zero_cntr,
	.br_in_exstage,
	.br_en_in_exstage,
	.global_stall
);

performance_counters pfc(
	.clk(dcache.CLK),
	.data_addr(stildi_p2addr),
	.sti_zero_cntr,
	.br_in_exstage,
	.br_en_in_exstage,
	.global_stall,
	.icache_hit, .icache_miss,
	.dcache_hit, .dcache_miss,
	.l2cache_hit, .l2cache_miss,
	.counter_val_out
);

endmodule : cpu
