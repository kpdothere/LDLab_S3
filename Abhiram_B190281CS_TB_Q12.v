module mux(y,s,d0,d1);
	input d0,d1,s;
	output y;
	wire t1,t2,sbar;
	nand(sbar,s,s);
	nand(t1,d1,s);
	nand(t2,d0,sbar);
	nand(y,t1,t2);
endmodule

module testbench_mux();
    reg s,d0,d1;
    wire y;
    mux m1(y,s,d0,d1);
    initial
        begin
            $monitor("y=%b s=%b d0=%b d1=%b",y,s,d0,d1);
            d0=0; d1=1;
            s=0; #10;
            s=1; #10;
        end
endmodule
