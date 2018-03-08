module inserter
(
	input [127:0] in,
	input [127:0] wdata,	//cpu datapath hands to-be-written byte|word in [15:0]
	input [15:0] insel,	//cpu control passes up to 2 consecutive highs and rest are lows
	output logic [127:0] out
);

assign out[127:120]	= (insel[15])?	wdata[127:120] : in[127:120];
assign out[119:112]	= (insel[14])? wdata[119:112] : in[119:112];
assign out[111:104]	= (insel[13])? wdata[111:104] : in[111:104];
assign out[103:96]	= (insel[12])? wdata[103:96] 	: in[103:96];
assign out[95:88]		= (insel[11])? wdata[95:88]	: in[95:88];
assign out[87:80]		= (insel[10])? wdata[87:80] 	: in[87:80];
assign out[79:72] 	= (insel[9])?	wdata[79:72]	: in[79:72];
assign out[71:64] 	= (insel[8])?	wdata[71:64]	: in[71:64];
assign out[63:56] 	= (insel[7])?	wdata[63:56]	: in[63:56];
assign out[55:48] 	= (insel[6])?	wdata[55:48] 	: in[55:48];
assign out[47:40] 	= (insel[5])?	wdata[47:40]	: in[47:40];
assign out[39:32] 	= (insel[4])?	wdata[39:32] 	: in[39:32];
assign out[31:24] 	= (insel[3])?	wdata[31:24]	: in[31:24];
assign out[23:16] 	= (insel[2])?	wdata[23:16]	: in[23:16];
assign out[15:8] 		= (insel[1])?	wdata[15:8]		: in[15:8];
assign out[7:0] 		= (insel[0])?	wdata[7:0]		: in[7:0];

endmodule : inserter