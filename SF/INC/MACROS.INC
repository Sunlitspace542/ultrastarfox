;------------------------------------------------------------------------
printerror	macro	[errormsg]
	printf	"%q%f%q (%l) %01%31Error: {errormsg}%00%n"
	error+
	ENDM
;------------------------------------------------------------------------
	IFD		_ARGSFX
; Rotates a string left by offset for ARGSFX
rols	MACRO	[string,offset]
	substr	{offset},,{string}

	ENDM

; Rotates a string right by offset (ARGSFX only)
rors	MACRO	[string,offset]
	substr	0,((strlen {string})-{offset}),{string}

	ENDM

	ENDC	;_ARGSFX
;------------------------------------------------------------------------

; Define Long
; From Star Fox 2
dl	macro	[address]
	dw	({address})&WM
	db	({address})>>16
	endm

; Used in SGDATA.ASM
rndbyte255	macro
rndval =	(rndval*91+$61d7)&$ffff
	db	rndval&255
	endm

; Used for random verts
rndbyte	macro
rndval =	(rndval*91+$61d7)&$ffff
	db	rndval&63
	endm

rndword	macro
rndval =	(rndval*91+$61d7)&$ffff
	dw	rndval&63
	endm
	
rndval	=	$5a79

;------------------------------------------------------------------------

turnonoff	macro	[var]		;turns a variable on or off, whichever is the opposite of its current state
	pha							;push anything in the accumulator out into the stack to retrieve later
	lda	{var}					;load the variable into the accumulator
	and	#1
	eor	#1
	sta	{var}
	pla							;pull accumulator back out that we pushed earlier
	endm

;------------------------------------------------------------------------

settext	macro	[column,row]					;Sets the column + row for upcoming text
	a16											;16 bit accumulator
	pha
	lda	#<({column}*col_size+{row}*32)			;#<(column)*col_size+(row)*32
	sta	printpt									;Store to low 2 bytes of printpt
	lda	#>({column}*col_size+{row}*32)			;#>(column)*col_size+(row)*32
	sta	printpt+1								;Store to upper 2 bytes of printpt
	pla
	endm

;------------------------------------------------------------------------

showtext	macro	[table]			;Shows the full text in a single table
	stz	textpt
	pha								;Push accumulator
	a16
	ldx	#-2							;load 0 into x index
.stringloop\@
	inx
	lda.l	{table},x				;load the next letter from the current pointer area from the table
	beq	.stringdone\@				;end this part of the code if equal to 0
	inx								;increase x by 1 again (letters after the first one are added in pairs)
	lda.l	{table},x				;load the next letter from the current pointer area from the table
	beq	.stringdone\@				;end this part of the code if equal to 0
.start\@
	sta	open_text					;store this letter into open_text

	lda	#open_text					;Load text back into accumulator
	sta	textpt						;store this into textpt (which gets printed with printt_l)
	
	jsl	printt_l					;Run routine to display the letter
	bra	.stringloop\@				;Go back and continue looking for letters (until it hits a 0)

.stringdone\@						;Done displaying the string, continue
	pla								;pull accumulator
	endm

;------------------------------------------------------------------------

settxt	macro	[column,row]
	settext	{column},{row}
	endm

;------------------------------------------------------------------------

showtxt	macro	[table]
	showtext	{table}
	endm

;------------------------------------------------------------------------

; Combines settxt and showtxt together to print a string
; at the defined column and row.
kandoprint	macro	[column,row,table]
	settxt	\1,\2				; Set position for upcoming text
	showtxt	\3					; Show specified string on screen at specified row and column
	ENDM

; Print variable on screen at defined column and row (Short address)
printnum	macro	[column,row,variable]
	lda	{variable}						; Load variable into A
	printd	{column},{row}				; Display decimal value of A on screen at specified row and column
	ENDM

; Print variable on screen at defined column and row (Long address)
printnuml	macro	[column,row,variable]
	lda.l	{variable}					; Long load variable into A
	printd	{column},{row} 				; Display decimal value of A on screen at specified row and column
	ENDM

;------------------------------------------------------------------------

printvar	macro	[var]				;displays value of a variable to set text point
	lda	{var}							;load variable to accumulator
	printd								;display decimal value of accumulator to screen
	endm

;------------------------------------------------------------------------

; Defines a string to be printed with kandoprint
; Usage...
;	definestring	mycoolstring,<my cool string>
definestring	MACRO	[label,text]
{label}					; Write label
	defs	2,"{text}"	; Define text param as a string
	UPPER	2			; Uppercase it
	run	' db "%$2"'		; Write the string
	dw	0				; Terminate string
	ENDM

;------------------------------------------------------------------------

; These macros print strings on screen using the MARIO chip rather than the SNES CPU.

; Prints a string defined in GAMETEXT.ASM at specified X and Y.
marioprint	MACRO	[xpos,ypos,string]
	ai16
	lda	#{xpos}
	sta.l	m_x1
	lda	#{ypos}
	sta.l	m_y1
	lda	#{string}&WM
	sta.l	m_txtdata
	call_mario	mprintstr
	ENDM

; Print variable as a decimal number on screen at specified X and Y.
marioprintdec	MACRO	[xpos,ypos,var]
	ai16
	lda	#{xpos}
	sta.l	m_x1
	lda	#{ypos}
	sta.l	m_y1
	lda.l	{var}
	and	#255
	sta.l	m_z1
	call_mario	mprtdecstop
	ENDM

;------------------------------------------------------------------------

; Sets up RNG seed for random_l
setuprng	MACRO
	IFEQ	rngmode-2
	savemode
	ai8
	LDA #$E5 ; seed, can be anything except 0
	STA rand
	LDA #$28
	STA rand+1
	returnmode
	ELSEIF ; rngmode == 0 || 1
	savemode
	ai8
	lda	#$3a
	sta	rand
	lda	#$a7
	sta	rand+1
	lda	#$55
	sta	rand+2
	lda	#$7f
	sta	rand+3
	returnmode
	ENDC
	ENDM

xorshiftrng	MACRO
	; Code taken from https://codebase64.org/doku.php?id=base:16bit_xorshift_random_generator
	; should be run with A in 8-bit mode
	; saves 2 bytes of zp vs the original routine
	; in C, what this does is:
	;	rand ^= rand << 7;
	;	rand ^= rand >> 9;
	;	rand ^= rand << 8;
	;	return rand;
	LDA rand+1
	LSR a
	LDA rand
	ROR a
	EOR rand+1
	STA rand+1 ; high part of x ^= x << 7 done
	ROR a	; A has now x >> 9 and high bit comes from low byte
	EOR rand
	STA rand  ; x ^= x >> 9 and the low part of x ^= x << 7 done
	EOR rand+1 
	STA rand+1 ; x ^= x << 8 done
	ENDM

;------------------------------------------------------------------------

; Checks for space remaining

chkmemoryfull	macro	[symbol,name,extramsg]
	IFEQ	{symbol}
	printf	"%01%31Warning: {name} full! {extramsg}%n%00"
	ENDC
	ENDM

chkmemoryexceeded	macro	[symbol,name,extramsg]
	IFLT	{symbol}
	printf	"%01%31Error: {name} space exceeded! {extramsg}%n%00"
	error+
	ENDC
	ENDM

;------------------------------------------------------------------------

wait	macro
	a8
	stz	gamevwpos
	lda	gamevwpos		;wait for screen off
	beq	*-3
	endm

;------------------------------------------------------------------------

call_mario	macro	[mariocode]
	savemode
	a8
	lda	#{mariocode}>>16
	ldx	#{mariocode}&WM
	jsl	runmario_l
	returnmode
	endm
;------------------------------------------------------------------------

savemode	macro
tmpa	=	longa
tmpi	=	longi
	endm

returnmode	macro
	ifeq	tmpa
	a8
	elseif
	a16
	endc
	ifeq	tmpi
	i8
	elseif
	i16
	endc
	endm

;------------------------------------------------------------------------

MOV	MACRO	[source,destination]
	ifeq	longa
	LDA	{source}
	STA	{destination}
	LDA	{source}+1
	STA	{destination}+1
	endc
	ifne	longa
	lda	{source}
	sta	{destination}
	endc
	ENDM

;------------------------------------------------------------------------

MOVI	MACRO
	ifeq	longa
	LDA	#<(\1)
	STA	\2
	LDA	#>(\1)
	STA	\2+1
	endc
	ifne	longa
	lda	#\1
	sta	\2
	endc
	ENDM

;------------------------------------------------------------------------

ADD	MACRO	;\3=\2+\1
	ifeq	longa
	CLC
	LDA	\1
	ADC	\2
	STA	\3
	LDA	\1+1
	ADC	\2+1
	STA	\3+1
	endc
	ifne	longa
	clc
	lda	\1
	adc	\2
	sta	\3
	endc
	ENDM

;------------------------------------------------------------------------

ADDI	MACRO
	ifeq	longa
	CLC
	LDA	#<(\1)
	ADC	\2
	STA	\2
	LDA	#>(\1)
	ADC	\2+1
	STA	\2+1
	endc
	ifne	longa
	clc
	lda	#\1
	adc	\2
	sta	\2
	endc
	ENDM

;------------------------------------------------------------------------

ADDIB	MACRO
	CLC
	LDA	\2
	ADC	#(\1)
	STA	\2
	BCC	.noinc\@
	INC	\2+1
.noinc\@
	ENDM

;------------------------------------------------------------------------

ADDB	MACRO
	CLC
	ADC	\1
	STA	\1
	BCC	.noinc\@
	INC	\1+1
.noinc\@
	ENDM

;------------------------------------------------------------------------


SUBB	MACRO
	SEC
	SBC	\1
	STA	\1
	BCS	.nodec\@
	DEC	\1+1
.nodec\@
	ENDM

;------------------------------------------------------------------------

SUBI	MACRO
	SEC
	LDA	#<(\1)
	SBC	\2
	STA	\2
	LDA	#>(\1)
	SBC	\2+1
	STA	\2+1
	ENDM

;------------------------------------------------------------------------

SUB	MACRO	;\3=\2-\1
	SEC
	LDA	\2
	SBC	\1
	STA	\3
	LDA	\2+1
	SBC	\1+1
	STA	\3+1
	ENDM

;------------------------------------------------------------------------

CPM	MACRO
	LDA	\2
	CMP	\1
	LDA	\2+1
	SBC	\1+1
	ENDM

;------------------------------------------------------------------------

chkbra	MACRO
	IFND	\1
	b\3	*+6
	jml	\1
	ELSEIF
	IFGT	*-(\1)-126
	IFNE	(*>>16)-((\1)>>16)
	b\3	*+6
	jml	\1
	ELSEIF
	b\3	*+5
	jmp	\1
	ENDC
	ELSEIF
	b\2	\1
	ENDC
	ENDC
	ENDM

;------------------------------------------------------------------------

chksbra	MACRO
	IFND	\1
	b\3	*+5
	brl	\1
	ELSEIF
	IFGT	*-(\1)-126
	b\3	*+5
	brl	\1
	ELSEIF
	b\2	\1
	ENDC
	ENDC
	ENDM

;------------------------------------------------------------------------

lbeq	macro
	chksbra	\1,eq,ne
	endm

;------------------------------------------------------------------------

lbne	macro
	chksbra	\1,ne,eq
	endm

;------------------------------------------------------------------------

lbpl	macro
	chksbra	\1,pl,mi
	endm

;------------------------------------------------------------------------

lbmi	macro
	chksbra	\1,mi,pl
	endm

;------------------------------------------------------------------------

lbcc	macro
	chksbra	\1,cc,cs
	endm

;------------------------------------------------------------------------

lbcs	macro
	chksbra	\1,cs,cc
	endm

;------------------------------------------------------------------------

lbvc	macro
	chksbra	\1,vc,vs
	endm

;------------------------------------------------------------------------

lbvs	macro
	chksbra	\1,vs,vc
	endm

;------------------------------------------------------------------------

lblo	macro
	chksbra	\1,lo,hs
	endm

;------------------------------------------------------------------------

lbhs	macro
	chksbra	\1,hs,lo
	endm

;------------------------------------------------------------------------

bhs	macro
	bcs	\1
	endm

;------------------------------------------------------------------------

blo	macro
	bcc	\1
	endm

;------------------------------------------------------------------------



cmpbpl	macro	*value,address	;branch pos
	sec
	sbc	\1
	beq	\2
	bvs	*+6
	bpl	\2
	bra	*+4
	bmi	\2
	endm

;------------------------------------------------------------------------


cmpbmi	macro	*value,address	;branch minus
	sec
	sbc	\1
	beq	*+10
	bvs	*+6
	bmi	\2
	bra	*+4
	bpl	\2

	endm

;------------------------------------------------------------------------

cmplbpl	macro	*value,address	;branch pos
	sec
	sbc	\1
	lbeq	\2
	bvs	.\@inv
	lbpl	\2
	bra	.\@mi
.\@inv	lbmi	\2
.\@mi
	endm

;------------------------------------------------------------------------


cmplbmi	macro	*value,address	;branch minus
	sec
	sbc	\1
	beq	.\@pos
	bvs	.\@inv
	lbmi	\2
	bra	.\@pos
.\@inv	lbpl	\2
.\@pos
	endm

;------------------------------------------------------------------------


movbxy	macro
	lda	\1,x
	sta	\1,y
	endm

;------------------------------------------------------------------------

movbyx	macro
	lda	\1,y
	sta	\1,x
	endm

;------------------------------------------------------------------------

txay	macro
	txa
	tay
	endm

;------------------------------------------------------------------------

tyax	macro
	tya
	tax
	endm

;------------------------------------------------------------------------

asra	macro
	cmp #(longa&$7f80)+128
	ror a
	endm

;------------------------------------------------------------------------

nega	macro
	eor #-1
	inc a
	endm

;------------------------------------------------------------------------

negb	macro
	lda #0
	sec
	sbc \1
	sta \1
	endm

;------------------------------------------------------------------------

incw	macro
	inc \1
	bne .\@
	inc \1+1
.\@
	endm

;------------------------------------------------------------------------

decw	macro
	lda \1
	bne .\@
	dec \1+1
.\@
	dec \1
	endm

;------------------------------------------------------------------------

negw	macro
	lda #0
	sec
	sbc \1
	sta \1
	ifeq	longa
	lda #0
	sbc \1+1
	sta \1+1
	endc
	endm

;------------------------------------------------------------------------

phxm	macro
	txa
	pha
	endm

;------------------------------------------------------------------------

plxm	macro
	pla
	tax
	endm

;------------------------------------------------------------------------

phym	macro
	tya
	pha
	endm

;------------------------------------------------------------------------

plym	macro
	pla
	tay
	endm

;------------------------------------------------------------------------

pushb	macro
	lda \1
	pha
	endm

;------------------------------------------------------------------------

popb	macro
	pla
	sta \1
	endm

