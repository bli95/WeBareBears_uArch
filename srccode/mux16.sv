module mux16 #(parameter width = 16)
(
	input [3:0] sel,
	input [width-1:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
	output logic [width-1:0] z
);

always_comb
begin
	case(sel)
		4'b0000: z = a;
		4'b0001: z = b;
		4'b0010: z = c;
		4'b0011: z = d;
		4'b0100: z = e;
		4'b0101: z = f;
		4'b0110: z = g;
		4'b0111: z = h;
		4'b1000: z = i;
		4'b1001: z = j;
		4'b1010: z = k;
		4'b1011: z = l;
		4'b1100: z = m;
		4'b1101: z = n;
		4'b1110: z = o;
		4'b1111: z = p;
		default: /* nada */;
	endcase
end

endmodule : mux16