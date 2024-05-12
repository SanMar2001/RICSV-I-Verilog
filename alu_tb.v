`include "alu.v"
`timescale 1ns / 1ps

module alu_tb;

    // Parámetros de prueba
    reg [31:0] op1_tb;
    reg [31:0] op2_tb;
    reg [2:0] func3_tb;
    reg [6:0] func7_tb;

    // Salidas de la ALU
    wire [31:0] add_result;
    wire [31:0] sub_result;
    wire [31:0] xor_result;
    wire [31:0] or_result;
    wire [31:0] and_result;
    wire [31:0] shift_left_result;
    wire [31:0] shift_right_result;
    wire [31:0] signed_shift_right_result;
    wire [31:0] signed_compare_result;
    wire [31:0] unsigned_compare_result;
    wire func7_result;
    wire [31:0] addsub_result;
    wire [31:0] srlsra_result;
    wire [31:0] out;

    // Instancia del módulo bajo prueba
    alu dut (
        .op1(op1_tb),
        .op2(op2_tb),
        .func3(func3_tb),
        .func7(func7_tb),
        .add_result(add_result),
        .sub_result(sub_result),
        .xor_result(xor_result),
        .or_result(or_result),
        .and_result(and_result),
        .shift_left_result(shift_left_result),
        .shift_right_result(shift_right_result),
        .signed_shift_right_result(signed_shift_right_result),
        .signed_compare_result(signed_compare_result),
        .unsigned_compare_result(unsigned_compare_result),
        .func7_result(func7_result),
        .addsub_result(addsub_result),
        .srlsra_result(srlsra_result),
        .out(out)
    );

    // Inicialización de la simulación
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);
        // Asignación de valores a las entradas
        op1_tb = 32'h0000000A;
        op2_tb = 32'h00000005;
        func3_tb = 3'b0;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'h0000000A;
        op2_tb = 32'h00000005;
        func3_tb = 3'b0;
        func7_tb = 7'h20;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b001;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b010;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b011;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b100;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b101;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b110;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b111;
        func7_tb = 7'h0;

        // Esperar 10 unidades de tiempo
        #10;

        // Cambiar valores para probar otras operaciones
        op1_tb = 32'hA;
        op2_tb = 32'h5;
        func3_tb = 3'b101;
        func7_tb = 7'h20;

        // Esperar 10 unidades de tiempo
        #10;

        // Terminar la simulación
        $finish;
    end

endmodule
