import lc3b_types::*;

module arbiter 
(
	wishbone.slave icache_arbiter,
	wishbone.slave dcache_arbiter,
	wishbone.master arbiter_mem
);

	enum int unsigned {none, ireq, dreq, both, hold_single, hold_both} state, next_state;
	
	logic w;
	
	always_comb begin
	
		icache_arbiter.DAT_S = arbiter_mem.DAT_S;
		dcache_arbiter.DAT_S = arbiter_mem.DAT_S;
		icache_arbiter.ACK = arbiter_mem.ACK && ~w;
		dcache_arbiter.ACK = arbiter_mem.ACK && (state == dreq || state == both);
		icache_arbiter.RTY = (icache_arbiter.ACK && icache_arbiter.STB) ? 0 : 1;
		dcache_arbiter.RTY = (dcache_arbiter.ACK && dcache_arbiter.STB) ? 0 : 1;
		
		w = 0;
	
		case(state)
			none:
			begin
				arbiter_mem.STB = 0;
				arbiter_mem.CYC = 0;
				arbiter_mem.WE = 0;
				arbiter_mem.ADR = 12'hxxx;
				arbiter_mem.SEL = 16'hxxxx;
				arbiter_mem.DAT_M = 128'dx;
			end
			ireq:
			begin
				arbiter_mem.STB = icache_arbiter.STB;
				arbiter_mem.CYC = icache_arbiter.CYC;
				arbiter_mem.WE = 0;
				arbiter_mem.ADR = icache_arbiter.ADR;
				arbiter_mem.SEL = icache_arbiter.SEL;
				arbiter_mem.DAT_M = 128'dx;
			end
			dreq:
			begin
				arbiter_mem.STB = dcache_arbiter.STB;
				arbiter_mem.CYC = dcache_arbiter.CYC;
				arbiter_mem.WE = dcache_arbiter.WE;
				arbiter_mem.ADR = dcache_arbiter.ADR;
				arbiter_mem.SEL = dcache_arbiter.SEL;
				arbiter_mem.DAT_M = dcache_arbiter.DAT_M;
			end
			both:
			begin
				arbiter_mem.STB = dcache_arbiter.STB;
				arbiter_mem.CYC = dcache_arbiter.CYC;
				arbiter_mem.WE = dcache_arbiter.WE;
				arbiter_mem.ADR = dcache_arbiter.ADR;
				arbiter_mem.SEL = dcache_arbiter.SEL;
				arbiter_mem.DAT_M = dcache_arbiter.DAT_M;
				w = 1;
			end
			hold_single:
			begin
				arbiter_mem.STB = 0;
				arbiter_mem.CYC = 0;
				arbiter_mem.WE = 0;
				arbiter_mem.ADR = 12'hxxx;
				arbiter_mem.SEL = 16'hxxxx;
				arbiter_mem.DAT_M = 128'dx;
			end
			hold_both:
			begin
				arbiter_mem.STB = 0;
				arbiter_mem.CYC = 0;
				arbiter_mem.WE = 0;
				arbiter_mem.ADR = 12'hxxx;
				arbiter_mem.SEL = 16'hxxxx;
				arbiter_mem.DAT_M = 128'dx;
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
				if (arbiter_mem.ACK == 1'b0 && icache_arbiter.STB == 1'b1) begin
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
				if (arbiter_mem.ACK == 1'b0 && dcache_arbiter.STB == 1'b1) begin
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
				if (arbiter_mem.ACK == 1'b0 && dcache_arbiter.STB == 1'b1) begin
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
		
	always_ff @(posedge arbiter_mem.CLK) begin: next_state_assignment
		state <= next_state;
	end
	
endmodule : arbiter
	
	