module full_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

//wishbone icache_mem(clk);
//wishbone dcache_mem(clk);

//wishbone icache_arbiter(clk);
//wishbone dcache_arbiter(clk);
//wishbone arbiter_L2cache(clk);
wishbone L2cache_mem(clk);

mainpc WeBareBears(
	.pmembus(L2cache_mem)
);

//physical_memory imemory(
	//.wb(icache_mem)
//);

//physical_memory dmemory(
	//.wb(dcache_mem)
//);

//arbiter sel_cache(
//	.icache_arbiter,
//	.dcache_arbiter,
//	.arbiter_L2cache
//);
//
//cache L2_cache(
//	.wb(L2cache_mem),
//	.sb(arbiter_L2cache)
//);

physical_memory mem(
	.wb(L2cache_mem)
);

endmodule : full_mainpc_tb

