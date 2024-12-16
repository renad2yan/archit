`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:25:23 PM
// Design Name: 
// Module Name: alu
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


module alu#(parameter ALU_WIDTH= 16)(
input [ALU_WIDTH-1:0]operand1,operand2,
input [1:0]op,
output reg [ALU_WIDTH-1:0]result
    );
    always @(*) begin
    case (op) 
    2'b00: result=operand1 +operand2;
    2'b01: result=operand1-operand2;
    2'b10: result=operand1&operand2;
    2'b11: result=operand1|operand2;
    default: result=0; 
    endcase
    end 
endmodule
