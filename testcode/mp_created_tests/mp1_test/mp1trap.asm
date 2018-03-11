ORIGIN 4x0000

SEGMENT  CodeSegment:
    ADD R0, R0, 5
    ADD R1, R0, 2
    TRAP TEST
    ADD R2, R0, R1
    BRnzp HALT

TEST: 
    DATA2 TEST2

HALT:
    BRnzp HALT

TEST2:
    ADD R0, R0, 3
    RET
