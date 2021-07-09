module project01(r[1:0], a[4:0], b[4:0]);
	input [4:0] a; 
	input [4:0] b; 
	output [1:0] r;
	wire [9:0] T; 
	wire [3:0] X; 
	wire [7:0] AT; 
	wire [4:0] M;
	wire [4:0] N;
	wire [3:0] F;
	wire [3:0] FINAL;
	
	and AND0(T[0], !a[4], b[4]); 
	and AND1(T[1], a[4], !b[4]);
	and AND2(T[2], !a[3], b[3]);
	and AND3(T[3], a[3], !b[3]);
	and AND4(T[4], !a[2], b[2]);
	and AND5(T[5], a[2], !b[2]);
	and AND6(T[6], !a[1], b[1]);
	and AND7(T[7], a[1], !b[1]);
	and AND8(T[8], !a[0], b[0]);
	and AND9(T[9], a[0], !b[0]);
	
	nor NOR0(X[3], T[0], T[1]);
	nor NOR1(X[2], T[2], T[3]);
	nor NOR2(X[1], T[4], T[5]);
	nor NOR3(X[0], T[6], T[7]);
	
	and AND_0(AT[0], X[3], T[2]);
	and AND_1(AT[1], X[3], T[3]);
	and AND_2(AT[2], X[3], X[2], T[4]);
	and AND_3(AT[3], X[3], X[2], T[5]);
	and AND_4(AT[4], X[3], X[2], X[1], T[6]);
	and AND_5(AT[5], X[3], X[2], X[1], T[7]);
	and AND_6(AT[6], X[3], X[2], X[1], X[0], T[8]);
	and AND_7(AT[7], X[3], X[2], X[1], X[0], T[9]);
	
	xnor XNOR_4(N[4], a[4], b[4]);
	xnor XNOR_3(N[3], a[3], b[3]);
	xnor XNOR_2(N[2], a[2], b[2]);
	xnor XNOR_1(N[1], a[1], b[1]);
	xnor XNOR_0(N[0], a[0], b[0]);
	
	nor NOR_4(M[4], a[4], b[4]);
	nor NOR_3(M[3], a[3], b[3]);
	nor NOR_2(M[2], a[2], b[2]);
	nor NOR_1(M[1], a[1], b[1]);
	nor NOR_0(M[0], a[0], b[0]);
	
	or RESULT_OR_3(F[3], T[0], AT[0], AT[2], AT[4], AT[6]); // F3 = A<B
	or RESULT_OR_2(F[2], T[1], AT[1], AT[3], AT[5], AT[7]); // F2 = A>B
	and RESULT_AND_1(F[1], M[4], M[3], M[2], M[1], M[0]); // F1 = A=B=0
	and RESULT_AND_0(F[0], !F[1], N[4], N[3], N[2], N[1], N[0]); // F0 = A=B!=0
	
	and OUTPUT_END_0(FINAL[0], F[0], !F[1], !F[2], !F[3]);
	and OUTPUT_END_1(FINAL[1], !F[0], !F[1], !F[2], F[3]);
	and OUTPUT_END_2(FINAL[2], !F[0], !F[1], F[2], !F[3]);
	
	or OUTPUT_OR_1(r[1], F[0], F[3]);
	and OUTPUT_OR_0(r[0], !F[1], !F[3]);
	
endmodule