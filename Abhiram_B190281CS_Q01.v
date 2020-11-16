module not_gate(y,a);
	output y;
	input a;

	//not (y,a)
	nand(y,a,a);
endmodule
