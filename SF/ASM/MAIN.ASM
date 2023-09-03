safeinidisptop	equ	1

	incpublics	EXT\main.ext

initialise_l ; Initialize game

	php ; Push Processor status to stack
	a8 ; set A to 8-bit

	lda	#40	; store 40 in all these variables:
	sta	fox	; hack to allow check for fox's hp
	sta	frog
	sta	bunny
	sta	cock
	sta	pepper
	sta	andorf

	jsl	playerstart_init_l ; Initialize player variables
	jsl	initplanets_l ; Initialize the planet selection

	ai16 ; Set A to 16-bit
	stz	boss_ptr ; store 0 at boss pointer variable
	stz	specptr ; store 0 at special pointer variable (score?)
	stz	specialobjtotal ; store 0 at special object total variable (score?)

	lda	#allcolscru&WM	; uncrunch colours and copy up
	sta.l	m_enddata
	lda	#$1000
	sta.l	m_decaddr
	lda	#0
	sta.l	m_decoffset
	a8
	lda	#allcolscru>>16
	sta.l	m_enddatabnk
	lda	#mdecrunch>>16
	ldx	#mdecrunch&WM
	jsl	runmario_l ; Run the MARIO chip

	a16 ; set A to 16 bit
	ldx	#0 ; load 0 into X
.lp	lda.l	$701000,x ; Load contents of addr $701000 + X into A
	sta.l	gamepalettes,x ; store A to gamepalettes variable + X
	inx ; Increment X
	inx ; Increment X
	cpx	#8192 ; Compare 8192 with X
	bne	.lp ; Branch to .lp if X != 8192

	plp ; Pull processor status from stack
	rtl ; Return from subroutine (Long)

initgame_l ; Initialize game
	php ; Push processor status to stack
	phb ; Push data bank to stack
	a8 ; Set A to 8 bit
	IFNE	FASTROM ; Start conditional: if FASTROM !=0 (=1)
	lda	#$80 ; Load $80 into A (Bank 80 for FastROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ELSEIF ; else if FASTROM = 0
	lda	#0 ; Load 0 into A (Bank 0 for SlowROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ENDC ; End conditional

	disable ; Disable interrupts (sei)

	a8 ; Set A to 8 bit
	stz	hdmaen ; Store 0 at HDMAEN register
	lda	#$80 ; Load $80 into A
	setinidisp1 ; TODO: this
	sta	inidisp ; store A at INIDISP register
	stz	fadedir ; store 0 in fadedir variable
	stz	fade ; store 0 at fade variable

	waitdma	110 ; wait for line 110
	waitdma	100	; wait for line 100 ; turn off screen and wait for sync

	ai16 ; set A to 16 bit
	stz	levelfinished ; store 0 at levelfinished variable
	stz	circleanim ; store 0 at circleanim variable
	stz	mapcnt ; store 0 at mapcnt variable
	stz	lastplayz ; store 0 at lastplayz variable
	stz	lastzchange ; store 0 at lastzchange variable
	stz	viewposz	; reset map position (Reset camera Z position?)
	lda	#1 ; Load 1 into A
	sta.l	m_meters ; Store 1 at m_meters var (show meters)
	stz	levelfinished ; Store 0 at level finished var
	stz	cont0l ; store 0 at controller 0 status var
	stz	sdgpt3 ; store 0 at sdgpt3 var
	stz	sdspt3 ; store 0 at sdspt3 var
	stz	sdpck3 ; store 0 at sdpck3 var

	a8 ; set A to 8 bit
	lda	#1 ; Load 1 into A
	sta	shieldon ; Store A into shieldon var (shield on)
	stz	showtype ; store 0 at showtype var
	stz	msg_count1 ; store 0 at msg_count1 var
	stz	msg_count2 ; store 0 at msg_count2 var
	stz	restartcol ; store 0 at restartcol var
	stz	onecredspr ; store 0 at onecredspr var
	stz	doneacircle ; store 0 at doneacircle var
	stz	windowmode ; store 0 at windowmode var
	stz	nosetport3 ; store 0 at nosetport3 var
	stz	pausesnd ; store 0 at pausesnd variable
	stz	sdpck3 ; store 0 at sdpck3 var
	stz	prttraining ; store 0 at prttraining var

	jsl	kill_list_l	; format alien list
	jsl	initmem_l ; Initialize RAM

	lda	mapbank
	pha

; set up player's objects
	lda.l	mapbase+2 ; Load mapbase+2 into A
	sta	mapbank ; Store A at mapbank
	ai16 ; Set A to 16 bit
	lda	mapptr ; Load Map Pointer into A
	pha ; Push A to stack
	lda.l	mapbase ; Load mapbase into A
	tax ; transfer A to X
	jsl	newobjs_l	;add player obj

	a8 ; set A to 8 bit
	jsl	initgame_strats_l	;initialize game strats

	i16 ; enable interrupts?
	plx ; Pull X from stack
	pla ; Pull A from stack
	sta	mapbank ; Store A in mapbank var
	a16 ; Set A to 16 bit
	stz	levelfinished ; Store 0 in levelfinished flag
	stx	mapptr ; Store X to map pointer
	jsl	newobjs_l		; set new map going

	jsl	initgame3d_l ; MARIO chip witchcraft

	jsl	find_window_pri_l ; Find window priority?

	plb ; Pull data bank from stack
	plp ; Pull processor status from stack
	rtl ; Return from subroutine

initgame3d_l ; MARIO chip witchcraft
	php ; Push processor status to stack
	a16 ; Set A to 16 bit
	lda	#$1234 ; Load $1234 into A
	sta.l	m_particlerand ; store A at m_particlerand MARIO chip var
	lda	#1 ; Load 1 into A
	sta.l	m_clrbitmaps ; store A at m_clrbitmaps MARIO chip var
	jsl	initscreen_l ; Initialize Screen
	a8 ; Set A to 8 bit
	lda	#deg180 ; Load 180 degrees const into A
	sta	roty ; Store A to Y rotation var
	lda	#-1 ; load -1 into A
	sta	mariocode ; store mariocode var into a
	stz	trans_flag ; store 0 at transfer flag
	ai8 ; Set A to 8 bit
	jsr	gameclipwindow ; Go to game clip window subroutine
	jml	init3d1 ; Jump to init3d1 subroutine



gamestart
	ai8 ; Set A to 8 bit
	jsl	initgame_l ; Initialize game
gameloop2

; @!: A ends up being set to 8 bit twice. This is probably unnecessary and uses up more CPU cycles.
; The macro may have been missed when the "foxyfoxy" stuff was being commented out.
	a8 ; set A to 8 bit
;	lda	foxyfoxy
;	beq	.nofox
;	stz	foxyfoxy
;	jsl	foxy_continue_l
;	jml	planetseq_l
;.nofox

	a8 ; set A to 8 bit
	lda	singlestep
	bne	.nopause
	lda	pshipflags
	bit	#psf_noctrl
	bne	.nopause
	lda	bossflags
	and	#bf_dying
	bne	.nopause
	lda	pstratflags
	and	#pstf_notdie
	bne	.nopause

	lda	cont0l
	bit	#key_start
	beq	.nopause

	IFEQ	CONTEST
	jsr	dopause
	ENDC
.nopause
	jsl	setblack_l
	jsl	stratdebug_l
	jsl	transfer_l		;transfer bitmap, do strats etc.
	jsl	friends_messages_l

cestimeron	=	0
	IFEQ	cesdemo-1
cestimeron	=	1
	ENDC

	IFNE	contest
cestimeron	=	1
	ENDC

	IFNE	cestimeron
	jsl	cestimer_l
	ENDC

	a16
	lda	levelfinished
	lbeq	gameloop2

	cmp	#le_gameover
	lbeq	gameover_l

	inc	stage

	a8
	lda	#1
	sta	doingend
	stz	crosshairon

;---------------------------------------------------------------------
	lda	levelfinished
	cmp	#le_fadedown
	beq	exitspec.dofadedown
	cmp	#le_bhole1
	beq	exittobhole1
	cmp	#le_bhole2
	beq	exittobhole2
	cmp	#le_bhole3
	beq	exittobhole3
	cmp	#le_special
	beq	exittospecial
	cmp	#le_enterbhole
	beq	enterbhole
	cmp	#le_enterspec
	beq	exitspec.white

	jsr	end_level_seq

	a8
	lda	levelfinished
	cmp	#le_startgame
	bne	.noplanets
	stz	doingend
	jml	gamestart
.noplanets
	shorta
	lda	levelfinished
	cmp	#le_endofgame
	lbeq	end_game_seq
exitspec

.wait
.dofadedown	local
	a8

	lda	doneacircle
	bne	.exit

	lda	levelfinished
	cmp	#le_fadetowhite
	bne	.black

.white	local
	a8
	lda	#40
.lp1	pha
	jsl	fadewhite_l	
	jsl	transfer_l
	a8
	pla
	dec	a
	bne	.lp1

