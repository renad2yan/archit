`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:46:17 PM
// Design Name: 
// Module Name: tb_top
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

module tb_top;

    parameter WORD_LENGTH = 8;
    parameter REGF_WIDTH = 16;
    parameter MEM_DEPTH = 16;

    reg clk, reset, wen;
    wire [WORD_LENGTH-1:0] instruction;
    wire [REGF_WIDTH-1:0] alu_result;

    // Instantiate the top module
    top #(
        .WORD_LENGTH(WORD_LENGTH),
        .REGF_WIDTH(REGF_WIDTH),
        .MEM_DEPTH(MEM_DEPTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .wen(wen),
        .instruction(instruction),
        .alu_result(alu_result)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock cycle
    end

    // Test procedure
    initial begin
        reset = 1; wen = 1;
        #10 reset = 0; // Release reset

        // Wait for a few cycles
        #200 $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | PC: %0d | Instruction: %b | ALU Result: %0d",
                 $time, uut.pc_inst.pc, instruction, alu_result);
    end

endmodule