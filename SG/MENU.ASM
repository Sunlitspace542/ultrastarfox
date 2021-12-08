	INCPUBLICS	menu.ext


specialmenu_l

	php
	phb
	a8i16
	lda	#0
	pha
	plb
	lda	#8
	sta	whichroute

	dmacgram	0,0,0,512

	bgm	staff

	decvramnotrans	0,vchr_logback,bgetestccr,6*k
	decbg2vramnotrans	0,vsc_base2,bgbpcr,8*k
	decvramnotrans	0,vobj_base,fobjccr,4*k
	decclear

;	lda	#$80
;	sta	vmainc
;	a16
;	lda	#vsc_base2+32*24+29
;	sta	vmaddl
;	lda	credits
;	clc
;	adc	#((vchr_logback-vchr_physback)/16+$8a)!(5<<10)!(1<<13)
;	sta	vmdatal
;	a8

;	jsl	clronehalf_l
;	jsl	clrotherhalf_l
;	jsl	clearsprites_l

	ldx		vmap2
	dmaxvram	0,(bitmapbase+bitmap1),gametranlen1+gametranlen2

	setdepth	night
	set_zdepthtable	normal

.start

	settext	1,1
	showtxt	offtext

	TESTKEYDOWN	START
	beq		.start
	stz	whichroute
	jml	restart

	rtl