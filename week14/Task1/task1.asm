	.ORIG x3000
	LD R0,SIZE
	LEA R1,FILE
	ADD R0,R0,#-1
Create	STR R0,R1,#0
	ADD R1,R1,#1
	ADD R0,R0,#-1
	BRzp Create
	AND R6,R6,#0	;#swaps
	AND R5,R5,#0	;#comparisons
	AND R0,R0,#0	;num[j]
	AND R1,R1,#0	;num[j+1]
	AND R2,R2,#0	;temp
	;
	;for(i=0;i<size;i=i+1)
	LD R4,SIZE	;i
M1	ADD R4,R4,#-1
	BRnz M3
	;
	;for(j=0;j<i;j=j+1)
	AND R3,R3,#0	;j
M2	NOT R2,R4
	ADD R2,R2,#1
	ADD R2,R3,R2
	BRzp M1	
	ADD R5,R5,#1
	;
	;compare FILE[j] & FILE[j+1]
	LEA R7,FILE	;address	
	ADD R7,R7,R3
	ADD R3,R3,#1
	LDR R0,R7,#0
	LDR R1,R7,#1
	NOT R1,R1
	ADD R1,R1,#1
	ADD R1,R0,R1	
	BRp swap_next	;num[j]>num[j+1]
	BR M2
swap_next	
	LDR R1,R7,#1
	STR R0,R7,#1
	STR R1,R7,#0	
	ADD R6,R6,#1	
	BR M2
M3	ST R6,SWAPS
	ST R5,COMP
BYE	BR BYE	
SIZE	.FILL #10	
SWAPS	.FILL #0
COMP	.FILL #0
FILE	.FILL #0
	.END