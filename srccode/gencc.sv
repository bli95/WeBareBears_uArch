import lc3b_types::*;

module gencc
(
   input lc3b_word in,
	input load,
   output lc3b_nzp out
);

lc3b_nzp cc = 3'b000;
assign out = cc;

always_latch
begin
	if (load == 1)
	begin
		if (in[15] == 1'b1)
			cc = 3'b100;
		else if (|in)
			cc = 3'b001;
		else
			cc = 3'b010;
	end
	else ;
end

endmodule : gencc
