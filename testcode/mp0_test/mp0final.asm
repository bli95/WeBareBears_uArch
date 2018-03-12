; Author: Harsh Modhera
; Netid/UIN: hmodhe2/659353980
; Class: ECE 411 Spring 2018
; Assignment: MP0

ORIGIN 4x0000

    ; NOTE: This program works for factorials from 1-7. It produces the wrong result at 8!.
    ; This is most likely due to overflow since the registers are 16 bits only.
    ; Therefore, they can only hold upto 2^(15)-1 = 32767. 8! is 40320.

SEGMENT CodeSegment:

    ; List of registers used in the program
    ; R1 - Takes in the initial value and holds the running result (holds final result at the end)
    ; R2 - Negative 1 used for subtraction
    ; R3 - Positive 1 used to revert subtraction
    ; R4 - Factorial counter
    ; R5 - Multiply counter
    ; R6 - Holds the value to add to the running result during multiplication
    ; R0/R7 - Blank register containing 0 from reset
	   
    ; Initialize the register values with the data values stored in memory 
    LDR R2, R0, NEG_ONE 
    LDR R3, R0, POS_ONE
    LDR R4, R0, INPUT
    LDR R1, R0, INPUT 

FACTORIAL_LOOP:
    ADD R6, R1, R0 			; Reset R6 to hold the value to add in current factorial iteration
    ADD R4, R4, R2	
    BRnzp CHECK_ONE_F 	

RET_FCHECK:
    ADD R5, R4, R0

MULTIPLY_LOOP:
    ADD R1, R1, R6
    ADD R5, R5, R2
    BRnzp CHECK_ONE_M
    
CHECK_ONE_F:				; Check if the only piece of the factorial remaining
    ADD R4, R4, R2			; is to multiply the running result by 1
    BRnz DONE				; If so, then running result is final result
    ADD R4, R4, R3			; Otherwise, branch back and keep going
    BRnzp RET_FCHECK 

CHECK_ONE_M:				; Same purpose as above check section but for
    ADD R5, R5, R2			; the multiply portion
    BRnz FACTORIAL_LOOP
    ADD R5, R5, R3
    BRnzp MULTIPLY_LOOP

DONE:
    STR R1, R0, RESULT		; Although answer is in R1, store answer into RESULT

HALT:                   	; Infinite loop to keep the processor
    BRnzp HALT          	; from trying to execute the data below

POS_ONE:    DATA2 4x0001	
NEG_ONE:    DATA2 4xFFFF
INPUT:      DATA2 4x0005	; CHANGE THIS VALUE TO COMPUTE DIFFERENT FACTORIALS 
RESULT:     DATA2 4x0000
