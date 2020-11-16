module xnor_gate(y,a,b);
	input a,b;
	output y;
	wire x,z,w,v;
	nand(x,a,b);
	nand(z,a,a);
	nand(w,b,b);
	nand(v,z,w);
	nand(y,x,v);
endmodule 