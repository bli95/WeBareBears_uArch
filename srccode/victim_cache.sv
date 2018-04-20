import lc3b_types::*;

module victim_cache
(
	wishbone.master wb,
	wishbone.slave sb
);

   logic clk;
				  
	logic [11:0] L2address;
	logic [127:0] L2data;
	
	assign L2address = sb.ADR;
	assign L2data = sb.DAT_M;
	
	assign wb.ADR = wb_address;
	assign wb.DAT_M = wb_data;
	
	VC_control VCC (.*);
	VC_datapath VCD (.*);
	
endmodule : victim_cache
	