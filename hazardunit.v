module hazardunit(IDEX_MEMControl, IDEX_Rt,RS, RT,IFIDWrite,PCWrite,HazardMux);
		input IDEX_MEMControl;
		input [4:0]IDEX_Rt;
		input [4:0]RS;
		input [4:0]RT;

		output reg IFIDWrite;
		output reg PCWrite;
		output reg HazardMux;
		
		// This only stalls for load use case. And is only done when the load instruction is 1 ahead. 
		wire STALL;
		assign STALL = (IDEX_MEMControl && ((IDEX_Rt == RS) || (IDEX_Rt == RT)));
	
		always @(*)
			begin
				if(STALL)
					begin
						IFIDWrite <= 0;
						PCWrite <= 0;
						HazardMux <= 1;
					end
				else
					begin
						IFIDWrite <= 1;
						PCWrite <= 1;
						HazardMux <= 0;
					end
			end
endmodule
