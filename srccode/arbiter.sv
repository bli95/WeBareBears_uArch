import lc3b_types::*;

module arbiter 
(
	wishbone.slave icache_arbiter,
	wishbone.slave dcache_arbiter,
	wishbone.master arbiter_L2cache
);

	enum int unsigned {none, ireq, dreq, both, hold_single, hold_both} state, next_state;
	
	logic w;
	
	always_comb begin
	
		icache_arbiter.DAT_S = arbiter_L2cache.DAT_S;
		dcache_arbiter.DAT_S = arbiter_L2cache.DAT_S;
		icache_arbiter.ACK = arbiter_L2cache.ACK && ~w;
		dcache_arbiter.ACK = arbiter_L2cache.ACK && (state == dreq || state == both);
		icache_arbiter.RTY = (icache_arbiter.ACK && icache_arbiter.STB) ? 1'b0 : 1'b1;
		dcache_arbiter.RTY = (dcache_arbiter.ACK && dcache_arbiter.STB) ? 1'b0 : 1'b1;
		
		w = 0;
	
		case(state)
			none:
			begin
				arbiter_L2cache.STB = 0;
				arbiter_L2cache.CYC = 0;
				arbiter_L2cache.WE = 0;
				arbiter_L2cache.ADR = 12'hxxx;
				arbiter_L2cache.SEL = 16'hxxxx;
				arbiter_L2cache.DAT_M = 128'dx;
			end
			ireq:
			begin
				arbiter_L2cache.STB = icache_arbiter.STB;
				arbiter_L2cache.CYC = icache_arbiter.CYC;
				arbiter_L2cache.WE = 0;
				arbiter_L2cache.ADR = icache_arbiter.ADR;
				arbiter_L2cache.SEL = icache_arbiter.SEL;
				arbiter_L2cache.DAT_M = 128'dx;
			end
			dreq:
			begin
				arbiter_L2cache.STB = dcache_arbiter.STB;
				arbiter_L2cache.CYC = dcache_arbiter.CYC;
				arbiter_L2cache.WE = dcache_arbiter.WE;
				arbiter_L2cache.ADR = dcache_arbiter.ADR;
				arbiter_L2cache.SEL = dcache_arbiter.SEL;
				arbiter_L2cache.DAT_M = dcache_arbiter.DAT_M;
			end
			both:
			begin
				arbiter_L2cache.STB = dcache_arbiter.STB;
				arbiter_L2cache.CYC = dcache_arbiter.CYC;
				arbiter_L2cache.WE = dcache_arbiter.WE;
				arbiter_L2cache.ADR = dcache_arbiter.ADR;
				arbiter_L2cache.SEL = dcache_arbiter.SEL;
				arbiter_L2cache.DAT_M = dcache_arbiter.DAT_M;
				w = 1;
			end
			hold_single:
			begin
				arbiter_L2cache.STB = 0;
				arbiter_L2cache.CYC = 0;
				arbiter_L2cache.WE = 0;
				arbiter_L2cache.ADR = 12'hxxx;
				arbiter_L2cache.SEL = 16'hxxxx;
				arbiter_L2cache.DAT_M = 128'dx;
			end
			hold_both:
			begin
				arbiter_L2cache.STB = 0;
				arbiter_L2cache.CYC = 0;
				arbiter_L2cache.WE = 0;
				arbiter_L2cache.ADR = 12'hxxx;
				arbiter_L2cache.SEL = 16'hxxxx;
				arbiter_L2cache.DAT_M = 128'dx;
				w = 1;
			end
		endcase
	end
	
	always_comb begin
	
		case(state)
			none:
			begin
				if (icache_arbiter.STB == 1'b1 && dcache_arbiter.STB == 1'b0) begin
					next_state = ireq;
				end
				else if (icache_arbiter.STB == 1'b0 && dcache_arbiter.STB == 1'b1) begin
					next_state = dreq;
				end
				else if (icache_arbiter.STB == 1'b1 && dcache_arbiter.STB == 1'b1) begin
					next_state = both;
				end
				else begin
					next_state = none;
				end
			end
			ireq:
			begin
				if (arbiter_L2cache.ACK == 1'b0 && icache_arbiter.STB == 1'b1) begin
					next_state = ireq;
				end
				else if (icache_arbiter.STB == 1'b1 || dcache_arbiter.STB == 1'b0) begin
					next_state = hold_single;
				end
				else begin
					next_state = none;
				end
			end
			dreq:
			begin
				if (arbiter_L2cache.ACK == 1'b0 && dcache_arbiter.STB == 1'b1) begin
					next_state = dreq;
				end
				else if (icache_arbiter.STB == 1'b1 && dcache_arbiter.STB == 1'b0) begin
					next_state = hold_single;
				end
				else begin
					next_state = none;
				end
			end
			both:
			begin
				if (arbiter_L2cache.ACK == 1'b0 && dcache_arbiter.STB == 1'b1) begin
					next_state = both;
				end
				else begin
					next_state = hold_both;
				end
			end
			hold_single:
			begin
				if (icache_arbiter.STB == 1'b1 && dcache_arbiter.STB == 1'b1) begin
					next_state = both;
				end
				else if (icache_arbiter.STB == 1'b1 && dcache_arbiter.STB == 1'b0) begin
					next_state = ireq;
				end
				else if (icache_arbiter.STB == 1'b0 && dcache_arbiter.STB == 1'b1) begin
					next_state = dreq;
				end
				else begin
					next_state = none;
				end
			end
			hold_both:
			begin
				next_state = ireq;
			end
		endcase
	end
		
	always_ff @(posedge arbiter_L2cache.CLK) begin: next_state_assignment
		state <= next_state;
	end
	
endmodule : arbiter
	
	