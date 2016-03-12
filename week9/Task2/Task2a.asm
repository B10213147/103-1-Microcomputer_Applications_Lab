;;;;;;;;Store each bit from SW[7:0] into each memory word of Bit7 t0 Bit0 ;;;;;;;;
	.ORIG x3000
top	LDI R5,Saddr
	;				
	;process N1	
	LD R3,Clean
	AND R3,R5,R3
	ST R3,N1	
	;
	;Mask & Save
	AND R2,R2,#0
	ADD R2,R2,#8
	LD R1,MASK
	LEA R6,B_n
M1	AND R4,R1,R3	;take a bit from N1
	BRz M2			;if the taken bit is not 0
	AND R4,R4,#0	;set the value to 1
	ADD R4,R4,#1
M2	STR R4,R6,#0	;save 0/1 to array B_n
	ADD R1,R1,R1	;mask next bit
	ADD R6,R6,#1	;next location of array B_n
	ADD R2,R2,#-1
	BRp M1
	BR top
;
;register location
N1	.BLKW #1
Clean	.FILL x00FF
MASK	.FILL #1
Saddr	.FILL xFFFC
Laddr	.FILL xFFFD
B_n	.BLKW #9
	.FILL x04
	.END