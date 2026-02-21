module BranchLogic(
    input        branch_ctrl, // From Main Control Unit
    input [2:0]  funct3,      // From Instruction[14:12]
    input        alu_zero,    // From ALU
    output reg   pc_sel       // To the PC Mux
);

    always @(*) begin
        case(funct3)
            3'b000: begin // BEQ
                pc_sel = branch_ctrl && alu_zero;
            end
            3'b001: begin // BNE
                pc_sel = branch_ctrl && !alu_zero;
            end
            default: begin // No jumping without branch statements (only implementing BEQ and BNE)
                pc_sel = 1'b0;
            end
        endcase
    end

endmodule
