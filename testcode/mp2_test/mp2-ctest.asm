; Author: Harsh Modhera
; Netid/UIN: hmodhe2/659353980
; Class: ECE 411 Spring 2018
; Assignment: MP2 Final Submission
; File: CP3 Test Code (Cache Write)

; This test file is based off of mp2-cp2.asm. It tests the capabilities of the STR and STB instruction.
; In each section, there are 3 situations being tested and verified. The first is storing into an 
; existing cache line in either way 0 or way 1. The second is storing into a location that is not 
; present in an existing cache line. This would require the memory to be brought in from memory, 
; modified, and then stored into the cache. The last is storing to cause a write back operation.
; To verify the write back, the memory location is loaded back and the memory written to in the 
; first situation test is read into a register.

; To test, uncomment either one of the two sections, but NOT both. The starting and ending 
; delimiters are provided.

ORIGIN 0
SEGMENT 0 CODE:
;   
; START TEST FOR STR 
                    
                       	; cache miss to load instructions into cl0_0
LEA R1, line1      
LDR R2, R0, l2p         ; cache miss to load l2p into cl0_1
LDR R3, R0, l3p         ; cache hit to load l3p
NOP
NOP
NOP
LDR R4, R1, 0           ; cache miss to load line1 cl0_2
NOP
NOP
NOP
NOP
STR R4, R1, 3           ; cache hit to store into line1
STR R4, R2, 3           ; cache miss to load line2 into cl1_2 and write to it 
STR R4, R3, 3           ; cache miss and write back
LDR R5, R1, 3           ; cache miss to load and verify write back worked

Halt:
	BRnzp Halt

l2p:   DATA2 line2
l3p:   DATA2 line3

SEGMENT 64 line1:
X0:	DATA2 4x1111
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line2:
Y0:	DATA2 4x2222
Y1:	DATA2 4x2222
Y2:	DATA2 4x2222
Y3:	DATA2 4x2222
Y4:	DATA2 4x2222
Y5:	DATA2 4x2222
Y6:	DATA2 4x2222
Y7:	DATA2 4x2222

SEGMENT 128 line3:
Z0:	DATA2 4x3333
Z1:	DATA2 4x3333
Z2:	DATA2 4x3333
Z3:	DATA2 4x3333
Z4:	DATA2 4x3333
Z5:	DATA2 4x3333
Z6:	DATA2 4x3333
Z7:	DATA2 4x3333

; Final Values ;
 
; R0 = R6 = R7 = 4x0000
; R1 = 4x0020
; R2 = 4x00a0
; R3 = 4x0120
; R4 = 4x1111
; R5 = 4x1111

; END TEST FOR STR 
;   
;; START TEST FOR STB 
;                    
;                        ; cache miss to load instructions into cl0_0
;LEA R1, line1      
;LDR R2, R0, l2p         ; cache miss to load l2p into cl0_1
;LDR R3, R0, l3p         ; cache hit to load l3p
;LDR R4, R1, 0           ; cache miss to load line1 cl0_2
;STB R4, R1, 4           ; cache hit to store into line1
;STB R4, R2, 7           ; cache miss to load line2 into cl1_2 and write to it 
;STB R4, R3, 14          ; cache miss and write back
;LDR R5, R1, 2           ; cache miss to load and verify write back worked
;
;Halt:
;	BRnzp Halt
;
;l2p:    DATA2 line2
;l3p:    DATA2 line3
;
;SEGMENT 32 line1:
;X0:	    DATA2 4xABCD
;NOP
;NOP
;NOP
;NOP
;NOP
;NOP
;NOP
;
;SEGMENT 128 line2:
;Y0:	    DATA2 4x2222
;Y1:	    DATA2 4x2222
;Y2:	    DATA2 4x2222
;Y3:	    DATA2 4x2222
;Y4:	    DATA2 4x2222
;Y5:	    DATA2 4x2222
;Y6:	    DATA2 4x2222
;Y7: 		DATA2 4x2222
;
;SEGMENT 128 line3:
;Z0:	    DATA2 4x3333
;Z1:	    DATA2 4x3333
;Z2:	    DATA2 4x3333
;Z3:	    DATA2 4x3333
;Z4:	    DATA2 4x3333
;Z5:	    DATA2 4x3333
;Z6:	    DATA2 4x3333
;Z7:	    DATA2 4x3333
;
;; Final Values ;
; 
;; R0 = R6 = R7 = 4x0000
;; R1 = 4x0020
;; R2 = 4x00a0
;; R3 = 4x0120
;; R4 = 4xABCD
;; R5 = 4x00CD
;
;; END TEST FOR STB 
;
