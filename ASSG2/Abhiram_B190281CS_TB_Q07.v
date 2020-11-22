module not_gate(y,a);
	input a;
	output y;
	nand (y,a,a);
endmodule	

module neg_16bit(y,a);
	input [15:0]a;
	output [15:0]y;
	not_gate n_[15:0](y,a);
endmodule	

module testbench_neg_16bit();
	reg [15:0]a;
	wire [15:0]y;
	integer i;
	neg_16bit n_16(y,a);
	initial
		begin
			for(i=0;i<65536;i=i+1)
				begin
					//$monitor("a = %b, y=%b",a,y);
					a=i; #1;
				end	
		end
endmodule		

