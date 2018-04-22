module mainpc(
	wishbone.master pmembus
);

logic icache_hit, icache_miss, dcache_hit, dcache_miss, l2cache_hit, l2cache_miss;
logic EWB_ack, EWB_req, EWB_busy, L2_busy;
logic [11:0] w_addr_out;
logic [127:0] w_data_out;
logic write_hit;
logic VC_read, VC_ack, Pmem_read, VC_write, foh, L2_dirty_bit;
logic [11:0] wb_address, to_pmem_adr;
logic [127:0] wb_data, rb_data;
logic l2_req_muxsel = 1'b0;	// chooses what L2 interacts with between VC and PMEM 

wishbone cpu_dcache(pmembus.CLK);
wishbone cpu_icache(pmembus.CLK);
wishbone icache_arbiter(pmembus.CLK);
wishbone dcache_arbiter(pmembus.CLK);
wishbone arbiter_L2cache(pmembus.CLK);
//wishbone L2cache_ewb(pmembus.CLK);
wishbone L2cache_VC(pmembus.CLK);

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
	.miss_me_wifdat_bs(icache_miss)
);

cache dcache (
	.sb(cpu_dcache),
	.wb(dcache_arbiter),
	.got_hit_likah_bih(dcache_hit),
	.miss_me_wifdat_bs(dcache_miss)
);

arbiter sel_cache (
	.icache_arbiter,
	.dcache_arbiter,
	.arbiter_L2cache
);

L2cache L2_cache (
	.wb(L2cache_VC),
	.sb(arbiter_L2cache),
	.L2_dirty_bit,
	.got_hit_likah_bih(l2cache_hit),
	.miss_me_wifdat_bs(l2cache_miss)
);



victim_cache Victim_cache (
	 .clk(pmembus.CLK),
    .L2_data(L2cache_VC.DAT_M),
	 .L2_address(L2cache_VC.ADR),
	 .mem_ack(pmembus.ACK), 
	 .L2_read(VC_read), 
	 .L2_write(L2cache_VC.WE), 
	 .L2toPmem_busy(l2_req_muxsel),
    .L2_dirty_bit,
	 
	 .foh,
	 .wb_data(pmembus.DAT_M),
	 .wb_address(pmembus.ADR),
	 .rb_data,
	 .VC_ack, .VC_write
);

always_ff @(posedge pmembus.CLK) 
begin
	if ((l2_req_muxsel == 0 && foh == 1) || (l2_req_muxsel == 1 && pmembus.ACK))
		l2_req_muxsel = ~l2_req_muxsel;
end

demux2 #(.width(1)) select_L2read (.sel(l2_req_muxsel), .a(L2cache_VC.STB & !L2cache_VC.WE), .y(VC_read), .z(Pmem_read));
mux2 #(.width(1)) select_ACK (.sel(l2_req_muxsel), .a(VC_ack), .b(pmembus.ACK), .z(L2cache_VC.ACK));
mux2 #(.width(128)) select_DATA (.sel(l2_req_muxsel), .a(rb_data), .b(pmembus.DAT_S), .z(L2cache_VC.DAT_S));

assign pmembus.STB = Pmem_read | VC_write;
assign pmembus.CYC = Pmem_read | VC_write;
assign pmembus.WE = VC_write;
assign pmembus.SEL = 16'hffff;
// incorporated inside VC_datapath
//mux2 #(.width(12)) select_ADR (.sel(VC_write), .a(L2cache_VC.ADR), .b(wb_address), .z(to_pmem_adr));
//register #(.width(12)) pmem_MAR (.clk(pmembus.CLK), .load(1'b1), .in(to_pmem_adr), .out(pmembus.ADR));
//assign pmembus.ADR = (VC_write) ? wb_address : L2cache_VC.ADR;

// All this shit below was used to connect EWB

/*
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
*/

endmodule : mainpc