.black	fadedown
.lp	jsl	transfer_l
	a8
	lda	fadedir
	bne	.lp

.exit	a8
	stz	doingend
	jml	planetseq_l



;--------------------------------------------------------------------
	shorta
	longi
exittobhole1	routechange	bhole1
	bra	gotobholeplanets
exittobhole2	routechange	bhole2
	bra	gotobholeplanets
exittobhole3	routechange	bhole3
	bra	gotobholeplanets
exittospecial	routechange	1
gotobholeplanets
enterbhole
	a8i16
	ldx	specptr
	lda	#101
	sta	specbuf,x
	inx
	stx	specptr
	stz	doingend
	jml	planetseq_l



;--------------------------------------------------------------------
setpath	macro
	jsr	setthepath
	endm


gameover_l	; Game over screen

	jsl	gameoverinit_l ; Go to Game Over Initialization subroutine

	a8i16 ; set A to 8 bit

	bgm	gameover ; Set BGM to gameover
	stz	defaulttrain ; stz to defaulttrain var
	lda	#0 ; Load 0 into A
	sta.l	contexit ; Store A at contexit var

	jsl	bg_gameover_1 ; Jump to subroutine to set Game Over Background
	decclear ; MARIO chip stuff

	lda	#1 ; Load 1 into A
	sta	fadedir ; Store A into fadedir var
	sta	bg2vofsoverride ; Store A into bg2vofsoverride var
	a16 ; set A to 16 bit
	stz	bg2hofsreq ; Store 0 at bg2hofsreq var
	lda	#32 ; Load 32 into A
	sta	bg2vofsreq ; Store A at bg2vofsreq var

	lda	#50 ; Load 50 into A
.lp2	pha ; Push processor status to stack
	jsr	setbg23toblack ; Set BG layers 2 and 3 to black
	jsl	setblack_l ; Set screen to black (fade?)
	jsl	transfer_l ; Go to transfer loop subroutine
	a16 ; set A to 16 bit
	pla ; Pull A from stack
	dec	a ;  Decrement A
	bne	.lp2 ; Repeat until A = 0

	a8 ; Set A to 8 bit
	stz	trig0 ; Store 0 at trig0 var
	a16 ; Set A to 16 bit
	lda	#60*20 ; Load result of 60*20 to A
.lp4	pha ; Push A to stack
.lp	jsr	fadehalf2norm ; go to fadehalftonorm subroutine
	jsl	setblack_l ; Set screen to black (fade?)
	jsl	transfer_l ; go to transfer loop subroutine
	a8i16 ; Set A to 8 bit
	window_addr	halffade ; Set window to half fade
	lda	wm_val,x ; Load wm_val + x into a
	bne	.lp ; Repeat until A = 0
	a8 ; Set A to 8 bit
	testkeydown	start ; Check if START has been pressed on controller 1
	bne	.ps ; branch to .ps (Pressed Start) sublabel if yes
	a16 ; Set A to 16 bit
	pla ; Pull A from stack
	dec	a ; Decrement A
	bne	.lp4 ; repeat until A = 0

.ps ; Pressed Start
	a8 ; Set A to 8 bit
	lda	#-1 ; Load -1 into A
	sta	fadedir ; Store in fadedir var
.lp3	jsr	fadehalf2norm ; go to fadehalftonorm subroutine
	jsl	setblack_l ; Set screen to black (fade?)
	jsl	transfer_l ; go to transfer loop subroutine
	a8 ; set A to 8 bit
	untilfaded .lp3 ; repeat until fade finished

	a8 ; set A to 8 bit
	stz	bg2vofsoverride ; Store 0 at bg2vofsoverride var
	lda	#1 ; Load 1 into A
	sta	defaulttrain ; Store A at defaulttrain var
	lda	#1 ; Load 1 into a
	sta.l	contexit ; Store A at contexit variable

	jsl	foxy_continue_l ; Jump to continue screen subroutine
	jml	planetseq_l ; Jump to planet screen


end_game_seq ; Stuff to do with Game End Demo?
	a8i16 ; Set A to 8 bit
	lda	#0 ; Load 0 into A
	sta.l	m_meters ; Store A at m_meters variable (hide meters)

	ifeq	1 ; Start conditional: If 1 = 0 (commented out code)
	lda	#100 ; Load 100 into A
	sta	specbuf ; Store A at specbuf var
	lda	#15 ; Load 15 into a
	sta	specbuf+1 ; Store A at specbuf var +1
	lda	#101 ; Load 101 into A
	sta	specbuf+2 ; Store A at specbuf var +2
	lda	#101 ; Load 101 into A
	sta	specbuf+3 ; Store A at specbuf var +3
	lda	#70 ; Load 70 into A
	sta	specbuf+4 ; Store A at specbuf var +4
	lda	#33 ; Load 33 intoA
	sta	specbuf+5 ; Store A at specbuf var +5
	lda	#6 ; Load 6 into A
	sta	specptr ; Store A at specbuf var
	endc ; End Conditional


	ai16 ; set A to 16 bit
	lda	#-550 ; Load -550 into A
	sta	vram1addr ; Store A at VRAM transfer addr variable
	lda	#msg_1 ; Load MARIO text display data for the number 1
	sta	vram1len ; Store A at VRAM transfer length variable
	stz	vram2addr ; Store A at BG2 SCR (tilemap?) variable
	lda	#1 ; Load 1 into A
	sta	vram2len ; Store A at VRAM transfer length 2 variable
	stz	vram3addr ; Store A at VRAM transfer length 3 variable


	a8 ; Set A to 8 bit
	lda	#200 ; load 200 into A
	sta	c_type ; Store A to control type variable

; this appears to be responsible for drawing the stage totals (or at least some text) during the Game End Demo
stagescore	a16 ; Set A to 16 bit
	dec	vram2len ; Decrement VRAM transfer length 2 variable
	lbne	.skip ; Long branch to .skip sublabel if vram2len != 0
	ldx	vram2addr ; Load VRAM transfer length 2 variable into X
	cpx	specptr ; Compare X with specptr
	lbeq	.skip ; Long branch to .skip sublabel if vram2len = 0

	lda	#30 ; Load 30 into A
	sta	vram2len ; Store A at VRAM transfer length 2 variable

	lda	#msg_stage ; Load MARIO text display data for "STAGE" into A
	ldx	#-500 ; Load -500 into X
	ldy	vram1addr ; Load VRAM transfer addr variable into Y
	jsr	makeendobj ; Go to makeendobj subroutine to create text on screen
	setpath ; set PATH

	lda	vram1len ; Load VRAM transfer length 1 into A
	ldx	#000 ; Load 000 into X
	ldy	vram1addr ; Load VRAM transfer addr 1 into Y
	jsr	makeendobj ; Go to makeendobj subroutine to create text on screen
	setpath ; set PATH
	inc	vram1len ; increment VRAM transfer length 1
	inc	vram1len ; increment VRAM transfer length 1

	ldx	vram2addr ; Load VRAM transfer length 2 variable into X
	lda	specbuf,x ; Load specbuf var + X into A
	inx ; increment X
	stx	vram2addr ; Store X to VRAM transfer length 2 variable
	and	#$ff ; AND A with $FF
	sta	tpa ; Store A to tpa var
	asl	a ; Arithmetic Shift Right A
	asl	a ; Arithmetic Shift Right A
	clc ; Clear carry flag
	adc	tpa ; Add tpa var to A
	clc ; Clear carry flag
	adc	#msg_00&WM ; add MARIO text display data for "00" &FFFF to A
	ldx	#600 ; Load 600 into X
	ldy	vram1addr ; Load VRAM transfer addr 1 into Y
	jsr	makeendobj ; Go to makeendobj subroutine to create text on screen
	setpath ; Set PATH

	lda	vram1addr ; Load VRAM transfer addr 1 into A
	clc ; Clear carry flag
	adc	#200 ; Add 200 to A
	sta	vram1addr ; store A to VRAM transfer addr 1 variable

	inc	vram3addr ; Increment VRAM transfer addr 3 variable
	inc	vram3addr ; Increment VRAM transfer addr 3 variable

.skip
	a8 ; Set A to 8 bit
	lda	c_type ; Load controller type into A
	cmp	#200 ; Compare with 200
	beq	.nod ; Branch to .nod sublabel if A != 200
	dec	c_type ; Decrement controller type variable
.nod
	jsl	transfer_l ; Go to transfer loop subroutine
	a8 ; Set A to 8 bit
	lda	c_type ; Load controller type into A
	cmp	#201 ; Compare A with 201
	lbne	stagescore ; Long branch to stagescore if c_type is not equal to 201

	jsr	maketotalscore ; Go to maketotalscore subroutine

	a16 ; Set A to 16 bit
	lda	#80 ; Load 80 into A
