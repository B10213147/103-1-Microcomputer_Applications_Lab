	.ORIG x3000
	;LD R0,Laddr
	;AND R0,R0,#0
	;STR R0,
	LD R0,Saddr
;set input value
SW6	LDR R1,R0,#0
	LD R2,Check6
	AND R3,R1,R2
	NOT R2,R2
	ADD R2,R2,#1
	ADD R3,R3,R2
	BRnp SW6
	LD R4,Clean
	AND R1,R1,R4
	ADD R1,R1,R2
	
	ST R1,N
	AND R2,R2,x0000
	AND R1,R1,x0000
	ADD R1,R1,#1
	LD R0,N 
;compute the sum	
L1	BRnz M2
	ADD R2,R1,R2
	ADD R1,R1,#1
	ADD R0,R0,#-1
	BRnzp L1

M2	ST R2,Sum
	LD R6,Laddr
	STR R2,R6,#0
BYE	BRnzp BYE
;
;register location
Clean	.FILL x007F
Check6	.FILL x0040
N	.FILL #3
Sum	.FILL #0
Saddr 	.FILL xFFFC
Laddr	.FILL xFFFD
	.END