module mainpc(
	wishbone.master pmembus
);

logic EWB_ack, EWB_req;
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
	.dcache(cpu_dcache)
);

cache icache (
	.sb(cpu_icache),
	.wb(icache_arbiter)
);

cache dcache (
	.sb(cpu_dcache),
	.wb(dcache_arbiter)
);

arbiter sel_cache (
	.icache_arbiter,
	.dcache_arbiter,
	.arbiter_L2cache
);

cache L2_cache (
	.wb(L2cache_ewb),
	.sb(arbiter_L2cache),
	.write_hit
);

//mux2 #(.width(1)) select_ACK (.sel(L2cache_ewb.WE), .a(pmembus.ACK), .b(EWB_ack), .z(L2cache_ewb.ACK));
assign L2cache_ewb.ACK = pmembus.ACK;
write_buffer EWB (
	.clk(pmembus.CLK),
	.w_data_in(L2cache_ewb.DAT_M),
	.w_addr_in(L2cache_ewb.ADR),
	.mem_ack(pmembus.ACK),
	.L2_req(L2cache_ewb.WE),
	.L2_hit(write_hit),
	.w_data_out,
	.w_addr_out,
	.EWB_ack,
	.EWB_req
);

assign L2cache_ewb.DAT_S = pmembus.DAT_S;
assign pmembus.DAT_M = w_data_out;
//mux2 #(.width(12)) select_ADR (.sel(EWB_req), .a(L2cache_ewb.ADR), .b(w_addr_out), .z(pmembus.ADR));
assign pmembus.ADR = L2cache_ewb.ADR;
assign pmembus.WE = EWB_req;
assign pmembus.STB = EWB_req || L2cache_ewb.STB;
assign pmembus.CYC = EWB_req || L2cache_ewb.CYC;
assign pmembus.SEL = 16'hffff;

endmodule : mainpc