.lp	pha ; Push A to stack
	jsl	transfer_l ; Go to transfer loop subroutine
	a16 ; Set A to 16 bit
	pla ; Pull A from stack
	dec	a ; Decrement A
	bne	.lp ; repeat until A = 0

	a8 ; Set A to 8 bit
	lda	#le_endtotalscore ; Load le_endtotalscore into A
	sta	levelfinished ; Store A to levelfinished var

	a16 ; Set A to 16 bit
	lda	#400-30 ; Load result of 400-30 into A
.lp2	pha ; Push A to stack
	jsl	transfer_l ; Go to transfer loop subroutine
	a16 ; Set A to 16 bit
	pla ; Pull A from stack
	pha ; Push A from stack
	cmp	#15 ; Compare A with 15
	bcs	.nnn ; branch to .nnn sublabel if A > 15
	a8 ; Set A to 8 bit
	lda	#-1 ; Load -1 into A
	sta	fadedir ; Store at fadedir var
	a16 ; Set A to 16 bit
.nnn	pla ; Pull A from stack
	dec	a ; Decrement A
	bne	.lp2 ; Repeat until A = 0

	jsl	endseq_l ; Jump to End Sequence

	a8i16 ; Set A to 8 bit
	bgm	staff ; Set BGM to Staff Roll (Main Theme)
	lda	#creditsmap>>16 ; Load credits map shifted right by 16 into A
	ldx	#creditsmap&$7fff ; Load credits map &7fff into X
	sta	mapbank ; Store A at map bank var
	stx	mapptr ; Store X at map ptr var
	jsl	initgame_l ; Initialize game
	stz	levelfinished ; Store 0 to level finished flag
.lp3	jsl	setblack_l ; Go to set screen to black subroutine
	jsl	transfer_l ; Go to transfer loop subroutine
	a8 ; Set A to 8 bit
	lda	levelfinished ; Load level finished flag into A
	cmp	#le_endofcreds ; Compare with end of credits flag
	bne	.lp3 ; repeat until A = end of credits var

	jsr	maketotalscore2 ; Get total score

.lp4	jsl	transfer_l ; Go to transfer loop subroutine
	bra	.lp4 ; infinite loop



	shorta
	longi
setthepath	php
	a8
	phx
	ldx	vram3addr
	jmp	(.tab,x)
.tab	dw	.1&WM
	dw	.2&WM
	dw	.3&WM
	dw	.4&WM
	dw	.5&WM
	dw	.6&WM
	dw	.7&WM
	dw	.8&WM
	dw	.9&WM
	dw	.10&WM
	dw	.11&WM
.1	plx
	s_set_path	x,stage1
	lda	#1
	jmp	checkifiamend
.2	plx
	s_set_path	x,stage2
	lda	#2
	jmp	checkifiamend
.3	plx
	s_set_path	x,stage3
	lda	#3
	jmp	checkifiamend
.4	plx
	s_set_path	x,stage4
	lda	#4
	jmp	checkifiamend
.5	plx
	s_set_path	x,stage5
	lda	#5
	jmp	checkifiamend
.6	plx
	s_set_path	x,stage6
	lda	#6
	jmp	checkifiamend
.7	plx
	s_set_path	x,stage7
	lda	#7
	jmp	checkifiamend

.8	plx
	s_set_path	x,total
	plp
	rts
.9	plx
	s_set_path	x,totaln
	plp
	rts
.10	plx
	s_set_path	x,ave
	plp
	rts
.11	plx
	s_set_path	x,aven
	plp
	rts

	shorta
	longi
checkifiamend
	cmp	specptr
	jne	.ok
	lda	#30
	sta	c_type
.ok	plp
	rts

;------------------------
maketotalscore
	a8
	lda	#1
	sta	c_type

	ai16
	lda	#14
	sta	vram3addr

	jsr	calctotalscore
	lda	tpa
	sta.l	m_x1		;divisor
	lda	specptr
	sec
	sbc.l	hadabumhole
	sta.l	m_y1		;dividend
	call_mario	mkrisdivu3115
	lda.l	m_x1		;quotient
	sta	kval1
	asl	a
	asl	a
	clc
	adc	kval1
	clc
	adc	#msg_00&WM
	pha


	lda	#msg_total&WM
	ldx	#0
	ldy	#-1600
	jsr	makeendobj
	setpath
	a16
	inc	vram3addr
	inc	vram3addr
	lda	#25
.wait	pha
	jsl	transfer_l
	a16
	pla
	dec	a
	bne	.wait

	a16
	jsr	calctotalscore
	lda	tpa
	sta	cla2
	lda	#-200
	sta	cla1
	lda	cla2
	ldx	#-1
.sub100	inx
	sec
	sbc	#100
	jns	.sub100
	clc
	adc	#100
	sta	cla2
	txa
	ora	#0
	je	.sub10do
	ldx	#-300
	ldy	#-1400
	jsr	makeendobjn
	setpath
.sub10do	lda	cla2
	ldx	#-1
.sub10	inx
	sec
	sbc	#10
	jns	.sub10
	clc
	adc	#10
	sta	cla2
	txa
	ora	#0
	ldx	#-150
	ldy	#-1400
	jsr	makeendobjn
	setpath
.sub1do	lda	cla2
	ldx	#000
	ldy	#-1400
	jsr	makeendobjn
	setpath
	lda	#0
	ldx	#150
	ldy	#-1400
	jsr	makeendobjn
	setpath
	lda	#0
	ldx	#300
	ldy	#-1400
	jsr	makeendobjn
	setpath

	a16
	inc	vram3addr
	inc	vram3addr
	lda	#25
.wait2	pha
	jsl	transfer_l
	a16
	pla
	dec	a
	bne	.wait2


	lda	#msg_ave&WM
	ldx	#0
	ldy	#-850
	jsr	makeendobj
	setpath
	inc	vram3addr
	inc	vram3addr

	lda	#25
.wait3	pha
	jsl	transfer_l
	a16
	pla
	dec	a
	bne	.wait3

	pla
	ldx	#0
	ldy	#-650
	jsr	makeendobj
	setpath
	inc	vram3addr
	inc	vram3addr

	a8
	stz	c_type
	a16
.fail
	rts

	longa
	longi
calctotalscore_l
	jsr	calctotalscore
	rtl

calctotalscore	stz	tpa		;add all special perc and print it *100
	lda	#0
	sta.l	hadabumhole
	ldx	#0
.addlp	cpx	specptr
	beq	.addx
	lda.l	specbuf,x
	and	#$ff
	cmp	#101
	bne	.ok
	lda.l	hadabumhole
	inc	a
	sta.l	hadabumhole
	lda	#0
.ok	clc
	adc	tpa
	sta	tpa
	inx
	bra	.addlp
.addx	rts

totalxpos	equ	500
totalypos	equ	750
totalzpos	equ	3600

maketotalscore2
	ai16
	jsr	calctotalscore
	lda	tpa
	sta.l	m_x1		;divisor
	lda	specptr
	sec
	sbc.l	hadabumhole
	sta.l	m_y1		;dividend
	call_mario	mkrisdivu3115
	lda.l	m_x1		;quotient
	sta	kval1
	asl	a
	asl	a
	clc
	adc	kval1
	clc
	adc	#msg_00&WM
	pha


	lda	#msg_total&WM
	ldx	#totalxpos
	ldy	#totalypos
	jsr	makeendobj2
	a16
	lda	#10
.wait	pha
	jsl	transfer_l
	a16
	pla
	dec	a
	bne	.wait

	a16
	jsr	calctotalscore
	lda	tpa
	sta	cla2
	lda	#-200
	sta	cla1
	lda	cla2
	ldx	#-1
.sub100	inx
	sec
	sbc	#100
	jns	.sub100
	clc
	adc	#100
	sta	cla2
	txa
	ora	#0
	je	.sub10do
	ldx	#totalxpos-300
	ldy	#totalypos+150
	jsr	makeendobjn2
.sub10do	lda	cla2
	ldx	#-1
.sub10	inx
	sec
	sbc	#10
	jns	.sub10
	clc
	adc	#10
	sta	cla2
	txa
	ora	#0
	ldx	#totalxpos-150
	ldy	#totalypos+150
	jsr	makeendobjn2
.sub1do	lda	cla2
	ldx	#totalxpos+0
	ldy	#totalypos+150
	jsr	makeendobjn2
	lda	#0
	ldx	#totalxpos+150
	ldy	#totalypos+150
	jsr	makeendobjn2
	lda	#0
	ldx	#totalxpos+300
	ldy	#totalypos+150
	jsr	makeendobjn2
	a16
	lda	#10
.wait2	pha
	jsl	transfer_l
	a16
	pla
	dec	a
	bne	.wait2


	lda	#msg_ave&WM
	ldx	#totalxpos
	ldy	#totalypos+300
	jsr	makeendobj2

	a16
	lda	#10
