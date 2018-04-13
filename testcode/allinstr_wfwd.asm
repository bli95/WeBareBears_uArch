ORIGIN	4x0040
SEGMENT TrapVector:
BRnzp	CodeSegment
HITME:	DATA2   TRAPTEST

SEGMENT CodeSegment:
        ;; Assuming all registers, specifically R0, are zeroed at beginning
        ;; R0 - counter for the number of correct instructions passing test
        ;; R7 - used only for RET-related tests
        
        ADD     R1, R1, 5       ; R1 = x0005
        BRnz    INF_LOOP
        ADD     R2, R2, 4
        NOT     R2, R2          ; R2 = xFFFB
        BRzp    INF_LOOP
        ADD     R2, R1, R2      ; R2 = x0000
        BRnp    INF_LOOP
        ADD     R0, R0, 4       ; ADDr, ADDi, NOT, BR pass
        ;; R0 = 4, CC set to p
        
        AND     R2, R1, R2      ; R2 same
        BRnp    INF_LOOP
        AND     R2, R1, -1      ; R2 = x0005
        BRnz    INF_LOOP
        ADD     R2, R2, -5      ; R2 = x0000
        BRnp    INF_LOOP
        ADD     R0, R0, 2       ; ANDr, ANDi pass (and SEXT(imm5) check)
        ;; R0 = 6
        
        AND     R1, R1, R2      ; R1 = x0005, CC set to z
        LEA     R1, JUMPTEST    ; label below this instr should set cc to pos
        BRnz    INF_LOOP
        JMP     R1
RETTEST:
        ADD     R0, R0, 1       ; RET passes
        ;; R0 = 9
        
        JSR     OUTER_FN
        ADD     R0, R0, 1       ; JSR passes
        ;; R0 = 11
        
        LSHF    R1, R2, 15      ; R1 = 0x0000 << 15
        BRnp    INF_LOOP
        ADD     R1, R1, -1      ; R1 = xFFFF
        ADD     R2, R2, -1      ; R2 = xFFFF
        RSHFL   R2, R2, 8       ; R2 = x00FF, cc should be set to p
        BRnz    INF_LOOP
        RSHFA   R1, R1, 15      ; R1 = xFFFF, cc should be set to n
        BRzp    INF_LOOP
        RSHFL   R1, R1, 0       ; this should do nothing so that
        ADD     R1, R1, 1       ; R1 = x0000
        BRnp    INF_LOOP
        ADD     R0, R0, 1       ; SHF passes
        ;; R0 = 12
        
        LEA     R6, Data
        ADD     R1, R1, 13      ; R1 = x000D
        STR     R1, R6, TSTR
        AND     R2, R2, 0       ; R2 = x0000, set cc to z
        LDR     R2, R6, TSTR    ; R2 = x000D
        BRnz    INF_LOOP
        ADD     R3, R2, -13     ; R3 = x000D + xFFF3 = x0000
        BRnp    INF_LOOP
        ADD     R0, R0, 2       ; STR, LDR pass
        ;; R0 = 14
        
        STI     R1, R6, TSTI
        AND     R2, R2, 0       ; R2 = x0000, set cc to z
        LDI     R3, R6, TSTI    ; R3 = x000D
        BRnz    INF_LOOP
        ADD     R3, R3, -13     ; R3 = x0000
        BRnp    INF_LOOP
        ADD     R0, R0, 2       ; STI, LDI pass
        ;; R0 = 16
        
        ADD     R3, R3, 10      ; R3 = x000A
        LSHF    R3, R3, 4       ;    = x00A0
        ADD     R3, R3, 10      ;    = x00AA
        STB     R3, R6, TSTBL
        NOT     R2, R3          ; R2 = xFF55, set CC to n
        STB     R2, R6, TSTBH
        LDB     R1, R6, TSTBL   ; R1 = x00AA
        BRnz    INF_LOOP
        AND     R1, R1, R2      ; R1 = x00AA & xFF55 = x0000
        BRnp    INF_LOOP
        LDB     R1, R6, TSTBH   ; R1 = x0055, set CC to p
        AND     R3, R1, R3      ; R3 = x00AA & x0055 = x0000
        BRnp    INF_LOOP
        ADD     R0, R0, 2       ; STB, LDB pass
        ;; R0 = 18
        
        TRAP    HITME
        ADD     R0, R0, 1       ; TRAP passes
        ;; R0 = 19

INF_LOOP:
        BRnzp   INF_LOOP        ; most likely failed... unless R0 = 0x13 ;)

JUMPTEST:
        ADD     R0, R0, 2       ; LEA, JMP pass
        ; R0 = 8
        LEA     R7, RETTEST
        RET                     ; PC should jump to [R7]
OUTER_FN:
        ADD     R6, R7, 0       ; save ret addr
        LEA     R1, INNER_FN
        JSRR    R1
        ADD     R0, R0, 1       ; JSRR passes
        ; R0 = 10
        AND     R7, R7, 0       ; restore R7 from JSR
        ADD     R7, R6, 0       ; if correctly saved
        RET
INNER_FN:
        RET
TRAPTEST:
        RET

SEGMENT Data:
TSTR:   DATA2   ?
TSTI:   DATA2   BAIT
BAIT:   DATA2   ?
TSTBL:  DATA1   ?
TSTBH:  DATA1   ?

