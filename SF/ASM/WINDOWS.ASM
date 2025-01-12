;***************************************************************************************
; colour windows
	
	incpublics	EXT\windows.ext


;--------------------------------------------------------
fadewhite_l
	jsr	fadewhite
	rtl
fadewhite
	php
	a8i16
	phx
	alloc_window	whitefade
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00000111
	sta	wm_cgadsub,x
	lda	#%11100000
	ora	wm_val,x
	sta	wm_coldata,x
	lda	wm_val,x
	cmp	#31
	beq	.nc
	inc	a
	sta	wm_val,x
.nc	plx
	plp
	rts



;--------------------------------------------------------
initblack_l
	php
	a8i16
	lda	#40
	sta	stayblack
	alloc_window	blackfade
	lda	#30
	sta	wm_val,x
	stz	wm_ts,x
	jsl	setblack_l
	a8
	stz	fade
	plp
	rtl

;--------------------------------------------------------
setblack_l
	php
	a8i16
	lda	stayblack
	inc	a
	beq	.clrit
	alloc_window	blackfade
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%10100111
	sta	wm_cgadsub,x

	lda	wm_val,x
	ora	#%11100000
	sta	wm_coldata,x
	lda	stayblack
	bne	.blackit
	lda.l	oncewipe
	beq	.wipeit
	lda	wm_val,x
	beq	.decit
	dec	a
	dec	a
	sta	wm_val,x
	bra	.end
.wipeit
	inc	a
	sta.l	oncewipe
	a16
	lda	#mstarwipe_circle
	sta	circleanim
	a8
	lda	#0

.blackit
	stz	wm_ts,x
	lda	#%11100111
	sta	wm_cgadsub,x
	lda	#255
	sta	wm_coldata,x

.decit
	dec	stayblack
.end	plp
	rtl
.clrit	dealloc_window	blackfade
	jmp	.end


;--------------------------------------------------------

flashturq_l
	php
	a8i16
	phx
	alloc_window	hitflash
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00100111
	sta	wm_cgadsub,x
	stz	wm_coldata_r,x
	lda	#%11111
	sta	wm_coldata_g,x
	sta	wm_coldata_b,x

	stz	wm_coldata,x
	plx
	plp
	rtl
         
;--------------------------------------------------------
flashturq2_l
	php
	a8i16
	phx
	alloc_window	hitflash
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00100111
	sta	wm_cgadsub,x
	stz	wm_coldata_r,x
	lda	#%111
	sta	wm_coldata_g,x
	sta	wm_coldata_b,x
	stz	wm_coldata,x
	plx
	plp
	rtl
	
	
;--------------------------------------------------------
flashred_l
	php
	a8i16
	phx
	alloc_window	hitflash
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00100111
	sta	wm_cgadsub,x
	stz	wm_coldata,x
	lda	#31
	sta	wm_coldata_r,x
	stz	wm_coldata_g,x
	stz	wm_coldata_b,x
	plx
	plp
	rtl

;--------------------------------------------------------
dyingred_l
	php
	a8i16
	phx
	alloc_window	dyingred
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00100111
	sta	wm_cgadsub,x
	stz	wm_coldata,x
	lda	#10
	sta	wm_coldata_r,x
	stz	wm_coldata_g,x
	stz	wm_coldata_b,x
	plx
	plp
	rtl

;--------------------------------------------------------
dyingredoff_l
	php
	a8i16
	phx
	dealloc_window	dyingred
	plx
	plp
	rtl



;--------------------------------------------------------
initfadewhite2norm_l
	php
	a8i16
	phx
	alloc_window	whitefade
	lda	#31
	sta	wm_val,x
	plx
	plp
	jsr	fadewhite2norm
	rtl

fadewhite2norm_l
	jsr	fadewhite2norm
	rtl
fadewhite2norm	
	php
	a8i16
	phx
	alloc_window	whitefade
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00000111
	sta	wm_cgadsub,x
	lda	#%11100000
	ora	wm_val,x
	sta	wm_coldata,x
	lda	wm_val,x
	beq	.nc
	dec	a
	sta	wm_val,x
	plx
	plp
	rts
.nc	dealloc_window	whitefade
	plx
	plp
	rts

;--------------------------------------------------------

bossflash_l
	php
	a8i16
	phx
	alloc_window	dyingred
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%00100111
	sta	wm_cgadsub,x
	stz	wm_coldata_r,x
	lda	#%11111
	sta	wm_coldata_g,x
	sta	wm_coldata_b,x

	stz	wm_coldata,x
	plx
	plp
	rtl

;--------------------------------------------------------


