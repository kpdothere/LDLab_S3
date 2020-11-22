module xor_gate(y,a,b);
	input a,b;
	output y;
	wire z,x,w;
	nand(x,a,b);
	nand(w,a,x);
	nand(z,x,b);
	nand(y,w,z);
endmodule

module and_gate(y,a,b);
	output y;
	input a,b;
	wire x;
	nand(x,a,b);
	nand(y,x,x);
endmodule

module halfadder(s,c,a,b);
	output s,c;
	input a,b;
	xor_gate x(s,a,b);
	and_gate y(c,a,b);
endmodule	

module inc_16bit(y,a);
	output [15:0]y;
	input [15:0]a;
	wire [15:0]c;
	halfadder h1(y[0],c[0],a[0],1'b1);
	halfadder h2(y[1],c[1],a[1],c[0]);
	halfadder h3(y[2],c[2],a[2],c[1]);
	halfadder h4(y[3],c[3],a[3],c[2]);

	halfadder h5(y[4],c[4],a[4],c[3]);
	halfadder h6(y[5],c[5],a[5],c[4]);
	halfadder h7(y[6],c[6],a[6],c[5]);
	halfadder h8(y[7],c[7],a[7],c[6]);

	halfadder h9(y[8],c[8],a[8],c[7]);
	halfadder h10(y[9],c[9],a[9],c[8]);
	halfadder h11(y[10],c[10],a[10],c[9]);
	halfadder h12(y[11],c[11],a[11],c[10]);

	halfadder h13(y[12],c[12],a[12],c[11]);
	halfadder h14(y[13],c[13],a[13],c[12]);
	halfadder h15(y[14],c[14],a[14],c[13]);
	halfadder h16(y[15],c[15],a[15],c[14]);
endmodule	