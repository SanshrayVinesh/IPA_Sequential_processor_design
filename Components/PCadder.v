module PCAdder (
    input  [63:0] pc_in,   // Current Program Counter address
    output [63:0] pc_out   // Incremented address (PC + 4)
);

    assign pc_out = pc_in + 64'd4;
endmodule
