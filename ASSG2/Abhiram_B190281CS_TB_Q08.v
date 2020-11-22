module and_gate(y,a,b);
	output y;
	input a,b;
	wire x;
	nand(x,a,b);
	nand(y,x,x);
endmodule

module or_gate(y,a,b);
	input a,b;
	output y;
	wire x,z;
	nand(x,a,a);
	nand(z,b,b);
	nand(y,x,z);
endmodule

module and_gate_16(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire x;
	nand and_gate_1[15:0](x,a,b);
	nand and_gate_2[15:0](y,x,x);
endmodule

module and_gate_16w1(y,a,b) ;

	output [15:0] y ;
	input [15:0] a ;
	input b ; 

	and_gate A[15:0](y,a,b) ;

endmodule 

module or_gate_16(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire x,z;
	nand or_gate_1 [15:0](x,a,a);
	nand or_gate_2 [15:0](z,b,b);
	nand or_gate_3 [15:0](y,x,z);
endmodule


module not_gate(y,a);
	input a;
	output y;
	nand (y,a,a);
endmodule	

module neg_16bit(y,a);
	input [15:0]a;
	output [15:0]y;
	not_gate n1[15:0](y,a);
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

module xor_gate_16w1(y,a,b) ;

	output [15:0] y ;
	input [15:0] a ;
	input b ;

	xor_gate X[15:0](y,a,b) ;

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

module mux(o,s,a,b);
	output o ;
	input a,b,s ;
	wire sbar,x,y ;

	not_gate Ns(sbar,s);
	and_gate Aa(x,a,sbar) ;
	and_gate Ab(y,b,s);
	or_gate O(o,x,y);
endmodule

module mux_16bit_2_1(o,s,a,b);

	output [15:0] o ;
	input [15:0] a,b ;
	input s;

	mux M[15:0](o,s,a,b) ;

endmodule 

module xor_gate_16(y,a,b);
	input [15:0]a,b;
	output [15:0]y;
	wire [15:0]z,x,w;
	nand xor_gate_1 [15:0](x,a,b);
	nand xor_gate_2 [15:0](w,a,x);
	nand xor_gate_3 [15:0](z,x,b);
	nand xor_gate_4 [15:0](y,w,z);
endmodule

module nor16_1bit(y,a) ;

	output y ;
	input [15:0] a ;
	wire [14:0] x ;

	or_gate O1(a[0],a[1],x[0]) ;
	or_gate O2(a[2],a[3],x[1]) ;
	or_gate O3(a[4],a[5],x[2]) ;
	or_gate O4(a[6],a[7],x[3]) ;
	or_gate O5(a[8],a[9],x[4]) ;
	or_gate O6(a[10],a[11],x[5]) ;
	or_gate O7(a[12],a[13],x[6]) ;
	or_gate O8(a[14],a[15],x[7]) ;
	or_gate O9(x[0],x[1],x[8]) ;
	or_gate O10(x[2],x[3],x[9]) ;
	or_gate O11(x[4],x[5],x[10]) ;
	or_gate O12(x[6],x[7],x[11]) ;
	or_gate O13(x[9],x[8],x[12]) ;
	or_gate O14(x[11],x[10],x[13]) ;
	or_gate O15(x[13],x[12],x[14]) ;

	not_gate N(y,x[14]) ;

endmodule 


module alu(o,ng,zr,x,y,zx,zy,nx,ny,f,no);
	input [15:0]x,y;
	input zx,zy,nx,ny,f,no;
	output [15:0]o;
	output ng,zr;
	wire zxbar,zybar,xzero,yzero,A,B,anded,added,res;

	not_gate n1(zxbar,zx);
	and_gate_16w1 a1(xzero,x,zxbar);
	xor_gate_16w1 x1(A,xzero,nx);

	not_gate n2(zybar,zy);
	and_gate_16w1 a2(yzero,y,zybar);
	xor_gate_16w1 x2(B,yzero,ny);

	and_gate_16 a3(anded,A,B);
	adder_16bit add(added,A,B);

	mux_16bit_2_1 m1(res,f,anded,added);

	xor_gate_16w1 x3(o,res,no);

	nor16_1bit no1(zr,o);
	and_gate a4(ng,o[15],o[15]);
endmodule

module testbench_alu;

	wire [15:0] o ;
	wire ng,zr ;
	reg [15:0] x,y ;
	reg zx,nx,zy,ny,f,no ;

	alu A(o,ng,zr,x,y,zx,zy,nx,ny,f,no) ;

	initial 
	begin 
		x = 16 ; y = 15 ;  
		
		zx = 1 ; nx = 0 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // 0
		
		zx = 1 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // 1
		
		zx = 1 ; nx = 1 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // -1
		
		zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 0 ; #10 ; // x
		
		zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // y
		
		zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // -x
		
		zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // -y 
		
		zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // !x 
		
		zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 1 ; #10 ; // !y 
		
		zx = 0 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // x+1
		
		zx = 1 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y+1
		
		zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 0 ; #10 ; // x-1 
		
		zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // y-1
		
		zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // x&y 
		
		zx = 0 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // x|y
		
		zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // x+y 
		
		zx = 0 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // x-y 
		
		zx = 0 ; nx = 0 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y-x 
	end

endmodule
