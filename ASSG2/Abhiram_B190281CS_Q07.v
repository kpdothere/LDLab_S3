module not_gate(y,a);
	input a;
	output y;
	nand (y,a,a);
endmodule	

module neg_16bit(y,a);
	input [15:0]a;
	output [15:0]y;
	not_gate n_[15:0](y,a);
endmodule	
