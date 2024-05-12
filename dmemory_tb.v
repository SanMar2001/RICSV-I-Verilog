`include "dmemory.v"

module dmemory_tb;

reg clk;
reg [2:0] func3;
reg [31:0] wdata;
reg dmwen;
reg [31:0] addr;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;
wire [7:0] mux_byte0;
wire [7:0] mux_byte1;
wire [7:0] mux_byte2;
wire [7:0] mux_byte3;
wire lbyte;
wire lhalf;
wire lword;
wire [31:0] out;

dmemory dut (
    .clk(clk),
    .func3(func3),
    .wdata(wdata),
    .dmwen(dmwen),
    .addr(addr),
    .byte0(byte0),
    .byte1(byte1),
    .byte2(byte2),
    .byte3(byte3),
    .mux_byte0(mux_byte0),
    .mux_byte1(mux_byte1),
    .mux_byte2(mux_byte2),
    .mux_byte3(mux_byte3),
    .lbyte(lbyte),
    .lhalf(lhalf),
    .lword(lword),
    .out(out)
);

initial begin
    $dumpfile("dmemory_tb.vcd");
    $dumpvars(0, dmemory_tb);
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin
    func3 = 3'b010; // Byte access
    wdata = 32'h111170;
    dmwen = 1;
    addr = 32'h0;
    #5;
    dmwen = 0;
    func3 = 0;
    addr = 32'h1;
    wdata = 32'hC;
    #5
    dmwen = 1;
    #5$display("Byte: %b", out);
    
    $finish;
end

endmodule