.wait3	pha
	jsl	transfer_l
	a16
	pla
	dec	a
	bne	.wait3

	pla
	ldx	#totalxpos+0
	ldy	#totalypos+450
	jsr	makeendobj2
.fail
	rts


	longa
	longi
makenumt	asl	a		;*2
	clc
	adc	#msg_0&WM
makenump	sta	kval1
	a8
	phb
	lda	#$7e
	pha
	plb
	ldx	allst
	s_make_obj	#zaco_4,.fail
	tyx
	s_set_strat	x,patht_istrat
	s_text_obj	x,kval1,#14
	s_set_alvar	B,x,al_ty,#7
	s_set_path	x,total
	ldy		viewpt
	s_copy_pos	x,y
	a16
	lda	al_worldx,x
	clc
	adc	cla1
	sta	al_worldx,x
	a8
	s_add_alvar W,x,al_worldy,#1100
	s_add_alvar W,x,al_worldz,#4000
.fail	plb
	a16
	lda	cla1
	clc
	adc	#150
	sta	cla1
	rts


	longa
	longi
makeendobjn	asl	a		;*2
	clc
	adc	#msg_0&WM
makeendobj	sta	kval1
	stx	ktpx
	sty	ktpy
	php
	a8
	phb
	lda	#$7e
	pha
	plb
	ldx		allst
	s_make_obj	#zaco_4,.fail
	tyx
	s_set_strat	x,patht_istrat
	s_text_obj	x,kval1,#3
	s_set_alvar	B,x,al_ty,#3
	s_set_path	x,total
	ldy	viewtoobj	playpt
	s_copy_pos	x,y
	s_add_alvar W,x,al_worldx,ktpx
	s_add_alvar W,x,al_worldy,ktpy
	s_add_alvar W,x,al_worldz,#4000
	a8
.fail	plb
	plp
	rts

	longa
	longi
makeendobjn2	asl	a		;*2
	clc
	adc	#msg_0&WM
makeendobj2	sta	kval1
	stx	ktpx
	sty	ktpy
	php
	a8
	phb
	lda	#$7e
	pha
	plb
	ldx		allst
	s_make_obj	#zaco_4,.fail
	tyx
	s_set_strat	x,patht_istrat
	s_text_obj	x,kval1,#5
	s_set_alvar	B,x,al_ty,#3
	s_set_path	x,fadeintotal
	ldy	playpt
	s_copy_pos	x,y
	s_add_alvar W,x,al_worldx,ktpx
	s_add_alvar W,x,al_worldy,ktpy
	s_add_alvar W,x,al_worldz,#totalzpos
.fail	a8
	plb
	plp
	rts


;----------------------------------------------------------------------------------------------
nametxt	dw	bunnytxt&WM,cocktxt&WM,frogtxt&WM
namepos	dw	15,96,173
deadnamepos	dw	11,91,170
namegfxpos	db	2,11*8
	db	12,11*8
	db	22,11*8

calcstageperc	php
	IFEQ	CONTEST
	ai8				;take 7% of total killed for every friend alive and add to total killed
	lda	#0
	ldx	bunny
	beq	.deadb
	clc
	adc	#5
.deadb	ldx	frog
	beq	.deadf
	clc
	adc	#5
.deadf	ldx	cock
	beq	.deadcock
	clc
	adc	#5
.deadcock	ai16
	and	#$ff
	sta	tpa

	ELSEIF
	a16
	stz	tpa
	ENDC

	a8
	stz	stageclear

;--------------------------------------
	a16
	lda	specialobjtotal
	and	#$ff
	beq	.zero
	sta.l	m_y1
	lda	specials_dead
	and	#$ff
	sta.l	m_x1
	call_mario	mcalcperc
	lda.l	m_x1
.zero	clc
	adc	tpa
	cmp	#100
	bcc	.n100
	lda	#100
.n100	sta	cla2
	plp
	rts


end_level_seq	ai16
	jsr	calcstageperc

	lda	levelfinished
	cmp	#le_endofgame
	lbeq	finis1


; what ALCS used are...
;  cla1 - current percentage
;  cla2 - target percentage
;  clb1 - 0 = prt graph, 1=print bonus, 2=graph and credit sound and dec clb1,  3=graph and dec clb1
;  clb2 - 1 = exit printing loop, 1 =  exit to planets, 2 = exit printing loop but display screen
;  clam - 0 = increment cla1 to cla2 1=nothing 2=add value <>0 <>1 <>2 = decrement
;  clbm - old total score
;plotx1 - counter to display fox sprite and inc credit.

	ai16
	jsr	calctotalscore
	lda	tpa
	sta	clbm
  
	stz	cla1
	stz	clb1
	stz	clam
	stz	plotx1
printspeclp
	jsl	transfer_l

	ai16
	IFEQ	CONTEST
	clrmes	totalscoretxt,16,44	;total score
	ELSEIF
	clrmes	totalscoretxt,16,100	;total score
	ENDC

	IFEQ	CONTEST
	a16
	jsr	calctotalscore
	lda	tpa
	sta.l	m_z1

	lda	#176
	sta.l	m_x1
	lda	#39
	sta.l	m_y1
	call_mario mprtperc		;this subtracts 8 from x1 if >=100 and adds 8 if <10

	call_mario mprt2zeros
	ELSEIF

	lda	#176-16
	sta	x1
	lda	#100
	sta	y1
	jsl	printpscore_l
	ENDC


	lda	clb1
	beq	.graph
	dec	a
	bne	.graph

	IFEQ	CONTEST
	clrmes	bonustxt,16,24		;print 'bonus...'
	ELSEIF
	clrmes	bonustxt,16,68		;print 'bonus...'
	ENDC

	lda	plotx1
	lbeq	.doneg
	dec	a
	sta	plotx1
	cmp	#1
	lbne	.doneg
	a8

	IFEQ	CONTEST
	inc	credits
	lda	#1
	sta	onecredspr
	ELSEIF
	a16
	lda.l	playerscore
	clc
	adc	#10000
	sta.l	playerscore
	ENDC

	a16
	jmp	.doneg
.graph
	sta	clb1
	cmp	#2			;bonus sound
	bne	.nc
	a8
	trigse	01ah
	a16
	lda	#10
	sta	plotx1
.nc
	IFEQ	CONTEST
	clrmes	scoretxt,16,24
	ELSEIF
	clrmes	scoretxt,16,68
	ENDC

	lda	#60
	sta.l	m_x1

	IFEQ	CONTEST
	lda	#24
	ELSEIF
	lda	#68
	ENDC

	sta.l	m_y1
	lda	cla1
	sta.l	m_xp2
	call_mario	mshowpercgraph

	lda	#176
	sta.l	m_x1

	IFEQ	CONTEST
	lda	#24
	ELSEIF
	lda	#68
	ENDC

	sta.l	m_y1
	lda	cla1
	sta.l	m_z1
	call_mario	mprtperc

	lda.l	m_x1
	clc
	adc	#4
	sta.l	m_x1
	lda	#percenttxt2&WM
	sta.l	m_txtdata
	call_mario	mprintstr
.doneg

	lda	clam			;no increment
	bne	.ok
	a8
	trigse	$12
	a16

	IFNE	CONTEST
	lda.l	playerscore
	clc
	adc	#30
	sta.l	playerscore
	ENDC

	lda	cla1
	clc
	adc	#3
	sta	cla1

	cmp	cla2
	jl	.doneadd

	IFNE	CONTEST
	lda	cla2
	sec
	sbc	cla1
	asl	a
	sta	cla1
	asl	a
	asl	a
	clc
	adc	cla1
	clc
	adc.l	playerscore
	sta.l	playerscore

	ENDC

	lda	cla2
	sta	cla1
	lda	#20
	sta	clam
	bra	.doneadd
.ok
	cmp	#1
	beq	.doneadd
	dec	a
	sta	clam
	cmp	#2
	bne	.doneadd
	a8
	trigse	011h
	ldx	specptr			;add to buffer
	lda	cla2
	sta.l	specbuf,x
	inx
	stx	specptr
	a16
	jsr	checkbonus
.doneadd

;----------------
	IFEQ	CONTEST
	a16
	IFEQ	GERMAN
	clrmes	teamtxt,48,69		;print "shield of team mate"
	ELSEIF
	clrmes	teamtxt,16,69		;print "shield of team mate"
	ENDC

	ldx	#0
	ldy	#0
	lda	#11			;position
	sta.l	m_x1
	sta	ktpx
.lp
	longa
	lda	#136
	sta.l	m_y1
	lda.w	friends_hp,y
	and	#$ff
	sta.l	m_z1
	phx
	a8
	lda	#mshowteammate>>16
	ldx	#mshowteammate&WM
	jsl	runmario_l
	plx

	phx
	a16
	lda.l	m_z1
	beq	.dead
	lda.l	namepos,x		;print name
	sta.l	m_x1
	lda	#150
	sta.l	m_y1
	lda.l	nametxt,x
	sta.l	m_txtdata
	a8
	lda	#mprintstr>>16
	ldx	#mprintstr&WM
	jsl	runmario_l
	bra	.notdead
