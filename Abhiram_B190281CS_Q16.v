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

module mux_4_16(y,s0,s1,d0,d1,d2,d3);
	output [15:0]y;
	input s0,s1;
	input[15:0]d0,d1,d2,d3;
	wire[15:0]a,b;
	mux_16 mux_16_1(a,s1,d0,d1);
	mux_16 mux_16_2(b,s1,d2,d3);
	mux_16 mux_16_3(y,s0,a,b);
endmodule	

module mux_8_16(y,s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7);
	output [15:0]y;
	input s0,s1,s2;
	input[15:0] d0,d1,d2,d3,d4,d5,d6,d7;
	wire[15:0]a,b;
	mux_4_16 mux_4_16_1(a,s1,s2,d0,d1,d2,d3);
	mux_4_16 mux_4_16_2(b,s1,s2,d4,d5,d6,d7);
	mux_16 mux_16_1(y,s0,a,b);
endmodule	
