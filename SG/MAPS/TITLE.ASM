TITLE
; disable player's movement and wobble:
	setfadedown	quick
	mapwaitfade
	setbg	title
	initbg

timeovercont
	start_65816
	a16
	stz	lastplayz
	stz	pviewposz
	ldx	playpt
	lda	#1
	sta	font
	sta	enemy_firing
	stz	al_worldz,x
	stz	soundtest
;	lda	#$AE
;	sta soundtest
	a8
	end_65816

	mapcode_jsl	initblack_l
	setvar		stayblack,10

	mapwait	800

;	mapobj	0,0,0,0,whale1,tit_istrat

	mapobj	0,0,30,100,myship_4,tit2_istrat
	mapwait	100
	mapobj	0,140,-30,300,peppy1,tit4_istrat	
	mapwait	100
	mapobj	0,-140,-30,300,falco1,tit3_istrat	
	mapwait	100
	mapobj	0,-140,70,300,slippy1,tit_istrat	
	mapwait	100
	
	setfadeup	quick

	start_65816
	a8
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode

	lda	pshipflags
	ora	#psf_noctrl!psf_nofire
	sta	pshipflags

	end_65816

;.ll	start_65816
;	jmp_keyup	right,.end333
;	jmp_keyup	left,.end333
;	jmp_lastkeydown	left,.end333
;	end_65816
;	mapjsr	bossbgm1
;	mapend
.ll	start_65816

	lda	mosaicon			;load value
	beq	.startstart			;if 0, don't display anything
	settext	0,0				;set to upper right corner
	printvar	mosaicon	;display value
.startstart
;-------------------Version Display-----------------------------------------------------------------------------
	settext	16,21					;Set location of text
	showtxt	versiontext				;Show the word "VERS"


;---------------------Version--------------------------------


	settext	21,21					;set location of text
	showtxt	version					;Show the actual version

.versionstringdone

;---------------------BGM Number Display---------------------------------
	lda	subbgmmode
	beq	.nosubbgm
	
	settext	0,0
	printvar	subbgm


.nosubbgm
	lda	bgmtest						;load bgmtest
	lbeq	.nobgm					;if its = 0, don't show the next part
	cmp	#27
	lbeq		.nonumber

	lda	selected
	cmp	#1
	bne	.nohilitebgm
	lda	#$FF
	sta	hilite
	sta	hilite+1

.nohilitebgm
	settext	0,21					;set location of text
	showtxt	bgmtext					;show the text "BGM"
	
	stz	hilite
	stz	hilite+1
	
	settext	4,21					;set location of text
	printvar	bgmtest				;show the variable's value
;-----------------------------	



;-------------------BGM Title Name Display-----------------------------------------------------------------------------

.nonumber
	lda	bgmtest						;load player weapon number
	bne	.noclear					;if not = 0, don't reset the numbers to 0 (default)
	stz	bgmtestptr					;otherwise, set the pointer to 0
	stz	bgmtestnextptr				;set next weapon pointer to 0 (this will update on the first cycle)
.noclear
	settext	0,20

	lda	bgmtestptr					;Load the current text pointer location
	tax								;Transfer into x index
	lda	bgmtest						;Load the current weapon number
	cmp	#27
	bpl	.hiliteit
	cmp	#17							;Check if its #17 or higher
	bpl	.loop2						;if so, jump down to loop2
	
	
.loop1					;-----------;BGM #0-16 use this code.
	inx								;Increment x
	lda.l	bgmlist,x			;Load the next letter of the weapons list from the x pointer
	beq	.testisdone					;if its a 0, we are done and we have displayed all letters
	inx								;otherwise, increment x again (Letters duplicate after the first character)
	lda.l	bgmlist,x			;Load the next letter of the weapons list from the x pointer
	beq	.testisdone					;if its a 0, we are done and we have displayed all letters
	sta	open_text					;Otherwise, store this letter into open_text

	lda	#open_text					;Load it back as a pointer
	sta	textpt						;store this into textpt
	jsl	printt_l					;print textpt to screen
.noprint
	bra	.loop1						;go back and find the next letter

.hiliteit
	lda	#$FF
	sta	hilite
	sta	hilite+1
.loop2					;-----------;BGM #17+ use this code to pull from the second weaponslist table
	inx								;Increment x
	lda.l	bgmlist2,x			;Load the next letter of the weapons list from the x pointer
	beq	.testisdone					;if its a 0, we are done and we have displayed all letters
	inx								;otherwise, increment x again (Letters duplicate after the first character)
	lda.l	bgmlist2,x			;Load the next letter of the weapons list from the x pointer
	beq	.testisdone					;if its a 0, we are done and we have displayed all letters
	sta	open_text					;Otherwise, store this letter into open_text

	lda	#open_text					;Load it back as a pointer
	sta	textpt						;store this into textpt
	jsl	printt_l					;print textpt to screen
