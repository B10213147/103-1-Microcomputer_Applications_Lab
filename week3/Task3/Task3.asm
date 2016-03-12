	.ORIG x3000
	;LD R0,Saddr	
;set 2 input value
	LD R7,Saddr
	LD R6,Clean
	;LD R0,N
	LDR R0,R7,#0
	;ADD R0,R0,#15
	AND R0,R0,R6
	ST R0,N
	LD R6,Laddr
	STR R0,R6,#0	
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

Clean	.FILL x01FF
Check7	.FILL x0800
;
;Register locations
N	.FILL #0
M	.FILL #10
Result	.FILL #0
Temp	.FILL #0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD	
	.END