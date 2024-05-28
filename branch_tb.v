`include "branch.v"
`timescale 1ns / 1ps

module branch_tb;


    // Definición de señales de entrada
    reg [31:0] rs1data_tb;
    reg [31:0] rs2data_tb;
    reg [2:0] func3_tb;
    reg binst_tb;
    reg jal_tb;
    wire mux_res_tb;


    // Instancia del módulo bajo prueba
    branch dut (
        .rs1data(rs1data_tb),
        .rs2data(rs2data_tb),
        .func3(func3_tb),
        .binst(binst_tb),
        .jal(jal_tb),
        .pcjump(pcjump_tb),
        .rs1pc(rs1pc_tb),
        .mux_res(mux_res_tb)
    );

    // Generación de estímulos
    initial begin
        $dumpfile("branch.vcd");
        $dumpvars(0, branch_tb);
        // Inicializamos las señales de entrada
        rs1data_tb = 32'h00000000;
        rs2data_tb = 32'h00000000;
        func3_tb = 3'b000;
        binst_tb = 1'b0;
        jal_tb = 1'b1;

        // Cambiamos los valores de las señales para simular diferentes casos
        // Puedes añadir más casos según sea necesario

        // Caso de BEQ
        #10;
        rs1data_tb = 32'h00000011;
        rs2data_tb = 32'h00000101;
        func3_tb = 3'b000;
        binst_tb = 1'b0;
        jal_tb = 1'b1;

        // Caso de BNE
        #10;
        rs1data_tb = 32'h00100001;
        rs2data_tb = 32'h00010000;
        func3_tb = 3'b001;
        binst_tb = 1'b1;
        jal_tb = 1'b0;

        // Caso de BLT
        #10;
        rs1data_tb = 32'hFFFFFFFE; // -2 en complemento a dos
        rs2data_tb = 32'h00000001;
        func3_tb = 3'b100;
        binst_tb = 1'b1;
        jal_tb = 1'b0;

        // Finalizamos la simulación
        #10;
        $finish;
    end

    

    // Añade aquí la generación de señales jal_tb si es necesario

endmodule
