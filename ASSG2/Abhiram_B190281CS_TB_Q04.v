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

module testbench_adder_4bit();
	reg [3:0]a,b;
	wire [3:0]y;
	integer i,j;
	adder_4bit a4(y,a,b);
	initial
		begin
			for(i=0;i<16;i=i+1)
				for(j=0;j<16;j=j+1)
					begin
						$monitor("a = %b, b = %b, y=%b",a,b,y);
						a=i;
						b=j; #10;
					end	
		end
endmodule			
