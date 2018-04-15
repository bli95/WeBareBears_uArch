ORIGIN	4x0000
SEGMENT CodeSegment:
	LEA		R0, Counters
	STI		R7, R0, TOTAL_BR
	AND		R7, R7, 0	; dummy instruction so STI in mem stage doesn't affect BR in ex, cc set to z
	BRnp	INF_LOOP
	BRnp	INF_LOOP
	BRnp	INF_LOOP
	BRnp	INF_LOOP
	BRnp	INF_LOOP
	LDI		R1, R0, TOTAL_BR	; should be 5 branches
	LDI		R2, R0, BR_MISP		; should be 0 mispredicts (NT is default always)
	
	STI		R7, R0, TOTAL_BR
	AND		R7, R7, 0
	BRz		P1
P1:	BRz		P2
P2:	BRz		P3
P3:	LDI		R3, R0, TOTAL_BR	; expect 3
	LDI		R4, R0, BR_MISP		; also expect 3
	
	LDI		R5, R0, IC_HIT		; should be like 15 - 25?
	LDI		R6, R0, IC_MISS		; 3 cache line misses (8 instr per line)
	LDI		R7, R0, DC_MISS		; around 1?
	
INF_LOOP:
	BRnzp   INF_LOOP

SEGMENT 96 Counters:
TOTAL_BR:	DATA2	4xFFFF;
BR_MISP:	DATA2	4xFFFE;
IC_HIT:		DATA2	4xFFFD;
IC_MISS:	DATA2	4xFFFC;
DC_HIT:		DATA2	4xFFFB;
DC_MISS:	DATA2	4xFFFA;
L2_HIT:		DATA2	4xFFF9;
L2_MISS:	DATA2	4xFFF8;

