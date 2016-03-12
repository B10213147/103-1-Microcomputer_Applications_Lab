;;;;;;;;Compute N**M ;;;;;;;;
	.ORIG x3000
top	LDI R5,Saddr
	;
	;process N
	LD R2,dvi
	NOT R2,R2
	ADD R2,R2,#1
	AND R6,R6,#0
	LD R1,MaskN
	AND R1,R5,R1
S1	BRz S2			;N/8=R6
	ADD R6,R6,#1
	ADD R1,R1,R2
	BRp S1
S2	ST R6,N				
	;
	;process M	
	LD R1,MaskM
	AND R1,R5,R1
	ST R1,M
	;
	;compute
	AND R3,R3,#0
	LD R0,N
	BRz Last		;N==0 Result=0
	LD R1,M
	BRz M3			;M==0 Result=1	
	AND R2,R2,#0
	ADD R2,R2,#1
M1	ADD R1,R1,#-1	
	BRn Last		;M times remaining
	AND R3,R3,#0
	LD R0,N
M2	ADD R3,R3,R2	;R3 plus R2 with N times
	ADD R0,R0,#-1
	BRp M2
	ADD R2,R3,#0	;change R2 value
	BR M1
M3	ADD R3,R3,#1	;special condition
Last	ST R3,Result
	STI R3,Laddr
	BR top
;
;register location
dvi	.FILL #16
Result	.FILL #0
N	.FILL #0
M	.FILL #0
MaskM	.FILL x000F
MaskN	.FILL x00F0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
	.END