`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:36:29 PM
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory #(
    parameter WORD_LENGTH = 8,
    parameter MEM_DEPTH = 16   // Number of instructions (parameterized)
)(
    input [3:0] address,              // Address input (4 bits for 16 words)
    output [WORD_LENGTH-1:0] instr    // Instruction output (8 bits)
);

    // Define memory array
    reg [WORD_LENGTH-1:0] memory [0:MEM_DEPTH-1];

    // Load memory content from file
    initial begin
        $readmemb("instruction_mem.bin", memory); // Load binary file
        // Alternative: $readmemh("instruction_mem.hex", memory); for hex file
    end

    // Read instruction based on address
    assign instr = memory[address];

endmodule