module dcache_phys_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

//wishbone icache_mem(clk);
//wishbone dcache_mem(clk);

wishbone icache_arbiter(clk);
wishbone dcache_arbiter(clk);

wishbone arbiter_mem(clk);

mainpc WeBareBears(
	.ibus(icache_arbiter),
	.dbus(dcache_arbiter)
);

//physical_memory imemory(
	//.wb(icache_mem)
//);

//physical_memory dmemory(
	//.wb(dcache_mem)
//);

arbiter sel_cache(
	.icache_arbiter,
	.dcache_arbiter,
	.arbiter_mem
);

physical_memory mem(
	.wb(arbiter_mem)
);

endmodule : dcache_phys_mainpc_tb

