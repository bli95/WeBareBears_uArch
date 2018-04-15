module full_mainpc_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone EWB_mem(clk);

mainpc WeBareBears(
	.pmembus(EWB_mem)
);

physical_memory mem(
	.wb(EWB_mem)
);

endmodule : full_mainpc_tb

