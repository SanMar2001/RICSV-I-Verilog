module instdec (
    input [31:0] inst,
    output reg [6:0] opcode,
    output reg [4:0] rd,
    output reg [2:0] func3,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [6:0] func7
);

    // Asignación de las salidas según los bits específicos del input
    always @(*) begin
        opcode = inst[6:0];
        rd = inst[11:7];
        func3 = inst[14:12];
        rs1 = inst[19:15];
        rs2 = inst[24:20];
        func7 = inst[31:25];
    end

endmodule