;------------------------------------------------------------------------

pushw	macro
	lda \1
	pha
	lda \1+1
	pha
	endm

;------------------------------------------------------------------------

popw	macro
	pla
	sta \1+1
	pla
	sta \1
	endm


;------------------------------------------------------------------------

	ifeq	1

; 16x16 signed multiply, 32 bit result
; 800 cycles max, 500 average

	ai16

	lda \1
	eor \2
	sta \4		; 12

	lda \1
	bpl \@p1
	eor #$ffff
	inc a
	sta \1		; 7/15
\@p1
	lda \2
	bpl \@p2
	eor #$ffff
	inc a
	sta \2		; 7/15
\@p2
	cmp \1
	blo \@2lt1
	ldx \1
	sta \1
	txa
	sta \2		; 7/20
\@2lt1	

	stz \1+2
	stz \2+2
	stz \3

; 1 iteration of multiply

	lsr a	
	beq \@r
	bcc \@0
	tax
	lda \1
	clc
	adc \3
	sta \3
	lda \1+2
	adc \3+2
	sta \3+2
	txa
\@0
	asl \1
	rol \1+2

; 21/50 
; to be repeated 15 times...



\@r
	bit \4		; 10/31
	bpl \@rp
	lda #0
	sec
	sbc \3
	sta \3
	lda #0
	sbc \3+2
	sta \3+2
\@rp
	ai8

	endc


;------------------------------------------------------------------------


	ifeq	1
mulslog   macro
	lda \1
	sta m1
	lda \2
	sta m2
	jsl muls8log_l
	lda m3
	endm
	endc

	ifeq	1
mulslogmac	macro
	ldx \1
	beq \@muls8log1
	ldy \2
	beq \@muls8log2
	lda logtab8s,x
	clc
	adc logtab8s,y
	tay
	txa
	ldx alogtab8s,y
	eor \2
	bpl \@muls8log1
\@muls8log2
	ldx nalogtab8s,y
\@muls8log1 
	endm
	endc

;------------------------------------------------------------------------

muls16mac	macro
	lda \1
	sta wrmpya
	lda \2
	sta wrmpyb

	eor \1
	bmi .\@n

	nop
	nop
	lda rdmpylr
	sta \3
	lda rdmpyhr
	sta \3+1
	jmp .\@

.\@n
	nop
	nop
	lda #0
	sec
	sbc rdmpylr
	sta \3
	lda #0
	sbc rdmpyhr
	sta \3+1
.\@
	endm

;------------------------------------------------------------------------

mulusmac	macro
	lda \1
	sta wrmpya
	lda \2
	sta wrmpyb

	eor \1
	bmi .\@n

	nop
	nop
	lda rdmpylr
	rol a
	lda rdmpyhr
	rol a
	sta \3
	jmp .\@

.\@n
	nop
	nop
	lda #0
	sec
	sbc rdmpylr
	sta \3
	lda #0
	sbc rdmpyhr
	sta \3+1
.\@
	endm

;------------------------------------------------------------------------

mulslogmac	macro

	lda \1
	bmi .\@m1

	asl a
	sta wrmpya

	lda \2
	bmi .\@p1m2
	sta wrmpyb
	nop
	nop
	nop
	nop
	lda rdmpyhr
	jmp .\@end

.\@m1
	eor #255
	inc a
	asl a
	sta wrmpya

	lda \2
	bmi .\@m1m2
	sta wrmpyb
	nop
	jmp .\@endm

.\@m1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
	nop
	nop
	lda rdmpyhr
	jmp .\@end

.\@p1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
.\@endm
	lda #0
	sec
	sbc rdmpyhr
.\@end
	tax

	endm

;------------------------------------------------------------------------

mulslogmacram	macro
	lda \1
	bmi .\@m1

	asl a
	sta.l wrmpya

	lda \2
	bmi .\@p1m2
	sta.l wrmpyb
	nop
	nop
	nop
	nop
	lda.l rdmpyhr
	jmp .\@end

.\@m1
	eor #255
	inc a
	asl a
	sta.l wrmpya

	lda \2
	bmi .\@m1m2
	sta.l wrmpyb
	nop
	jmp .\@endm

.\@m1m2
	eor #255
	inc a
	sta.l wrmpyb
	nop
	nop
	nop
	nop
	lda.l rdmpyhr
	jmp .\@end

.\@p1m2
	eor #255
	inc a
	sta.l wrmpyb
	nop
	nop
.\@endm
	lda #0
	sec
	sbc.l rdmpyhr
.\@end
	tax

	endm


;------------------------------------------------------------------------

mulslog16mac	macro
	lda \1
	bmi .\@m1
	asl a
	sta wrmpya

	lda \2
	bmi .\@p1m2
	sta wrmpyb
	nop
	nop
	nop
	jmp .\@p

.\@m1
	eor #255
	inc a
	asl a
	sta wrmpya

	lda \2
	bmi .\@m1m2
	sta wrmpyb
	nop
	jmp .\@endm

.\@m1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
	nop
	nop
.\@p
	ldx rdmpylr
	lda rdmpyhr
	jmp .\@end

.\@p1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
.\@endm
	lda #0
	sec
	sbc rdmpylr
	tax
	lda #0
	sbc rdmpyhr
.\@end
	endm



;------------------------------------------------------------------------


muls8816mac	macro	; \3.w = \1.b * \2.b
	lda \1
	bmi .\@m1
	sta wrmpya
	lda \2
	bmi .\@p1m2
	sta wrmpyb
	nop
	nop
	nop
	jmp .\@p

.\@m1
	eor #255
	inc a
	sta wrmpya
	lda \2
	bmi .\@m1m2
	sta wrmpyb
	nop
	jmp .\@endm

.\@m1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
	nop
	nop
.\@p
	ldx rdmpylr
	lda rdmpyhr
	jmp .\@end

.\@p1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
.\@endm
	lda #0
	sec
	sbc rdmpylr
	tax
	lda #0
	sbc rdmpyhr
.\@end
	stx \3
	sta \3+1
	endm



;------------------------------------------------------------------------


mlas8816mac	macro	; \3.w += \1.b * \2.b
	lda \1
	bmi .\@m1
	sta wrmpya
	lda \2
	bmi .\@p1m2
	sta wrmpyb
	nop
	nop
	nop
	jmp .\@p

.\@m1
	eor #255
	inc a
	sta wrmpya
	lda \2
	bmi .\@m1m2
	sta wrmpyb
	nop
	jmp .\@endm

.\@m1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
	nop
	nop
.\@p
	ldx rdmpylr
	lda rdmpyhr
	jmp .\@end

.\@p1m2
	eor #255
	inc a
	sta wrmpyb
	nop
	nop
.\@endm
	lda #0
	sec
	sbc rdmpylr
	tax
	lda #0
	sbc rdmpyhr
.\@end
	pha
	txa
	clc
	adc \3
	sta \3
	pla
	adc \3+1
	sta \3+1

	endm


;------------------------------------------------------------------------


mlas16816mac	macro	; \3=\1*\2+\4

	stz \3+1

	lda \2
	bmi .\@frm
	asl a
	sta wrmpya	; fr

	lda \1+1
	bmi .\@xm

.\@xp
	lda \1
	sta wrmpyb	; xl
	nop
	nop
	lda \1+1
	jmp .\@yadd

.\@xm
	shorta
	lda #0
	sec
	sbc \1
	sta wrmpyb	; xl
	lda #0
	sbc \1+1
	jmp .\@ysub

.\@frm
	shorta
	eor #255
	inc a
	asl a
	sta wrmpya	; fr
	lda \1+1
	bmi .\@mxm

.\@mxp
	lda \1
	sta wrmpyb	; xl
	nop
	nop
	nop
	lda \1+1
.\@ysub
	ldy rdmpyhr

	sta wrmpyb	; xh
	sty \3
	a16
	lda \4
	sec
	sbc rdmpylr
	sec
	sbc \3
	jmp .\@y

.\@mxm
	shorta
	lda #0
	sec
	sbc \1
	sta wrmpyb	; xl
	nop
	nop
	lda #0
	sbc \1+1
.\@yadd
	ldy rdmpyhr

	sta wrmpyb	; xh
	sty \3
	a16clc
	lda \4
;	clc
	adc rdmpylr
	clc
	adc \3

.\@y
	sta \4
	a8

	endm




;------------------------------------------------------------------------



mla16mac	macro	; \3=\1*\2+\4

	stz \3+1

	lda \2
	bmi \@frm
	asl a
	sta wrmpya	; fr

	lda \1+1
	bmi \@xm

\@xp
	lda \1
	sta wrmpyb	; xl
	nop
	nop
	lda \1+1
	jmp \@yadd

;	ldy rdmpyhr

;	sta wrmpyb	; xh
;	sty \3
;	a16
;	lda \4
;	clc
;	adc rdmpylr
;	clc
;	adc \3
;	jmp \@y

\@xm
	shorta
	lda #0
	sec
	sbc \1
	sta wrmpyb	; xl
	lda #0
	sbc \1+1
	jmp \@ysub

;	ldy rdmpyhr

;	sta wrmpyb	; xh
;	sty \3
;	a16
;	lda \4
;	sec
;	sbc rdmpylr
;	sec
;	sbc \3
;	jmp \@y


\@frm
	shorta
	eor #255
	inc a
	asl a
	sta wrmpya	; fr
	lda \1+1
	bmi \@mxm

\@mxp
	lda \1
	sta wrmpyb	; xl
	nop
	nop
	nop
	lda \1+1
\@ysub
	ldy rdmpyhr

	sta wrmpyb	; xh
	sty \3
	a16
	lda \4
	sec
	sbc rdmpylr
	sec
	sbc \3
	jmp \@y

\@mxm
	shorta
	lda #0
	sec
	sbc \1
	sta wrmpyb	; xl
	nop
	nop
	lda #0
	sbc \1+1
\@yadd
	ldy rdmpyhr

	sta wrmpyb	; xh
	sty \3
	a16clc
	lda \4
;	clc
	adc rdmpylr
	clc
	adc \3

\@y
	sta \3
	a8

	endm


;------------------------------------------------------------------------


asra16	macro
	cmp #$8000
	ror a
	endm

;------------------------------------------------------------------------


normalise16	macro
	muls	\1,\1,\4
	mlas	\2,\2,\5
	mlas	\3,\3,\5
	divu	#$10000000,\5,\6
	muls	\1,\6,\1
	muls	\2,\6,\2
	muls	\3,\6,\3
	lda	\1+2
	sta	\1
	lda	\2+2
	sta	\2
	lda	\3+2
	sta	\3
	endm


;------------------------------------------------------------------------

muls	macro

	stz	\3
	stz	\3+2

	lda	\1
	bpl	\@1p
	eor	#$ffff
	inc	a
	sta	\1

	lda	\2
	bpl	\@1n2p
	eor	#$ffff
	inc	a
	sta	\2
	jmp	\@1n2n

\@1p
	lda	\2
	bpl	\@1p2p
	eor	#$ffff
	inc	a
	sta	\2

\@1n2n
\@1p2p
	mlau161632mac
	jmp	\@exit

\@1n2p
\@1p2n
	mlau161632nmac

	endm

;------------------------------------------------------------------------


mlau161632mac	macro

; Exact UNSIGNED 16 bit * 16 bit multiply with 32 bit accumulate
;
; \3.l += \1.w * \2.w
;
; Mode:	a16i8
;
; In:	\1 = 16 bit multipier
;	\2 = 16 bit multiplicand
; 	\3 = 32 bit sum
;
; Out:	\3 = 32 bit result
;
; Dead: A,X
;
; Bytes:	70
; Cycles:	108/120

	ldx \2		; L2		3
	stx wrmpya	; 		4	=7

	ldx \1		; L1		3	=3

	stx wrmpyb	;		4
	ldx \1+1	; H1		3
	lda \3		;		4
	clc		;		2
	adc rdmpylr	; R0+=L1*L2	5
	sta \3		; 		4	=22

	stx wrmpyb	; H1		4
	ldx \2+1	; H2		3
	lda \3+1	;		4
	clc		;		2
	adc rdmpylr	; R1+=H1*L2	5
	sta \3+1	;		4	=22

	bcc .\@noc1	; 		9/3	=9/3
	a8
	inc \3+3	; add c to R3
	a16
.\@noc1

	stx wrmpya	; H2		4	=4

	ldx \1		; L1		3	=3

	stx wrmpyb	;		4
	ldx \1+1	; H1		3
	lda \3+1	;		4
	clc		;		2
	adc rdmpylr	; R1+=L1*H2	5
	sta \3+1	;		4	=22

	bcc .\@noc2	;		9/3	=9/3
	a8
	inc \3+3	; add c to R3
	a16
.\@noc2

	stx wrmpyb	; H1		4
	lda \3+2	;		4
	clc		;		2
	adc rdmpylr	; R2+=H1*H2	5
	sta \3+2	;		4	=19	= 108/120

	endm

;------------------------------------------------------------------------

mlau161632nmac	macro

; Exact UNSIGNED 16 bit * 16 bit multiply with NEGATIVE 32 bit accumulate
;
; \3.l -= \1.w * \2.w
;
; Mode:	a16i8
;
; In:	\1 = 16 bit multipier
;	\2 = 16 bit multiplicand
; 	\3 = 32 bit sum
;
; Out:	\3 = 32 bit result
;
; Dead: A,X
;
; Bytes:	62
; Cycles:	108/132

	ldx \2		; L2		3
	stx wrmpya	; 		4	=7

	ldx \1		; L1		3	=3

	stx wrmpyb	;		4
	ldx \1+1	; H1		3
	lda \3		;		4
	sec		;		2
	sbc rdmpylr	; R0+=L1*L2	5
	sta \3		; 		4	=22

	stx wrmpyb	; H1		4
	ldx \2+1	; H2		3
	lda \3+1	;		4
	sec		;		2
	sbc rdmpylr	; R1+=H1*L2	5
	sta \3+1	;		4	=22

	bcs .\@noc1	; 		15/3	=15/3
	a8
	dec \3+3	; sub c to R3
	a16
.\@noc1

	stx wrmpya	; H2		4	=4

	ldx \1		; L1		3	=3

	stx wrmpyb	;		4
	ldx \1+1	; H1		3
	lda \3+1	;		4
	sec		;		2
	sbc rdmpylr	; R1+=L1*H2	5
	sta \3+1	;		4	=22

	bcs .\@noc2	; 		15/3	=15/3
	a8
	dec \3+3	; sub c to R3
	a16
.\@noc2

	stx wrmpyb	; H1		4
	lda \3+2	;		4
	sec		;		2
	sbc rdmpylr	; R2+=H1*H2	5
	sta \3+2	;		4	=19	= 108/132

	endm


;------------------------------------------------------------------------

muls161632mac	macro

