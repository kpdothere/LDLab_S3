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

module adder_4bit(y,a,b);
	output [3:0]y;
	input [3:0]a,b;
	wire [3:0]c;
	fulladder f1(y[0],c[0],a[0],b[0],1'b0);
	fulladder f2(y[1],c[1],a[1],b[1],c[0]);
	fulladder f3(y[2],c[2],a[2],b[2],c[1]);
	fulladder f4(y[3],c[3],a[3],b[3],c[2]);
endmodule	

module adder_16bit(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire [15:0]c;
	fulladder f1(y[0],c[0],a[0],b[0],1'b0);
	fulladder f2(y[1],c[1],a[1],b[1],c[0]);
	fulladder f3(y[2],c[2],a[2],b[2],c[1]);
	fulladder f4(y[3],c[3],a[3],b[3],c[2]);

	fulladder f5(y[4],c[4],a[4],b[4],c[3]);
	fulladder f6(y[5],c[5],a[5],b[5],c[4]);
	fulladder f7(y[6],c[6],a[6],b[6],c[5]);
	fulladder f8(y[7],c[7],a[7],b[7],c[6]);

	fulladder f9(y[8],c[8],a[8],b[8],c[7]);
	fulladder f10(y[9],c[9],a[9],b[9],c[8]);
	fulladder f11(y[10],c[10],a[10],b[10],c[9]);
	fulladder f12(y[11],c[11],a[11],b[11],c[10]);

	fulladder f13(y[12],c[12],a[12],b[12],c[11]);
	fulladder f14(y[13],c[13],a[13],b[13],c[12]);
	fulladder f15(y[14],c[14],a[14],b[14],c[13]);
	fulladder f16(y[15],c[15],a[15],b[15],c[14]);
endmodule	

