SEGMENT  CodeSegment:

   LDR  R1, R0, NEGTWO  ; R1 <= -2
   LDR  R2, R0, ONE     ; R2 <= 2
   LDR  R3, R0, TWO     ; R4 <= 1
   LDR  R4, R0, THREE
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   BRnzp LOOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP


ONE:     DATA2 4xABCD
TWO:     DATA2 4xFF75
THREE:   DATA2 4x32AC
NEGTWO:  DATA2 4x0002
GOOD:    DATA2 4x600D
TEMP2:   DATA2 ?

LOOP:
   ADD R5, R2, R4       ; R3 <= R1 + R2
   AND R6, R3, R4       ; R5 <= R1 AND R4
   NOT R3, R3           ; R6 <= NOT R1
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   STR R5, R0, TEMP2    ; M[TEMP1] <= R6
   LDR R7, R0, TEMP2    ; R7 <= M[TEMP1]
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   BRp DONE
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   BRnzp LOOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP

DONE:
   LDR  R1, R0, GOOD
   BRnzp DONE
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
   NOP
