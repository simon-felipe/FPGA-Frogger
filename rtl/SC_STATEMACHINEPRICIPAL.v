///*######################################################################
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
module SC_STATEMACHINEPRINCIPAL (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEPRINCIPAL_NEXTLEVEL,
	SC_STATEMACHINEPRINCIPAL_RESETLEVEL,
	SC_STATEMACHINEPRINCIPAL_LIVEOUT,
	SC_STATEMACHINEPRINCIPAL_LEVELOUT,
	SC_STATEMACHINEPRINCIPAL_LEVELOR,
	//////////// INPUTS //////////
	SC_STATEMACHINEPRINCIPAL_CLOCK_50,
	SC_STATEMACHINEPRINCIPAL_RESET_InHigh,
	SC_STATEMACHINEPRINCIPAL_HOUSES,
	SC_STATEMACHINEPRINCIPAL_CEXIT,
	SC_STATEMACHINEPRINCIPAL_LIVECOUNT,
	SC_STATEMACHINEPRINCIPAL_POINT14,
	SC_STATEMACHINEPRINCIPAL_LEVELCOUNT
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_Vidas										= 3;
localparam STATE_OR											= 4;
localparam STATE_Next										= 5;
localparam STATE_Lose										= 6;
localparam STATE_Win											= 7;
//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEPRINCIPAL_LEVELOUT;
output reg		[3:0]SC_STATEMACHINEPRINCIPAL_NEXTLEVEL;
output reg		[2:0]SC_STATEMACHINEPRINCIPAL_RESETLEVEL;
output reg 		SC_STATEMACHINEPRINCIPAL_LIVEOUT;
output reg		[7:0]SC_STATEMACHINEPRINCIPAL_LEVELOR;
input			SC_STATEMACHINEPRINCIPAL_CLOCK_50;
input 		SC_STATEMACHINEPRINCIPAL_RESET_InHigh;
input			[7:0]SC_STATEMACHINEPRINCIPAL_HOUSES;
input			SC_STATEMACHINEPRINCIPAL_CEXIT;
input			[3:0]SC_STATEMACHINEPRINCIPAL_LIVECOUNT;
input			[7:0]SC_STATEMACHINEPRINCIPAL_POINT14;
input			[3:0]SC_STATEMACHINEPRINCIPAL_LEVELCOUNT;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if ((SC_STATEMACHINEPRINCIPAL_CEXIT == 1'b1) & (SC_STATEMACHINEPRINCIPAL_LIVECOUNT != 2'b00)) STATE_Signal = STATE_Vidas;
							else if ((SC_STATEMACHINEPRINCIPAL_CEXIT == 1'b1) & (SC_STATEMACHINEPRINCIPAL_LIVECOUNT == 2'b00)) STATE_Signal = STATE_Lose;
							else if (SC_STATEMACHINEPRINCIPAL_POINT14 != 8'b00000000) STATE_Signal = STATE_OR;
							else if ((SC_STATEMACHINEPRINCIPAL_HOUSES == 8'b11111111) & (SC_STATEMACHINEPRINCIPAL_LEVELCOUNT != 2'b11)) STATE_Signal = STATE_Next;
							else if ((SC_STATEMACHINEPRINCIPAL_HOUSES == 8'b11111111) & (SC_STATEMACHINEPRINCIPAL_LEVELCOUNT == 2'b11)) STATE_Signal = STATE_Win;
							else STATE_Signal = STATE_CHECK_0;
		STATE_Vidas: STATE_Signal = STATE_CHECK_0;
		STATE_OR: STATE_Signal = STATE_CHECK_0;
		STATE_Next: STATE_Signal = STATE_CHECK_0;
		STATE_Lose: STATE_Signal = STATE_Lose;
		STATE_Win: STATE_Signal = STATE_Win;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEPRINCIPAL_CLOCK_50 , posedge SC_STATEMACHINEPRINCIPAL_RESET_InHigh)
begin
	if (SC_STATEMACHINEPRINCIPAL_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end

	STATE_Vidas :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b01;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b1; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
		
	STATE_OR :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b01;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = (SC_STATEMACHINEPRINCIPAL_HOUSES | SC_STATEMACHINEPRINCIPAL_POINT14);
		end
		
	STATE_Next :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b10;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b1;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
		
	STATE_Lose :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b10;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
		
	STATE_Win :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b11;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEPRINCIPAL_NEXTLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_RESETLEVEL = 2'b00;
			SC_STATEMACHINEPRINCIPAL_LIVEOUT = 1'b0; 
			SC_STATEMACHINEPRINCIPAL_LEVELOUT = 1'b0;
			SC_STATEMACHINEPRINCIPAL_LEVELOR = SC_STATEMACHINEPRINCIPAL_HOUSES;
		end
	endcase
end
endmodule