.dead
	longa
	lda.l	namepos,x		;print name
	sta.l	m_x1
	lda	#137
	sta.l	m_y1
	lda.l	nametxt,x
	sta.l	m_txtdata
	a8
	lda	#mprintstr>>16
	ldx	#mprintstr&WM
	jsl	runmario_l
	a16
	plx
	phx
	lda.l	deadnamepos,x		;print dead
	sta.l	m_x1
	lda	#151
	sta.l	m_y1
	lda	#deadtxt&WM
	sta.l	m_txtdata
	a8
	lda	#mprintstr>>16
	ldx	#mprintstr&WM
	jsl	runmario_l
.notdead	plx

	phx

	lda.l	namegfxpos,x
	sta.l	m_bigx
	lda.l	namegfxpos+1,x
	sta.l	m_bigy
	lda	#0
	sta.l	m_bigx+1
	sta.l	m_bigy+1

	lda.w	friends_hp,y
	bne	.stillalive
	lda	gameframe
	and	#1
	a16
	bne	.oneframe
	lda	#facedata&WM+640*17
	bra	.writeit
.oneframe
	lda	#facedata&WM+640*4
	bra	.writeit
.stillalive
	a16
	cpx	#0
	beq	.bunny
	cpx	#2
	beq	.falco
	lda	#facedata&WM+640*11
	bra	.writeit
.bunny	lda	#facedata&WM+640*7
	bra	.writeit
.falco	lda	#facedata&WM+640*9
.writeit
	sta.l	m_faceptr

	call_mario	mcopyface

	plx
	a16
	inx
	inx
	iny
	lda.l	ktpx
	clc
	adc	#80
	sta	ktpx
	sta.l	m_x1
	cpy	#3
	lbne	.lp

	ENDC


	a8
	lda	clb2
	cmp	#0
	lbeq	printspeclp

.wait	a8
	lda	clb2
	cmp	#2
	lbne	.exit
	jsl	transfer_l
	bra	.wait
.exit
	stz	onecredspr
	rts

finis1
	ldx	specptr
	lda	cla2
	sta.l	specbuf,x
	inx
	stx	specptr
	rts

	longa
	longi
checkbonus	jsr	calctotalscore

	IFEQ	CONTEST
	ldx	#0
.cklp	lda.l	bonertab,x
	cmp	tpa
	jbe	.hmm
	inx
	inx
	bra	.cklp
.hmm
	cmp	clbm
	jg	.set
	rts
	ELSEIF


	lda	cla1
	cmp	#100
	beq	.set
	rts

	ENDC
.set	lda	#20			;wait 20 frames before bonus
	sta	clb1
	rts

bonertab	dw	2100,1900,1700,1500,1300,1100,900,700,500,300,100,0





;--------------------------------------------------------------------
dopause	php
	a8i16
	lda	doingwipe
	bne	.nop
	lda	stayblack
	cmp	#-1
	bne	.nop
	lda	#se_pauseon
	sta	pausesnd
	jsl	transfer_l		;transfer bitmap, do strats etc.
	jsr	printpause
	jsl	transfer_l		;transfer bitmap, do strats etc.
	a8
.wait	waitdma	100
	lda	joy1h
	bit	#key_start
	bne	.wait
.wait2	waitdma	100
	lda	joy1h
	bit	#key_start
	beq	.wait2
.wait3	waitdma	100
	lda	joy1h
	bit	#key_start
	bne	.wait3
	stz	cont0
	stz	contl0
	stz	cont0l
	stz	contl0l
	lda	#se_pauseoff
	sta	pausesnd
.nop	plp
	rts


printpause	ai16

	IFEQ	GERMAN
	lda	#90 ; x value (in pixels)
	ELSEIF
	lda	#90+4 ; x value (in pixels)
	ENDC

	sta.l	m_x1
	lda	#90 ; y value (in pixels)
	sta.l	m_y1
	lda	#pausetxt&WM ; loads predefined pausetxt 
	sta.l	m_txtdata
	a8
	lda	#mprintstr>>16	; }
	ldx	#mprintstr&WM	; } all this prints the text to the screen
	jsl	runmario_l		; }
	rts

halfbg23	php
	a8i16
	phx

	alloc_window	halffade
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%11100110
	sta	wm_cgadsub,x
	lda	#%11100000
	ora	wm_val,x
	sta	wm_coldata,x
	lda	wm_val,x
	cmp	#15
	beq	.nc
	inc	a
	sta	wm_val,x
.nc	plx
	plp
	rts

fadehalf2norm	php
	a8i16
	phx
	alloc_window	halffade
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%11100110
	sta	wm_cgadsub,x

	lda	#%11100000
	ora	wm_val,x
	sta	wm_coldata,x

	lda	wm_val,x
	beq	.done
	dec	a
	sta	wm_val,x
	plx
	plp
	rts
.done	
	dealloc_window	halffade
	plx
	plp
	rts

setbg23toblack
	php
	a8i16
	phx
	alloc_window	halffade
	stz	wm_ts,x
	lda	#2
	sta	wm_cgswsel,x
	lda	#%11100110
	sta	wm_cgadsub,x

	lda	#%11111111
	sta	wm_coldata,x

	lda	#31
	sta	wm_val,x
	plx
	plp
	rts


dogameframe	php
	a8i16
.wait	lda	trans_flag
	bne	.wait
	lda	#2		;start screen transferring
	sta	trans_flag
	stz	framec
.twait	lda	transbmp1
	beq	.twait

	jsl	clronehalf_l
.twait2	lda	transbmp1
	cmp	#2
	bne	.twait2

	stz	transbmp1
	jsl	find_window_pri_l

	jsl	dmahpos_l

	ai16
	lda	dotsflag
	sta.l	m_dotsorstars
	beq	.skip
	jsl	mshowgrid_l
.skip	jsl	showview_l
	jsl	do_3d_display_l
	plp
	rts



*****************************************************************************
*****************************************************************************
*****************************************************************************
*****************************************************************************



initscreen_l
	ai8

	disable

	stz	nmitimen
	stz	trans_flag
	stz	fade

	lda	timeupr		;clear IRQ's
	a16
	lda.l	mflags


;Set Mario Chip for 16 colours 192 pixel high
	lda	#gamemdm
	sta	mario_draw_mode

;clear video RAM
	screen_off

	stz	cgadd
	stz	vmaddl
	stz	vmaddh
	lda	#$80
	sta	inidisp
	sta	vmainc

;Clear VRAM
	lda	#$00
	ldx	#127
.ly	ldy	#0
.li	sta	vmdatal
	sta	vmdatah
	dey
	bne	.li
	dex
	bne	.ly


;Set screen to blank chars
	ai16
	lda	#vsc_base1
	sta	vmaddl
	lda	#gamenum_col*gamenum_row+1
	ldx	#1024
.cl	sta	vmdatal
	dex
	bne	.cl

;Set character map 22 wide by 20 high
	a8i16
	jsl	setcharmapgame_l

;Set double buffering (VRAM only)
	i16
	ldx	#vchr_base1
	stx	vmap1
	ldx	#vchr_base2
	stx	vmap2
	ldx	#bitmap1
	stx	drawmap
	ldx	#bitmap1
	stx	showmap
	lda	drawmap+1		;set mario draw base
	lsr	a
	lsr	a
	sta	mscrbase

;Set hardware pointers to screen
	lda	vmap1+1
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(vchr_physback>>12)<<4
	sta	bg12nba

	lda	#3
	sta	objsel

;Set bg screen base address'
	lda	#vsc_base1>>8
	sta	bg1sc
	lda	#vsc_base2>>8+3
	sta	bg2sc
	lda	#2
	sta	bgmode

	jsl	calcbg2voffsets_l
	jsl	dmabg2voffsets_l

	a8i16
	lda	#1
	jsl	setpal_l
	jsl	init_sprites_l
	dmacgram	0,128,spritepal,256

;Set window logic, position, size.
	stz	w12sel
	stz	w34sel		;wh0,1 set with hdma
	lda	#%00100000
	sta	wobjsel
	stz	wbglog
	lda	#%1100
	sta	wobjlog
	stz	tmw
	stz	tsw
	stz	wh0
	stz	wh1

	lda	#1+2+4+16
	sta	tm
	lda	#7
	sta	ts

