/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module CC_LEVELCOMPARATOR (
//////////// OUTPUTS //////////
	CC_SCREEN_0,
	CC_SCREEN_1,
	CC_SCREEN_2,
	CC_SCREEN_3,
	CC_SCREEN_4,
	CC_SCREEN_5,
	CC_SCREEN_6,
	CC_SCREEN_7,
	CC_SCREEN_8,
	CC_SCREEN_9,
	CC_SCREEN_10,
	CC_SCREEN_11,
	CC_SCREEN_12,
	CC_SCREEN_13,
//////////// INPUTS //////////
	CC_LEVELCOMPARATOR_LEVELCOUNTER
);
//=======================================================
//  PORT declarations
//=======================================================
output reg [7:0]CC_SCREEN_0;
output reg [7:0]CC_SCREEN_1;
output reg [7:0]CC_SCREEN_2;
output reg [7:0]CC_SCREEN_3;
output reg [7:0]CC_SCREEN_4;
output reg [7:0]CC_SCREEN_5;
output reg [7:0]CC_SCREEN_6;
output reg [7:0]CC_SCREEN_7;
output reg [7:0]CC_SCREEN_8;
output reg [7:0]CC_SCREEN_9;
output reg [7:0]CC_SCREEN_10;
output reg [7:0]CC_SCREEN_11;
output reg [7:0]CC_SCREEN_12;
output reg [7:0]CC_SCREEN_13;

