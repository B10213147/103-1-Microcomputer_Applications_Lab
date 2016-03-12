;;;;;;;;Compute N*M ;;;;;;;;
;N:=SW[7:4]; M:=SW[3:0]; LED[9:0]:=N*M
	.ORIG x3000
top	LDI R5,Saddr
	;
	;process N
	LD R2,dvi
	AND R6,R6,#0
	LD R1,MaskN
	AND R1,R5,R1
S1	BRz S2			;N/16=R6
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
	;product N&M
	AND R3,R3,#0
	LD R1,M
	BRz Last
	LD R2,N
	BRz Last	
M1	ADD R3,R1,R3
	ADD R2,R2,#-1
	BRp M1
Last	ST R3,Result
	STI R3,Laddr
	BR top
;
;register location
dvi	.FILL #-16
Result	.FILL #0
N	.FILL #0
M	.FILL #0
MaskM	.FILL x000F
MaskN	.FILL x00F0
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
	.END