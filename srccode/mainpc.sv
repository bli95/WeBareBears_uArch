module mainpc(
	wishbone.master pmembus
);

wishbone cpu_dcache(pmembus.CLK);
wishbone cpu_icache(pmembus.CLK);
wishbone icache_arbiter(pmembus.CLK);
wishbone dcache_arbiter(pmembus.CLK);
wishbone arbiter_L2cache(pmembus.CLK);

logic icache_hit, icache_miss, dcache_hit, dcache_miss, l2cache_hit, l2cache_miss;

cpu main_cpu(
	.icache(cpu_icache),
	.dcache(cpu_dcache),
	.icache_hit, .icache_miss,
	.dcache_hit, .dcache_miss,
	.l2cache_hit, .l2cache_miss
);

cache icache
(
	.sb(cpu_icache),
	.wb(icache_arbiter),
	.got_hit_likah_bih(icache_hit),
	.miss_me_wifdat_bs(icache_miss)
);

cache dcache(
	.sb(cpu_dcache),
	.wb(dcache_arbiter),
	.got_hit_likah_bih(dcache_hit),
	.miss_me_wifdat_bs(dcache_miss)
);

arbiter sel_cache(
	.icache_arbiter,
	.dcache_arbiter,
	.arbiter_L2cache
);

cache L2_cache(
	.wb(pmembus),
	.sb(arbiter_L2cache),
	.got_hit_likah_bih(l2cache_hit),
	.miss_me_wifdat_bs(l2cache_miss)
);

endmodule : mainpc