	.ORIG x3000
SW6_11	JSR Input
	BRnz SW6_11		;SW6==1 go down
	NOT R6,R6
	AND R0,R0,R6
	ADD R5,R0,#0
	STI R5,Laddr	;display input
SW6_01	JSR Input
	BRnp SW6_01		;SW6==0 go down	
;process N
	LD R2,dvi
	NOT R2,R2
	ADD R2,R2,#1
	AND R6,R6,#0
	LD R1,NClean
	AND R1,R5,R1
S1	BRz S2
	ADD R6,R6,#1
	ADD R1,R1,R2
	BRp S1
S2	ST R6,N
	ADD R6,R6,#0	;point to R6
	BRz M3 			;N==0 doesn't need to process
;process M	
	LD R1,MClean
	AND R1,R5,R1
	ST R1,M
	BRz M4			;M==0 doesn't need to process
;compute	
	AND R2,R2,#0
	ADD R2,R2,#1
	;LD R1,M
M1	ADD R1,R1,#-1	
	BRn Last		;M times remainding
	LD R0,N	
	AND R3,R3,#0
M2	ADD R3,R3,R2	;R3 plus R2 with N times
	ADD R0,R0,#-1
	BRp M2
	ADD R2,R3,#0	;change R2 value
	BR M1
;special condition	
M3	AND R3,R3,#0	;N==0 Result=0
	BR Last
M4	AND R3,R3,#0	;M==0 Result=1
	ADD R3,R3,#1
Last	ST R3,Result
	STI R3,Laddr
bye	BR bye
;register location
dvi	.FILL #8
Result	.FILL #0
N	.FILL #0
M	.FILL #0
MClean	.FILL x0007
NClean	.FILL x0038
Laddr	.FILL xFFFD
;recive the input value
Input	LDI R0,Saddr
	LD R6,Check6
	AND R1,R0,R6
	RET
Saddr	.FILL xFFFC
Check6	.FILL x0040
	.END