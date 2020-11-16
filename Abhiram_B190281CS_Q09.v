module or_gate_16(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire x,z;
	nand or_gate_1 [15:0](x,a,a);
	nand or_gate_2 [15:0](z,b,b);
	nand or_gate_3 [15:0](y,x,z);
endmodule
