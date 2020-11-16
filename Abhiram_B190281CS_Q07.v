module not_gate_16(y,a);
	input [15:0]a;
	output [15:0]y;
	nand n[15:0](y,a,a);
endmodule
