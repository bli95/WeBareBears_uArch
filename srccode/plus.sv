module plus #(parameter width = 16, parameter operand = 2)
(
    input [width-1:0] in,
    output logic [width-1:0] out
);

assign out = in + operand;

endmodule : plus
