module mainpc(
	wishbone.master pmembus
);

logic icache_hit, icache_miss, dcache_hit, dcache_miss, l2cache_hit, l2cache_miss;
logic EWB_ack, EWB_req, EWB_busy, L2_busy;
logic [11:0] w_addr_out;
logic [127:0] w_data_out;
logic write_hit;

wishbone cpu_dcache(pmembus.CLK);
wishbone cpu_icache(pmembus.CLK);
wishbone icache_arbiter(pmembus.CLK);
wishbone dcache_arbiter(pmembus.CLK);
wishbone arbiter_L2cache(pmembus.CLK);
wishbone L2cache_ewb(pmembus.CLK);

cpu main_cpu (
	.icache(cpu_icache),
	.dcache(cpu_dcache),
	.icache_hit, .icache_miss,
	.dcache_hit, .dcache_miss,
	.l2cache_hit, .l2cache_miss
);

cache icache (
	.sb(cpu_icache),
	.wb(icache_arbiter),
	.got_hit_likah_bih(icache_hit),
	.miss_me_wifdat_bs(icache_miss),
	.level(1'b0)
);

cache dcache (
	.sb(cpu_dcache),
	.wb(dcache_arbiter),
	.got_hit_likah_bih(dcache_hit),
	.miss_me_wifdat_bs(dcache_miss),
	.level(1'b0)
);

arbiter sel_cache (
	.icache_arbiter,
	.dcache_arbiter,
	.arbiter_L2cache
);

L2cache L2_cache (
	.wb(L2cache_ewb),
	.sb(arbiter_L2cache),
	.got_hit_likah_bih(l2cache_hit),
	.miss_me_wifdat_bs(l2cache_miss)
);

mux2 #(.width(1)) select_ACK (.sel(L2cache_ewb.WE || (L2cache_ewb.STB && EWB_busy)), .a(pmembus.ACK), .b(EWB_ack), .z(L2cache_ewb.ACK));

write_buffer EWB (
	.clk(pmembus.CLK),
	.w_data_in(L2cache_ewb.DAT_M),
	.w_addr_in(L2cache_ewb.ADR),
	.mem_ack(pmembus.ACK),
	.L2_req(L2cache_ewb.WE),
	.L2_busy(L2cache_ewb.STB),
	.L2_read(arbiter_L2cache.STB && !arbiter_L2cache.WE),
	.w_data_out, .w_addr_out,
	.EWB_ack, .EWB_req, .EWB_busy
);

assign L2cache_ewb.DAT_S = pmembus.DAT_S;
assign pmembus.DAT_M = w_data_out;
mux2 #(.width(12)) select_ADR (.sel(EWB_req), .a(L2cache_ewb.ADR), .b(w_addr_out), .z(pmembus.ADR));
assign pmembus.WE = EWB_req;
assign pmembus.STB = EWB_req || (L2cache_ewb.STB && !EWB_busy && !L2cache_ewb.WE);
assign pmembus.CYC = EWB_req || (L2cache_ewb.CYC && !EWB_busy && !L2cache_ewb.WE);
assign pmembus.SEL = 16'hffff;

endmodule : mainpc
