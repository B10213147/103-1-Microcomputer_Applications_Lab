;;;;;;;;Show the last four digits of your student number on Hex32 and Hex10 ;;;;;;;;
	.ORIG x3000
	LD R0,disable
	STI R0,Hex32
	STI R0,Hex10
TOP	AND R0,R0,#0
	ADD R0,R0,#3
	;
	;chose different digit of NUM(offset by R0)
M1	LEA R1,Mask
	LEA R2,div
	ADD R1,R1,R0
	ADD R2,R2,R0
	LDR R1,R1,#0
	LDR R2,R2,#0
	NOT R2,R2
	ADD R2,R2,#1
	;
	;count digit's value
	LD R3,NUM
	AND R4,R4,#0
	AND R3,R3,R1
	BRz S1	
M1_0	ADD R4,R4,#1
	ADD R3,R3,R2
	BRp M1_0
	;
	;check R0 is even or odd
S1	ADD R7,R0,#0
	BRz M2
	ADD R7,R7,#-2
	BRz M2	
	LEA R1,Tbl_FF	;if R0 is odd use Tbl_FF
	ADD R1,R1,R4
	LDR R6,R1,#0	;R6 is used to be temp of Tbl_FF
	ADD R0,R0,#-1
	BR M1	
M2	LEA R1,FF_Tbl	;if R0 is even use FF_Tbl
	ADD R1,R1,R4
	LDR R3,R1,#0
	;
	;check R0 is 2 or 0
	ADD R7,R0,#0
	BRz M2_0
	AND R1,R3,R6
	STI R1,Hex32	;if R0 is 2 use Hex32 to show
	ADD R0,R0,#-1
	BR M1
M2_0	AND R1,R3,R6
	STI R1,Hex10	;if R0 is 0 use Hex10 to show 
	BR TOP
;
;register location
NUM	.FILL x3147	;the last 4 digits of student no.
Mask	.FILL x000F
	.FILL x00F0
	.FILL x0F00
	.FILL xF000
div	.FILL x0001
	.FILL x0010
	.FILL x0100
	.FILL x1000
disable	.FILL xFFFF
Hex10	.FILL xFFFB	
Hex32	.FILL xFFFA
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