module memory (
    input wire [31:0] address,
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
        data_out = memory[address];
    end

endmodule