`timescale 1ns / 1ps
`include "mux2_1.v"

module testbench_mux2_1;

    // Declaración de señales
    reg [31:0] a, b;
    reg sel;
    wire [31:0] out;

    // Instanciación del módulo
    mux2_1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    // Generación de estímulos
    initial begin
        // Asigna valores a 'a' y 'b'
        a = 32'h12345678;
        b = 32'h87654321;

        // Prueba con sel = 0
        sel = 1'b0;
        #10;
        $display("When sel = 0, out = %h", out);

        // Prueba con sel = 1
        sel = 1'b1;
        #10;
        $display("When sel = 1, out = %h", out);

        // Finaliza la simulación
        #10;
        $finish;
    end

endmodule