; Exact SIGNED 16 bit * 16 bit multiply with 32 bit result
;
; \3.l = \1.w * \2.w    ( \4.w and \5.w used as temps )
;
; Mode:	a16i8
;
; In:	\1 = 16 bit multipier
;	\2 = 16 bit multiplicand
;
; Out:	\3 = 32 bit result
;
; Dead: A,X
;
; Bytes:	62
; Cycles:	102

	stz \3
	stz \3+2	;		=8

	lda \1
	eor \2
	php		;		=11

	lda \1
	bpl .\@1p	;		=14/11
	eor #$ffff
	inc a
.\@1p
	sta \4

	lda \2
	bpl .\@2p	;		=14/11
	eor #$ffff
	inc a
.\@2p
	sta \5

	mlau161632mac \4,\5,\3

	plp
	bpl .\@3p	;		30/7

	lda #0
	sec
	sbc \3
	sta \3
	lda #0
	sbc \3+2
	sta \3+2
.\@3p

	endm

;------------------------------------------------------------------------


mlas161632mac	macro

; Exact SIGNED 16 bit * 16 bit multiply with 32 bit accumulate
;
; \6.l += \1.w * \2.w	(\3.l,\4.w,\5.w are temps)
;
; Mode:	a16i8
;
; In:	\1 = 16 bit multipier
;	\2 = 16 bit multiplicand
; 	\6 = 32 bit sum
;
; Out:	\6 = 32 bit result
;
; Dead: A,X
;
; Bytes:	62
; Cycles:	102

	stz \3
	stz \3+2	;		=8

	lda \1
	eor \2
	php		;		=11

	lda \1
	bpl .\@1p	;		=14/11
	eor #$ffff
	inc a
.\@1p
	sta \4

	lda \2
	bpl .\@2p	;		=14/11
	eor #$ffff
	inc a
.\@2p
	sta \5

	mlau161632mac \4,\5,\3

	plp
	bpl .\@3p	;		33/31

	lda \6
	sec
	sbc \3
	sta \6
	lda \6+2
	sbc \3+2
	sta \6+2

	jmp .\@3n
.\@3p
	lda \6
	clc
	adc \3
	sta \6
	lda \6+2
	adc \3+2
	sta \6+2
.\@3n
	endm


;------------------------------------------------------------------------

	ifeq	1

mlas161632mac	macro

; Exact SIGNED 16 bit * 16 bit multiply with 32 bit accumulate
;
; 32 bit YX += \1 * \2
;
; Mode:	ai16
;
; In:	\1 16 bit
;	\2 16 bit
; 	Y = hi 16 bit sum
;	X = lo 16 bit sum
;
; Out:	Y = hi 16 bit result
;	X = lo 16 bit result
;
; Dead: A,\1,\2
;
; Bytes:	48
; Cycles:	7 to 600

	lda	\2
	beq	\@exit

	ifeq	1	; signed number optimisation test

	bpl	\@pl2	; optimise \2 if <0

	lda	\1
	beq	\@exit
	bpl	\@pl1

	eor	#$ffff	; \2<0 and \1<0 so neg both
	inc	a
	sta	\1
	lda	\2
	eor	#$ffff
	inc	a
	jmp	\@pl2

\@pl1
	pha		; \2<0 \1>0 so swap
	lda	\2
	sta	\1
	pla
	sta	\2
\@pl2
	endc


	lsr	\2
\@nextloop
	bcs	\@got1
\@find1
	asl	\1
	rol	\1+2
	lsr	\2
	beq	\@exit
	bcc	\@find1
\@got1
	txa
	sbc	\1
	tax
	tya
	sbc	\1+2
	tay

	asl	\1
	rol	\1+2
	lsr	\2
	beq	\@exit
	bcc	\@got0
\@find0
	asl	\1
	rol	\1+2
	lsr	\2
	beq	\@exit
	bcs	\@find0
\@got0
	txa
	adc	\1
	tax
	tya
	adc	\1+2
	tay

	asl	\1
	rol	\1+2
	lsr	\2
	bne	\@nextloop

\@exit

	endm

	endc




;asra16	macro
;	cmp #$8000
;	ror a
;	endm



;------------------------------------------------------------------------

scalep	macro			; \2 > \1

	stz dividend
	lda \1
	sta dividend+2

	cmp #$8000
	ror dividend+2
	ror dividend
	cmp #$8000
	ror dividend+2
	ror dividend		; dividend = \1 * 16384

	lda dividend
	sec
	sbc \1
	sta dividend
	lda dividend+2
	sbc #0
	sta dividend+2		; dividend = \1 * (16384 - 1)

	lda \2			; divisor  = \2
	sta divisor

	ai8
	jsr divu3216
	ai16

	lda quotient		; quotient = \1 * 16383 / \2
	sta \1

	lda #16383		; \2 = 16383
	sta \2

	endm

;------------------------------------------------------------------------


scalepnt	macro

	lda \1
	cmp \2
	blo \@2ge1
	scalep \2,\1
	bra \@1
\@2ge1
	scalep \1,\2
\@1
	endm



adval	equ	63


;------------------------------------------------------------------------

clamppnt macro

	phx
	phy

	lda \1
	bpl \@1p
	eor #$ffff
	inc a
\@1p
	sta \3

	lda \2
	bpl \@2p
	eor #$ffff
	inc a
\@2p
	sta \4

	cmp #adval
	bhs \@scale

	lda \3
	cmp #adval
	lblo \@ok

\@scale
	scalepnt \3,\4

	lda \3
	bit \1
	bpl \@3p
	eor #$ffff
	inc a
\@3p
	sta \1

	lda \4
	bit \2
	bpl \@4p
	eor #$ffff
	inc a
\@4p
	sta \2

	bra \@exit

\@ok
	lda \1
	xba
	and #$ff00
	clc
	adc vanishx
	sta \1

	lda \2
	xba
	and #$ff00
	clc
	adc vanishy
	sta \2
\@exit
	ply
	plx

	endm



;------------------------------------------------------------------------


projmul	macro
	phx
	phy

	a8
	stz	dividend
	stz	dividend+3
	lda	\1+1
	bpl	\@xp
	dec	dividend+3
\@xp
	a16
	lda	\1
	sta	dividend+1

	lda	\2
	beq	\@zpz
	bpl	\@zp
	eor	#$ffff
\@zpz
	inc	a
\@zp
	sta	divisor

	jsr	divs3216

	a16
	lda	quotient+2
	beq	\@q1ok
	inc	a
	beq	\@q1ok
	lda	#16383
	bit	quotient+2
	bpl	\@q1notok
	lda	#-16383
	jmp	\@q1notok
\@q1ok
	lda	quotient
	clc
	adc	\4
\@q1notok
	sta	\3


	a8
	stz	dividend
	stz	dividend+3
	lda	\5+1
	bpl	\@yp
	dec	dividend+3
\@yp
	a16
	lda	\5
	sta	dividend+1

	lda	\2
	beq	\@zpz2
	bpl	\@zp2
	eor	#$ffff
\@zpz2
	inc	a
\@zp2
	sta	divisor

	jsr	divs3216

	a16
	lda	quotient+2
	beq	\@q2ok
	inc	a
	beq	\@q2ok
	lda	#16383
	bit	quotient+2
	bpl	\@q2notok
	lda	#-16383
	jmp	\@q2notok
\@q2ok
	lda	quotient
	clc
	adc	\7
\@q2notok
	sta	\6


	ifeq	0

	lda	\3
	cmp	#16383
	beq	\@overflowed
	cmp	#-16383
	beq	\@overflowed
	lda	\6
	cmp	#16383
	beq	\@overflowed
	cmp	#-16383
	lbne	\@ok

\@overflowed
	lda \1
	bpl \@1p
	eor #$ffff
	inc a
\@1p
	sta x3

	lda \5
	bpl \@2p
	eor #$ffff
	inc a
\@2p
	sta y3

	scalepnt x3,y3

	lda x3
	bit \1
	bpl \@3p
	eor #$ffff
	inc a
\@3p
	sta \3

	lda y3
	bit \5
	bpl \@4p
	eor #$ffff
	inc a
\@4p

\@ok

	endc

	ai8
	ply
	plx

	endm


;------------------------------------------------------------------------

;projlog2mac x1,z1,xs,vanishx,y1,ys,vanishy

maxproj	equ	120

projmuls	macro

	ai16

	ldy \2
	bpl \@pzp

	tya
	eor #$ffff
	inc a
	tay

	lda #0
	sec
	sbc \1
	sta \1

	lda #0
	sec
	sbc \5
	sta \5
	
\@pzp
	a8

	cpy #256
	lbhs \@z2
;	ldy #256

	ifeq	0	; 16/8 project

	cpy #0
	bne \@pd0
	ldy #1
\@pd0
	bpl \@pdzp
	ldy #1
\@pdzp
	a16i8


	ifeq	1

	lda \1
	bpl \@1p
	eor #$ffff
	inc a
\@1p
	sta x3

	lda \5
	bpl \@2p
	eor #$ffff
	inc a
\@2p
	sta y3

	a8
	tya
	cmp x3+1
	a16
	blo \@zltx

	a8
	tya
	cmp y3+1
	a16
	lbhs \@ok

\@zltx
	
	lda y3
	cmp #256	;adval
	bhs \@scale

	lda x3
	cmp #256	;adval
	lblo \@ok

\@scale



;	phx
;	phy
	scalepnt x3,y3
;	ply
;	plx

	lda x3
	bit \1
	bpl \@3p
	eor #$ffff
	inc a
\@3p
	sta \3

	lda y3
	bit \5
	bpl \@4p
	eor #$ffff
	inc a
\@4p
	jmp \@proj

\@ok

	endc


	lda \1
	bmi \@dxn
	
	cmp #maxproj
	blo \@pd1
	lda #maxproj-1
\@pd1
	xba
	sta wrdivl
	sty wrdivb
	nop
	nop
	nop
	nop
	nop
	nop
	lda \4
	clc
	adc rddivlr
	jmp \@dxp

\@dxn
	eor #$ffff
	inc a
	cmp #maxproj
	blo \@pd2
	lda #maxproj-1
\@pd2
	xba
	sta wrdivl
	sty wrdivb
	nop
	nop
	nop
	nop
	nop
	nop
	lda \4
	sec
	sbc rddivlr
\@dxp
	sta \3

	lda \5
	bmi \@dyn
	
	cmp #maxproj
	blo \@pd3
	lda #maxproj-1
\@pd3
	xba
	sta wrdivl
	sty wrdivb
	nop
	nop
	nop
	nop
	nop
	nop
	lda \7
	clc
	adc rddivlr
	jmp \@dyp

\@dyn
	eor #$ffff
	inc a
	cmp #maxproj
	blo \@pd4
	lda #maxproj-1
\@pd4
	xba
	sta wrdivl
	sty wrdivb
	nop
	nop
	nop
	nop
	nop
	nop
	lda \7
	sec
	sbc rddivlr
\@dyp
	jmp \@proj

	shorta
	longi

	endc



\@z2
	stz \3+1
	stz \6+1

	cpy #maxztab/8
	blo \@z
	a16
	tya
	asra16
	tay
	lda \1
	asra16
	sta \1
	lda \5
	asra16
	sta \5
	a8
	jmp \@z

	cpy #maxztab/4
	blo \@z
	a16
	tya
	asra16
	asra16
	tay
	lda \1
	asra16
	asra16
	sta \1
	lda \5
	asra16
	asra16
	sta \5
	a8
	
	cpy #maxztab
	blo \@z
	ldy #maxztab-1
\@z
	lda ztab,y
	sta wrmpya	; 1/z


	lda \1+1
	bmi \@xm

	lda \1
	sta wrmpyb	; xl
	i8
	nop
	lda \1+1
	ldy rdmpyhr

	sta wrmpyb	; xh
	sty \3
	a16
	lda \4
	clc
	adc rdmpylr
	clc
	adc \3
	jmp \@y

\@xm
	shorta
	lda #0
	sec
	sbc \1
	sta wrmpyb	; xl
	i8
	lda #0
	sbc \1+1
	ldy rdmpyhr

	sta wrmpyb	; xh
	sty \3
	a16
	lda \4
	sec
	sbc rdmpylr
	sec
	sbc \3

\@y
	sta \3
	a8
	lda \5+1
	bmi \@ym

	lda \5
	sta wrmpyb	; yl
	nop
	nop
	nop
	lda \5+1
	ldy rdmpyhr

	sta wrmpyb	; yh
	sty \6
	a16
	lda \7
	clc
	adc rdmpylr
	clc
	adc \6
	jmp \@proj

\@ym
	shorta
	lda #0
	sec
	sbc \5
	sta wrmpyb	; yl
	nop
	nop
	lda #0
	sbc \5+1
	ldy rdmpyhr

	sta wrmpyb	; yh
	sty \6
	a16
	lda \7
	sec
	sbc rdmpylr
	sec
	sbc \6
\@proj
	sta \6

	ai8

	endm





;------------------------------------------------------------------------




	ifeq	1
mulslog16 macro
	lda \1
	sta m1
	lda \2
	sta m2
	jsr muls816log
	ldx m4
	lda m3
	endm
	endc


	ifeq	1
mulslog16mac	macro

	ldx \1
	beq \@muls816log0
	ldy \2
	bne \@muls816log0y
	ldx #0
\@muls816log0 
	stx m3
	jmp \@muls816log0y0
\@muls816log0y 
	lda logtab8s,x
	clc
	adc logtab8s,y
	tay
	txa
	ldx alogtab8s,y
	eor \2
	bpl \@muls816log1
	ldx nalogtab8s,y
\@muls816log1 
	stx m3
	ldx alogtab8sl,y
	cmp #0
	bpl \@muls816log2
	ldx nalogtab8sl,y
\@muls816log2 
\@muls816log0y0 
	stx m4
	lda m3

	endm
	endc

;------------------------------------------------------------------------


	ifeq	0
mulslog168 macro
	 lda \1
	 sta m1
	 lda \1+1
	 sta m2
	 lda \2
	 sta m3
	 jsl muls816log16_l
	 endm 
	endc


addbw	macro
	lda \1,x
	and #$00ff	
	bit #128	
	beq \@p
	ora #$ff00
\@p
	clc
	adc \2
	sta \3
	endm

addbwsh	macro
	lda \1,x
	and #$00ff	
	bit #128	
	beq \@p
	ora #$ff00
\@p
	rept \4
	asl a
	endr
	clc
	adc \2
	sta \3
	endm

addaw macro
	clc
	bpl pos\@
	adc \1
	sta \2
	lda #255
	bmi neg\@
pos\@
	adc \1
	sta \2
	lda #0
neg\@
	adc \1+1
	sta \2+1
	endm


;------------------------------------------------------------------------

projlog2mac	macro

	projlogzmac \1,\2
	lda	\2
	sta	pz
	projlogxmac \1,\2,\3,\4
	projlogxmac \5,pz,\6,\7

	endm


