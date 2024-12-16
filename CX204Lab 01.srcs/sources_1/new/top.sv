`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:47:36 PM
// Design Name: 
// Module Name: top
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


module top #(
    parameter WORD_LENGTH = 8,   // Instruction word size
    parameter REGF_WIDTH = 16,   // Register file width
    parameter MEM_DEPTH = 16     // Instruction memory depth
)(
    input clk,                // Clock input
    input reset,              // Reset input
    input wen,       // Write enable for Register File
    output [WORD_LENGTH-1:0] instruction, // Fetched instruction
    output [REGF_WIDTH-1:0] alu_result    // Result of ALU
);

    // Internal Signals
    wire [3:0] pc;                    // Program Counter output
    wire [1:0] rs1, rs2, rd;          // Register addresses
    wire [1:0] op;                // Opcode for ALU
    wire [REGF_WIDTH-1:0] data1, data2; // Data from register file

    // Split the instruction into opcode, rs1, rs2, and rd
    assign op = instruction[7:6]; // Top 2 bits for opcode
    assign rs1 = instruction[5:4];    // Next 2 bits for rs1
    assign rs2 = instruction[3:2];    // Next 2 bits for rs2
    assign rd = instruction[1:0];     // Last 2 bits for rd

    // Program Counter Instance
    program_counter #(
        .MAX_VALUE(MEM_DEPTH-1)
    ) pc_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    // Instruction Memory Instance
    instruction_memory #(
        .WORD_LENGTH(WORD_LENGTH),
        .MEM_DEPTH(MEM_DEPTH)
    ) im_inst (
        .address(pc),
        .instr(instruction)
    );

    // Register File Instance
    register_file #(
        .REGF_WIDTH(REGF_WIDTH),
        .MEM_DEPTH(4) // 4 Registers: x0, x1, x2, x3
    ) rf_inst (
        .clk(clk),
        .reset(reset),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wen(wen),
        .write_data(alu_result), // Write ALU result back to rd
        .data1(data1),
        .data2(data2)
    );

    // ALU Instance
    alu #(
        .ALU_WIDTH(REGF_WIDTH)
    ) alu_inst (
        .operand1(data1),
        .operand2(data2),
        .op(op),
        .result(alu_result)
    );

endmodule