module and_gate(y,a,b);
	output y;
	input a,b;
	wire x;
	nand(x,a,b);
	nand(y,x,x);
endmodule

module testbench_and_gate();
	wire y;
	reg a,b;
	and_gate and_gate1(y,a,b);
	initial
		begin
			a=1'b0; b=1'b0;
			#10 a=1'b0; b=1'b1;
			#10 a=1'b1; b=1'b0;
			#10 a=1'b1; b=1'b1;
		end
endmodule
