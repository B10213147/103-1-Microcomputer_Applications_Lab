;Compute the remainder of dividing N by M,
;where N is a number inputted with swtiches SW7_0 
;and M is a number in memory.
	.ORIG x3000
SW7_11	JSR Input
	BRnz SW7_11		;SW7==1 go down
	NOT R6,R6
	AND R0,R0,R6 
	ST R0,N
	STI R0,Laddr	;display value of N
SW7_01	JSR Input
	BRnp SW7_01		;SW7==0 go down
;
;compute the remainder	
	LD R0,N
	LD R1,M
	NOT R1,R1
	ADD R1,R1,#1
M1	ADD R2,R0,R1
	BRn M2
	BRz M3
	ADD R0,R2,#0
	BR M1
;0<remainder<M	
M2	ST R0,Result
	STI R0,Laddr	;display value of Result	
	BR bye
;remainder==0
M3 	ST R2,Result
	STI R2,Laddr	;display value of Result
bye	BR bye
;
;Register locations
N	.FILL #0
M	.FILL #10
Result	.FILL #0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD	
;
;recive the input value
Input	LDI R0,Saddr
	LD R6,Check7
	AND R1,R0,R6
	RET
Check7	.FILL x0080
	.END