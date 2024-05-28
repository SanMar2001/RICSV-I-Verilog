`include "defination.v"
module control(
    input [31:0] instr,
    output wire Immreg,
    output wire dmwenable,
    output wire rfwenable,
    output wire brinst,
    output wire jaljalr,
    output reg [1:0]wbsel,
    output wire useDM
);

assign Immreg = (instr[6:0] == 7'b0110011) ? 1'b0 : 1'b1;
assign dmwenable = (instr[6:0] == 7'b0100011) ? 1'b1 : 1'b0;
assign brinst = (instr[6:0] == 7'b1100011) ? 1'b1 : 1'b0;
assign jaljalr = (instr[6:0] == 7'b1101111) ? 1'b1 : ((instr[6:0] == 7'b1100111) ? 1'b1 : 1'b0);
assign rfwenable = ~((instr[6:0] == 7'b0100011) | (instr[6:0] == 7'b1100011));
assign useDM = (instr[6:0] == 7'b0000011) ? 1'b1 : 1'b0;

// Multiplexor inicial
always @* begin
    if(useDM)
        wbsel = 2'b01;
    else
        wbsel = 2'b00;
    if(jaljalr)
        wbsel = 2'b10;
end

endmodule // control




