ORIGIN 0

SEGMENT CodeSegment:

    ADD R0, R0, 1
    LSHF R0, R0, 5
    RSHFL R0, R0, 2
    LEA R0, DataSegment
    LDR R1, R0, VAL0
    RSHFA R2, R1, 4
    RSHFA R3, R1, 7
    RSHFL R4, R1, 4

HALT:
    BRnzp HALT

SEGMENT DataSegment:

VAL0: DATA2 4xFF00
