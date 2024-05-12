module pc (
    input wire [31:0] input_data,
    input wire enable,
    input wire [31:0] reset,
    input wire clk,
    output wire [31:0] output_data
);

    reg [31:0] mux_output;
    reg [31:0] reg_output;

    // Multiplexor para seleccionar entre input_data y 0 basado en reset
    always @(*) begin
        if (reset != 0) // Si el reset no es cero, seleccione 0
            mux_output = 0;
        else // De lo contrario, seleccione input_data
            mux_output = input_data;
    end

    // Registro para almacenar el valor de salida del multiplexor
    always @(posedge clk) begin
        if (enable) // Solo si enable está activo
            reg_output <= mux_output;
    end

    // Salida del registro
    assign output_data = reg_output;

endmodule

