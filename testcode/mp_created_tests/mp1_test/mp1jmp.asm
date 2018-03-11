ORIGIN 4x0000

SEGMENT CodeSegment:

	LDR R0, R0, ONE		; R0 <- 1
	ADD R3, R0, 12 		; R7 <- 1 + 8

	JMP R3	 		; PC <- R7 

HALT:
	BRnzp HALT

ONE:    DATA2 4x0001

