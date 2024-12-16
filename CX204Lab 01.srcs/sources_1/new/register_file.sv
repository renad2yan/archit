`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:56:21 PM
// Design Name: 
// Module Name: register_file
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


module register_file#(
parameter REGF_WIDTH =16,
parameter IMEM_DEPTH =4 
    )(
    input clk,
    input reset,
    input [1:0]rs1,rs2,rd, //regesters address
    input wen, //write enable 
    input [REGF_WIDTH-1:0] write_data,  // Data to write
    output reg [REGF_WIDTH-1:0] data1,  // Output data from rs1
    output reg [REGF_WIDTH-1:0] data2   // Output data from rs2
);

    // Register array
    reg [REGF_WIDTH-1:0] registers [0:IMEM_DEPTH-1];
    
// Initialize register x0 to always return 0
    initial begin
        registers[0] = 0;
        $readmemh("rom_image_hex.mem", registers); //  file initialization
    end

    // Read data from the registers
    always @(*) begin
        data1 = (rs1 == 2'b00) ? 0 : registers[rs1];
        data2 = (rs2 == 2'b00) ? 0 : registers[rs2];
    end

    // Write data to the destination register
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all registers except x0
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
        end else if (wen && rd != 2'b00) begin
            registers[rd] <= write_data;
        end
    end
endmodule

