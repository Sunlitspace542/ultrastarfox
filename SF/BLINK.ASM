
	INCPUBLICS	blink.ext

doblink	ai16
	lda	#$1f+($1f<<5)+($1f<<10)
	sta	blinkcol
	ldx	#256-86
	bra	stopall
doblink1	ai16
	lda	#$1f+($1f<<10)	; pink
	sta	blinkcol
	ldx	#256-70
	bra	stopall
doblink2	ai16
	lda	#$1f+($1f<<5)	; yellow
	sta	blinkcol
	ldx	#256-70
	bra	stopall
doblink3	ai16			; cyan
	lda	#($1f<<5)+($1f<<10)
	sta	blinkcol
	ldx	#256-55
	bra	stopall
doblink4	ai16			; green (sound loop crashed)
	lda	#($1f<<5)
	sta	blinkcol
	ldx	#256-30
	bra	stopall
crashed	i16
	ldx	#256-39
	bra	stopall

stopall	stx	blinkval
	a8
	stz	nmitimen
	stz	hdmaen
	disable
	stz	tm
	stz	ts
	lda	#0
	pha
	plb
	a8i16
	lda	#$80
	sta	inidisp

	dmacgram	0,0,oopspal,512
	dmavram	0,0,oopschr,16*1024
	dmavram	0,16*1024,oopspic,2*1024

	stz	cgadd
	lda	blinkcol
	sta	cgdata
	lda	blinkcol+1
	sta	cgdata

	lda	#(16*1024)>>8
	sta	bg1sc
	lda	#0
	sta	bg12nba

	stz	w12sel
	stz	w34sel		;wh0,1 set with hdma
	stz	wobjsel
	stz	wbglog
	stz	wobjlog
	stz	tmw
	stz	tsw
	stz	wh0
	stz	wh1

	lda	#1
	sta	bgmode
	lda	#1
	sta	tm
	stz	ts
	stz	cgadsub
	stz	coldata

	stz	ch1params
	lda	#inidisp&$ff
	sta	ch1addrb
	lda	#oopshdma>>16
	sta	ch1atbank
	ldx	#oopshdma&WM
	stx	ch1addra1tl
	stz	ch1databank

	stz	bg1vofs
	stz	bg1vofs
	lda	#-7
	sta	bg1hofs
	lda	#-1
	sta	bg1hofs
	lda	#$f
	sta	inidisp
	lda	#2
	sta	hdmaen

	i16
.wait2	ldy	#20000		;wait about 1 frame
.wait	dey
	bne	.wait

	a16
	lda	blinkval		;get diff.
	cmp	scrollval
	beq	.ok2
	sec
	sbc	scrollval
	lsr	a	
	lsr	a	
	lsr	a	
	bne	.ok
	lda	#1
.ok	clc
	adc	scrollval
	sta	scrollval

	a8
	lda	scrollval
	sta	bg1vofs
	lda	scrollval+1
	sta	bg1vofs

	lda	#3
	sta	apu_port0
	bra	.wait2

.ok2	bra	.ok2


oopshdma	db	100-16,$0
	db	1,$1
	db	1,$2
	db	1,$3
	db	1,$4
	db	1,$5
	db	1,$6
	db	1,$7
	db	1,$8
	db	1,$9
	db	1,$a
	db	1,$b
	db	1,$c
	db	1,$d
	db	1,$e
midblink	db	16,$f
	db	1,$e
	db	1,$d
	db	1,$c
	db	1,$b
	db	1,$a
	db	1,$9
	db	1,$8
	db	1,$7
	db	1,$6
	db	1,$5
	db	1,$4
	db	1,$3
	db	1,$2
;	db	1,$1
;	db	1,0
;	db	0,0




