`include "defination.v"
`include "control.v"

module control_tb;

    // Definición de señales para el testbench
    reg [31:0] instr;                // Entrada instr
    wire [1:0] wbsel;                 // Salida wbsel
    wire Immreg, dmwenable, rfwenable, brinst, jaljalr, useDM;  // Salidas adicionales

    // Instancia del módulo bajo prueba
    control dut (
        .instr(instr),
        .Immreg(Immreg),
        .dmwenable(dmwenable),
        .rfwenable(rfwenable),
        .brinst(brinst),
        .jaljalr(jaljalr),
        .wbsel(wbsel),
        .useDM(useDM)
    );

    // Estímulo inicial

    initial begin
        $dumpfile("control.vcd");
        $dumpvars(0, control_tb);
        // Asignamos algunos valores a la instrucción para simular diferentes casos
        instr = 32'hff010113; // Activa Immreg
        #100;  // Esperamos 100 unidades de tiempo para observar los resultados

        instr = 32'h00112423; // Desactiva todas las señales
        #100;

        instr = 32'h10000517; // 
        #100;

        instr = 32'h002d863; // 
        #100;

        instr = 32'h00008067; // 
        #100;

        instr = 32'h00012503; // 


        $finish;
    end
endmodule