.noprint2
	bra	.loop2						;go back and find the next letter
	
	
.testisdone		;-------------------;This is where both routines jump when done
	txa								;Transfer X to accumulator
	sta	bgmtestnextptr					;store accumulator to weapnextptr so it knows where the next weapon name starts
	stz	hilite
	stz	hilite+1


;-------------SOUND FX TEST CODE----------------	
.nobgm
	lda	soundtest					;load soundtest
	beq	.nosound					;if its = 0, don't show the next part

	lda	selected
	cmp	#2
	bne	.nohilitesfx
	lda	#$FF
	sta	hilite
	sta	hilite+1

.nohilitesfx
	settext	7,21					;set location of text
	showtxt	sfxtext					;show the text "SFX"

	stz	hilite
	stz	hilite+1
	
	settext	11,21					;set location of text
	printvar	soundtest			;show the variable's value
.nosound


;------------------------------------------------
	a8
	IFEQ	1				;essentially comments out this code until ENDC
	jmp_keyup	select,.startitup
	lda	#10
	sta	stopcounting
	lda	#1
	sta	credits
	a8
	lda	#-1
	sta	fadedir
	jsl	setblack_l
	jsl	transfer_l

	a8
	lda	#1
	sta	pagenumber
	stz	bg2vofsoverride
	stz	subbgmmode
	stz	subbgm
	end_65816
	setfadedown	quick
	mapwaitfade
	start_65816
	jml	foxy_continue_l
.startitup
	ENDC

	jmp_keyup	left,.nomodel
	jmp_keyup	select,.nomodel
	lda	#10
	sta	stopcounting
	trigse		171
	lda	#1
	sta	credits
	sta	menuselected
	a8
	lda	#3
	sta	pagenumber
	lda	#-1
	sta	fadedir
	jsl	setblack_l
	jsl	transfer_l

	a8
	stz	bg2vofsoverride
	end_65816
	setfadedown
	mapwaitfade
	start_65816
foxy_ptr	equ	clac
foxy_shape	equ	clam
	lda	#2								;otherwise, load position #2 and the a_wing shape
	sta	foxy_ptr
	a16
	lda	#a_wing
	sta	foxy_shape
	a8
	jml	foxy_continue_l	
.nomodel


	jmp_keyup	select,.clrsel
	bra	.noclrsel
.clrsel
	stz	ldown
.noclrsel
	lda	ldown
	bne	.nomosaic
	jmp_keyup	select,.nomosaic
	lda	#1
	sta	ldown
	lda	mosaicon
	beq	.init
	cmp	#%11111111
	beq	.reset
	inc	mosaicon
	lda	mosaicon
	sta	mosaic
	bra	.doneinit
.reset
	stz	mosaic
	stz	mosaicon
	bra	.doneinit
.init
	lda	#%00010001
	sta	mosaic
	sta	mosaicon
.doneinit
.nomosaic
	jmp_keyup	start,.nostartgame
	lda	#11
	sta	stopcounting
	trigse		171
	lda	#1
	sta	credits
	a8
	lda	#-1
	sta	fadedir
	jsl	setblack_l
	jsl	transfer_l

	a8
	stz	bg2vofsoverride
	stz	subbgmmode
	stz	subbgm
	end_65816
	setfadedown
	mapwaitfade
	start_65816
	jml	foxy_continue_l


.nostartgame
	jmp_keyup	y,.noquick
	jmp_keyup	b,.noquick
	lda	#1
	sta	$3039
	stz	$3037
	lda	#$15
	sta	$ffd6
	jml	planetseq_l
	
.noquick

	jmp_keyup	start2,.donetwop
	jmp_lastkeydown	start2,.donetwop
	lda	playertwoactivated
	cmp	#1
	lbeq	.nomorep2
	trigse		$10
	lda	#1
	sta	playertwoactivated
	sta.l	m_playertwoactivated
	end_65816

	mapobj	0,140,70,300,playertwo1,tit3_istrat	
	mapwait	100

	start_65816
	bra	.donetwopp
.nomorep2
	trigse		$10
	stz	playertwoactivated
	lda	#0
	sta.l	m_playertwoactivated
	end_65816
	maprem	playertwo1
	start_65816
	bra	.donetwopp
.donetwopp

.donetwop

	
	
;---------------QUICK START-------------

	jmp_keyup	y,.doneqs
	jmp_keyup	x,.doneqs
	jmp_keyup	left,.doneqs
	jmp_lastkeydown	left,.doneqs

	lda	#1
	sta	quickstart
	sta	skipscramble
	sta	snesmini
	trigse		$10