;Setup HDMA tables
;	a16
;	ldx	#0
;.loop	lda.l	hdma_start,x
;	sta.l	xhdma_start,x
;	inx
;	inx
;	cpx	#hdma_end-hdma_start
;	bcc	.loop

	jsl	setnoclash_l

	a8
	lda	#0		;inidisp
	sta	ch1params
	lda	#inidisp&$ff
	sta	ch1addrb
	ldx	#xhdma_inidisp&WM
	stx	ch1addra1tl
	lda	#xhdma_inidisp>>16
	sta	ch1atbank
	stz	ch1databank

	lda	#%010		;bg2hofs
	sta	ch2params
	lda	#bg2hofs&$ff
	sta	ch2addrb
	ldx	#xhdma_bg2hofs1&WM
	stx	ch2addra1tl
	lda	#xhdma_bg2hofs1>>16
	sta	ch2atbank
	stz	ch2databank

	lda	#1		;wh0
	sta	ch3params
	lda	#wh0&$ff
	sta	ch3addrb
	ldx	#xhdma_wh0wh1_1&WM
	stx	ch3addra1tl
	lda	#xhdma_wh0wh1_1>>16
	sta	ch3atbank
	stz	ch3databank

	lda	#%010		;bg2vofs
	sta	ch4params
	lda	#bg2vofs&$ff
	sta	ch4addrb
	ldx	#xhdma_bg2vofs&WM
	stx	ch4addra1tl
	lda	#xhdma_bg2vofs>>16
	sta	ch4atbank
	stz	ch4databank

	lda	#%11110
	sta	hdmaen_gc

	ldx	#xhdma_bg2hofs1&WM
	stx	hdmabg2hofs1
	ldx	#xhdma_bg2hofs2&WM
	stx	hdmabg2hofs2

	ldx	#xhdma_wh0wh1_1&WM
	stx	hdmacirclebuf1
	ldx	#xhdma_wh0wh1_2&WM
	stx	hdmacirclebuf2
	stz	whichcircle

	jsl	clearhvofs_l

;Enable key pad reading + hdma tables (includes inidisp)
	a8
	ldx	#gamevw_pos
	stx	vtimel
	ldx	#0
	stx	htimel

	lda	#$80
	setinidisp1
	sta	inidisp
	stz	fade

	lda	#%10	; just inidisp
	sta	hdmaen

	waitdma	190		;wait for HDMA to init.(inidisp)
	waitdma	100		;wait for HDMA to init.(inidisp)


	lda	rdnmir

	lda	#%00110001
	sta	nmitimen

	lda	#255
	sta	crosshairon

	enable
	rtl



setcharmapfrommap_l
	php
	disable
	jsl	setcharmapgame_l
	enable
	plp
	rtl

SetCharMapgame_l
	a8
	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda	#128
	sta	vmainc
	ai16
	lda	#vsc_base1+32*gameStRow		;128
	sta	vmaddl
	lda	#1024*pal3d
	ldy	#0
.lolv
	pha
	lda	#gamenum_col*gamenum_row+(6<<10)+(1<<13)
	rept	(32-gamenum_col)/2		;clear out borders
	sta	vmdatal
	endr
	pla

	ldx	#0
.lolh	sta	vmdatal
	clc
	adc	#gamenum_row
	inx
	cpx	#gamenum_col
	bne	.lolh

	pha
	lda	#gamenum_col*gamenum_row+(6<<10)+(1<<13)
	rept	(32-gamenum_col)/2
	sta	vmdatal
	endr
	pla

	sec
	sbc	#gamenum_col*gamenum_row-1
	iny
	cpy	#gamenum_row
	bne	.lolv

	IFNE	shieldboostcolorbox
	; why was this done in the first place? added a flag for vanilla game purposes
	; witchcraft
	lda.l	m_meters
	and	#255
	beq	.nometers

	lda	#vsc_base1+24*32+3	;damage
	sta	vmaddl
	lda	#46+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+4
	sta	vmaddl
	lda	#70+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+5
	sta	vmaddl
	lda	#94+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+6
	sta	vmaddl
	lda	#118+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+7
	sta	vmaddl
	lda	#142+(2<<10)+(1<<13)
	sta	vmdatal

	lda	#vsc_base1+24*32+22+2	;boost
	sta	vmaddl
	lda	#550+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+23+2
	sta	vmaddl
	lda	#574+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+24+2
	sta	vmaddl
	lda	#598+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+25+2
	sta	vmaddl
	lda	#622+(2<<10)+(1<<13)
	sta	vmdatal
	lda	#vsc_base1+24*32+26+2
	sta	vmaddl
	lda	#646+(2<<10)+(1<<13)
	sta	vmdatal
.nometers
	ENDC

	ldx	#((gamenum_col*gamenum_row)*16)+vchr_base1
	stx	vmaddl
	ldx	#-1
	ldy	#16
.lp	stx	vmdatal
	dey
	bne	.lp

	ldx	#((gamenum_col*gamenum_row)*16)+vchr_base2
	stx	vmaddl
	ldx	#-1
	ldy	#16
.lp2	stx	vmdatal
	dey
	bne	.lp2
	plb
	a8
	rtl

	shorta
	shorti
gameclipwindow_l
	jsr gameclipwindow
	rtl
gameclipwindow
	movi 0,clx1
	movi gamenum_col*8-1,clx2
	movi 0,cly1
	movi gamenum_row*8-1,cly2
	movi gamenum_col*4,vanishx
	movi gamenum_row*4,vanishy
	rts

clearhvofs_l
	php
	a8
	stz	bg1hofs
	stz	bg1hofs
	stz	bg1vofs
	stz	bg1vofs

	stz	bg2hofs
	stz	bg2hofs
	stz	bg2vofs
	stz	bg2vofs

	stz	bg3hofs
	stz	bg3hofs
	stz	bg3vofs
	stz	bg3vofs

	stz	bg4hofs
	stz	bg4hofs
	stz	bg4vofs
	stz	bg4vofs
	plp
	rtl



setpal_l	php
	ai16
	and #$ff
	xba
	lsr a
	lsr a
	lsr a
	tax

	a8
	lda	#16*pal3d
	sta	cgadd
	ldy	#0
.loop	lda.l	paladdr,x
	sta	cgdata
	lda.l	paladdr+1,x
	sta	cgdata
	inx
	inx
	iny
	iny
	cpy	#32
	bne	.loop
	plp
	rtl

setgamepal_l	php
	phb
	ai16
	and #$ff
	xba
	lsr a
	lsr a
	lsr a
	tax

	disable
	a8
	lda	#$7e
	pha
	plb		; so we can access ram without .L

	ldy	#0
	a16
.loop	lda.l	paladdr,x
	sta.w	gamepalbuff&WM,y
	sta.w	pal0palette+7*32,y
	inx
	inx
	iny
	iny
	cpy	#32
	bne	.loop
	enable
	plb
	plp
	rtl




kill_list_l	php
	ai16
	stz	allst	;clear Alien list
	FmtFreeLst	alfreelst,alblks,number_al,al_size
	plp
	rtl



showview_l
	php
	jsr	marioshowview
	a8i16
	call_mario	mallrotzsort
	plp
	rtl

alienflags_l
	php
	phb
	a8
	lda	#$7e
	pha
	plb

	i16
	ldx	#m_drawlist&WM
	ldy	allst
.next

	a8
	test_alsflag		y,invisible
	bne			.nextal
;	s_jmp_alsflag		y,invisible,.nextal

	a16
	lda.w	al_shape,y
	stx	tpa
	tax
	lda.l	sh_zmax,x
	ldx	tpa
	adc.l	dl_z,x
	bpl	.dontkill


; kill the alien if its z is behind the view
	a8
	lda.w	al_flags,y
	and	#~affrontpl
	sta.w	al_flags,y

	IFNE ALLRANGE
	testjoypad	select
    beq	.dontkill
	ENDC
	IFEQ ALLRANGE
	s_test_var	B,gameflags,#gf_nozremove
	bne	.dontkill
	ENDC
;	s_jmp_varAND		B,gameflags,#gf_nozremove,.dontkill

	test_alcollflags	y,acf_firstframe
	bne	.dontkill
	lda.w	al_type,y
	and	#atzremove
	beq	.dontkill
	phx
	tyx
	ldy	_next,x
	jsl	removedeadal_l
	a16
	pla
	clc
	adc	#dl_sizeof
	tax
	tya
	bra	.killed


.dontkill	a16
	lda.l	dl_x,x
	bpl	.right
.left	lda.w	al_flags,y
	ora	#afinviewpl+afleftpl
	sta.w	al_flags,y
	bra	.cont
.right	lda.w	al_flags,y
	ora	#afinviewpl
	sta.w	al_flags,y
.cont
	a16
	txa
	clc
	adc	#dl_sizeof
	tax

.nextal	a16
	lda.w	_next,y
.killed
	tay
	bne	.next

	plb
	plp
	rtl

	IFEQ	0

marioshowview
	php
	phb
	a8
	lda	#$7e
	pha
	plb

	ai16
	stz	numshapes
	lda	shadowheight
	sta.l	m_shadowheight
	lda	viewposy
	sta.l	m_viewposy

	ldx	#m_Drawlist&WM
	ldy	allst
.next	a8
	sty	al1pt