;------------------------------------------------------------------------


	ifeq	0

projlogmac	macro

	projlogzmac \1,\2
	projlogxmac \1,\2,\3,\4

	endm

	endc

;------------------------------------------------------------------------

projlogzmac	macro

	ldx	#0
	lda	\2+1
	beq	\@projlx4
	inx
	lsr	a
	beq	\@projlx51
\@projlx5
	ror	\2		;2
	inx
	lsr	a
	bne	\@projlx5
\@projlx51
	ror	\2		;2
\@projlx4
	stx	shiftz

	endm

;------------------------------------------------------------------------


projlogxmac	macro

	ldx	#0
	lda	\1+1
	sta	sign
	bpl	\@projlx1
	negw	\1		;1
\@projlx1
	beq	\@projlx21
	inx
	lsr	a
	beq	\@projlx31
\@projlx3
	ror	\1		;1
	inx
	lsr	a
	bne	\@projlx3
\@projlx31
	ror	\1		;1
	jmp	\@projlx2
\@projlx21
	lda	\1
	bmi	\@projlx2
	bne	\@projlx22
	mov	\4,\3
	jmp	\@projlx0

\@projlx22
	dex
	asl	a
	bpl	\@projlx22
	sta	\1		;1
\@projlx2

	lda	\2
	cmp	\1
	bcc	\@projlx8
\@projlx81
	dex
	lsr	a
	cmp	\1
	bcs	\@projlx81
	sta	\2		;2
\@projlx8

	txa
	sec
	sbc	shiftz
	sta	shift

	ldx	\1
	lda	logtab8u,x
	ldx	\2
	sec
	sbc	logtab8u,x
	tax
	lda	alogtab8uh,x
	sta	\3+1
	lda	alogtab8ul,x

	ldx	shift
	bmi	\@projlx10
	beq	\@projlx6
\@projlx7
	asl	a
	rol	\3+1
	dex
	bne	\@projlx7
	jmp	\@projlx6
\@projlx10
	lsr	\3+1
	ror	a
	inx
	bne	\@projlx10
\@projlx6
	sta	\3

	bit	sign
	bpl	\@projlx91
	sub	\3,\4,\3
	jmp	\@projlx0
\@projlx91
	add	\3,\4,\3
\@projlx0

	endm



;------------------------------------------------------------------------


	ifeq	1

projlogmac	macro
	lda	\1
	ora	\1+1
	bne	\@projlx00
	mov	\4,\3
	jmp	\@projlx0
\@projlx00
	ldx	#0
	lda	\2+1
;	bmi	\@projlx9
	beq	\@projlx4
\@projlx5
	inx
	lsr	a
	php
	ror	\2
	plp
	bne	\@projlx5
\@projlx4
	stx	shift
	ldx	#0
	lda	\1+1
	sta	sign
	bpl	\@projlx1
	negw	\1
\@projlx1
	beq	\@projlx21
\@projlx3
	inx
	lsr	a
	php
	ror	\1
	plp
	bne	\@projlx3
	beq	\@projlx2
\@projlx21
	lda	\1
	bmi	\@projlx2
\@projlx22
	dex
	asl	a
	bpl	\@projlx22
	sta	\1
\@projlx2
	lda	\2
	cmp	\1
	bcc	\@projlx8
\@projlx81
	dex
	lsr	a
	cmp	\1
	bcs	\@projlx81
	sta	\2
\@projlx8
	txa
	sec
	sbc	shift
	sta	shift
	ldx	\1
	ldy	\2
	lda	logtab8u,x
	sec
	sbc	logtab8u,y
	tax
	lda	alogtab8uh,x
	sta	\3+1
	lda	alogtab8ul,x
	sta	\3
	ldy	shift
	beq	\@projlx6
	bmi	\@projlx10
\@projlx7
	asl	a
	rol	\3+1
	dey
	bne	\@projlx7
	jmp	\@projlx61
\@projlx10
	lsr	\3+1
	ror	a
	iny
	bne	\@projlx10
\@projlx61
	sta	\3
\@projlx6
	lda	sign
	bpl	\@projlx91
	sub	\3,\4,\3
	jmp	\@projlx0
\@projlx91
	add	\3,\4,\3
\@projlx0

	endm

	endc

;------------------------------------------------------------------------
chkalc	MACRO
	IFEQ	alcon
	progress_off
	printf	"Error: ALC used in %$6:%l%n"
	progress_on
	ENDC
	ENDM

;------------------------------------------------------------------------

;Aloc zero page RAM
zalc	macro
	chkalc
\1	equ	zmempt
zmempt	=	zmempt+\2
	endm


;------------------------------------------------------------------------

;Aloc work RAM
alc	macro
	chkalc
\1	equ	wmempt
wmempt	=	wmempt+\2
	endm

;------------------------------------------------------------------------

;Aloc extended RAM
xalc	macro
	chkalc
\1	equ	xmempt
xmempt	=	xmempt+\2
	endm

;------------------------------------------------------------------------

;Aloc interleaved byte table in extended RAM
xalcp	macro
	chkalc
\1	equ	xmempt
\2	equ	xmempt+1
xmempt	=	xmempt+\3*2
	endm

;------------------------------------------------------------------------

;Aloc Mario chip RAM
malc	macro
\1	equ	mmempt
mmempt	=	mmempt+\2
	endm

;------------------------------------------------------------------------

;Aloc Mario chip RAM lo mem
zmalc	macro
\1	equ	zmmempt
zmmempt	=	zmmempt+\2
	endm

;------------------------------------------------------------------------


;Aloc video RAM
valc	macro
\1	equ	vmempt
vmempt	=	vmempt+\2
	endm


;------------------------------------------------------------------------

;Aloc stucture
structure	macro
stupt	=	\1
	endm

;------------------------------------------------------------------------

struct	macro
\1	equ	stupt
stupt	=	stupt+\2
	endm


;------------------------------------------------------------------------
a8	macro ; set A to 8 bit
	shorta
	sep	#p_a
	endm

;------------------------------------------------------------------------

i8	macro ; Set X/Y to 8 bit
	shorti
	sep	#p_x
	endm

;------------------------------------------------------------------------

a16	macro ; set A to 16 bit
	longa
	rep	#p_a
	endm

;------------------------------------------------------------------------

i16	macro ; Set X/Y to 16 bit
	longi
	rep	#p_x
	endm

;------------------------------------------------------------------------

a8sec	macro ; set A to 8 bit and carry flag
	shorta
	sep	#p_a+p_c
	endm

;------------------------------------------------------------------------

i8sec	macro ; Sets X/Y to 16 bit and sets carry flag
	shorti
	sep	#p_x+p_c
	endm

;------------------------------------------------------------------------

a16clc	macro ; sets A to 16 bit and clears carry flag
	longa
	rep	#p_a+p_c
	endm

;------------------------------------------------------------------------

i16clc	macro ; Sets X/Y to 16 bit and clears carry flag
	longi
	rep	#p_x+p_c
	endm

;------------------------------------------------------------------------

ai16	macro ;  sets A/X/Y to 16 bit
	longa
	longi
	rep	#p_a+p_x
	endm

;------------------------------------------------------------------------

ai8	macro ;  sets A/X/Y to 8 bit
	shorta
	shorti
	sep	#p_a+p_x
	endm

;------------------------------------------------------------------------

ai16clc	macro ; sets A/X/Y to 16 bit, and carry flags
	longa
	longi
	rep	#p_a+p_x+p_c
	endm

;------------------------------------------------------------------------

ai8sec	macro ; sets A/X/Y to 8 bit, and sets carry flag
	shorta
	shorti
	sep	#p_a+p_x+p_c
	endm

;------------------------------------------------------------------------

a8i16	macro ; sets A to 8 bit and X/Y to 16 bit
	shorta
	longi
	sep	#p_a
	rep	#p_x
	endm

;------------------------------------------------------------------------

a16i8	macro ; sets A to 16 bit and X/Y to 8 bit
	shorti
	longa
	sep	#p_x
	rep	#p_a
	endm

;------------------------------------------------------------------------

a8i16clc	macro ; sets A to 8 bit, and clears carry flag
	shorta
	longi
	sep	#p_a
	rep	#p_x+p_c
	endm

;------------------------------------------------------------------------

a16i8clc	macro ; sets A to 16 bit and clears carry flag
	shorti
	longa
	sep	#p_x
	rep	#p_a+p_c
	endm

;------------------------------------------------------------------------

a8i16sec	macro ; sets A to 8 bit and sets carry flag
	shorta
	longi
	sep	#p_a+p_c
	rep	#p_x
	endm

;------------------------------------------------------------------------

a16i8sec	macro ; set A to 16 bit and sets carry flag
	shorti
	longa
	sep	#p_x+p_c
	rep	#p_a
	endm

;------------------------------------------------------------------------

sprint	macro
	IFEQ	LONGA
	lda	#<((\1)*col_size+(\2)*32)
	sta	printpt
	lda	#>((\1)*col_size+(\2)*32)
	sta	printpt+1
	ELSEIF
	lda	#(\1)*col_size+(\2)*32
	sta	printpt
	ENDC
	endm

;------------------------------------------------------------------------

printb	macro
	IFNE	NARG
	pha
	sprint	(\1),(\2)
	pla
	ENDC
	jsl	printb_l
	endm
;------------------------------------------------------------------------
printmt	macro	[x,y,clip]	; prints string in X
	savemode
	ai16
	IFEQ	NARG-3
	lda	#{clip}
	sta.l	m_textrightclip
	ELSEIF
	lda	#224
	sta.l	m_textrightclip
	ENDC
	lda	#{x}
	sta.l	m_x1
	lda	#{y}
	sta.l	m_y1
	txa
	sta.l	m_txtdata
	a8
	lda	#mprintclippedstr>>16
	ldx	#mprintclippedstr&WM
	jsl	runmario_l
	returnmode
	endm
;------------------------------------------------------------------------
printd	macro
	IFNE	NARG
	pha
	sprint	(\1),(\2)
	pla
	ENDC
	jsl	printbd_l
	endm

;------------------------------------------------------------------------
printsd	macro
	IFNE	NARG
	pha
	sprint	(\1),(\2)
	pla
	ENDC
	jsl	printbsd_l
	endm

;------------------------------------------------------------------------

printw	macro
	IFNE	NARG
	pha
	sprint	(\1),(\2)
	pla
	ENDC
	jsl	printw_l
	endm

;------------------------------------------------------------------------

;sprint	macro
;scp\@	=	(\1)*col_size+(\2)*32
;	movi	scp\@,printpt
;	endm

	ifeq	1

GENOCODE	MACRO	;Num (1 or 2) 
	ldy	#0
	lda	X\1
	cmp	clx1	;bit 3
	bpl	.goc1\@
	ldy	#8
	bra	.goc3\@
.goc1\@	cmp	clx2	;bit 1
	bmi	.goc3\@
	beq	.goc3\@
	ldy	#2
.goc3\@	lda	y\1	;bit 2
	cmp	cly1
	bpl	.goc2\@
	tya
	ora	#4
	tay
	bra	.goc4\@
.goc2\@	cmp	cly2	;bit 0
	bmi	.goc4\@
	beq	.goc4\@
	iny
.goc4\@	sty	OCODE\1
	ENDM

	endc

;------------------------------------------------------------------------

GENOCODE	MACRO	;Num (1 or 2) 
	ldy	#0
	lda	X\1
	cmpbpl	clx1,.goc1\@	;bit 3
	ldy	#8
	bra	.goc3\@
.goc1\@	ldx	x\1
	cmpbmi	clx2,.goc3\@	;bit 1
	beq	.goc3\@
	ldy	#2
.goc3\@	lda	y\1	;bit 2
	cmpbpl	cly1,.goc2\@
	tya
	ora	#4
	tay
	bra	.goc4\@
.goc2\@	lda	y\1
	cmpbmi	cly2,.goc4\@	;bit 0
	beq	.goc4\@
	iny
.goc4\@	sty	OCODE\1
	ENDM

;------------------------------------------------------------------------


div88f	macro	;\1.\2 =  \3 / \4
;olonga	=	longa
	php
	a8
	lda	\3
	bpl	.dndp\@
	sec
	lda	#0
	sta	wrdivl
	sbc	\3
	sta	wrdivh
	lda	\4
	sta	wrdivb
	rept	6
	nop
	endr
	sec
	lda	#0
	sbc	rddivlr
	sta	\2
	lda	#0
	sbc	rddivhr
	sta	\1
	bra	.done\@

.dndp\@	lda	#0
	sta	wrdivl
	lda	\3
	sta	wrdivh
	lda	\4
	sta	wrdivb
	rept	8	
	nop
	endr
	lda	rddivlr
	sta	\2
	lda	rddivhr
	sta	\1
.done\@	plp
;	ifne	olonga
;	longa
;	endc
	endm

;------------------------------------------------------------------------

div8f8f	macro	;\1.\2 =  \3.\4 / \5
	php
	ai8
	lda	\3
	bpl	.dndp\@
	sec
	lda	#0
	sbc	\4
	sta	wrdivl
	lda	#0
	sbc	\3
	sta	wrdivh
	lda	\5
	sta	wrdivb
	rept	6
	nop
	endr
	sec
	lda	#0
	sbc	rddivlr
	sta	\2
	lda	#0
	sbc	rddivhr
	sta	\1
	bra	.done\@

.dndp\@	lda	\4
	sta	wrdivl
	lda	\3
	sta	wrdivh
	lda	\5
	sta	wrdivb
	rept	8	
	nop
	endr
	lda	rddivlr
	sta	\2
	lda	rddivhr
	sta	\1
.done\@	plp
	endm


;------------------------------------------------------------------------

udiv88f	macro	;\1.\2 =  \3 / \4
;olonga	=	longa
	php
	a8
	lda	#0
	sta.l	wrdivl
	lda	\3
	sta.l	wrdivh
	lda	\4
	sta.l	wrdivb
	rept	8	
	nop
	endr
	lda.l	rddivlr
	sta	\2
	lda.l	rddivhr
	sta	\1
.done\@	plp
;	ifne	olonga
;	longa
;	endc
	endm



;------------------------------------------------------------------------



divs16816mac	macro		; \3.w = \1.w / \2.b	(a16i8)

	ldx	\2
	bpl	\@2p

	txa
	eor	#$ffff
	inc	a
	tax

	lda	\1
	bpl	\@2n1p

	eor	#$ffff
	inc	a
	sta	wrdivl
	stx	wrdivb
	jmp	\@3p

\@2n1p
	sta	wrdivl
	stx	wrdivb
	jmp	\@3n

\@2p
	lda	\1
	bpl	\@2p1p
	eor	#$ffff
	inc	a
	sta	wrdivl
	stx	wrdivb
	nop
