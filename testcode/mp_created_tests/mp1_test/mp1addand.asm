ORIGIN 4x0000

SEGMENT CodeSegment:

	LDR R0, R0, ONE		; R0 <- 1
	ADD R7, R0, -4 		; R7 <- 1 + 4

	AND R7, R7, 0 		; R7 <- R7 & 0

HALT:
	BRnzp HALT

ONE:    DATA2 4x0001
