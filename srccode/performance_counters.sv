import lc3b_types::*;

module performance_counters
(
	input clk,
	input lc3b_word data_addr,
	input sti_zero_cntr,
	input br_in_exstage,
	input br_en_in_exstage,
	input global_stall,
	input icache_hit, icache_miss,
	input dcache_hit, dcache_miss,
	input l2cache_hit, l2cache_miss,
	output lc3b_word counter_val_out
);

lc3b_word tot_br_cnt, br_mis_cnt, ic_stall_cnt, dc_stall_cnt, ic_hit_cnt, ic_miss_cnt,
				dc_hit_cnt, dc_miss_cnt, l2_hit_cnt, l2_miss_cnt;

// declaring constant ADDR associated with internal counters
const shortint TOTAL_BR = 16'hFFFF;
const shortint BR_MISP = 16'hFFFE;
const shortint IC_HIT = 16'hFFFD;
const shortint IC_MISS = 16'hFFFC;
const shortint DC_HIT = 16'hFFFB;
const shortint DC_MISS = 16'hFFFA;
const shortint L2_HIT = 16'hFFF9;
const shortint L2_MISS = 16'hFFF8;
//const shortint IC_STAL = 16'hFFF7;
//const shortint DC_STAL = 16'hFFF6;

mux16 select_counter
(
	.sel(TOTAL_BR - data_addr),
	.a(tot_br_cnt), .b(br_mis_cnt), .c(ic_hit_cnt), .d(ic_miss_cnt), 
	.e(dc_hit_cnt), .f(dc_miss_cnt), .g(l2_hit_cnt), .h(l2_miss_cnt), 
	.i(), .j(), .k(), .l(),
	.m(), .n(), .o(), .p(),
	.z(counter_val_out)
);

counter total_branches (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == TOTAL_BR)),
	.increment(br_in_exstage & ~(global_stall)),	/* ensures that pipeline is not stalling so counter is not continuously increment for duration of stall */
	.out(tot_br_cnt)
);
counter br_mispredictions (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == BR_MISP)),
	.increment(br_in_exstage & br_en_in_exstage & ~(global_stall)),
	.out(br_mis_cnt)
);

counter l1i_hit (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == IC_HIT)),
	.increment(icache_hit),
	.out(ic_hit_cnt)
);
counter l1i_miss (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == IC_MISS)),
	.increment(icache_miss),
	.out(ic_miss_cnt)
);

counter l1d_hit (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == DC_HIT)),
	.increment(dcache_hit),
	.out(dc_hit_cnt)
);
counter l1d_miss (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == DC_MISS)),
	.increment(dcache_miss),
	.out(dc_miss_cnt)
);

counter l2_hit (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == L2_HIT)),
	.increment(l2cache_hit),
	.out(l2_hit_cnt)
);
counter l2_miss (
	.clk,
	.reset(sti_zero_cntr && !(data_addr == L2_MISS)),
	.increment(l2cache_miss),
	.out(l2_miss_cnt)
);

//counter icache_stalls (
//	.clk,
//	.reset(sti_zero_cntr && !(data_addr == IC_STAL)),
//	.increment(istall),
//	.out(ic_stall_cnt)
//);
//counter dcache_stalls (
//	.clk,
//	.reset(sti_zero_cntr && !(data_addr == DC_STAL)),
//	.increment(dstall),
//	.out(dc_stall_cnt)
//);

endmodule : performance_counters


module counter #(parameter width = 16)
(
    input clk,
    input reset,
	 input increment,
    output logic [width-1:0] out
);

logic [width-1:0] data;

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */
initial
begin
    data = 1'b0;
end

always_ff @(posedge clk)
begin
	if (reset)
		data = '0;
	else if (increment)
		data = data + 1;
end

always_comb
begin
    out = data;
end

endmodule : counter