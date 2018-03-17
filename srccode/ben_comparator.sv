module comparator #(parameter width = 9)
(
    input [width-1:0] a,
    input [width-1:0] b,
    output logic eq,
    output logic lt,
    output logic gt
);

always_comb
begin
	eq = 0;
	lt = 0;
	gt = 0;
	if (a < b)
	  lt = 1;
	else if (a == b)
	  eq = 1;
	else
	  gt = 1;
end

endmodule : comparator