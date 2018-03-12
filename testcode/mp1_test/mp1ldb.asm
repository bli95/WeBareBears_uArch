ORIGIN 4x0000

SEGMENT CodeSegment:

	LEA R0, DataSegment  	; R0 <- addr(DataSegment)
    LDB R1, R0, 0           ; R1 <- 0x00CD  
    LDB R2, R0, 1           ; R2 <- 0x00AB

HALT:
	BRnzp HALT

SEGMENT DataSegment:

ABCD:    DATA2 4xABCD
