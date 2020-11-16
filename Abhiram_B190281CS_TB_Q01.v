module not_gate(y,a);
	output y;
	input a;

	//not (y,a)
	nand(y,a,a);
endmodule
module testbench_not_gate();
	wire y;
	reg a;
	not_gate not_gate1(y,a);
	initial
		begin
			$monitor("y=%b a=%b",y,a);
			a=1'b0; #10;
			a=1'b1; #10;
		end
endmodule

