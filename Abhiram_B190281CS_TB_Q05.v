module xor_gate(y,a,b);
	input a,b;
	output y;
	wire z,x,w;
	nand(x,a,b);
	nand(w,a,x);
	nand(z,x,b);
	nand(y,w,z);
endmodule

module testbench_xor_gate();
	wire y;
	reg a,b;
	xor_gate xor_gate1(y,a,b);
	initial
		begin
			a=1'b0; b=1'b0;
			#10 a=1'b0; b=1'b1;
			#10 a=1'b1; b=1'b0;
			#10 a=1'b1; b=1'b1;
		end
endmodule
