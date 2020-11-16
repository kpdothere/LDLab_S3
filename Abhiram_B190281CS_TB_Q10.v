module xor_gate_16(y,a,b);
	input [15:0]a,b;
	output [15:0]y;
	wire [15:0]z,x,w;
	nand xor_gate_1 [15:0](x,a,b);
	nand xor_gate_2 [15:0](w,a,x);
	nand xor_gate_3 [15:0](z,x,b);
	nand xor_gate_4 [15:0](y,w,z);
endmodule

module testbench_xor_gate_16();
	wire[15:0] y;
	reg[15:0] a,b;
	integer i,j;
	xor_gate_16 xor_gate_16_1(y,a,b);
	always
		begin
			for(i=0;i<=65535;i=i+1)
				for(j=0;j<=65535;j=j+1)
					begin
						#10 a=i; b=j;
					end
		end
endmodule
