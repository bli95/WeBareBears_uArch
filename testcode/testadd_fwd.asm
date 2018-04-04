ORIGIN 4x0000

SEGMENT CodeSegement:
    ADD R0, R0, 6
    ADD R6, R4, 4
    ADD R5, R0, 7
    NOP
    NOP
    NOP
inf:
    BRnzp inf
    NOP
    NOP