\@3n
	nop
	nop
	nop
	nop
	nop
	lda	#0
	sec
	sbc	rddivlr
	jmp	\@exit

\@2p1p
	sta	wrdivl
	stx	wrdivb
	nop
\@3p
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	lda	rddivlr
\@exit
	sta	\3

	endm

;------------------------------------------------------------------------


divs168u16mac	macro		; \3.w = \1.w / \2.b	(a16i8)

	ldx	\2
	lda	\1
	bpl	\@2p1p

	eor	#$ffff
	inc	a
	sta	wrdivl
	stx	wrdivb
	nop
\@3n
	nop
	nop
	nop
	nop
	nop
	lda	#0
	sec
	sbc	rddivlr
	jmp	\@exit

\@2p1p
	sta	wrdivl
	stx	wrdivb
	nop
\@3p
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	lda	rddivlr
\@exit
	sta	\3

	endm

;------------------------------------------------------------------------

	IFEQ	1

colour	macro
	phx
	ifne	mario_test1
;	sta.l	marc
	db	$8f
	dw	marc&$ffff
	db	marc>>16
	endc
	tax
	lda colourtab0,x
	sta mask1
	lda colourtab1,x
	sta mask1+1
	lda colourtab2,x
	sta mask2
	lda colourtab3,x
	sta mask2+1
	plx
	endm

colouri	macro
	ifne	mario_test1
	lda	#\1
;	sta.l	marc
	db	$8f
	dw	marc&$ffff
	db	marc>>16
	endc
	lda colourtab0+\1
	sta mask1
	lda colourtab1+\1
	sta mask1+1
	lda colourtab2+\1
	sta mask2
	lda colourtab3+\1
	sta mask2+1
	endm

	ENDC

;------------------------------------------------------------------------


MOVIlh	MACRO
	LDA	#<(\1)
	STA	\2
	LDA	#>(\1)
	STA	\2
	ENDM

;------------------------------------------------------------------------


prb	macro
	sprint (\1),(\2)
	lda \3
	jsl printb_l
	endm

;------------------------------------------------------------------------

prw	macro
	sprint (\1),(\2)
	lda \3+1
	jsl printb_l
	lda \3
	jsl printb_l
	endm

;------------------------------------------------------------------------

prmat	macro
	prb 4,1,\111
	prb 7,1,\112
	prb 10,1,\113

	prb 4,2,\121
	prb 7,2,\122
	prb 10,2,\123

	prb 4,3,\131
	prb 7,3,\132
	prb 10,3,\133
	endm

;------------------------------------------------------------------------

prmatw	macro
	prw 4,2,\111w
	prw 9,2,\112w
	prw 14,2,\113w

	prw 4,3,\121w
	prw 9,3,\122w
	prw 14,3,\123w

	prw 4,4,\131w
	prw 9,4,\132w
	prw 14,4,\133w
	endm

;------------------------------------------------------------------------

copymat macro		; mat \2 = mat \1
	lda \111
	sta \211
	lda \112
	sta \212
	lda \113
	sta \213

	lda \121
	sta \221
	lda \122
	sta \222
	lda \123
	sta \223

	lda \131
	sta \231
	lda \132
	sta \232
	lda \133
	sta \233
	endm

;------------------------------------------------------------------------

copymat16 macro		; mat \2 = mat \1
	lda \111w
	sta \211w
	lda \112w
	sta \212w
	lda \113w
	sta \213w

	lda \121w
	sta \221w
	lda \122w
	sta \222w
	lda \123w
	sta \223w

	lda \131w
	sta \231w
	lda \132w
	sta \232w
	lda \133w
	sta \233w
	endm

;------------------------------------------------------------------------

unitmat macro		; mat \1 = unit mat
	lda #127
	sta \111
	stz \112
	stz \113

	stz \121
	sta \122
	stz \123

	stz \131
	stz \132
	sta \133

	stz \111w
	stz \112w
	stz \113w

	stz \121w
	stz \122w
	stz \123w

	stz \131w
	stz \132w
	stz \133w
	endm

dcwr	macro
	rept	\2
	dw	\1&$ffff
	endr
	endm


;------------------------------------------------------------------------

_next	equ	0
_prev	equ	2

;Add item to linked list after X
;X & Y 16 bit

l_add	macro	*List,freelist,error
;uses A, X & Y
;Null list X = zero
;exit X points to new item
;Error does jmp param 3
ar_size	=	longa
	ifeq	longa
	a16
	endc

	txy
	ldx	\2	;free list
	bne	.ok\@
			;error abort
	ifeq	ar_size
	a8
	endc
	tyx		;x not changed

	jmp	\3
	longa

.ok\@	lda	_next,x	;re-link free list
	sta	\2
			;y prev x new
	tya
	bne	.NotStart\@
	lda	\1
	sta	_next,x
	stz	_prev,x
	stx	\1
	bra	.WasStart\@
.NotStart\@	lda.w	_next,y
	sta	_next,x
	stx	_next,y
	sty	_prev,x
.WasStart\@	ldy	_next,x
	beq	.EndList\@
	stx	_prev,y
.EndList\@             		;X points to new item
	ifeq	ar_size
	a8
	endc
	endm
;------------------------------------------------------------------------


ar_size	=	0

;remove item X from linked list

l_rem	macro	*List,freelist
;uses A, X & Y
;Null list X = zero
;exit X points to removed block
ar_size	=	longa
	ifeq	longa
	a16
	endc

;******* Remove immunity ptr
	phx
	txa
	ldx	allst

.rem\@	cmp	al_immuneptr,x
	bne	.rem2\@
	stz	al_immuneptr,x
.rem2\@
	cmp	al_ptr,x
	bne	.rem3\@
	stz	al_ptr,x
.rem3\@
	cmp	al_fireobjptr,x
	bne	.rem4\@
	stz	al_fireobjptr,x
.rem4\@
	cmp	al_collobjptr,x
	bne	.remok\@
	stz	al_collobjptr,x

.remok\@	ldy	_next,x
	tyx
	bne	.rem\@
	plx

	jsl	sallfree_l	; free any memory allocated

	ldy	_prev,x
	bne	.NotFirst\@
	ldy	_next,x
	sty	\1
	lda	#0
	sta.w	_prev,y
	bra	.AddToFree\@
.NotFirst\@	phx
	lda	_next,x
	tax
	stx	_next,y
	cmp	#0
	beq	.justpullit\@
	sty	_prev,x
.justpullit\@
	plx
.AddToFree\@
	lda	\2
	sta	_next,x
	stx	\2
	ifeq	ar_size
	a8
	endc
	endm

;------------------------------------------------------------------------


;Format free list (ai16)
FmtFreeLst	macro	*FreeListPtr,MemBlock,Number,StructSize
	ifeq	longa&longi
	Bad_A_I_Size
	endc
	lda	#\2
	sta	\1
	ldy	#\3
.1\@	tax
	clc
	adc	#\4
	sta	_next,x
	dey
	bne	.1\@
;	tax
	stz	_next,x
	endm

;------------------------------------------------------------------------



rgbw	macro	; r,g,b
	dw	((\3)<<10)+((\2)<<5)+(\1)
	endm

;------------------------------------------------------------------------

shades	macro	; n,r1,g1,b1,r2,g2,b2
ri	=	((\5-\2)<<8)/\1	
gi	=	((\6-\3)<<8)/\1	
bi	=	((\7-\4)<<8)/\1	
rv	=	\2<<8
gv	=	\3<<8
bv	=	\4<<8
	rept	\1
	dw	((bv>>8)<<10)+((gv>>8)<<5)+(rv>>8)
rv	=	rv+ri
gv	=	gv+gi
bv	=	bv+bi
	endr
	endm


;------------------------------------------------------------------------

div2a	macro
	ifeq	longa
	cmp	#$fF
	bne	.nm1\@
	lda	#0
.nm1\@	cmp	#$80
	ror	a
	endc
	ifne	longa
	cmp	#$fFff
	bne	.nm1\@
	lda	#0
.nm1\@	cmp	#$8000
	ror	a
	endc
	endm

;------------------------------------------------------------------------

dw16	macro
	dw	(\1)&$ffff
	endm


;------------------------------------------------------------------------

absdecm	macro
	lda	\1
	beq	.x\@
	bmi	.n\@
	dec	a
	beq	.x\@
	dec	a
	bra	.x\@
.n\@	inc	a
	beq	.x\@
	inc	a
.x\@	sta	\1
	endm

;------------------------------------------------------------------------

sexa	macro
	bit	#$0080
	beq	*+7
	ora	#$ff00
	bra	*+5
	and	#$00ff
	endm

;------------------------------------------------------------------------

calzonof	macro	*worldx,worldz
	lda.\0	1+\2
;	xba
	and	#$00f8
	asl	a
	asl	a
	asl	a
	sta	zoneof
	lda.\0	1+\1
;	xba
	and	#$00f8
	lsr	a
	lsr	a
	clc
	adc	zoneof
	sta	zoneof
	endm


;------------------------------------------------------------------------
	IFEQ	1

menutitle macro
	db	"\1",0
menucnt	=	0
	endm

;------------------------------------------------------------------------

menub	macro
	db	0	;type: 0=byte  1=SUBMENU  2=WORD
	dw	\2&WM	;POINTER TO NUMBER
	db	(\2)>>16
	db	\3,0	;min value
	db	\4,0	;max value
	dw	\5	;pointer to text table if needed
	db	"\1",0	;null terminated text
menucnt	=	menucnt+1
	endm

;------------------------------------------------------------------------

menuw	macro
	db	2	;type
	dw	\2&WM	;POINTER TO NUMBER
	db	(\2)>>16
	dw	\3	;min value
	dw	\4	;max value
	dw	\5	;pointer to text table if needed
	db	"\1",0	;null terminated text
menucnt	=	menucnt+1
	endm

;------------------------------------------------------------------------

	structure	0
	struct	mn_type,1
	struct	mn_var,3
	struct	mn_min,2
	struct	mn_max,2
	struct	mn_txtab,2
	struct	mn_text,0

;------------------------------------------------------------------------

submenu	macro
	db	1
	dw	\2
	db	0
	db	0,0
	db	0,0
	dw	0
	db	"\1",0
menucnt	=	menucnt+1
	endm

;------------------------------------------------------------------------

menuend	macro
	db	-1,menucnt
	endm

	ENDC
;------------------------------------------------------------------------



startdebug	macro
	IFNE	debuginfo2
amode	=	longa
	IFNE	longa
	a8
	ENDC

	IFEQ	NARG
	pha
	ENDC
	lda	#%00111111
	sta.l	mosaic
	IFEQ	NARG
	pla
	ENDC

	IFNE	amode
	a16
	ENDC

	ENDC
	endm

;------------------------------------------------------------------------

enddebug	macro
	IFNE	debuginfo2
amode	=	longa
	IFNE	longa
	a8
	ENDC
	pha
	lda	#0
	sta.l	mosaic
	pla
	IFNE	amode
	a16
	ENDC
	ENDC
	endm


;------------------------------------------------------------------------


screenon	macro
	lda	hdmaen_gc
	sta	hdmaen
	lda	#15
	sta	inidisp
	endm

;------------------------------------------------------------------------

screenoff macro
	stz	hdmaen
	lda	#$80
	sta	inidisp
	endm

;------------------------------------------------------------------------


dmabitmap macro
	lda	#$80
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch\1addrb
	ldx	#(\2&$ffff)
	stx	vmaddl
	ldx	#(\3&$ffff)
	stx	ch\1addra1tl
	lda	#(\3>>16)
	sta	ch\1atbank
	ldx	#\4
	stx	ch\1dataddrl
	lda	#1
	sta	ch\1params
	lda	#1<<\1
	sta	mdmaen
	endm

;------------------------------------------------------------------------
; Syntax: blink (value)
blink	macro ; run crash handler
	jsl	doblink\1 ; Jump to BLINK routine
	endm
;------------------------------------------------------------------------

blinkcount	macro
	savemode
	IFNE	longa
	a8
	ENDC

	lda	blinktemp
	inc	a
	sta	blinktemp
	cmp	#\1
	bne	.noblink\@
	blink	2
.noblink\@

	returnmode
	endm

;------------------------------------------------------------------------

Fadedown	macro
	savemode
	a8
	lda	#-1
	sta	fadedir
	returnmode
	endm

;------------------------------------------------------------------------

Fadeup	macro
	savemode
	a8
	lda	#1
	sta	fadedir
	returnmode
	endm

;------------------------------------------------------------------------

WhenFaded	macro
	lda	fadedir
	and	#$ff
	lbeq	\1
	endm

;------------------------------------------------------------------------

UntilFaded	macro
	lda	fadedir
	and	#$ff
	lbne	\1
	endm

;------------------------------------------------------------------------

dmavram macro	;---chan,vmadd,sadd,length
	lda	#$80
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch\1addrb
	ldx	#((\2)&WM)
	stx	vmaddl
	ldx	#((\3)&WM)
	stx	ch\1addra1tl
	lda	#((\3)>>16)
	sta	ch\1atbank
	ldx	#\4
	stx	ch\1dataddrl
	lda	#1
	sta	ch\1params
	lda	#1<<(\1)
	sta	mdmaen
	endm

dmaramram	macro	;---chan,xdestadd,sadd,length
	ifd	\2
	ifne	$7e-\2
	ifne	$7f-\2
	error	"Destination must be in extended RAM"
	endc
	endc
	endc

	lda	#(wmdata&$ff)
	sta	ch\1addrb

	ldx	#(\2)&WM
	stx	wmaddl
	lda	#(\2)&1
	sta	wmaddh

	ldx	#(\3&WM)
	stx	ch\1addra1tl
	lda	#(\3>>16)
	sta	ch\1atbank

	ldx	#\4
	stx	ch\1dataddrl
	stz	ch\1params
	lda	#1<<(\1)
	sta	mdmaen
	endm

;------------------------------------------------------------------------

dmacgram	macro	;chan,cgadd,sadd,len
	lda	#cgdata&$ff
	sta	ch\1addrb
	lda	#\2
	sta	cgadd
	ldx	#\3&WM
	stx	ch\1addra1tl
	lda	#\3>>16
	sta	ch\1atbank
	ldx	#\4
	stx	ch\1dataddrl
	lda	#0
	sta	ch\1params
	lda	#1<<\1
	sta	mdmaen
	endm	

;------------------------------------------------------------------------

dmaoaram	macro	;chan,cgadd,sadd,len
	lda	#oamdata&$ff
	sta	ch\1addrb
	ldx	#\2
	stx	oamaddl
	ldx	#\3&WM
	stx	ch\1addra1tl
	lda	#\3>>16
	sta	ch\1atbank
	ldx	#\4
	stx	ch\1dataddrl
	lda	#0
	sta	ch\1params
	lda	#1<<\1
	sta	mdmaen
	endm	

;------------------------------------------------------------------------

