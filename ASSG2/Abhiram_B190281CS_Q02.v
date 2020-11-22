module or_gate(y,a,b);
	input a,b;
	output y;
	wire x,z;
	nand(x,a,a);
	nand(z,b,b);
	nand(y,x,z);
endmodule

module and_gate(y,a,b);
	output y;
	input a,b;
	wire x;
	nand(x,a,b);
	nand(y,x,x);
endmodule

module xor_gate(y,a,b);
	input a,b;
	output y;
	wire z,x,w;
	nand(x,a,b);
	nand(w,a,x);
	nand(z,x,b);
	nand(y,w,z);
endmodule

module fulladder(s,c_out,a,b,c);
	input a,b,c;
	output s, c_out;
	wire x,y,z;
	xor_gate x1(x,a,b);
	xor_gate x2(s,x,c);
	and_gate a1(z,x,c);
	and_gate a2(y,a,b);
	or_gate o1(c_out,y,z);
endmodule	
