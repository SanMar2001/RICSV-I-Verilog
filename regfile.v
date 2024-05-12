module register_file (
    input enable,
    input [4:0] rdAdrs,
    input [31:0] rdData,
    input [4:0] rs1Adrs,
    input [4:0] rs2Adrs,
    input clock,
    output reg [31:0] rs1Data,
    output reg [31:0] rs2Data
);

  reg [31:0] registers [0:31];

  always @(posedge clock) begin
    if (enable && (rdAdrs != 5'b00000)) begin
      registers[rdAdrs] <= rdData;
    end
    rs1Data <= registers[rs1Adrs]; 
    rs2Data <= registers[rs2Adrs];
  end

endmodule