.doneqs
	end_65816

;disabled-------------------------
	IFEQ	1
	jmp_keyup	y,.doneenablesubbgm
	jmp_keyup	x,.doneenablesubbgm
	jmp_lastkeydown	x,.doneenablesubbgm

	lda	#1
	sta	subbgmmode
	
	
.doneenablesubbgm
	

	jmp_keyup	x,.noplaysubbgm
	jmp_keyup	a,.noplaysubbgm
	jmp_lastkeydown	a,.noplaysubbgm
	a8
	lda	subbgm
	sta	bgm_music
	stz	bgmcnt
	jmp	.realend	
.noplaysubbgm

	jmp_keyup	x,.noincsubbgm
	jmp_keyup	y,.noincsubbgm
	jmp_lastkeydown	y,.noincsubbgm
	
	inc	subbgm
	jmp	.realend
.noincsubbgm

	jmp_keyup	x,.nodecsubbgm
	jmp_keyup	b,.nodecsubbgm
	jmp_lastkeydown	b,.nodecsubbgm
	
	
	dec	subbgm
	jmp	.realend
.nodecsubbgm
;---------------RIGHT BGM------------------
	jmp_keyup	right,.end333			;if right isn't down, skip this part
	jmp_keydown	a,.end333
	jmp_keydown	b,.end333
	jmp_lastkeydown	right,.end333		;if right is being held down, don't do this part again
	a16
	lda	bgmtest							;load bgmtest
	a8		
	cmp	#26								;compare to 25
	lbeq	.confirm					;if its true, jump to .confirm which silences the bgm and shows "press r again for bossbgm test"
	cmp	#27								;compare to 26
	lbeq	.boss						;If its true, jump to the routine to start the boss bgm test
	jmp	.continuebgm
.boss
	mapplayermode	onplanet
	setfadedown	quick
	mapwaitfade
	maprem	whale1
	maprem	whale
	maprem	myship_4
	maprem	peppy1
	maprem	slippy1
	maprem	falco1
	start_65816
	lda	#9
	sta	stopcounting
	lda	#99
	sta	stage
	end_65816
	mapjsr	bossbgm2 ;bye felicia
	
.confirm
	inc	bgmtest							
	end_65816
	setbgm	$F0
	start_65816
	lda	bgmtestnextptr
	sta	bgmtestptr
	jmp	.end333
.continuebgm
	a8
	inc	bgmtest
	lda	bgmtestnextptr
	sta	bgmtestptr
	lda	#1
	sta	selected

	lda	bgmtest									;load bgmtest
	cmp	#17										;compare against 17
	bne	.end333									;if not equal, we are done here
	stz	bgmtestptr								;otherwiae, reset the bgmtest pointer
	stz	bgmtestnextptr							;and reset the bgmtest next pointer

.end333

;-----------------------LEFT BGM---------------------------
	lda	keyrdown
	lbne	.end3333
	testjoypad	TLEFT
	lbeq	.end3333
	jmp_keydown	a,.end3333					;all stuff done when you hit L
	jmp_keydown	b,.end3333					;all stuff done when you hit L
	jmp_keydown	right,.end3333					;all stuff done when you hit L
	lda	#1
	sta	keyrdown

	lda	bgmtest									;load bgmtest
	cmp	#2 										;compare against 2
	bmi	.resetbgm1							;if its less than 2 (0 or 1), reset to bgm #25
	bra	.continuebgm1							;otherwise, go to .continuebgm1
.resetbgm1
	lda	#26										;load #26 into accumulator
	sta	bgmtest									;store #26 into bgmtest
	lda	#1
	sta	selected

;	jmp	.end3331								;done with this part
	jmp	.bridgetoend
.continuebgm1
;	a8											;8 bit accumulator (for bgm)
	dec	bgmtest									;decrease value of bgmtest
	lda	#1
	sta	selected
;	jmp	.end3331								;done
;----------------------------------	
.end3331
	lda	bgmtest						;load bgmtest
	cmp	#16							;compare to 16
	beq	.bridgedown					;if its = 16, we need to bridge down to the end of table 1
	cmp	#26							;compare to 25
	beq	.bridgetoend				;if its = 25, we need to bridge up to the end of table 2
	cmp	#16							;compare to 16 again
	bpl	.looper1secondtable			;if its greater than 16, jump to second table

.looper1firsttable					;first table
	lda	bgmtestptr					;load current pointer
	tax								;transfer to x
	dex								;decrease x
