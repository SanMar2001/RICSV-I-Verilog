`include "adder.v"
`include "p_memory.v"
`include "pc.v"
`include "immunit.v"
`include "instdec.v"
`include "regfile.v"
`include "mux2_1.v"
`include "mux4_1.v"
`include "alu.v"
`include "dmemory.v"
`include "control.v"
`include "branch.v"

module top (
    input clk,
    input reset
); 
    wire [31:0] pc, pc4, aluout, mux_pcjump, inst, rs1data, rs2data, imm, res;
    wire [31:0] mux_rs1pc, mux_imm, dmout;
    wire immreg, dmwen, rfwenable, brinst, jaljalr, useDM;
    wire pcjump, rs1pc;
    wire [1:0] wbsel;
    wire [2:0] func3;
    wire [4:0] rs1, rs2, rd;
    wire [6:0] opcode, func7;

    adder adder_ins(
        .pc(pc),
        .pc4(pc4)
    );

    mux2_1 mux2_1_pcjump(
        .a(pc4),
        .b(aluout),
        .sel(pcjump),
        .out(mux_pcjump)
    );

    pc pc_ins(
        .input_data(mux_pcjump),
        .enable(1'b1),
        .reset(reset),
        .clk(clk),
        .output_data(pc)
    );

    p_memory p_memory_ins(
        .address(pc),
        .data_out(inst)
    );

    control control_ins(
        .instr(inst),
        .immreg(immreg),
        .dmwen(dmwen),
        .rfwenable(rfwenable),
        .brinst(brinst),
        .jaljalr(jaljalr),
        .wbsel(wbsel),
        .useDM(useDM)
    );

    branch branch_ins(
        .rs1data(rs1data),
        .rs2data(rs2data),
        .func3(func3),
        .binst(brinst),
        .jal(jaljalr),
        .pcjump(pcjump),
        .rs1pc(rs1pc)
    );

    instdec instdec_ins(
        .inst(inst),
        .opcode(opcode),
        .rd(rd),
        .func3(func3),
        .rs1(rs1),
        .rs2(rs2),
        .func7(func7)
    );

    immunit immunit_ins(
        .inst(inst),
        .imm(imm)
    );

    regfile regfile_ins(
       .enable(rfwenable),
       .rdAdrs(rd),
       .rdData(res),
       .rs1Adrs(rs1),
       .rs2Adrs(rs2),
       .clk(clk),
       .rs1Data(rs1data),
       .rs2Data(rs2data) 
    );

    mux2_1 mux2_1_rs1pc(
        .a(rs1data),
        .b(pc),
        .sel(rs1pc),
        .out(mux_rs1pc)
    );

    mux2_1 mux2_1_imm(
        .a(rs2data),
        .b(imm),
        .sel(immreg),
        .out(mux_imm)
    );

    alu alu_ins(
        .op1(mux_rs1pc),
        .op2(mux_imm),
        .func3(func3),
        .func7(func7),
        .out(aluout)
    );

    dmemory dmemory_ins(
        .clk(clk),
        .func3(func3),
        .wdata(rs2data),
        .dmwen(dmwen),
        .addr(aluout),
        .dmout(dmout)
    );

    mux4_1 mux4_1_wbsel(
        .a(aluout),
        .b(dmout),
        .c(pc4),
        .d(32'b0),
        .sel(wbsel),
        .out(res)
    );

endmodule
