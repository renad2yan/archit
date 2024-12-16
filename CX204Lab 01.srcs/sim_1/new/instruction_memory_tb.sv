`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 05:03:49 PM
// Design Name: 
// Module Name: instruction_memory_tb
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


module instruction_memory_tb;

   
    // Parameters
    parameter WORD_LENGTH = 8;
    parameter MEM_DEPTH = 16;

    // Signals
    reg [3:0] address;
    wire [WORD_LENGTH-1:0] instr;

    // Instantiate Instruction Memory
    instruction_memory #(WORD_LENGTH, MEM_DEPTH) uut (
        .address(address),
        .instr(instr)
    );

    // Test Procedure
    initial begin
        // Read instructions from different addresses
        address = 4'h0; #10;
        address = 4'h1; #10;
        address = 4'h2; #10;
        address = 4'h3; #10;
        address = 4'h4; #10;

        // Finish
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time: %0dns, Address: %h, Instruction: %h", $time, address, instr);
    end

endmodule
