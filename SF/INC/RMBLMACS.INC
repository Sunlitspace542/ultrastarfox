; Rumble Controller Macros

; Queue up rumble command to be executed on the next NMI/IRQ cycle
queue_rumble	MACRO	[left,right,time]
	ifne	longa
	printerror	<%m: A must be in 8-bit mode!>
	endc

; Each nybble controls the strength of each motor.
; <--RIGHT--> <---LEFT-->
; R3 R2 R1 R0 L3 L2 L1 L0

	lda	#({right}<<4)+({left})
	sta	rumble_cmd

	lda	#{time}
	sta	rumble_time
	ENDM
	
; Same as above, but correct DBR for strat/path interpreter
s_queue_rumble	MACRO	[left,right,time]
	ifne	longa
	printerror	<%m: A must be in 8-bit mode!>
	endc
	PHB
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	queue_rumble	{left},{right},{time}
	plb
	ENDM

; Same as above, but for PATHs
P_QUEUERUMBLE	MACRO	[left,right,time]
	P_START65816
	s_queue_rumble	{left},{right},{time}
	P_END65816
	ENDM

; Uses a table for sequenced rumbles
s_queue_rumble_table	MACRO	[table]
	ifne	longa
	printerror	<%m: A must be in 8-bit mode!>
	endc
	phx
	lda #1
	sta rumble_index
	ldx	#0
.loop\@
	lda.l {table},x
	beq	.done\@
	sta rumble_table,x
	inx
	cmp #20
	bne	.loop\@
.done\@
	plx
	ENDM