; clear view flags
	lda.w	al_flags,y
	and	#~(afinrngpl+affrontpl+afinviewpl+afleftpl)
	ora	#affrontpl
	sta.w	al_flags,y

	s_jmp_alsflag	y,invisible,.nextal

; ground obj?
	lda.w	al_type,y
	bit	#atgnd
	a16
	beq	.notgndobj
	lda	#15000
	bra	.gndobj
.notgndobj	lda	#0
.gndobj	sta.l	dl_sortz,x

; copy x,y,z into the drawlist block
	lda.w	al_worldx,y
	sec
	sbc	viewposx
	sta.l	dl_x,x
	lda.w	al_worldy,y
	sec
	sbc	viewposy
	sta.l	dl_y,x
	lda.w	al_worldz,y
	sec
	sbc	viewposz
	sta.l	dl_z,x

.notinvis
	lda.w	al_shape,y
.invis
	sta.l	dl_shape,x

	a8
	lda.w	al_rotx,y
	sta.l	dl_rotx,x
	lda.w	al_roty,y
	sta.l	dl_roty,x
	lda.w	al_rotz,y
	sta.l	dl_rotz,x


	a8
	lda.w	al_flags,y
	and	#afexp
	beq	.noexp
	lda.w	al_count,y
	sta.l	dl_expcnt,x

;-----------------------------------------------
; put unique obj number in dl_shady if partobj.
	lda.w	al_sflags,y
	bit	#asf_partobj
	beq	.exploded

	a16
	tya
	sta.l	dl_shady,x
	a8
	lda.w	al_sbyte1,y	; amount
	sta.l	dl_shadx,x
	lda.w	al_sbyte2,y	; life
	sta.l	dl_shadx+1,x
	lda.w	al_sbyte3,y	; type
	sta.l	dl_shadz,x

;-----------------------------------------------

	bra	.exploded
.noexp
	lda	#0
	sta.l	dl_expcnt,x

.exploded

	lda.w	al_sflags,y
	sta.l	dl_sflags,x

; mask out hitflash (only hitflashes for one frame)
	and	#~asf_hitflash
	sta.w	al_sflags,y

; copy the animation and colour animation frames over
	lda.w	al_animframe,y
	bmi	.standardframe
	lda	gameframe
.standardframe
	and	#127
	sta.l	dl_animframe,x

	lda.w	al_colframe,y
	bmi	.standardframe2
	lda	gameframe
.standardframe2
	and	#127
	sta.l	dl_colframe,x

; copy the depth offset in
	lda.w	al_depthoffset,y
	sta.l	dl_depth,x

; texture map coordinates
	lda.w	al_tx,y
	sta.l	dl_tscrollx,x
	lda.w	al_ty,y
	sta.l	dl_tscrolly,x

; check for debug mode (y = alientemp)
	a16
	cpy	alientemp
	bne	.normcoltab

	lda	gameframe
	and	#7
	cmp	#4
	bcc	.onecol
	lda	#white_C&WM
	bra	.connn
.onecol
	lda	#black_C&WM
	bra	.connn

.normcoltab
	lda.w	al_coltab,y
.connn
	sta.l	dl_coltab,x

; increment number of shapes
	inc	numshapes

; increment dl pointer
	txa
	clc
	adc	#dl_sizeof
	tax


.nextal	a16
; next alien block (if any)
	lda.w	_next,y
	tay
	lbne	.next
.out
	lda	numshapes
	sta.l	m_numshapes

	plb
	plp


	rts

	ELSEIF


showview	

	a16
	lda	viewposy
	sta.l	m_viewposy

	ai8
	lda	showtype
	lbne	showview2

	jsr	 initdeferredlist

	i16
	ldx	allst
.next	a8
	stx	al1pt

	s_jmp_alsflag	x,invisible,.nextal

	lda	al_flags,x
	and	#~(afinrngpl+affrontpl+afinviewpl+afleftpl)
	sta	al_flags,x

	ldy	al_shape,x
	a16
	lda	al_worldx,x
	sec
	sbc	viewposx
	sta.l	m_x1
	lda	al_worldy,x
	sec
	sbc	viewposy
	pha
	lda	shadowheight
	sbc	viewposy
	sta.l	m_y1
	lda	al_worldz,x
	sec
	sbc	viewposz
	sta.l	m_z1

	lda	al_sflags,x
	and	#asf_shadow
	beq	.noshadow

	a8
	lda	#mwmatrotp16>>16
	ldx	#mwmatrotp16&$ffff
	jsl	runmario_l
	a16
	lda.l	m_bigx
	sta	shadx
	lda.l	m_bigz
	sta	shadz
.noshadow
	lda.l	m_bigy
	sta	shady
	pla
	sta.l	m_y1

	a8
	lda	#mwmatrotp16>>16
	ldx	#mwmatrotp16&$ffff
	jsl	runmario_l

	ldx	al1pt

	lda	al_sflags,x
	and	#asf_shadowshape
	a16
	beq	.notshadowshape
	lda.l	m_bigx
	sta	shadx
	lda.l	m_bigy
	sta	shady
	lda.l	m_bigz
	sta	shadz
.notshadowshape

	lda.l	m_bigx
	bpl	.right
.left	sta	bigx
	lda	al_flags,x
	ora	#afinviewpl+affrontpl+afleftpl
	sta	al_flags,x
	bra	.cont
.right	sta	bigx
	lda	al_flags,x
	ora	#afinviewpl+affrontpl
	sta	al_flags,x
.cont

	lda.l	m_bigz
	ldy	al_shape,x
	clc
	adc.w	sh_zmax,y
	bmi	.chkkillal
	sec
	sbc.w	sh_zmax,y
	sta	bigz

	lda.l	m_bigy
	sta	bigy

	jsr	deferredinsert
	ldx	al1pt
.nextal	ldy	_next,x
.killed	tyx
	lbne	.next
	rts


	longi
.chkkillal	
	a8
	s_jmp_varAND		B,gameflags,#gf_nozremove,.nextal
	test_alcollflags	x,acf_firstframe
	bne	.nextal
	lda	al_type,x
	and	#atzremove
	beq	.nextal
	ldy	_next,x
	jsl	removedeadal_l
	bra	.killed


showview2
	IFEQ	1
	jsr	 initdeferredlist

	i16
	ldx	allst
.next
	a8
	stx	al1pt

	lda	al_flags,x
	and	#~(afinrngpl+affrontpl+afinviewpl+afleftpl)
	sta	al_flags,x

	ldy	al_shape,x

	a16
	lda	al_worldx,x
	sec
	sbc	viewposx
	sta.l	m_x1
	lda	al_worldy,x
	sec
	sbc	viewposy
	sta.l	m_y1
	lda	al_worldz,x
	sec
	sbc	viewposz
	sta.l	m_z1

	lda	#0
	sec
	sbc	viewposy
	sta	shady

	a8
	lda	#mwmatrotp16>>16
	ldx	#mwmatrotp16&$ffff
	jsl	runmario_l
	ldx	al1pt

	a16
	lda.l	m_bigz
	bpl	.zp
	nega
.zp	sta	tpx
	lda.l	m_bigx
	bpl	.xp
	nega
.xp	adc	tpx
	cmp	#maxztab+1000
	bcs	.killal

	lda.l	m_bigz
	sta	bigz

	lda.l	m_bigx
	bpl	.right
.left	sta	bigx
	lda	al_flags,x
	ora	#afinviewpl+affrontpl+afleftpl
	sta	al_flags,x
	bra	.cont
.right	sta	bigx
	lda	al_flags,x
	ora	#afinviewpl+affrontpl
	sta	al_flags,x
.cont
	lda.l	m_bigy
	sta	bigy

	jsr	deferredinsert
	ldx	al1pt
.nextal	ldy	_next,x
.killed	tyx
	lbne	.next
	rts

	longi
.killal	a8
	ldy	_next,x
	jsl	removedeadal_l
	bra	.killed


	ENDC


	ENDC

	IFEQ	1
initdeferredlist
	php
	ai16
	ldx	#zbblks
	stx	spare
	stz	zb_behind,x
	stz	zb_infront,x
	stz	head
	plp
	rts



***************************************************************
*
*   Binary tree Z sort
*
*   By Krister Wombell and Jon Wolff.
*
zb_behind	equ	0
zb_infront	equ	2

deferredinsert
	ai16
	
	lda	bigz
	sta	sortz

	ldy	al_shape,x
	clc
	adc.w	sh_sortz,y 
	bpl	.nbehind
	lda	#0
.nbehind
	sta	sortz

	lda	al_type,x
	and	#atgnd
	beq	.notgndobj
	clc
	lda	sortz
	adc	#20000
	sta	sortz
.notgndobj
	lda	sortz
	ldx	#head 		;link 'a' into binary tree
.loop	ldy	0,x
	beq	.dolink
	tyx
	cmp	zb_sz,x
	bcs	.loop
	inx
	inx
	bra	.loop
