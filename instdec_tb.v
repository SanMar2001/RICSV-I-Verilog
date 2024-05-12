`include "instdec.v"
`timescale 1ns / 1ps

module instdec_tb;

    parameter WIDTH = 32;

    reg [WIDTH-1:0] inst;
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] func3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] func7;

    // Instancia del módulo bajo prueba
    instdec dut (
        .inst(inst),
        .opcode(opcode),
        .rd(rd),
        .func3(func3),
        .rs1(rs1),
        .rs2(rs2),
        .func7(func7)
    );

    // Inicialización de la simulación
    initial begin
        $dumpfile("instdec_tb.vcd");
        $dumpvars(0, instdec_tb);

        inst = 32'h41635293;
        #10;
        
        inst = 32'h4190d393;
        #10;
        
        inst = 32'h41f15293;
        #10;

        inst = 32'h4034d413;
        #10;

        $finish;
    end

endmodule
