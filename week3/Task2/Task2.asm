;Compute Sum=1+2+...+N and store the result into memory location Sum.
;Use switches SW7_0 to input the value of N ai the beginning of your program.
;Show Sum on LED9_0 at the end of your program.
	.ORIG x3000
SW7_11	JSR Input
	BRnz SW7_11		;SW7==1 go down
	NOT R6,R6
	AND R0,R0,R6 
	ST R0,N
	STI R0,Laddr	;display value of N
SW7_01	JSR Input
	BRnp SW7_01		;SW7==0 go down
	
	AND R2,R2,x0000
	AND R1,R1,x0000
	ADD R1,R1,#1
	LD R0,N
;compute sum	
L1	BRnz M2
	ADD R2,R1,R2
	ADD R1,R1,#1
	ADD R0,R0,#-1
	BR L1

M2	ST R2,Sum
	STI R2,Laddr
BYE	BR BYE
;
;register value
N	.FILL #3
Sum	.FILL #0
Saddr 	.FILL xFFFC
Laddr	.FILL xFFFD
;
;recive input value
Input	LDI R0,Saddr
	LD R6,Check7
	AND R1,R0,R6
	RET
Check7	.FILL x0080
	.END