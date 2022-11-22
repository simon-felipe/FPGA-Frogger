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
module SC_LIVECOUNTER (
	//////////// OUTPUTS //////////
	SC_LIVECOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_LIVECOUNTER_CLOCK_50,
	SC_LIVECOUNTER_RESET_InHigh,
	SC_LIVECOUNTER_CUENTA
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//=======================================================
//  PORT declarations
//=======================================================
output	[3:0]	SC_LIVECOUNTER_data_OutBUS;
input		SC_LIVECOUNTER_CLOCK_50;
input		SC_LIVECOUNTER_RESET_InHigh;
input		SC_LIVECOUNTER_CUENTA;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] LIVECOUNTER_Register;
reg [3:0] LIVECOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_LIVECOUNTER_CUENTA == 1'b1)
		LIVECOUNTER_Signal = LIVECOUNTER_Register - 1'b1;
	else
		LIVECOUNTER_Signal = LIVECOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LIVECOUNTER_CLOCK_50, posedge SC_LIVECOUNTER_RESET_InHigh)
begin
	if (SC_LIVECOUNTER_RESET_InHigh == 1'b1)
		LIVECOUNTER_Register <= 2'b11;
	else
		LIVECOUNTER_Register <= LIVECOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LIVECOUNTER_data_OutBUS = LIVECOUNTER_Register;

endmodule