input		[3:0]CC_LEVELCOMPARATOR_LEVELCOUNTER;
//=======================================================
//  Parameters
//=======================================================
 parameter INITREGBACKG_13 = 8'b00000000;
 parameter INITREGBACKG_12 = 8'b00111000;
 parameter INITREGBACKG_11 = 8'b00000000;
 parameter INITREGBACKG_10 = 8'b11001100;
 parameter INITREGBACKG_9 = 8'b00000000;
 parameter INITREGBACKG_8 = 8'b01110000;
 parameter INITREGBACKG_7 = 8'b00000000;
 parameter INITREGBACKG_6 = 8'b00001110;
 parameter INITREGBACKG_5 = 8'b00000000;
 parameter INITREGBACKG_4 = 8'b00111000;
 parameter INITREGBACKG_3 = 8'b00000000;
 parameter INITREGBACKG_2 = 8'b11100000;
 parameter INITREGBACKG_1 = 8'b00000000;
 parameter INITREGBACKG_0 = 8'b00000000;
 
 parameter INITREGBACKG_13_1 = 8'b00000000;
 parameter INITREGBACKG_12_1 = 8'b00011110;
 parameter INITREGBACKG_11_1 = 8'b00000000;
 parameter INITREGBACKG_10_1 = 8'b11100111;
 parameter INITREGBACKG_9_1 = 8'b11100111;
 parameter INITREGBACKG_8_1 = 8'b00000000;
 parameter INITREGBACKG_7_1 = 8'b00000000;
 parameter INITREGBACKG_6_1 = 8'b00111000;
 parameter INITREGBACKG_5_1 = 8'b00000000;
 parameter INITREGBACKG_4_1 = 8'b11101110;
 parameter INITREGBACKG_3_1 = 8'b00000000;
 parameter INITREGBACKG_2_1 = 8'b11110000;
 parameter INITREGBACKG_1_1 = 8'b00000000;
 parameter INITREGBACKG_0_1 = 8'b00000000;
 
 parameter INITREGBACKG_13_2 = 8'b00000000;
 parameter INITREGBACKG_12_2 = 8'b11100000;
 parameter INITREGBACKG_11_2 = 8'b00000000;
 parameter INITREGBACKG_10_2 = 8'b11000110;
 parameter INITREGBACKG_9_2 = 8'b11100000;
 parameter INITREGBACKG_8_2 = 8'b00011100;
 parameter INITREGBACKG_7_2 = 8'b00000000;
 parameter INITREGBACKG_6_2 = 8'b00111000;
 parameter INITREGBACKG_5_2 = 8'b00000000;
 parameter INITREGBACKG_4_2 = 8'b11011111;
 parameter INITREGBACKG_3_2 = 8'b11000111;
 parameter INITREGBACKG_2_2 = 8'b11100111;
 parameter INITREGBACKG_1_2 = 8'b00000000;
 parameter INITREGBACKG_0_2 = 8'b00000000;
 
 parameter INITREGBACKG_13_3 = 8'b00000000;
 parameter INITREGBACKG_12_3 = 8'b01110000;
 parameter INITREGBACKG_11_3 = 8'b00000000;
 parameter INITREGBACKG_10_3 = 8'b10101010;
 parameter INITREGBACKG_9_3 = 8'b01110000;
 parameter INITREGBACKG_8_3 = 8'b00001110;
 parameter INITREGBACKG_7_3 = 8'b00000000;
 parameter INITREGBACKG_6_3 = 8'b00111100;
 parameter INITREGBACKG_5_3 = 8'b00000000;
 parameter INITREGBACKG_4_3 = 8'b11100111;
 parameter INITREGBACKG_3_3 = 8'b11100111;
 parameter INITREGBACKG_2_3 = 8'b11100111;
 parameter INITREGBACKG_1_3 = 8'b00000000;
 parameter INITREGBACKG_0_3 = 8'b00000000;
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	if (CC_LEVELCOMPARATOR_LEVELCOUNTER == 2'b00)
		begin
			CC_SCREEN_0 = INITREGBACKG_0;
			CC_SCREEN_1 = INITREGBACKG_1;
			CC_SCREEN_2 = INITREGBACKG_2;
			CC_SCREEN_3 = INITREGBACKG_3;
			CC_SCREEN_4 = INITREGBACKG_4;
			CC_SCREEN_5 = INITREGBACKG_5;
			CC_SCREEN_6 = INITREGBACKG_6;
			CC_SCREEN_7 = INITREGBACKG_7;
			CC_SCREEN_8 = INITREGBACKG_8;
			CC_SCREEN_9 = INITREGBACKG_9;
			CC_SCREEN_10 = INITREGBACKG_10;
			CC_SCREEN_11 = INITREGBACKG_11;
			CC_SCREEN_12 = INITREGBACKG_12;
			CC_SCREEN_13 = INITREGBACKG_13;
		end
	else if (CC_LEVELCOMPARATOR_LEVELCOUNTER == 2'b01)
		begin
			CC_SCREEN_0 = INITREGBACKG_0_1;
			CC_SCREEN_1 = INITREGBACKG_1_1;
			CC_SCREEN_2 = INITREGBACKG_2_1;
			CC_SCREEN_3 = INITREGBACKG_3_1;
			CC_SCREEN_4 = INITREGBACKG_4_1;
			CC_SCREEN_5 = INITREGBACKG_5_1;
			CC_SCREEN_6 = INITREGBACKG_6_1;
			CC_SCREEN_7 = INITREGBACKG_7_1;
			CC_SCREEN_8 = INITREGBACKG_8_1;
			CC_SCREEN_9 = INITREGBACKG_9_1;
			CC_SCREEN_10 = INITREGBACKG_10_1;
			CC_SCREEN_11 = INITREGBACKG_11_1;
			CC_SCREEN_12 = INITREGBACKG_12_1;
			CC_SCREEN_13 = INITREGBACKG_13_1;
		end
	else if (CC_LEVELCOMPARATOR_LEVELCOUNTER == 2'b10)
		begin
			CC_SCREEN_0 = INITREGBACKG_0_2;
			CC_SCREEN_1 = INITREGBACKG_1_2;
			CC_SCREEN_2 = INITREGBACKG_2_2;
			CC_SCREEN_3 = INITREGBACKG_3_2;
			CC_SCREEN_4 = INITREGBACKG_4_2;
			CC_SCREEN_5 = INITREGBACKG_5_2;
			CC_SCREEN_6 = INITREGBACKG_6_2;
			CC_SCREEN_7 = INITREGBACKG_7_2;
			CC_SCREEN_8 = INITREGBACKG_8_2;
			CC_SCREEN_9 = INITREGBACKG_9_2;
			CC_SCREEN_10 = INITREGBACKG_10_2;
			CC_SCREEN_11 = INITREGBACKG_11_2;
			CC_SCREEN_12 = INITREGBACKG_12_2;
			CC_SCREEN_13 = INITREGBACKG_13_2;
		end
	else if (CC_LEVELCOMPARATOR_LEVELCOUNTER == 2'b11)
		begin
			CC_SCREEN_0 = INITREGBACKG_0_3;
			CC_SCREEN_1 = INITREGBACKG_1_3;
			CC_SCREEN_2 = INITREGBACKG_2_3;
			CC_SCREEN_3 = INITREGBACKG_3_3;
			CC_SCREEN_4 = INITREGBACKG_4_3;
			CC_SCREEN_5 = INITREGBACKG_5_3;
			CC_SCREEN_6 = INITREGBACKG_6_3;
			CC_SCREEN_7 = INITREGBACKG_7_3;
			CC_SCREEN_8 = INITREGBACKG_8_3;
			CC_SCREEN_9 = INITREGBACKG_9_3;
			CC_SCREEN_10 = INITREGBACKG_10_3;
			CC_SCREEN_11 = INITREGBACKG_11_3;
			CC_SCREEN_12 = INITREGBACKG_12_3;
			CC_SCREEN_13 = INITREGBACKG_13_3;
		end
end

endmodule

