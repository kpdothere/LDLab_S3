module mux(y,s,d0,d1);
	input d0,d1,s;
	output y;
	wire t1,t2,sbar;
	nand(sbar,s,s);
	nand(t1,d1,s);
	nand(t2,d0,sbar);
	nand(y,t1,t2);
endmodule

module mux_16(y,s,d0,d1);
	input [15:0]s;
	input [15:0]d0,d1;
	output[15:0]y;
	mux mux_1[15:0](y,s,d0,d1);
endmodule

module testbench_mux_16();
	wire[15:0]d0;
	wire[15:0]d1;
	reg s;
	reg[15:0]y;
	integer i,j;
	mux_16 mux_16_1(y,s,d0,d1);
	initial
		begin
			for(i=0;i<65535;i=i+1)
				for(j=0;j<65535;j=j+1)
					begin
						d0=i; d1=j; s=0; #10;
						d0=i; d1=j; s=1; #10;
					end
		end
endmodule					

