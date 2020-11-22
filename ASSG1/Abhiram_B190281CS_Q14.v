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
