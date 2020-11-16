module nor_gate(y,a,b);
	input a,b;
	output y;
	wire w,x,z;
	nand(w,a,a);
	nand(x,b,b);
	nand(z,w,x);
	nand(y,z,z);
endmodule