setscreen	macro
	a8i16
	lda	level
	pha
	lda	#\2
	sta	level
	a16
	lda	playertemp
	pha
	lda	#\1
	sta	playertemp
	jsl	setlevelscreen_l
	a16
	pla
	sta	playertemp
	a8
	pla
	sta	level
	endm

;------------------------------------------------------------------------

ijsr	macro
	ifd	\1
		ifeq	(*>>16)-(\1>>16)
		jsr	\1
		elseif
		jsl	\1_l
		endc
	elseif
		jsl	\1_l
	endc
	endm

;------------------------------------------------------------------------
trigse	macro
	ifne	longa
	error_wrong_mode
	endc
	ifeq	longi
	error_wrong_mode
	endc

	ifnc	"a","\1"
	ifnc	"A","\1"
	ifeq	\1-2
	printf	"BOLOX SOMEONE DID A PAUSE%n"
	endc
	lda	#\1		;check priority
	endc
	endc

	jsl	setport3_l

	endm


;------------------------------------------------------------------------

;* x = alien block
trigse_rge	macro
	ifne	longa
	ERROR_wrong_mode
	endc
	ldy	viewpt		;check in range
	ijsr	xzdiffs
	lda	rangexz+1
	cmp	#$15
	bcs	.miss\@
	lda	#\1		;check priority
	cmp	port3snd
	bcs	.miss\@
	sta	port3snd
	stz	port3cnt
.miss\@
	endm

;------------------------------------------------------------------------

txt	macro
	db	\1
	db	"\2",0
	endm

;------------------------------------------------------------------------

gametxt	macro
	phy
	phx

	ldy	#\1&WM
	cpy	txtptrs
	beq	.txt1\@
	cpy	txtptrs+4
	beq	.txt2\@
	ldx	txtptrs
	bne	.txt2\@
.txt1\@	ldx	#txtptrs
	sty	0,x
	ldy	#\2
	sty	2,x
	bra	.ok\@
.txt2\@	ldx	#txtptrs+2
	sty	0,x
	ldy	#\2
	sty	2,x
.ok\@
	plx
	ply
	endm

;------------------------------------------------------------------------

dmaclear	macro
	lda	#128
	sta	ch\1params
	lda	#mpylr&$ff
	sta	ch\1addrb
	ldx	#\2&WM
	stx	ch\1addra1tl
	lda	#\2>>16
	sta	ch\1atbank
	ldx	#\3
	stx	ch\1dataddrl
	lda	#1<<\1
	sta	mdmaen
	endm

;------------------------------------------------------------------------

dmaxvram macro	;---chan,sadd,length
	lda	#$80
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch\1addrb
	stx	vmaddl
	ldx	#((\2)&WM)
	stx	ch\1addra1tl
	lda	#((\2)>>16)
	sta	ch\1atbank
	ldx	#\3
	stx	ch\1dataddrl
	lda	#1
	sta	ch\1params
	lda	#1<<(\1)
	sta	mdmaen
	endm

;------------------------------------------------------------------------

lbra	macro
	jmp	\1
	endm

;------------------------------------------------------------------------
deccgram	macro
	a16
	lda	#\2&WM
	sta.l	m_enddata
	lda	#$1000
	sta.l	m_decaddr
	lda	#0
	sta.l	m_decoffset
	a8
	lda	#\2>>16
	sta.l	m_enddatabnk
	lda	#mdecrunch>>16
	ldx	#mdecrunch&WM
	jsl	runmario_l
	wait
	dmacgram	\1,0,$701000,\3
	endm

;------------------------------------------------------------------------
inccru	macro
	incbin	\2
\1
	ifeq	NARG-3
\3
	endc

	endm
;------------------------------------------------------------------------

decclear	macro
	lda	#mdecclear>>16
	ldx	#mdecclear&WM
	jsl	runmario_l
	endm

;------------------------------------------------------------------------

setlevel	macro
	ifeq	longa
	ERROR_wrong_mode
	endc
	ifeq	longi
	ERROR_wrong_mode
	endc

	lda	newmap
	sta	mapptr
	a8
	lda	newmap+2
	sta	mapbank
	a16
	endm

;------------------------------------------------------------------------


bankend	macro
	IFEQ	NARG
		printf	"BANKEND: Which bank are we talking about here?"
		error+
		MEXIT
	ENDC


	IFNE	FASTROM
bank\1left	=	32768-(*-((\1*$10000)+$808000))
	ELSEIF
	IFEQ	\1
bank\1left	=	65536-*
	ELSEIF
bank\1left	=	32768-(*-((\1*$10000)+$8000))
	ENDC
	ENDC

	IFND	totalromspaceleft
totalromspaceleft	=	0
	ENDC

totalromspaceleft = totalromspaceleft+bank\1left

	IFLT	bank\1left
		progress_off
		printf	"[0;5;31;1mError: Bank \1 is out of space by ",-bank\1left," bytes.[0m%n"
		error+
		progress_on
	ENDC

	; Write free space info to BANKS.CSV
	fopen	+BANKS.CSV
	printf	"\1,%xbank\1left %n"
	fclose	BANKS.CSV

	IFD	_SASM
	printf	"%01-- %xbank\1left bytes free.%00%n"
	ENDC

	IFD	_ARGSFX
	printf	"%01-- %xbank\1left  bytes free.%00%n"
	ENDC

	endm

;------------------------------------------------------------------------
;;	list	T+ on macros
bank	macro

	IFEQ	NARG
		progress_off
		printf	"Chigau matey.. the bank macro needs um.. a thingy on the end."
		error+
		progress_on
		MEXIT
	ENDC

	printf	"%01-- BANK \1:%00%n"

	IFNE	FASTROM
	org	((\1)*$10000)+$808000,$8000*(\1)
	ELSEIF
	org	((\1)*$10000)+$8000,$8000*(\1)
	ENDC

banknum	=	\1
Assembling_bank	=	\1

	endm

;------------------------------------------------------------------------


;--- Mario Nasty mode macros -------------
nastyon	macro
	lda	mario_draw_mode ; Load the current MARIO chip draw mode into A
	ora	#mm_ramn+mm_romn ; OR A With RAM nasty flag + ROM nasty flag (8+16)
	sta	m_scmr ; store A to MARIO chip I/O mode var
	endm

;------------------------------------------------------------------------

ramnastyon	macro
	lda	mario_draw_mode ; Load the current MARIO chip draw mode into A
	ora	#mm_ramn ; OR A with RAM nasty flag (8)
	sta	m_scmr ; store A to MARIO chip I/O mode var
	endm

;------------------------------------------------------------------------

romnastyon	macro
	lda	mario_draw_mode ; Load the current MARIO chip draw mode into A
	ora	#mm_romn ; OR A with ROM nasty flag (16)
	sta	m_scmr ; store A to MARIO chip I/O mode var
	endm

;------------------------------------------------------------------------

nastyoff	macro
	lda	mario_draw_mode ; Load the current MARIO chip draw mode into A
	sta	m_scmr ; store A to MARIO chip I/O mode var
	endm

;------------------------------------------------------------------------

ramnastyoff	macro
	lda	mario_draw_mode ; Load the current MARIO chip draw mode into A
	and	#~mm_ramn ; AND A with RAM nasty flag (8)
	sta	m_scmr ; store A to MARIO chip I/O mode var
	endm

;------------------------------------------------------------------------

romnastyoff	macro
	lda	mario_draw_mode ; Load the current MARIO chip draw mode into A
	and	#mm_romn ; AND A with ROM nasty flag (16)
	sta	m_scmr ; store A to MARIO chip I/O mode var
	endm

;------------------------------------------------------------------------

timeit1	macro
	lda	framec
	sta	time1
	lda	$2137
	lda	$213d	;low
	sta	time1+2
	lda	$213d	;high
	and	#1
	sta	time1+1
	endm

;------------------------------------------------------------------------

timeit2	macro
	a8
	lda	framec
	sta	time2
	lda	$2137
	lda	$213d	;low
	sta	time2+2
	lda	$213d	;high
	and	#1
	sta	time2+1
	endm


;------------------------------------------------------------------------

sprCOLOR0	=	(0<<9)
sprCOLOR1	=	(1<<9)
sprCOLOR2	=	(2<<9)
sprCOLOR3	=	(3<<9)
sprCOLOR4	=	(4<<9)
sprCOLOR5	=	(5<<9)
sprCOLOR6	=	(6<<9)
sprCOLOR7	=	(7<<9)
sprPRI0	=	(0<<12)
sprPRI1	=	(1<<12)
sprPRI2	=	(2<<12)
sprPRI3	=	(3<<12)
sprFLIPX	=	(1<<14)
sprFLIPY	=	(1<<15)
spr	=	0

sPARAM	MACRO
	IFD	spr\1
tmp	=	tmp+spr\1
	ELSEIF
	fail	; unrecognised parameter
	ENDC
	ENDM
;------------------------------------------------------------------------

sprite	macro
	lda	\1
	sta	spriteblk,x
	lda	\2
	sta	spriteblk+1,x
	a16
tmp	=	0
	sPARAM	\4
	sPARAM	\5
	sPARAM	\6
	sPARAM	\7
	lda	\3
	IFNE	tmp
	ora	#tmp
	ENDC
	sta	spriteblk+2,x
	a8
	inx
	inx
	inx
	inx
	endm


;------------------------------------------------------------------------

spralc	macro
	IFEQ	NARG
sprpt	=	spriteblk
	ELSEIF
\1	=	sprpt
sprpt	=	sprpt+\2*4
	ENDC
	endm

;------------------------------------------------------------------------

sprmalc	macro
	IFEQ	NARG
sprmpt	=	0
	ELSEIF
\1	=	sprmpt
sprmpt	=	sprmpt+\2
	ENDC
	endm
;------------------------------------------------------------------------

get_lsz	MACRO
	IFLT	(\1)-$100
lsz	=	1
	ELSEIF
lsz	=	2
	ENDC
	ENDM
;------------------------------------------------------------------------

get_asz	MACRO
	IFEQ	LONGA
asz	=	1
	ELSEIF
asz	=	2
	ENDC
	ENDM
;------------------------------------------------------------------------

label	MACRO
l\@	equ	*
	ENDM
;------------------------------------------------------------------------

printf	MACRO
; not supported with other assemblers
	ENDM
;------------------------------------------------------------------------

fopen	MACRO
; not supported with other assemblers
	ENDM
;------------------------------------------------------------------------

fclose	MACRO
; not supported with other assemblers
	ENDM
;------------------------------------------------------------------------

report	MACRO	[namestr,label,maxlabel]
	IFND	rlbl
rlbl	=	0
	ENDC

	IFEQ	rlbl&1
	printf	"%n"
	ELSEIF
	printf	"      "
	ENDC
	IFLT	{label}
	printf	"%01%31"
	ENDC
	printf	"[20]{namestr}"," = "

	IFLT	({label})-10000
	printf	[4]({label})
	ELSEIF
	printf	[3]({label})/1024,"K"
	ENDC
p5per	=	({maxlabel})/200
	printf	" (",[3,0]((({label})+p5per)*100)/({maxlabel}),"%%)"
rlbl	=	rlbl+1
	printf	"%00"

	ENDM

;------------------------------------------------------------------------

bank_report	MACRO
rlbl	=	0
	header	<----------------------------- BANK INFORMATION -------------------------------->
	bankinfo	0
	bankinfo	1
	bankinfo	2
	bankinfo	3
	bankinfo	4
	bankinfo	5
	bankinfo	6
	bankinfo	7
	bankinfo	8
	bankinfo	9
	bankinfo	10
	bankinfo	11
	bankinfo	12
	bankinfo	13
	bankinfo	14
	bankinfo	15
	bankinfo	16
	bankinfo	17
	bankinfo	18
	bankinfo	19
	bankinfo	20
	bankinfo	21
	bankinfo	22
	bankinfo	23
	bankinfo	24
	bankinfo	25
	bankinfo	26
	bankinfo	27
	IFNE	ANSI
	printf	"[K"
	ENDC
	printf	"%n"
	ENDM

;------------------------------------------------------------------------

report_status	MACRO
rlbl	=	0
	header	<------------------------------- MEMORY USAGE ---------------------------------->
	report	<Zero Page Free>,Zero_Page_free,$100
	report	<Work Ram Free>,Work_RAM_free,($2000-$300)
	report	<Extended Ram Free>,Extended_RAM_free,($800000-$7e2000)
	report	<Mario Ram Free>,Mario_RAM_free,(bitmap1-$200)
	report	<ZMario Ram Free>,ZMario_RAM_free,(200)
	report	<Mario Code>,mariocodelen,TotalRomUsed
	report	<Strategy Code>,Total_Stratfile_len,TotalRomUsed
	report	<Shape Data>,shapes_len,TotalRomUsed
	report	<Total Rom Usage>,TotalRomUsed,1024*1024
	report	<Total Rom Spare>,TotalRomSpaceLeft,1024*1024
;	run	"memfree = %k"
;	report	<Memory Free>,memfree,initial_assembler_memory
;	report	<Est. Symbols Free>,memfree/25,(initial_assembler_memory)/25
;	report	<Total Mem Free>,initial_assembler_memory,640*1024
	printf	"%n"
	ENDM

;------------------------------------------------------------------------


shapes_len	=	0
total_shapes_time	=	0

	IFEQ	TIMINGS

start_shapes	MACRO
shapes_sta	=	*
	ENDM
;------------------------------------------------------------------------

end_shapes	MACRO
shapes_len	=	shapes_len+(*-shapes_sta)
	ENDM

	ELSEIF

start_shapes	MACRO
shapes_sta	=	*
	gettime	tsta
	ENDM

;------------------------------------------------------------------------

end_shapes	MACRO
shapes_len	=	shapes_len+(*-shapes_sta)
	gettime	tste
total_shapes_time	=	total_shapes_time+(tste-tsta)
	ENDM


	ENDC




;------------------------------------------------------------------------
printKperc	MACRO	bytes,number of decimal places
decp	=	1
	REPT	\2
decp	=	decp*10
	ENDR

	printf	(\1)/1024,".",[\2,0](((\1)*decp)/1024)-(((\1)/1024)*decp),"K"

	ENDM


;------------------------------------------------------------------------
printroulen	MACRO	label name,[comment]

	progress_off
	Sprintroulen	\1,<\2>

	progress_on

	ENDM

;------------------------------------------------------------------------
Sprintroulen	MACRO	label name,[comment]

	printf	"%q","[14]\1","%q","  Size = "
	printKperc	*-\1,2
	printf	" (",[4]*-\1," bytes)"

	IFEQ	NARG-2
	printf	"; %q\2.%q%n"
	ELSEIF
	printf	".%n"
	ENDC

	ENDM



;------------------------------------------------------------------------
printstratmacdat	MACRO
	
	IFD	\1_cnt
