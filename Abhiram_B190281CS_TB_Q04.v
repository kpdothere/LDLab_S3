module nor_gate(y,a,b);
	input a,b;
	output y;
	wire w,x,z;
	nand(w,a,a);
	nand(x,b,b);
	nand(z,w,x);
	nand(y,z,z);
endmodule

module testbench_nor_gate();
	wire y;
	reg a,b;
	nor_gate nor_gate1(y,a,b);
	initial
		begin
			a=1'b0; b=1'b0;
			#10 a=1'b0; b=1'b1;
			#10 a=1'b1; b=1'b0;
			#10 a=1'b1; b=1'b1;
		end
endmodule
