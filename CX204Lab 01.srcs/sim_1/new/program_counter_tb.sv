`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 05:02:38 PM
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb;
// Parameters
    parameter MAX_VALUE = 15;

    // Signals
    reg clk, reset;
    wire [3:0] pc;

    // Instantiate Program Counter
    program_counter #(MAX_VALUE) uut (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Test Procedure
    initial begin
        clk = 0; reset = 1;

        // Reset PC
        #10 reset = 0;

        // Observe PC increment
        #100;

        // Finish
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time: %0dns, PC: %h", $time, pc);
    end

endmodule
