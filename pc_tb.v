`timescale 1ns / 1ps
`include "pc.v"

module pc_tb;

    // Parámetros del módulo
    parameter CLK_PERIOD = 10; // Periodo del reloj en unidades de tiempo

    // Señales de entrada
    reg [31:0] input_data;
    reg enable;
    reg [31:0] reset;
    reg clk;

    // Señal de salida
    wire [31:0] output_data;

    // Instancia del módulo bajo prueba
    pc dut (
        .input_data(input_data),
        .enable(enable),
        .reset(reset),
        .clk(clk),
        .output_data(output_data)
    );

    // Generación de señales de control
    initial begin
        // Inicialización de la simulación
        $dumpfile("pc_tb.vcd");
        $dumpvars(0, pc_tb);

        input_data = 32'hABCDEFFF;
        enable = 1;
        reset = 32'h00000000;
        clk = 0;
        #10;
        enable = 0;
        input_data = 32'h12124545;
        #10;
        reset = 32'h00000001; // Desactivar el reset
        #10; // Espera un tiempo antes de cambiar la entrada
        input_data = 32'h00000000;
        enable = 1;
        #10; // Espera un tiempo antes de cambiar la entrada
        input_data = 32'h12345678;
        enable = 1;
        #10; // Espera un tiempo antes de cambiar la entrada

        // Simulación completada
        $display("Simulación completada.");
        $finish;
    end

    // Generación del reloj
    always #((CLK_PERIOD / 2)) clk = ~clk;

endmodule

