module dcache_phys_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone cpu_icache(clk);
wishbone cpu_dcache(clk);

mainpc WeBareBears(
	.ibus(cpu_icache),
	.dbus(cpu_dcache)
);

magic_memory mmemory(
	.wb(cpu_icache)
);

physical_memory pmemory(
	.wb(cpu_dcache)
);

endmodule : dcache_phys_mainpc_tb


