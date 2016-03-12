;;;;;;;;Implement a hexadecimal countdown counter ;;;;;;;;
;;;;;;;;and start counting down from 0x000F ;;;;;;;;;
	.ORIG x3000	
	LD R1,disable
	STI R1,Hex32
	STI R1,Hex10
	;
	;start counting down from 0x000F
	AND R0,R0,#0	;R0:digtit0(counter)
	LEA R7,digtit	;R7:address of digtit
	STR R0,R7,#1
	STR R0,R7,#2
	STR R0,R7,#3
	ADD R0,R0,#9
M1	STR R0,R7,#0
	;
	;display program
	LEA R6,FF_Tbl
	ADD R1,R6,R0
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
	;
	;countdown program
	ADD R0,R0,#-1	;digtit0 countdown
	BRzp M1		;display when R0 countdown
	;AND R0,R0,#0	;when digtit0<0
	ADD R0,R0,#10	;reset digtit0=#9
	;
	;digtit1 countdown
	LDR R1,R7,#1
	ADD R1,R1,#-1	
	STR R1,R7,#1
	BRzp M1		;display when digtit1 countdown
	STR R0,R7,#1	;when digtit1<0 reset digtit1=#9
	;
	;digtit2 countdown
	LDR R1,R7,#2
	ADD R1,R1,#-1
	STR R1,R7,#2
	BRzp M1		;display when digtit2 countdown
	STR R0,R7,#2 	;when digtit2<0 reset digtit2=#9
	;
	;digtit3 countdown
	LDR R1,R7,#3
	ADD R1,R1,#-1
	STR R1,R7,#3
	BRzp M1		;display when digtit3 countdown
	STR R0,R7,#3	;when digtit3<0 reset digtit3=#9
	BR M1	
;
;register location
digtit	.BLKW 4
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