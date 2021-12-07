;*****************************************************************************
;* Head Up Display 
;*
;* Giles Goddard  
;*


;****************************************

mhudline	MACRO	x1,y1,x2,y2
	iwt	r0,#\2
	sms	[m_numpnts],r0
	iwt	r0,#\1
	sms	[m_numgroups],r0

	iwt	r0,#\4
	sms	[m_groupnum],r0
	iwt	r0,#\3
	sms	[m_grouptab],r0

	mcall	mdrawhudline
	nop

	ENDM
;****************************************

;----------------------------
; line draw
rx1	equr	r1
ry1	equr	r2
rx2	equr	r3
ry2	equr	r9
rxi	equr	r5
ryi	equr	r6
rcnt	equr	r12


;----------------------------
; mrotpnty
rx	equr	1
ryrot	equr	2
rt	equr	2
rz	equr	3
rcosy	equr	5
rprodlo	equr	7
rprodhi	equr 	8
rsiny	equr	9

rtemp1	equ	4

	malc	m_hudrot,2
	malc	m_hudcolour,2
	malc	m_hudflags,2
	malc	m_hudcol1,2
	malc	m_hudcol2,2
mdrawhud
	mpush	r11

	lm	r0,[m_hudrot]
	mtest	r0
	mlbpl	.off	
	

	ibt	r0,#sintab>>16
	romb

	sub	r0
	cmode

	lm	r0,[m_hudcolour]
	sm	[m_hudcol1],r0
	sm	[m_hudcol2],r0

	mhudline	0,200,0,265


	lm	r0,[m_hudflags]
	ibt	r1,#1
	and	r1
	beq	.nbrkL
	nop
	ibt	r0,#2
	sm	[m_hudcol2],r0
.nbrkL

	lm	r0,[m_hudflags]
	ibt	r1,#2
	and	r1
	beq	.nbrkR
	nop
	ibt	r0,#2
	sm	[m_hudcol1],r0
.nbrkR

	mhudline	200+50,0,265+50,-32
	mhudline	265+50,-32,265+50,32
	mhudline	200+50,0,265+50,32



.off
	mpop	pc
	nop
	




	
;********************************************************************
mdrawhudline
	mpush	r11

	lm	r0,[m_hudcol1]
	colour

	lms	rx,[m_numpnts]
	lms	rz,[m_numgroups]
	lm	ryrot,[m_hudrot]
	with	ryrot
	lob	
	mcall	mrotpnty
	nop
	sms	[m_numpnts],rx
	sms	[m_numgroups],rz

	lms	rx,[m_groupnum]
	lms	rz,[m_grouptab]
	lm	ryrot,[m_hudrot]
	with	ryrot
	lob	
	mcall	mrotpnty
	nop
	sms	[m_groupnum],rx
	sms	[m_grouptab],rz

;---------------------------------------
	iwt	r0,#mvanishX
	lms	rx1,[m_numpnts]
	lms	rx2,[m_groupnum]
	with	rx1
	add	r0
	with	rx2
	add	r0

	iwt	r0,#mvanishY
	lms	ry1,[m_numgroups]
	lms	ry2,[m_grouptab]
	with	ry1
	add	r0
	with	ry2
	add	r0


	mcall	mdodrawline
	nop

;---------------------------------------
	lm	r0,[m_hudcol2]
	colour

	iwt	r0,#mvanishX
	lms	rx1,[m_numpnts]
	mneg	rx1
	lms	rx2,[m_groupnum]
	mneg	rx2
	with	rx1
	add	r0
	with	rx2
	add	r0

	iwt	r0,#mvanishY
	lms	ry1,[m_numgroups]
	mneg	ry1
	lms	ry2,[m_grouptab]
	mneg	ry2
	with	ry1
	add	r0
	with	ry2
	add	r0


	mcall	mdodrawline
	nop



	mpop	pc
	nop




;*******************************************************************
mdodrawline
	mpush	r11
	mcache

	ibt	rxi,#1
	with	rx2
	sub	rx1
	bpl	.1
	nop
	ibt	rxi,#-1
	mneg	rx2
.1
	ibt	ryi,#1
	with	ry2
	sub	ry1
	bpl	.3
	nop
	ibt	ryi,#-1
	mneg	ry2
.3
	from	rx2
	sub	ry2
	bmi	.largery
	nop

	move	rcnt,rx2
	inc	rcnt
	lsr
	sub	ry2
	move	r13,pc

;Loop			8/11 cycles
	bcs	.5
	plot
	add	rx2
	with	ry1
	add	ryi
.5
	dec	rx1
	with	rx1
	add	rxi
	loop
	sub	ry2

	mlbra	.end


.largery
	move	rcnt,ry2
	inc	rcnt
	mneg	r0
	lsr

	sub	rx2
	move	r13,pc
;Loop			8/11 cycles
	bcs	.6
	plot
	add	ry2
	with	rx1
	add	rxi
.6
	dec	rx1
	with	ry1
	add	ryi
	loop
	sub	rx2

.end
	mpop	pc
	nop
