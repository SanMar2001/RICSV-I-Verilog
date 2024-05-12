`include "immunit.v"

module immunit_tb;

    // Parámetros del testbench
    reg [31:0] inst;
    wire [6:0] opcode;
    wire [2:0] func3;
    wire [31:0] shamt;
    wire shamflag;
    wire [31:0] immi;
    wire [31:0] imms;
    wire [31:0] immb;
    wire [31:0] immu;
    wire [31:0] immj;
    wire normal_i;
    wire special_i;
    wire [31:0] imm;
    wire types;
    wire typeb;
    wire typeu;
    wire typej;

    // Instancia del módulo immunit
    immunit uut (
        .inst(inst),
        .opcode(opcode),
        .func3(func3),
        .shamt(shamt),
        .shamflag(shamflag),
        .immi(immi),
        .imms(imms),
        .immb(immb),
        .immu(immu),
        .immj(immj),
        .normal_i(normal_i),
        .special_i(special_i),
        .imm(imm),
        .types(types),
        .typeb(typeb),
        .typeu(typeu),
        .typej(typej)
    );

    // Inicialización de la señal de entrada
    initial begin
        $dumpfile("immunit_tb.vcd");
        $dumpvars(0, immunit_tb);
        // Instrucción de prueba
        inst = 32'b00000000000000001100001000110111;
        $display("El valor es: %d", immu);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;
        
        // Instrucción de prueba
        inst = 32'b00000000000000001111001100010111;
        $display("El valor es: %d", immu);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'b11111011011111111111001111101111;
        $display("El valor es: %d", immu);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'b00100001111000000000001101101111;
        $display("El valor es: %d", immu);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'hfc530213;
        $display("El valor es: %d", immi);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'h40c65313;
        $display("El valor es: %d", immi);
        
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'h0037d413;
        $display("El valor es: %d", immi);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'h00108623;
        $display("El valor es: %d", imms);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'hfe1087a3;
        $display("El valor es: %d", imms);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'hfe2089e3;
        $display("El valor es: %d", immb);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;

        // Instrucción de prueba
        inst = 32'h08208163;
        $display("El valor es: %d", immb);
        // Espera un ciclo para que las salidas del módulo se actualicen
        #10;


        // Finaliza la simulación
        $finish;
    end

endmodule
