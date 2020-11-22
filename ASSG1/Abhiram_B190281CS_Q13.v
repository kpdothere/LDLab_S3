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
