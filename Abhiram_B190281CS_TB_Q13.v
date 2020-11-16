module not_gate(y,a);
	output y;
	input a;

	//not (y,a)
	nand(y,a,a);
endmodule

module and_gate(y,a,b);
	output y;
	input a,b;
	wire x;
	nand(x,a,b);
	nand(y,x,x);
endmodule

module demux(y0,y1,s,i);
	input s,d;
	output y0,y1;
	wire sbar;
	not_gate not_gate_1(sbar,s);
	and_gate and_gate_1(y0,i,sbar);
	and_gate and_gate_2(y1,i,s);
endmodule

module testbench_demux();
	wire y0,y1;
	reg s,i;
	demux demux_1(y0,y1,s,i);
	initial
		begin
			$monitor("y0=%b y1=%b s=%b d=%b",y0,y1,s,i);
			s=0; i=1; #10;
			s=1; i=0; #10;
		end
endmodule
	
