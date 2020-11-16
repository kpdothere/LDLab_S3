module or_gate_16(y,a,b);
	output [15:0]y;
	input [15:0]a,b;
	wire x,z;
	nand or_gate_1 [15:0](x,a,a);
	nand or_gate_2 [15:0](z,b,b);
	nand or_gate_3 [15:0](y,x,z);
endmodule

module testbench_or_gate_16();
	wire[15:0] y;
	reg[15:0] a,b;
	integer i,j;
	or_gate_16 or_gate_16_1(y,a,b);
	always
		begin
			for(i=0;i<=65535;i=i+1)
				for(j=0;j<=65535;j=j+1)
					begin
						#10 a=i; b=j;
					end
		end
endmodule 