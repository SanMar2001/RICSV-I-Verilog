module immunit (
    input [31:0] inst,
    output reg [31:0] imm
);
    reg [6:0] opcode;
    reg [2:0] func3;
    reg [31:0] shamt;
    reg shamflag;
    reg [31:0] immi;
    reg [31:0] imms;
    reg [31:0] immb;
    reg [31:0] immu;
    reg [31:0] immj;
    reg normal_i;
    reg special_i;
    reg types;
    reg typeb;
    reg typeu;
    reg typej;

    always @* begin
        opcode = inst[6:0];
        func3 = inst[14:12];
        //Tipo I
        immi = {(inst[31] == 0) ? 20'b0 : 20'b1, inst[31:20]};
        //Tipo I SRAI SRLI
        shamt = {26'b0, inst[24:20]};
        //Tipo U
        immu = {12'b0, inst[31:12]};
        //Tipo J
        immj = {(inst[31] == 0) ? 11'b0 : 11'b1, inst[31], inst[30:21], inst[20], inst[19:12], 1'b0};
        //Tipo S
        imms = {(inst[31] == 0) ? 20'b0 : 20'b1, inst[31:25], inst[11:7]};
        //Tipo B
        immb = {(inst[31] == 0) ? 19'b0 : 19'b1, inst[31], inst[7], inst[30:25], inst[11:8],1'b0};
        //Evaluar tipo de inmediato
        normal_i = ((opcode == 7'b0010011) | (opcode == 7'b0000011) | (opcode == 7'b1110011) | (opcode == 7'b1100111)) ? 1'b1 : 1'b0;
        special_i = ((func3 == 5) | (func3 == 1)) ? 1'b1 : 1'b0;
        shamflag = (normal_i && special_i) ? 1'b1 : 1'b0;

        if (normal_i)
            imm = immi;
        else if (shamflag)
            imm = shamt;
        else if (opcode == 7'b0100011)
            imm = imms;
        else if (opcode == 7'b1100011)
            imm = immb;
        else if (opcode == 7'b1101111)
            imm = immj;
        else if ((opcode == 7'b0110111) | (opcode == 0010111))
            imm = immu;
    end

endmodule



