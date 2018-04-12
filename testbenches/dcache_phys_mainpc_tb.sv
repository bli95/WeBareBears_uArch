module dcache_phys_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone icache_arbiter(clk);
wishbone dcache_arbiter(clk);
wishbone arbiter_L2cache(clk);
wishbone L2cache_mem(clk);

mainpc WeBareBears(
	.ibus(icache_arbiter),
	.dbus(dcache_arbiter)
);

arbiter sel_cache(
	.icache_arbiter,
	.dcache_arbiter,
	.arbiter_L2cache
);

cache L2_cache(
	.wb(L2cache_mem),
	.sb(arbiter_L2cache),
	.L2_ack,
	.L2_data
);

mux2 #(.width(1)) select_ACK (.sel(L2cache_mem.WE), .a(L2cache_mem.ACK), .b(EWB_ack), .z(L2_ack));

write_buffer EWB(
	.wdata(L2cache_mem.DAT_M),
	.w_address(L2cache_mem.ADR),
	.mem_ack(L2cache_mem.ACK),
	.w_req(L2cache_mem.WE),
	.EWB_ack,
);

physical_memory mem(
	.wb(L2cache_mem)
);

endmodule : dcache_phys_mainpc_tb

