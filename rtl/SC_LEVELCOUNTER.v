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
module SC_LEVELCOUNTER (
	//////////// OUTPUTS //////////
	SC_LEVELCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_LEVELCOUNTER_CLOCK_50,
	SC_LEVELCOUNTER_RESET_InHigh,
	SC_LEVELCOUNTER_CUENTA
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//=======================================================
//  PORT declarations
//=======================================================
output	[3:0]	SC_LEVELCOUNTER_data_OutBUS;
input		SC_LEVELCOUNTER_CLOCK_50;
input		SC_LEVELCOUNTER_RESET_InHigh;
input		SC_LEVELCOUNTER_CUENTA;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] LEVELCOUNTER_Register;
reg [3:0] LEVELCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_LEVELCOUNTER_CUENTA == 1'b1)
		LEVELCOUNTER_Signal = LEVELCOUNTER_Register + 1'b1;
	else
		LEVELCOUNTER_Signal = LEVELCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LEVELCOUNTER_CLOCK_50, posedge SC_LEVELCOUNTER_RESET_InHigh)
begin
	if (SC_LEVELCOUNTER_RESET_InHigh == 1'b1)
		LEVELCOUNTER_Register <= 2'b00;
	else
		LEVELCOUNTER_Register <= LEVELCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LEVELCOUNTER_data_OutBUS = LEVELCOUNTER_Register;

endmodule
