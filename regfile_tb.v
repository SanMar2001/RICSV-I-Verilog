`include "regfile.v"

module register_file_tb;
  parameter T = 10;

  reg enable;
  reg [4:0] rdAdrs;
  reg [31:0] rdData;
  reg [4:0] rs1Adrs;
  reg [4:0] rs2Adrs;
  reg clock;
  wire [31:0] rs1Data;
  wire [31:0] rs2Data;

  register_file dut (
    .enable(enable),
    .rdAdrs(rdAdrs),
    .rdData(rdData),
    .rs1Adrs(rs1Adrs),
    .rs2Adrs(rs2Adrs),
    .clock(clock),
    .rs1Data(rs1Data),
    .rs2Data(rs2Data)
  );

  always #((T)/2) clock = ~clock;
  
  initial begin
    
    $dumpfile("regfile_tb.vcd");
    $dumpvars;
    
    enable = 1'b0;
    rdAdrs = 5'b00000;
    rdData = 32'b0;
    rs1Adrs = 5'b00000;
    rs2Adrs = 5'b00000;
    clock = 1'b1;
	//Se guarda en x1 el valor de 20
    enable = 1'b1;
    rdAdrs = 5'd1;
    rdData = 32'd20;
    rs1Adrs = 5'd3;
    rs2Adrs = 5'd4;
    #10;
	//Se guarda en x2 el valor de 286
    enable = 1'b1;
    rdAdrs = 5'd2;
    rdData = 32'd286;
    rs1Adrs = 5'd1;
    rs2Adrs = 5'd2;
    #10;
    //Se guarda en x4 el valor de 1024
    enable = 1'b1;
    rdAdrs = 5'd4;
    rdData = 32'd1024;
    rs1Adrs = 5'd1;
    rs2Adrs = 5'd2;
    #10;
    //Se envía a x5 el valor 12 pero con el enable en 0
    enable = 1'b0;
    rdAdrs = 5'd5;
    rdData = 32'd12;
    rs1Adrs = 5'd2;
    rs2Adrs = 5'd4;
    #10;
    //Se confirma que no haya guardado nada en x5 y se activa el enable
    enable = 1'b1;
    rdAdrs = 5'd5;
    rdData = 32'd12;
    rs1Adrs = 5'd5;
    rs2Adrs = 5'd5;
    #10;
    //Se confirma que si haya guardado 12 en x5
    enable = 1'b1;
    rdAdrs = 5'd0;
    rdData = 32'd0;
    rs1Adrs = 5'd5;
    rs2Adrs = 5'd5;
    #10;

    $finish;
  end

endmodule