;	printf	"| NAME                  |   Used   |   Size   %n"
	printf	"| ","[20]\1","  |   ",[4]\1_cnt,"   |  "
	printf	[5]\1_len
	ELSEIF
	printf	"| ","[20]\1","  |  Unused  |   -----   "
	ENDC

	printf	"%n"
	ENDM



;----------------------------------------------------------

Rprintstratmacdat	MACRO
	printstratmacdat	\$1
\$1_nosort	=	1
	ENDM


;----------------------------------------------------------
stratmacsort	MACRO
	
	IFEQ	passnum
\1_nosort	=	0
	ENDC

	IFEQ	\1_nosort
	IFD	\1_len
	IFLE	currmax-\1_len
currmax	=	\1_len
	defs	$1,"\1"
nomore	=	0
	ENDC
	ENDC
	ENDC



	IFNE	donomore
	IFND	\1_len
	printstratmacdat	\1
	ENDC
	ENDC

	ENDM

;------------------------------------------------------------------------
strats_report	MACRO

	ENDM




;------------------------------------------------------------------------

cr_line	MACRO
	IFNE	ANSI
	printf	"[80D"
	ELSEIF
	printf	"%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b"
	printf	"%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b"
	ENDC
	ENDM

;------------------------------------------------------------------------

del_line	MACRO
	cr_line
	IFEQ	ANSI
	printf	"[79]"
	ELSEIF
	printf	"[K"
	ENDC
	cr_line
	ENDM

;------------------------------------------------------------------------

printr	MACRO	string,number of repeats
	IFGT	\2
	REPT	\2
	printf	"\1"
	ENDR
	ENDC
	ENDM

;------------------------------------------------------------------------

	IFD	_SASM!_ARGSFX
	IFNE	PROGRESS_INDICATOR

	IFEQ	progression_thingy&1
; progression indicator type #1
progress	MACRO	number,maximum value


	IFNE	NARG-2
	IFNE	NARG-3
	printf	"progress macro requires two parameters.%n"
	MEXIT
	ENDC
	ENDC

	IFNE	TITLE_BAR
tmp2	=	64
leftedge	=	0
rightedge	=	70
	ENDC

	starglider	<\3>

	cr_line

	IFEQ	TITLE_BAR
tmp2	=	40
leftedge	=	32
rightedge	=	75
	printf	"%q%32","[16]\3","%37%q",", %33BANK "
	IFND	banknum
	printf	"--",":  %37"
	ELSEIF
	printf	[2,0]banknum,":  %37"
	ENDC
	ENDC

tmp	=	((\1)*(tmp2/2))/(\2)
tmp3	=	((\1)*100)/(\2)
	IFGE	tmp-(tmp2/2)
tmp	=	tmp2/2
	ENDC

	printr	< >,(rightedge-tmp2-leftedge)/2-2
	printf	"%33%01<%34"

	printr	<.>,(tmp2-(tmp*2))/2

	printf	"%31"
	printr	<>,tmp
	printr	<>,tmp
	printf	"%34"

	printr	<.>,(tmp2-(tmp*2)-((tmp2-(tmp*2))/2))

	printf	"%33>"

	printr	< >,(rightedge-tmp2-leftedge)/2-2
	printf	"%00(%36",[3]tmp3,"%%%00)"

	IFNE	TITLE_BAR
	printf	"[K%n"
	IFNE	TITLEBANKINFO
	bank_report
	ENDC
	printf	"%01%41","[80,-]"
	printf	"%00[u"
	ELSEIF
	printf	"%00"
	ENDC

	ENDM
	ELSEIF
; progression indicator type #2
progress	MACRO	number,maximum value


	IFNE	NARG-2
	IFNE	NARG-3
	printf	"progress macro requires two or three parameters.%n"
	MEXIT
	ENDC
	ENDC

	IFNE	TITLE_BAR
tmp2	=	64
leftedge	=	0
rightedge	=	70
	ENDC


	starglider	<\3>

	cr_line

	IFEQ	TITLE_BAR
tmp2	=	40
leftedge	=	32
rightedge	=	75
	printf	"%q%32","[16]\3","%37%q",", %33BANK "
	IFND	banknum
	printf	"??",":  %37"
	ELSEIF
	printf	[2,0]banknum,":  %37"
	ENDC
	ENDC

tmp	=	((\1)*(tmp2))/(\2)
tmp3	=	((\1)*100)/(\2)

	IFGE	tmp-tmp2
tmp	=	tmp2
	ENDC

	printr	< >,(rightedge-tmp2-leftedge)/2-2
	printf	"%00%01%31<%33"

	printr	<o>,tmp

	printf	"%31"
	printr	<.>,tmp2-tmp

	printf	">"

	printr	< >,(rightedge-tmp2-leftedge)/2-2
	printf	"%00(%36",[3]tmp3,"%%%00)"

	IFNE	TITLE_BAR
	printf	"[K%n"
	IFNE	TITLEBANKINFO
	bank_report
	ENDC
	printf	"%01%41","[80,-]"
	printf	"%00[u"
	ELSEIF
	printf	"%00"
	ENDC

	ENDM
	ENDC

	ELSEIF

progress	MACRO
	starglider	<\3>
	ENDM

	ENDC

	ELSEIF
progress	macro
	endm
	ENDC

;------------------------------------------------------------------------


sg_colour2	=	1
starglider	macro
	IFNE	TITLE_BAR
	IFNE	ANSI
	IFC	"\1",""
	printf	"[s[0;0H%01----------------------"
	ELSEIF
	printf	"[s[0;0H%01------- %q%32","[12]\1","%37%q,"
	ENDC
	IFD	BANKNUM
	printf	" %33BANK..",[2,.]banknum,"%37: "
	ELSEIF
	printf	"---------- "
	ENDC

sg_colour	=	sg_colour2
sg_colour2	=	sg_colour2+1
	IFGT	sg_colour2-5
sg_colour2	=	1
	ENDC

	starchar	<S>
	starchar	<T>
	starchar	<A>
	starchar	<R>
	starchar	<G>
	starchar	<L>
	starchar	<I>
	starchar	<D>
	starchar	<E>
	starchar	<R>
	IFEQ	TIMINGS
	printf	" %37----------------------------------- %00"
	ELSEIF
	printf	" %36(",[3](tfsta-starttime)/100
	printf	"s) %37--------------------------- %00"
	ENDC
;	printf	"[80,-]"
;	printf	"[u"
	ENDC
	ENDC
	endm

starchar	macro
	defs	$1,sg_colour
	starchar2
	printf	"\1"
sg_colour	=	sg_colour+1
	IFGT	sg_colour-5
sg_colour	=	1
	ENDC
	endm

starchar2	macro
	printf	"%3\$1"
	endm

;------------------------------------------------------------------------
shapes_report	MACRO
	header	<---------------------------- SHAPES INFORMATION -------------------------------%n>
	include	shapes.tmp
	printf	"%n"
	ENDM

;------------------------------------------------------------------------
ptime	MACRO
	printf	(\1)/100,".",(\1)-(((\1)/100)*100)
	IFLT	((\1)-(((\1)/100)*100))-10
	printf	"0"
	ENDC
	ENDM
;------------------------------------------------------------------------
timings_report	MACRO
	header	<---------------------------- TIMING INFORMATION -------------------------------%n>
	printf	"[40]* Time taken to assemble strategies: "
	ptime	total_strat_time
	printf	"s%n"
	printf	"[40]* Time taken to assemble shapes:"
	ptime	total_shapes_time
	printf	"s%n"
	printf	"[40]* Average time per file:"
	ptime	includetime/totalfiles
	printf	"s%n"
	ENDM

;------------------------------------------------------------------------
	IFND	_SASM!_ARGSFX
progress_on	MACRO
	ENDM

progress_off	MACRO
	ENDM
	ELSEIF

progress_on	MACRO
	progress	totalfiles,oldtotalfiles,\$6
	ENDM

progress_off	MACRO
	del_line
	ENDM
	ENDC
;------------------------------------------------------------------------
INCFILE	MACRO
	IFND	totalfiles
totalfiles	=	0
	ENDC
totalfiles	=	totalfiles+1
	IFEQ	1
	progress	totalfiles,oldtotalfiles,<\1>
	ENDC
	include	\1
	ENDM

;------------------------------------------------------------------------
warmvar	MACRO
	printf	"\1%tequ%t",\2,"%n"
	ENDM
;------------------------------------------------------------------------
header	MACRO
	printf	"%01\1%00"
	ENDM
;------------------------------------------------------------------------
gettime	MACRO
	time	currenttime
\1	=	((currenttime>>24)&255)*360000+((currenttime>>16)&255)*6000+((currenttime>>8)&255)*100+((currenttime)&255)
	ENDM
;------------------------------------------------------------------------
time	MACRO
\1	=	0
	ENDM

;------------------------------------------------------------------------

defs	MACRO
	ENDM
;------------------------------------------------------------------------

	IFEQ	ANSI
ANSI_ON	MACRO
	suppress ansi
	ENDM
	ELSEIF
ANSI_ON	MACRO
	release  ansi
ansi	=	1
	ENDM
	ENDC

ANSI_OFF	MACRO
	suppress	ansi
ansi	=	0
	ENDM

;------------------------------------------------------------------------
suppress	macro
	endm
release	macro
	endm
;------------------------------------------------------------------------


	IFD	_SASM!_ARGSFX

bankinfo	MACRO

	IFD	bank\1left

	IFEQ	rlbl&1
	printf	"%n"
	ELSEIF
	printf	"  "
	ENDC

p5per	=	32768/200
	IFLT	bank\1left
	printf	"%31"
	ELSEIF
	IFLT	bank\1left-1024
	printf	"%33"
	ENDC
	ENDC
	printf	"Bank..",[2,.]\1
	printf	"  ",[2](32768-bank\1left)/1024,"K(",[3]((32768-bank\1left+p5per)*100)/32768,"%%)"
	printf	", Free =",[5]bank\1left,"(",[3]((bank\1left+p5per)*100)/32768,"%%)"
	printf	"%00"
	IFNE	ANSI
	printf	"[K"
	ENDC

rlbl	=	rlbl+1

	ENDC
	ENDM

	ELSEIF

bankinfo	MACRO
	ENDM

	ENDC

;------------------------------------------------------------------------


;------------------------------------------------------------------------
local	macro
	endm
;------------------------------------------------------------------------


waitdma	MACRO	; waits for a particular raster line
ola	=	LONGA
oli	=	LONGI

	lda	#\1
	sta	dmatemp
	jsl	waitdma_l

	IFNE	oli
	IFNE	ola
	ai16
	ELSEIF
	a8i16
	ENDC
	ELSEIF
	IFNE	ola
	a16i8
	ELSEIF
	ai8
	ENDC
	ENDC

	ENDM


;------------------------------------------------------------------------
; pass window number as \1
alloc_window	MACRO
	savemode
	a8i16
	lda	windowmode
	ora	#wf_\1
	sta	windowmode
	window_addr	\1
	returnmode
		ENDM

;------------------------------------------------------------------------
; pass window number as \1
dealloc_window	MACRO
	savemode
	a8
	lda	windowmode
	and	#~wf_\1
	sta	windowmode
	returnmode
			ENDM
;------------------------------------------------------------------------
; get the address of a window in x
window_addr		MACRO
	IFEQ	longi
	progress_off
	printf	"%31Error: window_addr needs to be in longi mode.%n"
	progress_on
	ENDC
	ldx	#wa_\1*wm_sizeof+windowarray
	ENDM
;------------------------------------------------------------------------
chk_window	MACRO
	IFNE	longa
	delline
	printf	"%31Error: chk_window needs to be in shorta mode.%n"
	ENDC
	lda	windowmode
	and	#wf_\1
	ENDM
;------------------------------------------------------------------------


defwindow	MACRO	window name
wf_\1	=	(1<<maxwindows)
wa_\1	=	maxwindows
maxwindows	=	maxwindows+1
	ENDM
;------------------------------------------------------------------------
remember	MACRO
	IFND	\1
	progress_off
	printf	"%01%35Remember to merge \1 into \2!!%n%00"
	progress_on
	ENDC

	ENDM


;------------------------------------------------------------------------





;------------------------------------------------------------------------
;decvramnowaits	macro
;	IFEQ	longa
;	a16
;	ENDC
;	lda	#(\2)&WM
;	sta	param2
;	lda	#(\3)&WM
;	sta	param3
;	lda	#((\3)>>8)&WM
;	sta	param3+1
;	lda	#(\4)&WM
;	sta	param4
;	lda	#1
;	sta	nowaits
;	jsl	decvram_rou_l
;	a8
;	endm
;decbg2vramnowaits	MACRO
;	IFEQ	longa
;	a16
;	ENDC
;	lda	#(\2)&WM
;	sta	param2
;	lda	#(\3)&WM
;	sta	param3
;	lda	#((\3)>>8)&WM
;	sta	param3+1
;	lda	#(\4)&WM
;	sta	param4
;	IFNE	NARG-5
;	lda	#(vchr_logback-vchr_physback)/16
;	ELSEIF
;	lda	#\5
;	ENDC
;	sta	param5
;	lda	#1
;	sta	nowaits
;	jsl	decbg2vram_rou_l
;	a8
;	ENDM
;


;-------------------------------------------------------------------

defgamepal	MACRO

gamepal_\1	equ	(*-paladdr)/32
	IFEQ	NARG-2
	inccolfile	data\\\2,7,8
	ELSEIF
	inccolfile	data\\\2,\3,\4
	ENDC
	ENDM


;-------------------------------------------------------------------
initcircle	MACRO
\1_circle	equ	*-circletab
	db	ct_circle_init
	ENDM

circle_aff	MACRO	[affect]
	db	ct_set_affect
	db	{affect}
	ENDM

;-------------------------------------------------------------------
radiusto	MACRO	[radius,speed,speedadd]
	db	ct_circle_rad
	dw	{radius}
	dw	{speed}
	ifeq	NARG-3
	dw	{speedadd}
	elseif
	dw	0
	endc
	ENDM

;-------------------------------------------------------------------
blueto	MACRO	[colval,frame,speed]
	db	ct_circle_blue
	db	{colval}
	db	{frame}
	ifeq	NARG-3
	db	{speed}
	elseif
	db	1
	endc
	ENDM

;-------------------------------------------------------------------
greento	MACRO	[colval,frame,speed]
	db	ct_circle_green
	db	{colval}
	db	{frame}
	ifeq	NARG-3
	db	{speed}
	elseif
	db	1
	endc
	ENDM

;-------------------------------------------------------------------
redto	MACRO	[colval,frame,speed]
	db	ct_circle_red
	db	{colval}
	db	{frame}
	ifeq	NARG-3
	db	{speed}
	elseif
	db	1
	endc
	ENDM

