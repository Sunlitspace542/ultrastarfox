; Macros for Sunlit's MSU-1 driver
;-------------------------------------------------------------
	; define an msu track in MSUTRKS.INC
msutrack	macro	[track,num]
bgm{track}	equ	{num}
	endm
;-------------------------------------------------------------
	; play an msu track
msuplay	macro	[track,audiostate]
	php
	pha	;save a&x
	phx

	a8i16
	lda	#audiostate_{audiostate}
	ldx	#bgm{track}
	jsl	msuplay_l

	plx	;return a&x
	pla
	plp
	endm
;-------------------------------------------------------------
; specifically for stage 1-3. yes, really.
msubgmrestart	MACRO	[track,audiostate]
	lda	bgflags
	bit	#bgf_restart
	beq	.\@ok
	msuplay	{track},{audiostate}
.\@ok
	ENDM
;-------------------------------------------------------------
	; use this macro if the former breaks stuff
	; you have to know what A/X should and will be,
	; and if any macros using savemode/returnmode are run before using this
msuplay_alt	macro	[track,audiostate]
	savemode
	pha	;save a&x
	phx

	a8i16
	lda	#audiostate_{audiostate}
	ldx	#bgm{track}
	jsl	msuplay_l

	plx	;return a&x
	pla
	returnmode
	endm
;-------------------------------------------------------------
	; HACK to make it possible to do msu stuff in strats
s_msuplay	macro	[track,audiostate]
	savemode
	a8
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
	msuplay	{track},{audiostate}
	returnmode
	plb
	ENDM
;-------------------------------------------------------------
	; play an msu track (for levelscripts)
mapmsuplay	macro	[track,audiostate]
	start_65816
	php
	pha	;save a&x
	phx

	a8i16
	lda	#audiostate_{audiostate}
	ldx	#bgm{track}
	jsl	msuplay_l

	plx	;return a&x
	pla
	plp
	end_65816
	endm
;-------------------------------------------------------------
	;Shut the MSU-1 off
msustop	macro
	stz	msu_volume
	stz	msu_control
	endm
;-------------------------------------------------------------
	;Shut the MSU-1 off (for levelscripts)
mapmsustop	macro
	start_65816
	stz	msu_volume
	stz	msu_control
	end_65816
	endm
;-------------------------------------------------------------
	;Trigger fade out
msufade	macro
	php
	a8
	lda	#1
	sta	msufadeflag
	plp
	endm
;-------------------------------------------------------------
	;Trigger fade out
	;see msuplay_alt for notes on usage
msufade_alt	macro
	savemode
	a8
	lda	#1
	sta	msufadeflag
	returnmode
	endm
;-------------------------------------------------------------
mapmsufade	macro
	start_65816
	php
	a8
	lda	#1
	sta	msufadeflag
	plp
	end_65816
	endm
;-------------------------------------------------------------
msu1_setseekport	macro [addr]
;	savemode
;	a8
	lda #{addr}_byte1
	sta msu_seek
	lda #{addr}_byte2
	sta msu_seek2
	lda #{addr}_byte3
	sta msu_seek3
	lda #{addr}_byte4
	sta msu_seek4
;	returnmode
	ENDM

;--------------------------------------------------------------
; Stream MSU-1 data to memory
msustream	macro	[dest,addr]
	pha
	phy
	savemode
	a8
	msu1_setseekport	{addr}
	a16
	lda	#{dest}
	sta	msu_dest_zptr
	lda	#{addr}len
	sta msu_read_len
	jsl	msuread_l
	returnmode
	ply
	pla
	ENDM
;--------------------------------------------------------------