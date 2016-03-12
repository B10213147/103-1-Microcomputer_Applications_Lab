	.ORIG x3000
top	LDI R5,Saddr
	;
	;N shift right
	LD R2,dvi
	NOT R2,R2
	ADD R2,R2,#1
	
	LD R1,Clean
	AND R1,R5,R1
	ST R1,N
;S1	AND R6,R6,#0
S1_1	BRz S2			;R6 <- N/2
	ADD R6,R6,#1
	ADD R1,R1,R2
	BRzp S1_1
	ADD R6,R6,#-1
S2	ST R6,N
	STI R6,Laddr	
	ADD R1,R6,#0
	AND R6,R6,#0
	ADD R1,R1,#0
	BRp S1_1
	BR top
;
;register location
dvi	.FILL #2
Result	.FILL #0
N	.FILL #0
;M	.FILL #0
;MClean	.FILL x0007
Clean	.FILL x00FF
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
	.END