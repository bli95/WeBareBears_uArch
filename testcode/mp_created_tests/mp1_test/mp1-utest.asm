; Author: Harsh Modhera
; Netid/UIN: hmodhe2/659353980
; Class: ECE 411 Spring 2018
; Assignment: MP1


; This file contains the culmination of the tests that I have written and conducted.
; I uncommented only the section that pertained to the desired instruction to be tested, 
; and thus tested all instructions, one at a time. Yes, I understand this is not necessarily
; considered unit testing as mentioned on piazza, but it is the closest method to narrowing down
; possibilities of error. This file contains simple tests for the instructions in checkpoint 1. 
; However, before running the test code for a newly added instruction pertaining to post checkpoint
; 1, I would run mp1-cp.asm to verify that I have not broken my initial design as a result of the 
; modifications made for the new instructions. The file mp1-cp.asm tests the following instructions 
; correctly: LDR, LEA, ADD, AND, STR, JMP, BR, and RET.

; INSTRUCTIONS: Uncomment all lines between ";; START TEST ..." and ";; END TEST ..." and load
;               the program into memory. In modelsim, run the program for 5000ns. By default,
;               the first test is uncommented.
; NOTE:         If viewing file in vim, all tests are neatly placed in folds.

ORIGIN 4x0000

SEGMENT CodeSegment:
;
;; START TEST FOR LEA, BR ;;
;
;    LEA R0, 20
;    LEA R1, DataSegment
;
;HALT:
;    BRnzp HALT
;
;SEGMENT DataSegment:
;
;ONE:    DATA2 4x0001
;GOOD:   DATA2 4x600D
;
;    ; Final Value ;
;
;    ; R0 = 4x002A
;    ; R1 = 4x0006 
;
;; END TEST FOR LEA, BR ;;
;
;; START TEST FOR LDR, STR ;;
;
;    LDR R0, R0, 4
;    LDR R1, R1, 5
;    STR R0, R2, 6
;
;HALT:
;    BRnzp HALT
;
;SEGMENT DataSegment:
;
;ONE:    DATA2 4x0001
;GOOD:   DATA2 4x600D
;ISGOOD: DATA2 ?
;
;    ; Final Value ;
;
;    ; R0 = 4x0001
;    ; R1 = 4x600D
;    ; ISGOOD = 4x0001
;
;; END TEST FOR LDR, STR ;;
;
;; START TEST FOR ADD, ADDi, NOT ;;
;
;    ; Check ADDi
;    ADD R0, R0, 1       ; R0 <- 1   ... lowest positive value of imm5
;    ADD R1, R1, 15      ; R1 <- 15  ... highest positive value of imm5
;    ADD R2, R2, -5      ; R2 <- -5  ... negative value
;    ; Check ADD
;    ADD R3, R1, R2      ; R3 <- R1 + R2 
;    ; Check NOT
;    NOT R4, R1          ; R4 <- ~(15)
;
;HALT:
;    BRnzp HALT
;
;SEGMENT DataSegment:
;
;ONE:    DATA2 4x0001
;GOOD:   DATA2 4x600D;
;
;    ; Final Values ;
;
;    ; R0 = 4x0001
;    ; R1 = 4x000F
;    ; R2 = 4xFFFB
;    ; R3 = 4x000A
;    ; R4 = 4xFFF0
;
;; END TEST FOR ADD, ADDi, NOT ;;
;
;; START TEST FOR AND, ANDi ;;
;
;    ADD R0, R0, 5       ; R0 <- 5
;    ADD R1, R1, -2      ; R1 <- -2
;    ; Check ANDi
;    AND R2, R0, 3       ; R2 <- R0 & 3 
;    ; Check AND
;    AND R3, R0, R1      ; R3 <- R0 & R1
; 
;HALT:
;    BRnzp HALT
;
;SEGMENT DataSegment:
;
;ONE:    DATA2 4x0001
;GOOD:   DATA2 4x600D
;
;    ; Final Values ;
;
;    ; R0 = 4x0005
;    ; R1 = 4xFFFE
;    ; R2 = 4x0001
;    ; R3 = 4x0004
;
;; END TEST FOR AND, ANDi ;;
;
;; START TEST FOR JMP ;;
;
;    ADD R0, R0, 1       ; R0 <- 1
;    ADD R3, R0, 12      ; R3 < R0 + 12
;    JMP R3              ; Go to 4x000D
;
;    ; Final Values ;
;    
;    ; R0 = 4x0001
;    ; R3 = 4x000D
;    ; PC jumps correctly to 4x000D
;
;; END TEST FOR JMP ;;
;
;; START TEST FOR JSR, JSRR, RET ;;
;    
;    LEA R0, DataSegment
;    LDR R1, R0, LVAL1
;    LDR R2, R0, LVAL2
;    LDR R3, R0, LVAL3
;    ADD R4, R4, 11     
;    ADD R4, R4, 11     ; R4 <- 22 
;    JSRR R4
;    ADD R5, R5, 8      ; Add 8 if RET from JSRR worked
;    JSR TESTJSR
;    ADD R5, R5, 8      ; Add 8 if RET from JSR worked 
;    BRnzp GOODEND
;    
;TESTJSRR:    
;    ADD R5, R1, R2     ; Operations testing if JSRR worked
;    ADD R5, R5, R3
;    RET    
;
;GOODEND:
;    BRnzp GOODEND
;
;TESTJSR:
;    ADD R5, R5, 5      ; Operations testing if JSR worked
;    LDR R6, R0, GOOD
;    RET
;    LDR R6, R0, BADD
;
;BADEND:
;    BRnzp BADEND
;
;SEGMENT DataSegment:
;
;LVAL1:  DATA2 4x0001
;LVAL2:  DATA2 4x0002
;LVAL3:  DATA2 4x0003
;GOOD:   DATA2 4x600D
;BADD:   DATA2 4xBADD
;
;    ; Final Values ;
;    
;    ; R0 = 4x0028
;    ; R1 = 4x0001
;    ; R2 = 4x0002
;    ; R3 = 4x0003
;    ; R4 = 4x0016
;    ; R5 = 4x001B
;    ; R6 = 4x600D
;    ; R7 = 4x0012
;
;; END TEST FOR JSR, JSRR, RET ;;
;
;; START TEST FOR SHF ;;
;
;    ADD R0, R0, 1       ; R0 <- 1
;    LSHF R0, R0, 5      ; R0 <- 32
;    RSHFL R0, R0, 2     ; R0 <- 8
;    LEA R0, DataSegment 
;    LDR R1, R0, VAL0    
;    RSHFA R2, R1, 4     
;    RSHFA R3, R1, 7
;    RSHFL R4, R1, 4
;
;HALT:
;    BRnzp HALT
;
;SEGMENT DataSegment:
;
;VAL0:  DATA2 4xFF00
;
;    ; Final Values ;
;    
;    ; R0 = 4x0012
;    ; R1 = 4xFF00
;    ; R2 = 4xFFF0
;    ; R3 = 4xFFFE
;    ; R4 = 4x0FF0
;
;; END TEST FOR SHF ;;
;
;; START TEST FOR LDB, STB ;;
;
;	LEA R0, DataSegment  	 ; R0 <- addr(DataSegment)
;    LDB R1, R0, 0           ; R1 <- 4x00CD  
;    LDB R2, R0, 1           ; R2 <- 4x00AB
;    STB R1, R0, 3           
;    STB R2, R0, 2       
;
;HALT:
;	BRnzp HALT
;
;SEGMENT DataSegment:
;
;ABCD:  DATA2 4xABCD
;TEST:  DATA2 ?
;
;    ; Final Values ;
;
;    ; R0 = 4x000C 
;    ; R1 = 4x00CD
;    ; R2 = 4x00AB
;    ; TEST = 4xCDAB
;
;; END TEST FOR LDB, STB ;;
;
; START TEST FOR LDI, STI ;;

    LEA R0, DataSegment
    LDI R1, R0, LP
    STI R1, R0, SP

HALT:
    BRnzp HALT

SEGMENT DataSegment: 

LP:    DATA2 LD
SP:    DATA2 SD
LD:    DATA2 4xABCD
SD:    DATA2 ?

    ; Final Values ;

    ; R0 = 4x0008
    ; R1 = 4xABCD
    ; SD = 4xABCD

; END TEST FOR LDI, STI ;;
;
;; START TEST FOR TRAP ;;
;   
;    ADD R0, R0, 5
;    ADD R1, R0, 2
;    TRAP TEST
;    ADD R2, R0, R1
;    BRnzp HALT
;
;TEST: 
;    DATA2 TEST2
;
;HALT:
;    BRnzp HALT
;
;TEST2:
;    ADD R0, R0, 3
;    RET
;
;    ; Final Values ;
;
;    ; R0 = 4x0008 
;    ; R1 = 4x0007
;    ; R2 = 4x000F
;
;; END TEST FOR TRAP ;;
;
