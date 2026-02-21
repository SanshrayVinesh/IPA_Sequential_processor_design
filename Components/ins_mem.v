module InstructionMemory (
    input  [63:0] address,     // From Program Counter
    output [31:0] instruction  // To ImmGen and Control Unit
);
    // 1024-entry memory
    // Each entry is 32 bits
    reg [31:0] mem [0:1023];

    initial begin
        $readmemh("program.txt", mem);
    end

    assign instruction = mem[address[11:2]];

endmodule
