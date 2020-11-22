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

module testbench_halfadder();
	reg a,b;
	wire s,c;
	halfadder h(s,c,a,b);
	initial
		begin
			$monitor("a = %b, b = %b, s=%b, c = %b",a,b,s,c);
			a=0; b=0;
			#10 a=0; b=1;
			#10 a=1; b=0;
			#10 a=1; b=1;
		end
endmodule	
