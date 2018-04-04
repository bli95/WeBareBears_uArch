module cache
(
	wishbone.slave cpu,
	wishbone.master mem
);

logic hit0, hit1, dir0_out, dir1_out, lru_out,
		lru_we, lru_in, val_in, dir_in, write0, write1;
logic indata_muxsel, outdata_muxsel;
logic [1:0] memaddr_muxsel;

// ignoring cpu.CYC in cache bc bus granularity
assign cpu.RTY = cpu.STB & ~cpu.ACK;	//cpu.STB & .CYC is the same here
// mem.CLK is the same clock as cpu.CLK
assign mem.CYC = mem.STB;
assign mem.SEL = 16'hFFFF;	//write & read all 128bits btwn cache & mem
// mem.RTY safely ignored by cache master here bc isolated bus

cache_datapath dp
(
	.clk(cpu.CLK),
	.cpu_address(cpu.ADR),
	.cpu_wb_sel(cpu.SEL),
	.cpu_rdata(cpu.DAT_S),
	.cpu_wdata(cpu.DAT_M),
	.mem_address(mem.ADR),
	.mem_rdata(mem.DAT_S),
	.mem_wdata(mem.DAT_M),
	.hit0, .hit1,
	.dir0_out, .dir1_out,
	.lru_out, .lru_we, .lru_in,
	.val_in, .dir_in,
	.write0, .write1,
	.indata_muxsel, .outdata_muxsel, .memaddr_muxsel
);

cache_control ctr
(
	.clk(cpu.CLK),
	.cpu_req(cpu.STB),
	.cpu_r0w1(cpu.WE),
	.cache_resp(cpu.ACK),
	.mem_req(mem.STB),
	.mem_r0w1(mem.WE),
	.mem_resp(mem.ACK),
	.hit0, .hit1,
	.dir0_out, .dir1_out,
	.lru_out, .lru_we, .lru_in,
	.val_in, .dir_in,
	.write0, .write1,
	.indata_muxsel, .outdata_muxsel, .memaddr_muxsel
);

endmodule : cache
