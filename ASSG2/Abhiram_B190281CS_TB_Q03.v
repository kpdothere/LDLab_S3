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

module bit_inc4(y,a);
	output [3:0]y;
	input [3:0]a;
	wire [3:0]c;
	halfadder h1(y[0],c[0],a[0],1'b1);
	halfadder h2(y[1],c[1],a[1],c[0]);
	halfadder h3(y[2],c[2],a[2],c[1]);
	halfadder h4(y[3],c[3],a[3],c[2]);
endmodule	

module testbench_4bit_inc();
	wire y;
	reg a;
	integer i;
	bit_inc4 inc(y,a);
	initial
		begin
			for(i=0;i<16;i=i+1)
			begin
				a=i; #10;
			end
		end
endmodule	
