`timescale 1ns / 1ps

module ImmGen(
    input  [31:0] instruction,
    output reg [63:0] imm_64
);

wire [6:0] opcode = instruction[6:0];

    always @(*) begin
        case (opcode)
            // I-type: addi, andi, ori, ld
            // Extracts [31:20]
            7'b0010011, 7'b0000011: begin
                imm_64 = {{52{instruction[31]}}, instruction[31:20]};
            end

            // S-type: sd (Store Doubleword)
            // Combines [31:25] (upper) and [11:7] (lower)
            7'b0100011: begin
                imm_64 = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end

            // B-type: beq (Branch if Equal)
            // Reassembles scrambled bits and adds a '0' (last bit always 0)
            7'b1100011: begin
                imm_64 = {{51{instruction[31]}}, instruction[31], instruction[7], 
                          instruction[30:25], instruction[11:8], 1'b0};
            end

            // Default case (for R-type instructions like add, sub, or, and)
            // R does operations exclusively on registers
            default: begin
                imm_64 = 64'b0;
            end
        endcase
    end
endmodule
