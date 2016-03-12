	.ORIG x3000
	LD R0,SIZE
	LEA R1,FILE
	ADD R0,R0,#-1
Create	STR R0,R1,#0
	ADD R1,R1,#1
	ADD R0,R0,#-1
	BRzp Create
	;
	;compare FILE[0]~FILE[j]
	;LEA R7,FILE	;address
	AND R6,R6,#0	;#swaps
	AND R5,R5,#0	;#comparisions
	;AND R4,R4,#0	;i_max
	;AND R3,R3,#0	;max
	;AND R2,R2,#0	;i
	;AND R1,R1,#0	;j
	AND R0,R0,#0	;temp
	;
	;for(i=size-1;i>0;i=i-1)
	LD R2,SIZE
M1	ADD R2,R2,#-1
	BRnz M4 
	LEA R7,FILE	;address
	LDR R3,R7,#0	;max=FILE[0]
	AND R4,R4,#0	;i_max=0
	;
	;for(j=1;j<=i;j=j+1)
	AND R1,R1,#0
M2	NOT R0,R2
	ADD R0,R0,#1	
	ADD R1,R1,#1	;j=1
	ADD R0,R1,R0
	BRp swap_next
	;
	;compare FILE[j] & max
	ADD R5,R5,#1	
	LEA R7,FILE
	ADD R7,R7,R1
	LDR R7,R7,#0	;FILE[j]
	NOT R0,R3
	ADD R0,R0,#1
	ADD R0,R0,R7
	BRnz M2
	ADD R3,R7,#0	;if(FILE[j]>max)
	ADD R4,R1,#0
	BR M2
swap_next	
	LEA R7,FILE
	ADD R7,R7,R2
	LDR R0,R7,#0
	STR R3,R7,#0
	LEA R7,FILE
	ADD R7,R7,R4
	STR R0,R7,#0
	ADD R6,R6,#1
	BR M1	
M4	ST R6,SWAPS
	ST R5,COMP
BYE	BR BYE	
;
;Register location
SIZE	.FILL #10	
SWAPS	.FILL #0
COMP	.FILL #0
FILE	.FILL #0
	.END