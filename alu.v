module alu (
    input [31:0] op1,
    input [31:0] op2,
    input [2:0] func3,
    input [6:0] func7,
    output reg [31:0] add_result,
    output reg [31:0] sub_result,
    output reg [31:0] xor_result,
    output reg [31:0] or_result,
    output reg [31:0] and_result,
    output reg [31:0] shift_left_result,
    output reg [31:0] shift_right_result,
    output reg [31:0] signed_shift_right_result,
    output reg [31:0] signed_compare_result,
    output reg [31:0] unsigned_compare_result,
    output reg func7_result,
    output reg [31:0] addsub_result,
    output reg [31:0] srlsra_result,
    output reg [31:0] out
);

    // Suma
    always @* begin
        add_result = op1 + op2;
        sub_result = op1 - op2;
        xor_result = op1 ^ op2;
        or_result = op1 | op2;
        and_result = op1 & op2;
        shift_left_result = op1 << (op2[5:0]);
        shift_right_result = op1 >> (op2[5:0]);
        signed_shift_right_result = (op1) >>> (op2[5:0]);
        signed_compare_result = ($signed(op1) < $signed(op2)) ? 1 : 0;
        unsigned_compare_result = (op1 < op2) ? 1 : 0;
        func7_result = (func7 == 7'h20) ? 1 : 0;
        if (func7_result) begin
            addsub_result = sub_result;
            srlsra_result = signed_shift_right_result;
        end
        else begin
            addsub_result = add_result;
            srlsra_result = shift_right_result;
        end
        case (func3)
            3'b000: out = addsub_result;
            3'b001: out = shift_left_result;
            3'b010: out = signed_compare_result;
            3'b011: out = unsigned_compare_result;
            3'b100: out = xor_result;
            3'b101: out = srlsra_result;
            3'b110: out = or_result;
            3'b111: out = and_result;
        endcase
    end

endmodule

