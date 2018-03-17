module dcache_phys_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone icache_mem(clk);
wishbone dcache_mem(clk);

mainpc WeBareBears(
	.ibus(icache_mem),
	.dbus(dcache_mem)
);

physical_memory imemory(
	.wb(icache_mem)
);

physical_memory dmemory(
	.wb(dcache_mem)
);

endmodule : dcache_phys_mainpc_tb

