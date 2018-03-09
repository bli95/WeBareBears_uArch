import lc3b_types::*;

module cpu
(
    wishbone.master icache_if,
	 wishbone.master dcache_if
);

// RTY safely ignored by cpu master here bc isolated bus
assign clk = bus.CLK;
assign mem_resp = bus.ACK;
assign mem_rdata = bus.DAT_S;
assign bus.DAT_M = mem_wdata;
assign bus.ADR = mem_address[15:4];
assign bus.STB = mem_read | mem_write;
assign bus.CYC = bus.STB;	// effectively disregarded bc 1 transfer sufficient
assign bus.WE = mem_write;
assign bus.SEL = mem_byte_enable << {mem_address[3:1],1'b0};

cpu_datapath pl_datpath
(
	
);

endmodule : cpu
