`include "top.v"
`timescale 1ns / 1ps

module testbench;

    // Parámetros de simulación
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Definición de señales
    reg clk = 0;
    reg reset = 0;

    // Instancia del módulo bajo prueba
    top dut (
        .clk(clk),
        .reset(reset)
    );

    // Generación de un reloj para la simulación
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Inicialización de señales
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, testbench);
        // Resetea el sistema
        reset = 1;
        #100; // Espera un tiempo
        reset = 0;
        // Ejecuta la simulación por un tiempo suficiente
        #1000; // Esto puede necesitar ajustarse dependiendo de la duración de la simulación
        // Finaliza la simulación
        $finish;
    end

    // Agrega código para monitorizar y verificar las señales de salida del módulo top
    // ...

endmodule

