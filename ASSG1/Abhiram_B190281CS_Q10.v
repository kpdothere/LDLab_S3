module xor_gate_16(y,a,b);
	input [15:0]a,b;
	output [15:0]y;
	wire [15:0]z,x,w;
	nand xor_gate_1 [15:0](x,a,b);
	nand xor_gate_2 [15:0](w,a,x);
	nand xor_gate_3 [15:0](z,x,b);
	nand xor_gate_4 [15:0](y,w,z);
endmodule
