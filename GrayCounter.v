`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:35 06/09/2014 
// Design Name: 
// Module Name:    GrayCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GrayCounter(
    input clk,
    input incdec,
    input stop,
	 input rst,
    output [7:0] gray,
	 output [7:0] normal
    );

	parameter CLK_DIV = 17_000_000;
	reg [31:0] clkDiv = 32'd0;
	
	reg [7:0] curGray = 8'b0;
	reg [7:0] curNum = 8'b0;

	assign gray = curGray;
	assign normal = curNum;
	
	always @(posedge clk)
	begin
		// increment the clock divider
		clkDiv = clkDiv + 1;
		
		// reset and run control
		if (rst == 1) begin
			clkDiv = 0;
			curNum = 8'b0;
		end else if (stop == 1)
			clkDiv = clkDiv - 1;
		else if (clkDiv == CLK_DIV)
		begin
			// first, reset the clock divider
			clkDiv = 0;
			
			// use the inc/dec input
			if (incdec == 1) 
				curNum = curNum + 1;
			else
				curNum = curNum - 1;
		end
		
		curGray = curNum ^ (curNum >> 1);
	end

endmodule
