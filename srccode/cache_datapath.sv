module cache_datapath
(
	input clk,
	input [11:0] cpu_address,
	input [15:0] cpu_wb_sel,
	input [127:0] cpu_wdata,
	input [127:0] mem_rdata,
	input indata_muxsel, outdata_muxsel,
	input [1:0] memaddr_muxsel,
	input lru_we, lru_in,
	input val_in, dir_in,
	input write0, write1,
	output logic [11:0] mem_address,
	output logic [127:0] mem_wdata,
	output logic [127:0] cpu_rdata,
	output logic hit0, hit1,
	output logic lru_out,
	output logic dir0_out, dir1_out
);

/* internal signal declarations */
logic [8:0] tag;
logic [2:0] set;
logic val0_out, val1_out;
logic [8:0] tag0_out, tag1_out;
logic [127:0] data0_out, data1_out;
logic [127:0] indata_out, outdata_out;
logic comp0_out, comp1_out;
logic [127:0] modified_data;

/* constant signal assignments */
assign tag = cpu_address[11:3];
assign set = cpu_address[2:0];
assign mem_wdata = outdata_out;
assign cpu_rdata = outdata_out;
assign hit0 = val0_out & comp0_out;
assign hit1 = val1_out & comp1_out;

array #(.width(1)) lru
(
	.clk,
	.write(lru_we),
	.index(set),
	.datain(lru_in),
	.dataout(lru_out)
);
array #(.width(1)) valid0
(
	.clk,
	.write(write0),
	.index(set),
	.datain(val_in),
	.dataout(val0_out)
);
array #(.width(1)) valid1
(
	.clk,
	.write(write1),
	.index(set),
	.datain(val_in),
	.dataout(val1_out)
);
array #(.width(1)) dirty0
(
	.clk,
	.write(write0),
	.index(set),
	.datain(dir_in),
	.dataout(dir0_out)
);
array #(.width(1)) dirty1
(
	.clk,
	.write(write1),
	.index(set),
	.datain(dir_in),
	.dataout(dir1_out)
);
array #(.width(9)) tag0
(
	.clk,
	.write(write0),
	.index(set),
	.datain(tag),
	.dataout(tag0_out)
);
array #(.width(9)) tag1
(
	.clk,
	.write(write1),
	.index(set),
	.datain(tag),
	.dataout(tag1_out)
);
array data0
(
	.clk,
	.write(write0),
	.index(set),
	.datain(indata_out),
	.dataout(data0_out)
);
array data1
(
	.clk,
	.write(write1),
	.index(set),
	.datain(indata_out),
	.dataout(data1_out)
);

comparator comp0_9b
(
	.a(tag),
	.b(tag0_out),
	.eq(comp0_out),
	.lt(),
	.gt()
);
comparator comp1_9b
(
	.a(tag),
	.b(tag1_out),
	.eq(comp1_out),
	.lt(),
	.gt()
);

inserter modify_outdata
(
	.in(outdata_out),
	.wdata(cpu_wdata),
	.insel(cpu_wb_sel),
	.out(modified_data)
);

mux4 #(.width(12)) memaddr_mux
(
	.sel(memaddr_muxsel),
	.a(cpu_address),
	.b({tag0_out,set}),
	.c({tag1_out,set}),
	.d(),
	.f(mem_address)
);
mux2 #(.width(128)) outdata_mux
(
	.sel(outdata_muxsel),
	.a(data0_out),
	.b(data1_out),
	.f(outdata_out)
);
mux2 #(.width(128)) indata_mux
(
	.sel(indata_muxsel),
	.a(mem_rdata),
	.b(modified_data),
	.f(indata_out)
);

endmodule : cache_datapath