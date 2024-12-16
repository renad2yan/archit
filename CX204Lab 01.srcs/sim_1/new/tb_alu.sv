`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:45:10 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;

    // Testbench parameters
    parameter N = 16;

    // Testbench signals
    reg [N-1:0] operand1, operand2;
    reg [1:0] op;
    wire [N-1:0] result;

    // Instantiate the ALU
    alu #(N) uut (
        .operand1(operand1),
        .operand2(operand2),
        .op(op),
        .result(result)
    );

    // Test stimulus
    initial begin
        // Initialize operands
        operand1 = 8'b00001101; // 13
        operand2 = 8'b00000011; // 3
        
        // Test ADD
        op = 2'b00;
        #10;
        $display("ADD: %d + %d = %d", operand1, operand2, result);

        // Test SUB
        op = 2'b01;
        #10;
        $display("SUB: %d - %d = %d", operand1, operand2, result);

        // Test AND
        op = 2'b10;
        #10;
        $display("AND: %b & %b = %b", operand1, operand2, result);

        // Test OR
        op = 2'b11;
        #10;
        $display("OR: %b | %b = %b", operand1, operand2, result);

        // Finish simulation
        $stop;
    end

endmodule
