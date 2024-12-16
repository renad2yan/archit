`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 04:58:54 PM
// Design Name: 
// Module Name: alu_tb
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

module alu_tb;

    // Parameters
    parameter ALU_WIDTH = 16;

    // Signals
    reg [ALU_WIDTH-1:0] operand1, operand2;
    reg [1:0] op;
    wire [ALU_WIDTH-1:0] result;

    // Instantiate ALU
    alu #(ALU_WIDTH) uut (
        .operand1(operand1),
        .operand2(operand2),
        .op(op),
        .result(result)
    );

    // Test Procedure
    initial begin
        // Test ADD
        operand1 = 16'hA; operand2 = 16'h5; op = 2'b00;
        #10;

        // Test SUB
        operand1 = 16'hA; operand2 = 16'h5; op = 2'b01;
        #10;

        // Test AND
        operand1 = 16'hF; operand2 = 16'hA; op = 2'b10;
        #10;

        // Test OR
        operand1 = 16'h5; operand2 = 16'hA; op = 2'b11;
        #10;

        // Finish simulation
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time: %0dns, OP: %b, Operand1: %h, Operand2: %h, Result: %h", 
                 $time, op, operand1, operand2, result);
    end

endmodule