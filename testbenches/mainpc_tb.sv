module mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone cpu_icache(clk);
wishbone cpu_dcache(clk);

mainpc WeBareBears(
	.icache_if(cpu_icache),
	.dcache_if(cpu_dcache)
);

magic_memory_dual_port memory(
	.ifetch(cpu_icache),
	.memory(cpu_dcache)
);

endmodule : mainpc_tb
