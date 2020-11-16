module not_gate_16(y,a);
	input [15:0]a;
	output [15:0]y;
	nand n[15:0](y,a,a);
endmodule

module testbench_not_gate_16();
	wire [15:0]y;
	reg [15:0]a;
	integer j;
	not_gate_16 not_gate_16_1(y,a);
	initial
		begin
			for(j=0;j<65535;j=j+1)
				#10 a=j;
		end
endmodule
