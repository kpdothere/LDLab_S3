module or_gate(y,a,b);
	input a,b;
	output y;
	wire x,z;
	nand(x,a,a);
	nand(z,b,b);
	nand(y,x,z);
endmodule

module testbench_or_gate();
	wire y;
	reg a,b;
	or_gate or_gate1(y,a,b);
	initial
		begin
			a=1'b0; b=1'b0;
			#10 a=0'b0; b=1'b1;
			#10 a=1'b1; b=1'b0;
			#10 a=1'b1; b=1'b1;
		end
endmodule
