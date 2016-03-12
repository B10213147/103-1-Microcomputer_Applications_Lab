;;;;;;;;Show the numbers x0,x1,...,xE,xF on Hex10 and the repeats forever ;;;;;;;;
	.ORIG x3000
	LD R0,disable
	STI R0,Hex32
	STI R0,Hex10
TOP	LEA R1,FF_Tbl	;address of FF_Tbl
	AND R3,R3,#0
	ADD R3,R3,#15
M1	LDR R0,R1,#0
	LD R7,Delay
D1	ADD R7,R7,#-1
	BRp D1
	STI R0,Hex10	;show to Hex10
	ADD R1,R1,#1	;address+1(find next location)
	ADD R3,R3,#-1
	BRzp M1
	BR TOP
;
;register location
disable	.FILL xFFFF
Hex32	.FILL xFFFA
Hex10	.FILL xFFFB
Delay	.FILL #5	
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
	.FILL xFF88
	.FILL xFF83
	.FILL xFFC6
	.FILL xFFA1
	.FILL xFF86
	.FILL xFF8E
	.END