.dolink
	ldy	spare
	sty	0,x
	tyx
	stz	zb_behind,x
	stz	zb_infront,x
.copydata
	lda	al1pt		;store ptr to al block
	sta	zb_ptr,x		;store rotated x
	lda	bigx
	sta	zb_x,x
	lda	bigy		;rotated y
	sta	zb_y,x
	lda	bigz		;rotated z
	sta	zb_z,x
	lda	shady
	sta	zb_shady,x	; store the shadow's rotated y
	lda	shadx
	sta	zb_shadx,x
	lda	shadz
	sta	zb_shadz,x

	lda	sortz		;and distance
	sta	zb_sz,x
	txa
	clc
	adc	#zb_size
	sta	spare
	rts


	ENDC
	shorta
	longi
build_drawlist_l
	jsr	build_drawlist
	rtl
build_drawlist
	rts
	IFEQ	1
	ai16
	ldx	#m_drawlist&WM
	stx	dlptr

	stz	numshapes
	stz	ktpx

	ldx	head		;get first behind
	lbeq	drawlistexit
walktree
	ldy	zb_behind,x
	beq	.nonebehind
	phx
	tyx
	inc	ktpx
	jmp	walktree		;do 'behind objects'
.ret	local
	plx
.nonebehind
	ldy	zb_ptr,x

	phx
	ldx	dlptr
	a8
	lda.w	al_rotx,y
	sta.l	dl_rotx,x
	lda.w	al_roty,y
	sta.l	dl_roty,x
	lda.w	al_rotz,y
	sta.l	dl_rotz,x
	a16
	lda.w	al_shape,y
	sta.l	dl_shape,x
	plx

	phy
	txy
	ldx	dlptr
	lda.w	zb_shady,y
	sta.l	dl_shady,x
	lda.w	zb_shadx,y
	sta.l	dl_shadx,x
	lda.w	zb_shadz,y
	sta.l	dl_shadz,x
	lda.w	zb_y,y
	sta.l	dl_y,x
	lda.w	zb_x,y
	sta.l	dl_x,x
	lda.w	zb_z,y		;y=zb block
	sta.l	dl_z,x
	plx			;x=al block

	phy
	a8
	stz	expcnt
	lda	al_flags,x
	and	#afexp
	beq	.noexp
	lda	al_count,x
	sta	expcnt

;-----------------------------------------------
; put unique obj number in dl_shady if partobj.
	lda	al_sflags,x
	bit	#asf_partobj,.noexp

	a16
	txy
	txa
	ldx	dlptr
	sta.l	dl_shady,x
	a8
	lda.w	al_sbyte1,y	; amount
	sta.l	dl_shadx,x
	lda.w	al_sbyte2,y	; life
	sta.l	dl_shadx+1,x
	lda.w	al_sbyte3,y	; type
	sta.l	dl_shadz,x
	tyx

;-----------------------------------------------


.noexp
	lda	al_sflags,x
	sta	sflags
	bit	#asf_hitflash
	beq	.nothfc
	and	#~asf_hitflash
	sta	al_sflags,x
.nothfc
	lda.l	alx_animframe,x
	bit	#128
	bne	.standardframe
	lda	gameframe
.standardframe
	sta	animframe
	lda.l	alx_colframe,x
	bit	#128
	bne	.standardframe2
	lda	gameframe
.standardframe2
	sta	colframe

	lda.l	alx_depthoffset,x	; get high byte.
	sta	tpa

	lda.l	alx_tx,x
	sta	texxy
	lda.l	alx_ty,x
	sta	texxy+1

	a16
	cpx	alientemp
	bne	.normcoltab
	lda	gameframe
	and	#7
	cmp	#4
	bcc	.onecol
	lda	#white_C&WM
	bra	.connn
.onecol
	lda	#black_C&WM
	bra	.connn
.normcoltab
	lda.l	alx_coltab,x
.connn
	sta	tpx
	a8

	ldx	dlptr
	lda	texxy
	sta.l	dl_tscrollx,x
	lda	texxy+1
	sta.l	dl_tscrolly,x
	lda	expcnt
	sta.l	dl_expcnt,x
	lda	sflags
	sta.l	dl_sflags,x
	lda	animframe
	and	#127
	sta.l	dl_animframe,x
	lda	colframe
	and	#127
	sta.l	dl_colframe,x
	lda	tpa
	sta.l	dl_depth,x
	a16
	lda	tpx
	sta.l	dl_coltab,x

	lda	dlptr
	clc
	adc	#dl_sizeof
	sta	dlptr

	inc	numshapes

	plx
	ldy	zb_infront,x
	beq	drawlistexit
	tyx
	jmp	walktree

drawlistexit
	dec	ktpx
	bpl	walktree.ret
	rts


	ENDC



;---------------------------------------------------------------------------------------------------------
fadepalto_l	ai16
	ldy	palnum
	bne	.do
	rtl
.do
	ldx	palfade
	ldy	palnum

	lda.l	seapal,x
	sta.w	pal0palette+4*32,y

	dec	palfade
	dec	palfade
	dec	palnum
	dec	palnum
	rtl


palgoto_l	a8
	lda	pshipflags2
	and	#psf2_playerHP0
	beq	.set
	rtl
.set
	lda	fadepal
	bne	.fadeit
	rtl
.fadeit	dec	a
	sta	fadepal

	ai16
	ldx	palfrom
	ldy	palto
	lda	pallen
.lp
	pha
	lda.w	pal0palette,y
	and	#%111110000000000
	sta	tpa
	lda.l	mist2col,x
	and	#%111110000000000
	cmp	tpa
	beq	.skipb
	bcs	.incb
.decb	lda	tpa
	sec
	sbc	#%000010000000000
	bra	.skipb
.incb	lda	tpa
	clc
	adc	#%000010000000000
.skipb	sta	tpx

	lda.w	pal0palette,y
	and	#%1111100000
	sta	tpa
	lda.l	mist2col,x
	and	#%1111100000
	cmp	tpa
	beq	.skipg
	bcs	.incg
.decg	lda	tpa
	sec
	sbc	#%0000100000
	bra	.skipg
.incg	lda	tpa
	clc
	adc	#%0000100000
.skipg	sta	tpy

	lda.w	pal0palette,y
	and	#%11111
	sta	tpa
	lda.l	mist2col,x
	and	#%11111
	cmp	tpa
	beq	.skipr
	bcs	.incr
.decr	lda	tpa
	dec	a
	bra	.skipr
.incr	lda	tpa
	inc	a
.skipr	ora	tpx
	ora	tpy
	sta.w	pal0palette,y

	iny
	iny
	inx
	inx
	pla
	dec	a
	lbne	.lp
	rtl

fadered_l	php
	phy
	phx
	phb

	a8
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	
	ai16
	ldy	#0
	lda	#8*16
.lp
	pha
	lda.w	pal0palette,y
	and	#%111111111100000

	sta	tpx
	lda.w	pal0palette,y
	and	#%11111
	cmp	#3
	ja	.ok
	ora	#3
.ok
	asl	a
	cmp	#31
	bcc	.nsh
	lda	#31
.nsh	and	#%11111
	ora	tpx
	sta.w	pal0palette,y
	iny
	iny
	pla
	dec	a
	bne	.lp
.out
	lda	#0
	sta	pal0palette+6*32+30

	plb
	plx
	ply
	plp
	rtl

makeBG2black_l
	phx
	a8
	lda	#0
	ldx	#(7*32)-1
.clr	sta.w	pal0palette,x
	dex	
	bpl	.clr
	plx
    	rtl


seapal	dw $0000,$34c0,$38e0,$3d00,$4120,$4540,$4960,$4d80
	dw $51a0,$55c0,$59e0,$5e00,$6220,$6640,$6a60,$6e80
groundpal	dw $0000,$0088,$00c9,$04ea,$090b,$0d2c,$114d,$156e
	dw $198f,$1db0,$21d1,$25f2,$2a13,$2e34,$3255,$3676
mist2col	inccolfile	data\col\mist.col,6,8
daycol	inccolfile	data\col\bg2-c.col,1,2
	inccolfile	data\col\bg2-c.col,5,6
gameoverpal	inccolfile	data\col\over_d.col,7,8

;---------------------------------------------------------------------------


setinidisp1_l
	php
	a8
	sta.l	xinidisp1
	sta.l	xinidisp2
	sta.l	xinidisp1a
	plp
	rtl

;---------------------------------------------------------------------------

setnoclash_l
	php
	a8
	lda	#95
	sta.l	xinidisp1-1
	lda	#45
	sta.l	xinidisp2-1
	lda	#50
	sta.l	xinidisp1a-1
	plp
	rtl
;---------------------------------------------------------------------------
screenoff_l
	php
	a8i16
	stz	hdmaen
	lda	#$80
	sta	inidisp
	setinidisp1
	waitdma	150
	waitdma	140	; wait for it all to take effect
	plp
	rtl





