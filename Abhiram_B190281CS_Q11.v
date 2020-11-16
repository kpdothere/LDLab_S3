module or_gate(y,a,b);
	input a,b;
	output y;
	wire x,z;
	nand(x,a,a);
	nand(z,b,b);
	nand(y,x,z);
endmodule
module or_gate_8(y,x);
	input [7:0]x;
	output y;
	wire a1,a2,a3,a4,a5,a6;
	or_gate or_gate_1(a1,x[0],x[1]);
	or_gate or_gate_2(a2,x[2],x[3]);
	or_gate or_gate_3(a3,x[4],x[5]);
	or_gate or_gate_4(a4,x[6],x[7]);
	or_gate or_gate_5(a5,a1,a2);
	or_gate or_gate_6(a6,a3,a4);
	or_gate or_gate_7(y,a5,a6);
endmodule 
