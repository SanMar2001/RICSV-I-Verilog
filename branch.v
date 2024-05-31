module branch(
    input [31:0] rs1data,
    input [31:0] rs2data,
    input [2:0] func3,
    input binst,
    input jal,
    output reg pcjump,
    output reg rs1pc
    
);

reg mux_res;

always @* begin
    case(func3)
        3'b000: begin // BEQ
            mux_res = (rs1data == rs2data) ? 1'b1 : 1'b0;
        end
        3'b001: begin // BNE
            mux_res = (rs1data != rs2data)? 1'b1 : 1'b0;
        end
        3'b100: begin // BLT
            mux_res = ($signed(rs1data) < $signed(rs2data)) ? 1'b1 : 1'b0;
        end
        3'b101: begin // BGE
            mux_res = ($signed(rs1data) >= $signed(rs2data)) ? 1'b1 : 1'b0;
        end
        3'b110: begin // BLTU
            mux_res = (rs1data < rs2data) ? 1'b1 : 1'b0;
        end
        3'b111: begin // BGEU
            mux_res = (rs1data >= rs2data) ? 1'b1 : 1'b0;
        end
    endcase
    if (binst)
        rs1pc = mux_res;
    else
        rs1pc = 1'b0;

    pcjump = (jal | rs1pc) ? 1'b1 : 1'b0;
    

end

endmodule
