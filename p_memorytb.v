`timescale 1ns / 1ps
`include "p_memory.v"

module memory_tb;

    parameter ADDR_WIDTH = 32;
    reg [ADDR_WIDTH-1:0] address;
    wire [31:0] data_out;

    memory dut (
        .address(address),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("memory_tb.vcd");
        $dumpvars(0, memory_tb);

        #10;
        $display("Lectura de memoria:");

        address = 0;
        #5;
        $display("Dirección %d: Valor %h", address, data_out);
        address = 4;
        #5;
        $display("Dirección %d: Valor %h", address, data_out);
        address = 8;
        #5;
        $display("Dirección %d: Valor %h", address, data_out);
        address = 12;
        #5;
        $display("Dirección %d: Valor %h", address, data_out);
        address = 16;
        #5;
        $display("Dirección %d: Valor %h", address, data_out);    
        address = 20;
        #5;
        $display("Dirección %d: Valor %h", address, data_out);
        #10;
        $display("Simulación completada.");
        $finish;
    end

endmodule
