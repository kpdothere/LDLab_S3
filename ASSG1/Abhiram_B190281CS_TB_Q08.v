module and_gate_16(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire x;
	nand and_gate_1[15:0](x,a,b);
	nand and_gate_2[15:0](y,x,x);
endmodule

module testbench_and_gate_16();
	wire[15:0] y;
	reg[15:0] a,b;
	integer i,j;
	and_gate_16 and_gate_16_1(y,a,b);
	always
		begin
			for(i=0;i<=65535;i=i+1)
				for(j=0;j<=65535;j=j+1)
					begin
						#10 a=i; b=j;
					end
		end
endmodule
