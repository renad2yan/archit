`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 05:00:23 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;
// Parameters
    parameter REG_WIDTH = 16;
    parameter MEM_DEPTH = 4;

    // Signals
    reg clk, reset, wen;
    reg [1:0] rs1, rs2, rd;
    reg [REG_WIDTH-1:0] write_data;
    wire [REG_WIDTH-1:0] data1, data2;

    // Instantiate Register File
    register_file #(REG_WIDTH, MEM_DEPTH) uut (
        .clk(clk),
        .reset(reset),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_data(write_data),
        .wen(wen),
        .data1(data1),
        .data2(data2)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Test Procedure
    initial begin
        clk = 0; reset = 1; wen = 0; write_data = 16'h0;

        // Reset
        #10 reset = 0;

        // Write to Register 1
        wen = 1; rd = 2'b01; write_data = 16'hAAAA;
        #10;

        // Write to Register 2
        rd = 2'b10; write_data = 16'hBBBB;
        #10;

        // Read Registers 1 and 2
        wen = 0; rs1 = 2'b01; rs2 = 2'b10;
        #10;

        // Finish
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time: %0dns, RS1: %b, RS2: %b, RD: %b, Write Data: %h, Data1: %h, Data2: %h",
                 $time, rs1, rs2, rd, write_data, data1, data2);
    end

endmodule
