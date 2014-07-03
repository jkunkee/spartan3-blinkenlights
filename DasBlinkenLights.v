`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:56:23 06/11/2014 
// Design Name: 
// Module Name:    DasBlinkenLights 
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
module DasBlinkenLights(
    input clk,
    input [3:0] btn,
    input [7:0] sw,
    output [7:0] led,
    output [3:0] anode, // asserted low
    output [7:0] cathode, // asserted low
    input rx,
    output tx
    );

	assign anode = 4'hF;
	assign cathode = 8'hFF;
	assign tx = rx;
	
	wire [7:0] grayScramble;
	
	assign led = {
		grayScramble[6],
		grayScramble[0],
		grayScramble[5],
		grayScramble[3],
		grayScramble[1],
		grayScramble[4],
		grayScramble[2],
		grayScramble[7]
	};
	
	GrayCounter gc (clk, sw[7], sw[6], btn[3], grayScramble);

endmodule
