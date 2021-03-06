module not_gate(y,a);
	output y;
	input a;

	//not (y,a)
	nand(y,a,a);
endmodule

module and_gate(y,a,b);
	output y;
	input a,b;
	wire x;
	nand(x,a,b);
	nand(y,x,x);
endmodule

module demux(y0,y1,s,i);
	input s,i;
	output y0,y1;
	wire sbar;
	not_gate not_gate_1(sbar,s);
	and_gate and_gate_1(y0,i,sbar);
	and_gate and_gate_2(y1,i,s);
endmodule

module demux_4(y0,y1,y2,y3,s0,s1,i);
	output y0,y1,y2,y3;
	input i,s0,s1;
	wire a,b;
	demux demux_1(a,b,s0,i);
	demux demux_2(d0,d1,s1,a);
	demux demux_3(d2,d3,s1,b);
endmodule	

module demux_8(y0,y1,y2,y3,y4,y5,y6,y7,s0,s1,s2,i);
	output y0,y1,y2,y3,y4,y5,y6,y7;
	input i,s0,s1,s2;
	wire a,b;
	//demux(y0,y1,s,i)
	demux demux_4(a,b,s0,i);
	//demux_4(y0,y1,y2,y3,y4,s1,i)
	demux_4 demux_4_1(y0,y1,y2,y3,s1,s2,a);
	demux_4 demux_4_2(y4,y5,y6,y7,s1,s2,b);
endmodule
