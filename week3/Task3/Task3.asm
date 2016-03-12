	.ORIG x3000
	LD R0,Saddr	
;set 2 input value
	JSR SW7
	ST R1,N
	;JSR SW7
	;ST R1,M	
;compute the remainder	
	LD R0,N
	LD R1,M
	NOT R1,R1
	ADD R1,R1,#1
M1	ADD R2,R0,R1
	BRn M2
	BRz M3
	ST R2,Temp
	LD R0,Temp
	BRnzp M1
;0<remainder<M	
M2	ST R0,Result
	LD R6,Laddr
	STR R0,R6,#0	
	BRnzp bye
;remainder==0
M3 	ST R2,Result
	LD R6,Laddr
	STR R2,R6,#0	
bye	BRnzp bye
;
;check switch7==1 or not
;switch7==1 means set the value from SW[6:0]
;otherwise waiting for set
SW7	LDR R1,R0,#0
	LD R2,Check7
	AND R3,R1,R2
	NOT R2,R2
	ADD R2,R2,#1
	ADD R3,R3,R2
	BRnp SW7
	LD R4,Clean
	AND R1,R1,R4
	ADD R1,R1,R2
	LD R6,Laddr
	STR R1,R6,#0	
	RET
Clean	.FILL x01FF
Check7	.FILL x0800
;
;Register locations
N	.FILL #0
M	.FILL #3
Result	.FILL #0
Temp	.FILL #0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD	
	.END