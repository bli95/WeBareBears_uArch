module cache_control
(
	input clk,
	input cpu_req,
	input cpu_r0w1,
	input mem_resp,
	input hit0, hit1,
	input lru_out,
	input dir0_out, dir1_out,
	output logic cache_resp,
	output logic mem_req,
	output logic mem_r0w1,
	output logic indata_muxsel, outdata_muxsel,
	output logic [1:0] memaddr_muxsel,
	output logic lru_we, lru_in,
	output logic val_in, dir_in,
	output logic write0, write1
);

enum int unsigned {
   wait_hitrw,
	store_data,
	wb_sep_req,
	load_data
} state, next_state;

always_comb
begin : state_actions
	cache_resp = 1'b0;
	mem_req = 1'b0;
	mem_r0w1 = 1'b0;
	indata_muxsel = 1'b0;
	outdata_muxsel = 1'b0;
	memaddr_muxsel = 2'b00;
	lru_we = 1'b0;
	lru_in = 1'b0;
	val_in = 1'b0;
	dir_in = 1'b0;
	write0 = 1'b0;
	write1 = 1'b0;

	case(state)
		wait_hitrw: begin
			if (cpu_req != 0)
			begin
				if (hit0 | hit1)	//should be mutually exclusive, by inherent design
				begin
					outdata_muxsel = (hit0 != 0)? 1'b0 : 1'b1;
					if (cpu_r0w1 != 0)
					begin
						// for modifying cache data (writes)
						dir_in = 1;
						val_in = 1; 
						indata_muxsel = 1;
						// overwrite the block in the set least recently used;
						if (hit0 != 0)
							write0 = 1;
						else
							write1 = 1;
					end
					lru_in = hit0;	//if hit is in set0, then LRU is other set (=1) & vice versa
					lru_we = 1;
					cache_resp = 1;
				end
				else
				/* no hit, must retrieve from physical memory then
					note: state will transition, but content fetch/req begins this cycle (immediately) */
				begin
					/* since dirty bit only set on valid data writes, we assume implied validity;
						evicting the LRU set, check if the block has been modified since retrieval */
					if ((lru_out == 0 & dir0_out) | (lru_out == 1 & dir1_out))
					begin
						// store LRU set's modified data to proper memory loc (its tag) before eviction
						outdata_muxsel = lru_out;
						memaddr_muxsel = (lru_out == 0 && dir0_out)? 2'b01 : 2'b10;
						mem_r0w1 = 1;
						mem_req = 1;
					end
					else	//data has not changed from mem, can directly overwrite|replace
					begin
						mem_req = 1;
						mem_r0w1 = 0;
						memaddr_muxsel = 2'b00;
					end
				end
			end
			// else, inactive|wait state
		end
		store_data: begin
			outdata_muxsel = lru_out;
			memaddr_muxsel = (lru_out == 0 & dir0_out)? 2'b01 : 2'b10;
			mem_r0w1 = 1;
			mem_req = 1;
		end
		wb_sep_req: ; // dummy do-nothing state per wishbone spec to separate two mem reqs
		load_data: begin
			mem_req = 1;
			mem_r0w1 = 0;
			memaddr_muxsel = 2'b00;

			indata_muxsel = 0;
			val_in = 1;
			dir_in = 0;
			if (lru_out == 0)
				write0 = 1;
			else
				write1 = 1;
			/* could technically update LRU and respond to cpu reads here, but we choose to let 
				wait_hitrw handle both final write modification and write | read response to cpu */
		end
		default: /* hacer nada */;
	endcase
end

always_comb
begin : next_state_logic
	 next_state = state;
	 
    case(state)
		wait_hitrw: begin
			if (~(hit0 | hit1))
			begin
				/* if dirty old data has been stored: retrieve new data from mem;
					if old data was clean and new data retrieved: load it into cache */
				if ((lru_out == 0 && dir0_out) | (lru_out == 1 && dir1_out))
					next_state = store_data;
				else
					next_state = load_data;
			end
		end
		store_data: begin
			if (mem_resp != 0)
				next_state = wb_sep_req;
		end
		wb_sep_req: next_state = load_data; // to reset STB to low when transition from store to load
		load_data: begin
			if (mem_resp != 0)
				next_state = wait_hitrw;
		end
		default: /* hacer nada */;
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    state <= next_state;
end

endmodule : cache_control