module dcache_phys_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic EWB_ack, EWB_req;
logic [11:0] w_addr_out;
logic [127:0] w_data_out;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone icache_arbiter(clk);
wishbone dcache_arbiter(clk);
wishbone arbiter_L2cache(clk);
wishbone L2cache_EWB(clk);
wishbone EWB_mem(clk);

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
	.wb(L2cache_EWB),
	.sb(arbiter_L2cache),
);

mux2 #(.width(1)) select_ACK (.sel(L2cache_EWB.WE), .a(L2cache_EWB.ACK), .b(EWB_ack), .z(L2cache_EWB.ACK));

write_buffer EWB(
	.w_data_in(L2cache_EWB.DAT_M),
	.w_addr_in(L2cache_EWB.ADR),
	.mem_ack(EWB_mem.ACK),
	.L2_req(L2cache_EWB.WE),
	.w_data_out,
	.w_addr_out,
	.EWB_ack,
	.EWB_req
);

EWB_mem.CLK = L2cache_EWB.CLK;
L2cache_EWB.DAT_S = EWB_mem.DAT_S;
mux2 #(.width(128)) select_DAT (.sel(EWB_req), .a(L2cache_EWB.DAT_M), .b(w_data_out), .z(EWB_mem.DAT_M))
mux2 #(.width(12)) select_ADR (.sel(EWB_req), .a(L2cache_EWB.ADR), .b(w_addr_out), .z(EWB_mem.ADR));
EWB_mem.WE = EWB_req;
EWB_mem.STB = EWB_req || L2cache_EWB.STB;
EWB_mem.CYC = EWB_req || L2cache_EWB.CYC;
EWB_mem.SEL = 16'hffff;

physical_memory mem(
	.wb(EWB_mem)
);

endmodule : dcache_phys_mainpc_tb

