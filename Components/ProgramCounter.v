module ProgramCounter (
    input clk,
    input reset,
    input  [63:0] pc_in,  // The address coming from the Mux (either PC+4 or Branch)
    output reg [63:0] pc_out // The current address going to Instruction Memory
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset pressed, start at the beginning 
            pc_out <= 64'b0;
        end else begin
            // update to the new address calculated
            pc_out <= pc_in;
        end
    end

endmodule
