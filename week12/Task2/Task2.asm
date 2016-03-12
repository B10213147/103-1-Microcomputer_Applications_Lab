;;;;;;;;Show the last four digits of your student number on Hex32 and Hex10 ;;;;;;;;
;;;;;;;;version 2;;;;;;;;
	.ORIG x3000
	LD R0,disable
	STI R0,Hex32
	STI R0,Hex10
	LD R3,NUM	
	;
	;Mask & Save
	AND R1,R1,#0
	ADD R1,R1,xF
	AND R2,R2,#0
	ADD R2,R2,#3
	AND R5,R5,#0
	ADD R5,R5,#-1
	LEA R6,B_n
M0_1	AND R7,R7,#0
	AND R4,R1,R3	;take a bit from NUM
	BRz M0_2	;if the taken bit is not 0
S0	ADD R7,R7,#1
	ADD R4,R4,R5
	BRnp S0
M0_2	STR R7,R6,#0	;save to array B_n
	AND R0,R0,#0
	ADD R0,R0,#4
S1	ADD R1,R1,R1	;mask next bit
	ADD R0,R0,#-1
	BRp S1
	AND R0,R0,#0
	ADD R0,R0,#4
S2	ADD R5,R5,R5
	ADD R0,R0,#-1
	BRp S2
	ADD R6,R6,#1	;next location of array B_n
	ADD R2,R2,#-1
	BRzp M0_1
TOP	LEA R7,B_n
	;
	;display program
	LEA R6,FF_Tbl
	LDR R1,R7,#0	;load digtit0
	ADD R1,R6,R1
	LDR R1,R1,#0	;convert digtit0 value to display
	LDR R3,R7,#2	;load digtit2
	ADD R3,R6,R3
	LDR R3,R3,#0	;convert digtit2 value to display	
	
	LEA R6,Tbl_FF
	LDR R2,R7,#1	;load digtit1
	ADD R2,R6,R2
	LDR R2,R2,#0	;convert digtit1 value to display
	LDR R4,R7,#3	;load digtit3
	ADD R4,R6,R4
	LDR R4,R4,#0	;convert digtit3 value to display
	;
	;combine then display
	AND R5,R1,R2
	STI R5,Hex10
	AND R5,R3,R4
	STI R5,Hex32
	BR TOP
;
;register location
NUM	.FILL x3147	;the last 4 digits of student no.
disable	.FILL xFFFF
Hex10	.FILL xFFFB	
Hex32	.FILL xFFFA
B_n	.BLKW 4
FF_Tbl	.FILL xFFC0
	.FILL xFFF9
	.FILL xFFA4
	.FILL xFFB0
	.FILL xFF99
	.FILL xFF92
	.FILL xFF82
	.FILL xFFF8
	.FILL xFF80
	.FILL xFF98
Tbl_FF	.FILL xC0FF
	.FILL xF9FF
	.FILL xA4FF
	.FILL xB0FF
	.FILL x99FF
	.FILL x92FF
	.FILL x82FF
	.FILL xF8FF
	.FILL x80FF
	.FILL x98FF
	.END