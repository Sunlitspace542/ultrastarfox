
level3_7
	initlevel	3_7a,0

	start_65816
	stz	helpshots
	lda	playertwoactivated
	beq	.nop2
	jsl	scenedone
.nop2
	end_65816
	
	mapjsr	map3_7a
	mapgoto	level1_end
	mapgoto	final_tunnel

;	setbg	3_7b
;	initbg

;	mapjsr	map3_7b

;	setbg	3_7c
;	initbg

;	mapjsr	map3_7c

;	mapwait	10000
;	mapend


