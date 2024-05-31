module p_memory (
    input  [31:0] address,
    output reg [31:0] data_out
);

    // Declaración de memoria ROM
    reg [31:0] memory [0:1023]; // Cambiar 1023 por el tamaño de memoria deseado

    // Cargar datos desde el archivo .hex en la inicialización
    initial begin
        $readmemh("program.hex", memory);
    end

    // Acceso a la ROM
    always @(*) begin
        data_out[31:24] = memory[address];
        data_out[23:16] = memory[address+1];
        data_out[15:8] = memory[address+2];
        data_out[7:0] = memory[address+3];
    end

endmodule