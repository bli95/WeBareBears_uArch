SEGMENT BOOT:
    BRnzp ldr_str_test
DSP:    DATA2 DataSeg
    ; cache line boundary
ldr_str_test:
    LDR R0, R0, DSP
    LDR R1, R0, W
    LDR R3, R0, Y
    ; cache line boundary
    LDR R2, R0, X
    LDR R4, R0, Z
    STR R1, R0, Z
    STR R2, R0, Y
    STR R3, R0, X
    STR R4, R0, W
    ; cache line boundary
    LDR R1, R0, W
    LDR R2, R0, X
    LDR R3, R0, Y
    LDR R4, R0, Z
    BRnzp fetch_stall_test
    ; cache line boundary
    ; cache line boundary
fetch_stall_test:
    ADD R5, R1, R2
    ; cache line boundary
    ADD R6, R3, R4
    STR R5, R0, VICTIM
    ADD R7, R5, R6
    ; cache line boundary
    STR R7, R0, TOTAL
    LDR R1, R0, TOTAL
inf:
    BRnzp inf
; cache line boundary
SEGMENT DataSeg:
W:  DATA2 4x0009
X:  DATA2 4x0002
; cache line boundary
Y:  DATA2 4x0001
Z:  DATA2 4x0003
; cache line boundary
TOTAL:  DATA2 4x0000
; cache line boundary
VICTIM: DATA2 4x0000
