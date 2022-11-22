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
module SC_RegBACKTYPELAST (
	//////////// OUTPUTS //////////
	SC_RegBACKTYPELAST_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegBACKTYPELAST_CLOCK_50,
	SC_RegBACKTYPELAST_RESET_InHigh,
	SC_RegBACKTYPELAST_NEXTLEVEL,
	SC_RegBACKTYPELAST_LEVELOR
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATA_FIXED_INITREGBACKG_14 = 8'b11100111;
//=======================================================
//  PORT declarations
//=======================================================
output	[7:0]SC_RegBACKTYPELAST_data_OutBUS;
input		[3:0]SC_RegBACKTYPELAST_NEXTLEVEL;
input		[7:0]SC_RegBACKTYPELAST_LEVELOR;
input 	SC_RegBACKTYPELAST_CLOCK_50;
input 	SC_RegBACKTYPELAST_RESET_InHigh;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [7:0]RegBACKTYPELAST_Signal;
reg [7:0]RegBACKTYPELAST_Register;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegBACKTYPELAST_NEXTLEVEL == 2'b01)
		RegBACKTYPELAST_Signal = SC_RegBACKTYPELAST_LEVELOR;
	else if (SC_RegBACKTYPELAST_NEXTLEVEL == 2'b10)
		RegBACKTYPELAST_Signal = DATA_FIXED_INITREGBACKG_14;
	else
		RegBACKTYPELAST_Signal = RegBACKTYPELAST_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegBACKTYPELAST_CLOCK_50, posedge SC_RegBACKTYPELAST_RESET_InHigh)
begin
	if (SC_RegBACKTYPELAST_RESET_InHigh == 1'b1)
		RegBACKTYPELAST_Register <= DATA_FIXED_INITREGBACKG_14;
	else
		RegBACKTYPELAST_Register <= RegBACKTYPELAST_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegBACKTYPELAST_data_OutBUS = RegBACKTYPELAST_Register;

endmodule
