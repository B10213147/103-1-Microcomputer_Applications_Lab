;;;;;;;;Move the numbers from Bit7 to Bit6,
;;;;;;;;Bit6 to Bit5,..., Bit1 to Bit0 ;;;;;;;;
	.ORIG x3000
	;
	;right shift array B_n
	;(xB9 -> x5C)
M1	AND R2,R2,#0
	ADD R2,R2,#7
	LEA R6,B_0
M1_1	LDR R1,R6,#1
	STR R1,R6,#0	;M[n] <- M[n+1]
	ADD R6,R6,#1	;next location of array B_n
	ADD R2,R2,#-1	;do 7 times
	BRp M1_1
	AND R1,R1,#0	
	STR R1,R6,#0	;M[7] <- 0
Bye	BR Bye
;
;register location
B_0	.FILL #1
B_1	.FILL #0
B_2	.FILL #0
B_3	.FILL #1
B_4	.FILL #1
B_5	.FILL #1
B_6	.FILL #0
B_7	.FILL #1
	.FILL x04
	.END
