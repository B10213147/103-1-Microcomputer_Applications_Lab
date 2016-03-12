;;;;;;;;Show bits on LEDs and shift left ;;;;;;;;
	.ORIG x3000
top	LDI R5,Saddr
	;				
	;process N1	
	LD R3,Clean
	AND R3,R5,R3
	ST R3,N1
	STI R3,Laddr
	AND R2,R2,#0
	ADD R2,R2,#11	;do 10+1 times
M1	ADD R3,R3,R3	;N1 left shift 
	ST R3,Result
	LD R0,DELAY
D1	ADD R0,R0,#-1
	BRp D1 
	STI R3,Laddr
	ADD R2,R2,#-1
	BRp M1
	BR top
;
;register location
DELAY	.FILL #40
Result	.FILL #0
;N	.FILL #0
N1	.FILL #0
Clean	.FILL x00FF
;NClean	.FILL x00F0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
	.END