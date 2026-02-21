module DataMemory (
    input          clk,
    input [63:0]   addr,          // From ALU Result
    input [63:0]   write_data,    // From Register rs2
    input          mem_write,     // Control signal: "Is it a store?"
    input          mem_read,      // Control signal: "Is it a load?"
    output [63:0]  read_data      // To Register File (Write-back mux)
);

    // 1024 entries of 64-bit data (8KB total)
    reg [63:0] mem [0:1023];

    // Synchronous Write: Data saved on the clock edge
    always @(posedge clk) begin
        if (mem_write) begin
            // Moving by 3 ie dividing by 8 ie aligning with bytes
            mem[addr[12:3]] <= write_data;
        end
    end

    // Asynchronous Read: Data is available as soon as addr/mem_read change
    assign read_data = (mem_read) ? mem[addr[12:3]] : 64'b0;

endmodule
