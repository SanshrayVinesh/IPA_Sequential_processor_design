module BranchAdder(
    input  [63:0] pc_in,      // Current PC
    input  [63:0] imm_in,     // The 64-bit sign-extended immediate from ImmGen
    output [63:0] branch_out  // The target address if we jump
);

    assign branch_out = pc_in + imm_in;
endmodule
