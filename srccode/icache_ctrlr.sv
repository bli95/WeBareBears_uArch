import lc3b_types::*;
/*
module icache_ctrlr
(
	input clk,
	input rw_resp,
	output logic istall,
	output logic req_rw
);

always_ff @(posedge clk)
begin
	// when cache is connected, move these signals to always_comb block to be compatible with same cycle ack
	
	req_rw = 0;
	
	if (rw_resp == 0)
		req_rw = 1;
	else
		req_rw = 0;
end

always_comb
begin
	
	stall2 = 0;
	
	if (rw_resp == 0)
		 stall2 = 1;
	else
		 stall2 = 0;
end

endmodule : icache_ctrlr
*/