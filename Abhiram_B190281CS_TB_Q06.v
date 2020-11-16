module xnor_gate(y,a,b);
	input a,b;
	output y;
	wire x,z,w,v;
	nand(x,a,b);
	nand(z,a,a);
	nand(w,b,b);
	nand(v,z,w);
	nand(y,x,v);
endmodule 

module testbench_xnor_gate();
	wire y;
	reg a,b;
	xnor_gate xnor_gate1(y,a,b);
	initial
		begin
			a=1'b0; b=1'b0;
			#10 a=1'b0; b=1'b1;
			#10 a=1'b1; b=1'b0;
			#10 a=1'b1; b=1'b1;
		end
endmodule
