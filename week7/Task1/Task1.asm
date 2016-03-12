;;;;;;;;Reading N,M from switches ;;;;;;;;
;M:= SW[3:0]
;N:= SW[7:4]
	.ORIG x3000
top	LDI R5,Saddr
	;
	;process N
	LD R2,dvi
	AND R6,R6,#0
	LD R1,NClean
	AND R1,R5,R1
S1	BRz S2		;input right shift 4 bits
	ADD R6,R6,#1	;R6 <- N/16
	ADD R1,R1,R2
	BRp S1
S2	ST R6,N
	;				
	;process M	
	LD R1,MClean
	AND R1,R5,R1
	ST R1,M
	AND R2,R2,#0
	ADD R2,R2,#4
M2	ADD R1,R1,R1	;M left shift 4 bits
	ADD R2,R2,#-1
	BRp M2
	;
	;combine [MN]	
	LD R6,N
	ADD R3,R1,R6 	
	ST R3,Result
	STI R3,Laddr
	BR top
;
;register location
dvi	.FILL #-16
Result	.FILL #0
N	.FILL #0
M	.FILL #0
MClean	.FILL x000F
NClean	.FILL x00F0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
	.END