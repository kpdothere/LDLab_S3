module and_gate_16(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire x;
	nand and_gate_1[15:0](x,a,b);
	nand and_gate_2[15:0](y,x,x);
endmodule