;-------------------------------------------------------------------
circleendif	MACRO	[param,cond]
	ifc	"{param}","blue"
	db	ct_circle_endifblue
	db	{cond}
	mexit
	endc

	ifc	"{param}","green"
	db	ct_circle_endifgreen
	db	{cond}
	mexit
	endc

	ifc	"{param}","red"
	db	ct_circle_endifred
	db	{cond}
	mexit
	endc

	ifc	"{param}","radius"
	db	ct_circle_endifradius
	dw	{cond}
	mexit
	endc

	printf	"Illegal circle command%n"

	ENDM

;-------------------------------------------------------------------
circleend	MACRO
	db	ct_circle_end
	ENDM
;-------------------------------------------------------------------


circleloop	MACRO
	db	ct_circle_loop
	ENDM

;-------------------------------------------------------------------
setblue	MACRO	[blue]
	db	ct_set_blue
	db	{blue}
	ENDM

;-------------------------------------------------------------------
setgreen	MACRO	[green]
	db	ct_set_green
	db	{green}
	ENDM

;-------------------------------------------------------------------
setred	MACRO	[red]
	db	ct_set_red
	db	{red}
	ENDM

;-------------------------------------------------------------------
circleexit	MACRO
	db	ct_circle_exit
	ENDM

;-------------------------------------------------------------------
setrad	MACRO	[size]
	db	ct_set_rad
	dw	{size}
	ENDM

;-------------------------------------------------------------------
databank	MACRO
	IFEQ	LONGA
	lda	#(\1)
	pha
	plb 
	ELSEIF
	a8
	lda	#(\1)
	pha
	plb
	a16 
	ENDC
	ENDM

;-------------------------------------------------------------------
sdebug	MACRO
	IFNE	debuginfo2
	a8
	stz	gameover
	ENDC
	ENDM
edebug	MACRO
	IFNE	debuginfo2
	a8
	lda	gameover
	cmp	#0
	beq	.ok\@
	blink
.ok\@
	ENDC
	ENDM

;-------------------------------------------------------------------
incsnd	MACRO			;INCBINS A FILE AND 'SPLITS' IT!
rompos	=	(firstsndbnk*$8000)+musicsize
sndbank	=	(rompos/$8000)
sndoffset	=	rompos-(sndbank*$8000)

	IFNE	FASTROM
	org	sndbank*$10000+$808000+sndoffset,rompos
	ELSEIF
	org	sndbank*$10000+$8000+sndoffset,rompos	
	ENDC


\1	incbin	\2
\1len	equ	@-rompos

musicsize	=	musicsize+\1len

	ENDM

;-------------------------------------------------------------------
bgm	MACRO			;DNLDS THE BGM AND SET
	IFNE	LONGA
	printf	"%m requires SHORTA%n"
	ENDC
	jsl	do_bgm_\1
	ENDM
;-------------------------------------------------------------------
startbgm	MACRO			;SET PORT 0 IF IRQ'S ENABLED
	ifne	longa
	error	"wrong mode"
	endc
	lda	#\1
	sta	bgm_music
	stz	bgmcnt
	ENDM
;-------------------------------------------------------------------
bootapu	MACRO
	php
	i16
	ldx	\1
	jsr	sbootapu
	plp
	rtl
	endm
;-------------------------------------------------------------------
snd_data	macro
snd_\1	equ	*-sndtbl
	db	\2
	rept	narg-2
	irs	1,"\3","\4","\5","\6","\7","\8","\9","\a","\b","\c","\d","\e"
	run	" dw %$1&WM"
	run	" db %$1>>16"
	run	" dw %$1len"
	endr
	dw	0
	db	0
	endm

;-------------------------------------------------------------------
defal	MACRO
	struct	al_\1,\2
size_al_\1	=	\2
;	printf	"al_\1 = $",:$al_\1,"  ",al_\1,"%n"
	ENDM
;-------------------------------------------------------------------
defalx	MACRO
	struct	alx_\1,\2
al_\1	=	alx_\1&WM
size_al_\1	=	\2
;	printf	"alx_\1 =$",:$alx_\1&WM,"  ",alx_\1&WM,"%n"
	ENDM
;-------------------------------------------------------------------


TESTJOYPAD	MACRO
	IFEQ	pad_\1>>8
	lda	trig0
	ELSEIF
	lda	trig0h
	ENDC
	bit	#padl_\1
	ENDM

;-------------------------------------------------------------------
TESTKEYDOWN	MACRO
	IFEQ	NARG-2
	lda	\2
	ELSEIF
	IFEQ	pad_\1>>8
	lda	contl0
	ELSEIF
	lda	cont0
	ENDC
	ENDC
	bit	#padl_\1
	ENDM

;-------------------------------------------------------------------
TESTKEYDOWN2	MACRO
	IFEQ	NARG-2
	lda	\2
	ELSEIF
	IFEQ	pad_\1>>8
	lda	contl1
	ELSEIF
	lda	cont1
	ENDC
	ENDC
	bit	#padl_\1
	ENDM
;-------------------------------------------------------------------
irv	macro ; something to do with IRQ (IRQ Variable?)
	dw	(\1)&WM ; Direct Write value in arg 1 & $FFFF ?
	endm
;-------------------------------------------------------------------


startmus	macro
.trig0	lda	bgmcnt
	beq	.start
	dec	a
	beq	.check
	bra	.trig3
.start	lda	bgm_music
	sta	apu_port0
	inc	bgmcnt
	bra	.trig3
.check	lda	apu_port0
	cmp	bgm_music
	bne	.start
	stz	apu_port0
	inc	bgmcnt

.trig3	lda	port3cnt
	beq	.start2
	dec	a
	beq	.check2
	bra	.cont2
.start2	lda	port3snd
.restart	sta	apu_port3
	sta	port3bak
	inc	port3cnt
	lda	#255
	sta	port3snd
	bra	.cont2
.check2	lda	port3bak
	cmp	apu_port3
	bne	.restart
	stz	apu_port3
	inc	port3cnt
.cont2
	endm

;-------------------------------------------------------------------

mark	macro
	IFNE	LONGA
	printf	"mark in wrong mode.%n"
	ENDC
	lda	#$80
	sta	inidisp
	lda	#15
	sta	inidisp
	lda	#$80
	sta	inidisp
	endm

;-------------------------------------------------------------------

mark2	macro
	lda	#$80
	sta	inidisp
	stz	inidisp
	lda	#15
	sta	inidisp
	endm


;-------------------------------------------------------------------
global	MACRO

	IFGT	NARG-13
	printf	"Only 13 references allowed on line.%n"
	ENDC

	IFEQ	publics

	rept	narg
	irs	1,"\1","\2","\3","\4","\5","\6","\7","\8","\9","\a","\b","\c","\d"
	run	" extern %$1"
	endr

	ELSEIF

	rept	narg
	irs	1,"\1","\2","\3","\4","\5","\6","\7","\8","\9","\a","\b","\c","\d"
	run	" public %$1"
	endr

	ENDC
	ENDM



;-------------------------------------------------------------------

publics	=	0

INCEXTERNS	MACRO	[filename]
	INCLUDE	\1
	ENDM

INCPUBLICS	MACRO	[filename]
publics	=	1
	INCLUDE	\1
publics	=	0
	ENDM

;-------------------------------------------------------------------
makeshade	macro

bit	=	1

	REPT	2
	REPT	8
	db	((((\1)&bit)/bit)*BM),((((\1)&(bit<<1))/(bit<<1))*BM)
	ENDR
bit	=	bit<<2
	ENDR

	endm
;-------------------------------------------------------------------

incshapes	macro
Do_Hdr	=	1
hdrpublics	=	0
	incfile	\1
Do_Hdr	=	0
	incfile	\1
	endm

;-------------------------------------------------------------------

incbinfile	MACRO
	incbin	\1
	ENDM

;-------------------------------------------------------------------

inccolfile	MACRO
	inccol	\1,\2,\3
	ENDM

;-------------------------------------------------------------------
weapon	MACRO	; name,fire weapon strategy.

	IFNE	weaphdr
WEAPON_\1	equ	cweapon
	ELSEIF
	dw	((cweapon-2)/2)*wchrlen
	dw	\2&WM		; ptr. to fire weapon strat
	db	\2>>16,0
	ENDC

cweapon	=	cweapon+2
	ENDM
;---------------------------------------------------
disable	MACRO ; why bother with this macro? literally just one instruction.
	sei ; disable interrupts
	ENDM
;---------------------------------------------------

enable	MACRO

	IFEQ	LONGA
	lda.l	timeupr
	ELSEIF
	a8
	lda.l	timeupr
	a16
	ENDC

	cli

	ENDM
;---------------------------------------------------

routechange	MACRO ; Change route on planet selection screen
	jsl	routechange\1_l
	ENDM

;---------------------------------------------------

clrmes	MACRO
	lda	#\2		;print special enemys killed
	sta.l	m_x1
	lda	#\3
	sta.l	m_y1
	lda	#\1&WM
	sta.l	m_txtdata
	call_mario	mprintstr
	ENDM


;---------------------------------------------------
fast	MACRO ; Run MARIO chip @ 21.4mhz (no clock divider)
	IFEQ	LONGA
	lda	#1
	sta	m_clsr
	; Enable fast multiplication mode (MS1) and disable GSU IRQs
	lda	#cfgr_ms1+cfgr_noirq
	sta	m_cfgr
	ELSEIF
	a8
	lda	#1
	sta	m_clsr
	; Enable fast multiplication mode (MS1) and disable GSU IRQs
	lda	#cfgr_ms1+cfgr_noirq
	sta	m_cfgr
	a16
	ENDC
	ENDM

;---------------------------------------------------
slow	MACRO ; Run MARIO chip @ 10.7mhz (enable clock divider)
	IFEQ	LONGA
	lda	#0
	sta	m_clsr
	ELSEIF
	a8
	lda	#0
	sta	m_clsr
	a16
	ENDC
	ENDM
;---------------------------------------------------
waithtime	macro	[start,end]
	IFNE	LONGA
	printf	"%m must be in SHORT a mode%n"
	ENDC
.\@
	a8
	lda	slhvr
	lda	ophctr
	xba
	lda	ophctr
	xba

	a16
	and	#%111111111
	cmp	#{start}
	bcc	.\@
	cmp	#{end}
	bcs	.\@

	a8

	endm
;---------------------------------------------------
screen_off	macro
	jsl	screenoff_l
		endm

;------------------------------------------------------------------------------------------------------
;8086 relative jump style thingies.
;  Works after a compare...
;    lda	#100
;    cmp	#200
;    jb	hello		;will branch to hello because 100 is below 200
;
; je   - equal
; js   - sign (negative)
; jc   - carry
; ja   - above (unsigned)
; jae  - above or equal (unsigned)
; jg   - greater (signed)
; jge  - greater or equal (signed)
; jb   - below (unsigned)
; jbe  - below or equal (unsigned)
; jl   - less (signed)
; jle  - less or equal (signed)
; jne  - not equal
; jns  - not sign (jump if + or 0)
; jnc  - not carry
; jna  - not above (unsigned)
; jnae - not above or equal (unsigned)
; jng  - not greater (signed)
; jnge - not greater or equal (signed)
; jnb  - not below (unsigned)
; jnbe - not below or equal (unsigned)
; jnl  - not less (signed)
; jnle - not less or equal (signed)

ja	macro
	beq	.ok\@
	bcs	\1
.ok\@
	endm

jae	macro
	beq	\1
	bcc	\1
	endm

jg	macro			;s xor v = 0
	beq	.\@2
	bmi	.\@1
	bvc	\1
	bra	.\@2
.\@1	bvs	\1
.\@2
	endm

jge	macro			;e = 1  s xor v = 0
	bmi	.\@1
	bvc	\1
	bra	.\@2
.\@1	bvs	\1		;s
.\@2
	endm

jb	macro
	bcc	\1
.ok\@
	endm

jbe	macro
	beq	\1
	bcc	\1
	endm

jl	macro			;s xor v = 0
	bmi	.\@1
	bvs	\1
	bra	.\@2
.\@1	bvc	\1
.\@2
	endm

jle	macro			;e = 1  s xor v = 0
	beq	\1
	bmi	.\@1
	bvs	\1
	bra	.\@2
.\@1	bvc	\1		;s
.\@2
	endm

js	macro
	bmi	\1
	endm

je	macro
	beq	\1
	endm

jc	macro
	bcs	\1
	endm

jna	macro
	jbe	\1
	endm

jnae	macro
	jb	\1
	endm

jng	macro
	jle	\1
	endm

jnge	macro
	jl	\1
	endm

jnb	macro
	jae	\1
	endm

jnbe	macro
	ja	\1
	endm

jnl	macro
	jge	\1
	endm

jnle	macro
	jg	\1
	endm

jns	macro
	bpl	\1
	endm

jne	macro
	bne	\1
	endm

jnc	macro
	bcc	\1
	endm
;---------------------------------------------------
setinidisp1	macro
	jsl	setinidisp1_l
		endm
;---------------------------------------------------


spr_col0	equ	0<<9
spr_col1	equ	1<<9
spr_col2	equ	2<<9
spr_col3	equ	3<<9
spr_col4	equ	4<<9
spr_col5	equ	5<<9
spr_col6	equ	6<<9
spr_col7	equ	7<<9

spr_pri0	equ	0<<12
spr_pri1	equ	1<<12
spr_pri2	equ	2<<12
spr_pri3	equ	3<<12

spr_hflip	equ	1<<14
spr_vflip	equ	1<<15


sprar_time	equ	3
sprar_flash	equ	1

ldaspr	macro
sprtemp	=	0

	rept	NARG-1
	irs	1,"spr_\2","spr_\3","spr_\4","spr_\5","spr_\6"
	upper	1

	run	"sprtemp = sprtemp+%$1"
	endr

	lda	#\1+spradd+sprtemp

	endm


;--------------------------------------------------------------
defpac	macro
\1	equ	gamepalettes+__totpallen
__totpallen	=	__totpallen+(\2*32)
__totpallines	=	__totpallines+(\2)
	endm

;---------------------------------------------------------------
xxalc	macro
	chkalc
\1	equ	xxmempt
xxmempt	=	xxmempt+\2
	endm
;---------------------------------------------------------------
; replicates MVN instruction for SASM
sasm_mvn	MACRO ; src,dest
; example: sasm_mvn	$32,$7E
; raw opcodes are little endian so we reverse the arguments
	db $54,\2,\1
	ENDM
;---------------------------------------------------------------
; replicates MVP instruction for SASM
sasm_mvp	MACRO ; src,dest
; example: sasm_mvp	$32,$7E
; raw opcodes are little endian so we reverse the arguments
	db $44,\2,\1
	ENDM
;---------------------------------------------------------------
; Incbin a 2bpp CGX file
inccgx2	MACRO	[filepath,NUMCHRS]
	inccol	{filepath},0,{NUMCHRS}/2
	ENDM
;---------------------------------------------------------------