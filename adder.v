module adder (
    input [31:0] pc,
    output [31:0] pc4
);
    assign pc4 = pc + 4;
endmodule
