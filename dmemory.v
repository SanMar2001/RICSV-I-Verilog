module dmemory (
    input clk,
    input [2:0] func3,
    input [31:0] wdata,
    input dmwen,
    input [31:0] addr,
    output reg [31:0] dmout      // Datos de salida
);

reg [7:0] memory0 [0:(1<<24)-1];
reg [7:0] memory1 [0:(1<<24)-1];
reg [7:0] memory2 [0:(1<<24)-1];
reg [7:0] memory3 [0:(1<<24)-1];

reg [7:0] byte0;
reg [7:0] byte1;
reg [7:0] byte2;
reg [7:0] byte3;
reg [7:0] mux_byte0;
reg [7:0] mux_byte1;
reg [7:0] mux_byte2;
reg [7:0] mux_byte3;
reg lbyte;
reg lhalf;
reg lword;

always @(posedge clk) begin
    
    case(func3)
        3'b010: begin // Word access
            lword = 1'b1;
            lhalf = 1'b1;
            lbyte = 1'b1;
        end
        3'b001: begin // Halfword access
            lword = 1'b0;
            lhalf = 1'b1;
            lbyte = 1'b1;
        end
        3'b000: begin // Byte access
            lword = 1'b0;
            lhalf = 1'b0;
            lbyte = 1'b1;
        end
    endcase

    byte0 = memory0[addr[23:0]];
    byte1 = memory1[addr[23:0]];
    byte2 = memory2[addr[23:0]];
    byte3 = memory3[addr[23:0]];

    if (dmwen && lbyte)
        memory0[addr[23:0]] <= wdata[7:0];
    if (dmwen && lhalf)
        memory1[addr[23:0]] <= wdata[15:8];
    if (dmwen && lword) begin
        memory2[addr[23:0]] <= wdata[23:16];
        memory3[addr[23:0]] <= wdata[31:24];    
    end

    if (lbyte)
        mux_byte0 = byte0;
    else
        mux_byte0 = 8'b0;
    if (lhalf)
        mux_byte1 = byte1;
    else
        mux_byte1 = 8'b0;
    if (lword) begin
        mux_byte2 = byte2;
        mux_byte3 = byte3;
    end
    else begin
        mux_byte2 = 8'b0;
        mux_byte3 = 8'b0;
    end

    dmout = {mux_byte3, mux_byte2, mux_byte1, mux_byte0};

end

endmodule