.looper1
	dex								;decrease x
	lda.l	bgmlist,x				;load the previous letter in list
	beq	.doneloop1					;if = 0 we're done
	cmp	#1							;compare to 1
	beq	.doneloop1					;if = 1 we're done
	bra	.looper1					;otherwise go back and keep going

.looper1secondtable					;second table
	lda	bgmtestptr					;load the current pointer
	tax								;transfer to X
	dex								;decrease x
.looper12
	dex								;decrease x
	lda.l	bgmlist2,x				;load the previous letter in list2
	beq	.doneloop1					;if it = 0 we're done
	cmp	#1							;compare to 1
	beq	.doneloop1					;if = 1 we're done
	bra	.looper12					;otherwise, go back and continue

	
.doneloop1							;both end up here
	dex								;decrease x by 1 more
	txa								;transfer x to a
	sta	bgmtestptr					;store to pointer
	
	bra	.nochh
;-------	
.bridgedown
	lda	#243						;location of last bgm description in bgmlist (fortuna)
	sta	bgmtestptr					;store to pointer
	bra	.nochh						;done
;------------
.bridgetoend
	lda	#138						;location of last bgm description in bgmlist2 (Venom Levels 1+3)
	sta	bgmtestptr					;store to pointer
;	jmp	.nochh						;done
;------------

.nochh
	
.end3333
;----------------------------------------------------------
	TESTJOYPAD	TLEFT	
	bne	.noreleaserightkey
	stz	keyrdown
.noreleaserightkey

	testjoypad	RIGHT
	beq	.noright
	startbgm	$F5
.noright
	testjoypad	left
	beq	.noleft
	startbgm	$F4
.noleft


	a8
	jmp_keyup	a,.end1
	jmp_lastkeydown	a,.end1
	bra	.rightsound
.end1
	jmp_keyup	b,.end3
	a16
	lda	trig0
	bit	#pad_b
	a8
	lbeq	.end3
	bra	.leftsound




	
.rightsound
	a16
	lda	soundtest
	cmp	#175
	beq	.resetsoundteststart
	cmp	#1
	beq	.doubleinc
	inc	soundtest
	bra	.donesound
.doubleinc
	lda	#3
	sta	soundtest
	bra	.donesound
.resetsoundteststart
	stz	soundtest
	inc	soundtest
	bra	.donesound
.leftsound
	a16
	lda	soundtest
	cmp	#2
	bmi	.resetsoundtestend
	cmp	#3
	beq	.goto1
	dec	soundtest
	bra	.donesound
.goto1
	lda	#1
	sta	soundtest
	bra	.donesound
.resetsoundtestend
	lda	#175
	sta	soundtest
.donesound
	lda	#2
	sta	selected
.end3
	a8
	jmp_keyup	y,.end7
	a16
	lda	trig0
	bit	#pad_y
	a8
	lbeq	.end7
	lda	selected
	cmp	#1
	beq	.playbgm
	cmp	#2
	lbeq	.playsound
	
	jmp	.end7
.playbgm
	bgmtesting
	bra	.end7
.playsound
	a8
;	bgm2	init
	end_65816
	setbgm	$F0
	start_65816
	lda	soundtest
	jsl	setport3_l

.end7
	lda	soundtest
	bne	.ok
	lda	bgmtest
	bne	.ok
	bra	.realend
.ok
	settext	0,22
	showtxt	pressytext
.realend
	ENDC
	;end_65816
;done disabled------------------------------



	mapwait	50
	mapgoto	.ll
;.end333
;	a8
;	end_65816
;	mapwait	50
;	mapgoto	.ll
;------------------------------------------------------------


contmap	setfadedown	quick
	mapwaitfade
	setbg	cont
	initbg

	start_65816
	a16
	stz	lastplayz
	stz	pviewposz
	ldx	playpt
	stz	al_worldz,x
	a8
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode

;	lda	pshipflags
;	ora	#psf_noctrl!psf_nofire
;	sta	pshipflags
	end_65816

	mapwait	medpspeed*4

	mapcode_jsl	initblack_l
	setvar.n	stayblack,3
	setfadeup	quick
.ll	mapwait	4000
	mapgoto	.ll

waitmap
;;	setfadedown	quick
;;	mapwaitfade
;;	setbg	gameover
;;	initbg
;;	setfadeup	quick
;;	mapcode_jsl	initblack_l
;;	setvar	stayblack,5
;;
;;	pathobj	0,-285,200,3400,gamesh,game,255,0
;;	pathobj	0,0285,200,3400,oversh,over,255,0
;;
;;	pathobj	0,-285,200,3400,gamesh,gameover,255,0
;;	pathobj	0,0285,200,3400,oversh,gameover,255,0

.ll	mapwait	4000
	mapgoto	.ll




