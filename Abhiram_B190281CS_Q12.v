module mux(y,s,d0,d1);
	input d0,d1,s;
	output y;
	wire t1,t2,sbar;
	nand(sbar,s,s);
	nand(t1,d1,s);
	nand(t2,d0,sbar);
	nand(y,t1,t2);
endmodule
