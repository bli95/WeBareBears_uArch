ORIGIN 4x0000

SEGMENT CodeSegement:
    LDR R0, R0, A
    LDR R6, R0, 4
    NOP
    NOP
    NOP
inf:
    BRnzp inf
    NOP
    NOP

DSP:
A: DATA2 4x000A
B: DATA2 4x000B
