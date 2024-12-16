`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:39:16 PM
// Design Name: 
// Module Name: program_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module program_counter #(
    parameter MAX_VALUE = 15 // Maximum PC value (default: 15 for 16 instructions)
)(
    input clk,            // Clock input
    input reset,          // Reset input
    output reg [3:0] pc   // Program Counter output (4 bits for 16 instructions)
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 0; // Reset PC to zero
        else if (pc < MAX_VALUE)
            pc <= pc + 1; // Increment PC
        else
            pc <= 0; // Wrap around when reaching MAX_VALUE
    end

endmodule