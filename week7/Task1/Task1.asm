	.ORIG x3000
top	LDI R5,Saddr
	;
	;process N
	LD R2,dvi
	NOT R2,R2
	ADD R2,R2,#1
	AND R6,R6,#0
	LD R1,NClean
	AND R1,R5,R1
S1	BRz S2			;R6 <- N/8
	ADD R6,R6,#1
	ADD R1,R1,R2
	BRp S1
S2	ST R6,N
	;				
	;process M	
	LD R1,MClean
	AND R1,R5,R1
	ST R1,M
	LD R2,dvi
	AND R3,R3,#0
	LD R1,M
M2	ADD R3,R3,R1	;R3 <- M*8
	ADD R2,R2,#-1
	BRp M2
	LD R6,NClean
	AND R3,R3,R6
	;
	;combine [MN]	
	LD R6,N
	ADD R3,R3,R6 	
	ST R3,Result
	STI R3,Laddr
	BR top
;
;register location
dvi	.FILL #8
Result	.FILL #0
N	.FILL #0
M	.FILL #0
MClean	.FILL x0007
NClean	.FILL x0038
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
	.END