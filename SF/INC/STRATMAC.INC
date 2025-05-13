;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                	       *
;*   File: STRATMAC.ASM                                                    *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: STRATEGY MACROS.                                                *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 11/2/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:	                                                               *
;*                                                                         *
;*		Giles Goddard.                                                     *
;*                                                                         *
;***************************************************************************
;***************************************************************************
;* REMEMBERS...
	progress_off
;	printf	"REMEMBER : extra parm in S_GOTO_WP.%n"
;	printf	"REMEMBER : S_NEXT_STATE change.%n"
	progress_on
	
;***************************************************************************
ERROR	MACRO
	progress_off
	printf	"[0;5;31;1mError: \1 [0m%n"
	progress_on
	ENDM

total_strat_len		=	0
total_stratfile_len	=	0
total_stratmac_len	=	0


;---------------------------------------------------------------------------
;	macro name		dest,(source),parms
;
;- OBJECT MISC. MACROS
;	s_make_obj		shape,label - returns new obj in Y
;	s_push_stratptr		obj1 - one level only !
;	s_pull_stratptr		obj1 - one level only !
;	s_set_strat		obj1,#ptr to strategy
;	s_set_collstrat		obj1,#ptr to collision strategy
;	s_set_endcollstrat	obj1,#ptr to end collision strategy
;	s_set_expstrat		obj1,#ptr to explosion strategy
;	s_set_aldata		obj1,HP,AP
;	s_set_alptrs		obj1,#strategy,#collstrat,#expstrat
;	s_set_nmistrat		obj1,#ptr to nmi strategy
;	s_goto_obj		obj1,obj2,Xoff,Yoff,Zoff,max dist,min dist,max speed,#accel,#angle chase rate,#skid,[label]
;	s_goto_WP		obj1,obj2,obj2 #WP,max speed,#accel,#angle chase rate,#skid,min dist,min dist speed,[label]
;	s_goto_WPpostab		obj1,obj2,obj2 #WP,max speed,#accel,#angle chase rate,#skid,min dist,min dist speed,table name,label
;	s_set_WP		obj1,obj2 or 0,obj1 #WP,x,y,z
;	s_set_dist		obj1,obj2,XorYorZ
;	s_kill_obj		obj1
;	s_setnoremove_behind	obj1
;	s_setremove_behind	obj1
;	s_remove_offscn		obj1
;	s_remove_obj		obj1
;	s_remove_fire		obj1
;	s_circle_obj		obj1,obj2,#distance,speed,#skid - USES SBYTE2
;*TBD	s_turnto_obj		obj1,obj2,Y rotation offset.		
;	s_carry_obj		obj1,obj2,#x,#y,#z offset.	16bit offsets. obj1 carry obj2
;	s_damagesmoke		obj1,smoke HP,#smoke rate(0-8),[x,y,z offset BYTES,scale] 
;	s_damagefire		obj1,smoke HP,#smoke rate(0-8),[x,y,z offset BYTES,scale] 
;	s_make_smoke		[delay,label]
;	s_make_splash		obj,[size(S)]
;	s_set_find		obj1 (0= start of list)
;	s_find_nearobj		obj2,obj1,shape,min radius,max radius,label 
;	s_find_radiusobj	obj2,obj1,shape,min radius,max radius,label 
;	s_find_obj		obj2,obj1,shape,label
;	s_find_Mobj		obj2,obj1,shape,ASF_name mask,label 
;	s_rots_flat		obj1
;	s_chk_objptr		obj1,label
;	s_weapon_pos		x,y,z
;	s_weapon_rot		x,y
;	s_weapon_rndrot		#rnd x AND,#rnd y AND
;	s_weapon_rndrots2obj 	obj1,#rnd x AND,#rnd y AND
;	s_weapon_rots2obj 	obj1,[x rot off,y rot off]
;	s_weapon_Yrot2obj 	obj1
;	s_fire_weapon		obj1,#WEAPON_name,[label] - if can't gen.
;	s_fire_Yweapon		obj1,#WEAPON_name 
;	s_Initface_player	obj1
;	s_face_player		obj1,#chase,#delay,[label] - USES SBYTE2,SBYTE3
;	s_exg_objs		
;	s_start_strat
;	s_start_collstrat
;	s_start_nmistrat
;	s_end_strat
;	s_end_nmistrat
;	s_end_collstrat		
;	s_DIScolls		obj1
;	s_ENAcolls		obj1
;	s_docoll		obj1,frames per AP,[#AP scale down]
;	s_docollAP		obj1,frames per AP,AP override 
;	s_obj2collide		obj1 
;	s_hardvars		obj1
;	s_playerctrl		off/on
;	s_make_xyvec		onj1,angle,speed
;	s_set_debrisdata	obj1,shape
;	s_banktoplayer	
;	s_float			obj1,size(32/64)
;	s_spacemist		obj1
;	s_add_rnd2pos		obj1,#X AND,#Y AND,#Z AND,[#X scale,#Y scale,#Z scale]
;	s_particle_data		obj1,#type,#amount,#life
;	s_boss_dying		
;	s_remove_ifplayerdead	obj1

;- VARIABLES AND COUNTERS MACROS
;	s_set_alvartobeobj	obj2,obj2 alvar,obj1
;	s_set_vartobeobj	var,obj
;	s_set_objtobealvar	obj2,obj1,obj1 alvar
;	s_set_objtobevar	obj2,var
;	s_set_objtobeplayer	obj1

;	s_copy_sflags		obj2,obj1		
;	s_copy_obj		obj2,obj1		
;	s_copy_var2var		size,var,var
;	s_copy_var2alvar	size,obj1,alvar,var
;	s_copy_var2alxvar	size,obj1,alxvar,var
;	s_copy_alvar2var	size,obj1,var,alvar
;	s_copy_alxvar2var	size,obj1,var,alxvar
;	s_copy_alvar2alvar	size,obj1,alvar,obj2,alvar
;	s_copy_alvar2alxvar	size,obj1,alxvar,obj2,alvar
;	s_Achase_alvar		size,obj1,alvar,value,#chase rate,[label]
;	s_Achase_2alvars	size,obj1,alvar1,value1,#chase rate,alvar2,value2,#chase rate,[label]
;	s_Achase_var2alvar	size,obj1,var,alvar,#chase rate,[label]
;	s_Achase_alvar2alvar	size,obj1,alvar,obj2,alvar,#chase rate,[label]
;	s_Achase_var		size,var,value,#chase rate,[label]
;	s_Fchase_alvar		size,obj1,alvar,value,#chase rate,[label]
;	s_Fchase_var2alvar	size,obj1,var,alvar,#chase rate,[label]
;	s_Fchase_alvar2alvar	size,obj1,alvar,obj2,alvar,#chase rate,[label]
;	s_Fchase_var		size,var,value,#chase rate,[label]
;	s_set_alvar		size,obj1,alvar,value
;	s_clr_alvar		size,obj1,alvar
;	s_set_alvar2rnd		obj1,alvar,[AND value] - BYTE ONLY
;	s_add_rnd2alvar		obj1,alvar,[AND value] - BYTE ONLY
;	s_add_rnd2var		alvar,[AND value] - BYTE ONLY
;	s_add_alvar		size,obj1,alvar,value
;	s_varadd_alvar		size,obj1,var,alvar
;	s_sub_alvar		size,obj1,alvar,value
;	s_varsub_alvar		size,obj1,var,alvar
;	s_dec_alvar		size,obj1,alvar
;	s_inc_alvar		size,obj1,alvar
;	s_neg_alvar		size,obj1,var
;	s_scale_alvar		size,obj1,var,#scale(-ve/+ve)
;	s_scale_var		size,var,#scale(-ve/+ve)
;	s_set_var		size,var,value
;	s_clr_var		size,var
;	s_set_var2rnd		var,[AND value]  -  BYTE ONLY
;	s_add_var		size,var,value
;	s_sub_var		size,var,value
;	s_dec_var		size,var
;	s_inc_var		size,var
;	s_neg_var		size,var
;	s_add_alvars		size,obj1,alvar,obj2,alvar
;	s_add_vars		size,var,var
;	s_sub_alvars		size,obj1,alvar,obj2,alvar
;	s_cmp_alvars		size,obj1,alvar,obj2,alvar
;	s_cmp_alvar		size,obj1,alvar,cmp value
;	s_cmp_var		size,var,cmp value
;	s_set_alvar2alvartab	OFFSET size,FROM size,TO size,obj1,alvar,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
;	s_set_alvar2vartab	OFFSET size,FROM size,TO size,obj1,alvar,var OFFSET,table ptr,[#scale(-7 -> 7)]
;	s_set_var2alvartab	OFFSET size,FROM size,TO size,var,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
;	s_set_var2vartab	OFFSET size,FROM size,TO size,var,var OFFSET,table ptr,[#scale(-7 -> 7)]
;	s_set_3vars		size,var1,var2,var3,value1,value2,value3

;	s_set_lifecnt		obj1,value
;	s_dec_lifecnt		obj1,[1=kill]
;	s_decbpl_lifecnt	obj1,label
;	s_decbne_lifecnt	obj1,label
;	s_set_altype		obj1,#ATflag
;	s_set_alflag		obj1,#AFflag
;	s_set_alsflag		obj1,#AFS_flag
;	s_set_flag		var,#bit number
;	s_clr_flag		var,#bit number
;	s_test_flag		var,#bit number
;	s_test_var		size,var,#value
;	s_or_var		size,var,#value
;	s_not_var		size,var,#value
;	s_and_var		size,var,#value
;	s_or_alvar		size,obj1,var,#value
;	s_and_alvar		size,obj1,var,#value
;	s_set_alcollflag	obj1,#ACF_flag
;	s_clr_atype		obj1,#ATflag
;	s_not_alflag		obj1,#AFS_flag
;	s_clr_alflag		obj1,#AFflag
;	s_clr_alsflag		obj1,#AFS_flag
;	s_clr_alcollflag	obj1,#ACF_flag
;	s_set_colltype		obj1,coll type (LASER/ENEMY1)
;	s_clr_colltype		obj1,coll type (LASER/ENEMY1)
;	s_not_alsflag		obj1,#AFS_flag
;	s_limit_alvar		size,obj1,alvar,#min value,#max value,[label]
;	s_limit_var		size,var,#min value,#max value,[label]

;	s_push_obj		obj
;	s_pull_obj		obj
;	s_push_alvar		size,obj1,alvar
;	s_pull_alvar		size,obj1,alvar
;	s_push_var		size,var
;	s_pull_var		size,var


;- VECTOR MACROS
;	s_set_speed		obj1,speed
;	s_add_speed		obj1,value
;	s_sub_speed		obj1,value
;	s_speedto		obj1,speed,#acceleration,[label]
;	s_zero_vecs		obj1
;	s_zero_2dvecs		obj1
;	s_zero_rots		obj1
;	s_zero_pos		obj1
;	s_scale_vecs		obj1,#scale shift value
;	s_gen_vecs		obj1,alroty,alvel,[#scale]
;	s_gen_Zvec		obj1,alvel,[#scale]
;	s_gen_flatvecs		obj1,alroty,alvel,[#scale]
;	s_addgen_vecs		obj1,alroty,alvel,[#scale]
;	s_addgen_3Dvecs		obj1,alroty,alrotx,alvel,[#scale]
;	s_gen_3Dvecs		obj1,alroty,alrotx,alvel,[#scale]
;	s_scale_vec		obj1,vec,#scale shift value
;	s_add_2pos		obj1,x,y,z
;	s_add_vecs2pos		obj1
;	s_add_vecs2vecs		obj2,obj1
;	s_set_pos		obj1,x,y,z
;	s_set_vecs		obj1,x,y,z
;	s_set_vec		obj1,X or Y or Z,value
;	s_add_2Yvec		obj1,value (WORD)
;	s_copy_pos		obj2,obj1
;	s_copy_pos2WP		obj2,#WP,obj1
;	s_copy_vecs		obj2,obj1
;	s_copy_rots		obj2,obj1
;	s_objrel_vecs		obj1,obj2,x,z offset.
;	s_objrel_3vecs		obj1,obj2,x,y,z offset.
;	s_obj2obj_angle		obj1,obj2,obj1 roty,#angle chase.,[label]
;	s_obj2obj_3Dangle 	obj1,obj2,obj1 roty,rotx,#angle chase.,[label]
;	s_obj2obj_3DangleOFF 	obj1,obj2,obj1 roty,roty offset,rotx,rotx offset,#angle chase.,[label]
;	s_obj2obj_angleOFF	obj1,obj2,obj1 roty,offset,#angle chase.,[label]
;	s_obj2WP_angle		obj1,obj2,#WP,obj1 alroty,obj1 alrotx,#angle chase.,[label]
;	s_move_obj		obj1,speed,#accel,#skid
;	s_move3D_obj		obj1,speed,#accel,#skid
;	s_add_viewheight	obj1
;	s_sub_viewheight	obj1
;	s_add_cheight		obj1
;	s_sub_cheight		obj1
;	s_copy_vheight2var	obj1,var
;	s_falldown_Yvec		obj1,#bounceyness(1-4/high-low),gravity(WORD),ground Ypos,[label]
;	s_add_Roffs2pos		size,TO obj,POS obj,ROT obj,x,y,z,0/1,0/1,0/1 (x,y,z)rot on,[X #scale,Y #scale,Z #scale] 
;	s_keeprelto_player	obj1
;	s_add_playerZ		obj1
;	s_sub_playerZ		obj1

;- STRATEGY MASKING MACROS 
;	s_inrng_strat		obj1,label
;	s_inview_strat		obj1,label
;	s_leftview_strat	obj1,label
;	s_rightview_strat	obj1,label
;	s_player_strat		obj1,label

;- CONDITIONAL MACROS
;	s_jmp_iflevel		#level(1-3),.label
;	s_jmp_ifnotlevel	#level(1-3),.label
;	s_jmp			label
;	s_jsr			label
;	s_jsl			label
;	s_ldajsl		size,var,label
;	s_rtl			
;	s_jmp_onfire		obj1,label
;	s_jmpNOT_onfire		obj1,label
;	s_jmpto_strat		x
;	s_jmpto_tempstrat	x
;	s_do_strat		obj1
;	s_jmpto_collstrat	x
;	s_jmpto_expstrat 	x
;	s_jmp_higher		obj1,height,label	16bit height
;	s_jmp_higheralvar	obj1,alvar,label	16bit height
;	s_jmp_objhigher		obj1,obj2,label		
;	s_jmp_lower		obj1,height,label	16bit height
;	s_jmp_loweralvar	obj1,alvar,label	16bit height
;	s_jmp_objlower		obj1,obj2,label		
;	s_jmp_Hdistmore		obj1,obj2,dist,label	16bit distance
;	s_jmp_Hdistless		obj1,obj2,dist,label	16bit distance
;	s_jmp_distmore		obj1,obj2,dist,label	16bit distance
;	s_jmp_distless		obj1,obj2,dist,label	16bit distance
;	s_jmp_XYdistmore	obj1,obj2,dist,label	16bit distance
;	s_jmp_XYdistless	obj1,obj2,dist,label	16bit distance
;	s_jmp_outXYdistrng	obj1,obj2,min dist,max dist,label
;	s_jmp_objinfront	obj1,obj2,label
;	s_jmp_Zdistmore		obj1,obj2,dist,label
;	s_jmp_Zdistless		obj1,obj2,dist,label
;	s_jmp_outXdistrng	obj1,obj2,min dist,max dist,label
;	s_jmp_outYdistrng	obj1,obj2,min dist,max dist,label
;	s_jmp_outZdistrng	obj1,obj2,min dist,max dist,label
;	s_jmp_Xdistmore		obj1,obj2,dist,label
;	s_jmp_Xdistless		obj1,obj2,dist,label
;	s_jmp_WPdistmore	obj1,obj2,#WP,dist,label	16bit distance
;	s_jmp_WPdistless	obj1,obj2,#WP,dist,label	16bit distance
;	s_jmp_lifemore		obj1,value,label   			
;	s_jmp_lifeless		obj1,value,label			
;	s_jmp_ifdelay		#delay(1-8)(min-max),label,[offset]
;	s_jmp_notdelay		#delay(1-8)(min-max),label,[offset]
;	s_jmp_ANDframe		AND value,label
;	s_jmp_notANDframe	AND value,label
;	s_jmp_frameMORE		#frame num,#max frame AND value,label 
;	s_jmp_frameLESS		#frame num,#max frame AND value,label 
;	s_jmp_onframe		#frame num,#max frame AND value,label 
;	s_jmpNOT_onframe	#frame num,#max frame AND value,label 
;	s_jmp_alvarAND		size,obj1,alvar,value,label	
;	s_jmpNOT_alvarAND	size,obj1,alvar,value,label	
;	s_jmp_varAND		size,var,value,label	
;	s_jmpNOT_varAND		size,var,value,label	
;	s_jmp_ABSalvarmore	size,obj1,alvar,value,label	UNSIGNED
;	s_jmp_alvarmore		size,obj1,alvar,value,label	UNSIGNED
;	s_jmp_alvarmoreEQ	size,obj1,alvar,value,label	UNSIGNED
;	s_jmp_ABSalvarless	size,obj1,alvar,value,label	UNSIGNED
;	s_jmp_alvarless		size,obj1,alvar,value,label	UNSIGNED
;	s_jmp_alvarlesseq	size,obj1,alvar,value,label	UNSIGNED
;	s_jmp_alvarpl		size,obj1,alvar,label
;	s_jmp_alvarmi		size,obj1,alvar,label
;	s_jmp_alvareq		size,obj1,alvar,value,label
;	s_jmp_alvarzero		size,obj1,alvar,label
;	s_jmp_alvarNOTzero	size,obj1,alvar,label
;	s_jmp_varzero		size,var,label
;	s_jmp_varNOTzero	size,var,label
;	s_jmp_alvarne		size,obj1,alvar,value,label
;	s_jmp_varpl		size,obj1,var,value,label
;	s_jmp_varne		size,obj1,var,value,label
;	s_jmp_vareq		size,obj1,var,value,label
;	s_jmp_varmoreEQ		size,var,value,label	UNSIGNED
;	s_jmp_varmore		size,var,value,label	UNSIGNED
;	s_jmp_varless		size,var,value,label	UNSIGNED
;	s_jmp_alvarOUTLIMIT	size,obj1,alvar,#-+range,label
;	s_jmp_alvarINLIMIT	size,obj1,alvar,#-+range,label
;	s_beqdec_alvar		size,obj1,alvar,label
;	s_beqinc_alvar		size,obj1,alvar,label
;	s_decbeq_alvar		size,obj1,alvar,label
;	s_decbne_alvar		size,obj1,alvar,label
;	s_decbpl_alvar		size,obj1,alvar,label
;	s_beqdec_var		size,var,label
;	s_beqinc_var		size,var,label
;	s_decbne_var		size,var,label
;	s_jmp_altype		obj1,#ATflag,label
;	s_jmp_alflag		obj1,#AFflag,label
;	s_jmpNOT_alflag		obj1,#AFflag,label
;	s_jmp_alsflag		obj1,#ASF_flag,label
;	s_jmpNOT_alsflag	obj1,#ASF_flag,label
;	s_jmp_alcollflag	obj1,#ACF_flag,label
;	s_jmpNOT_alcollflag	obj1,#ACF_flag,label
;	s_jmp_colltype		obj1,#colltype,label
;	s_jmpNOT_colltype	obj1,#colltype,label
;	s_jmp_random		label,[#percentage]
;	s_jmp_objplayer		obj1,label
;	s_jmp_objNOTplayer	obj1,label
;	s_jmp_keydown		#key,label
;	s_jmp_keyup		#key,label
;	s_jmp_anyJkeydown	label
;	s_jmp_anyJkeyup		label
;	s_jmp_leftofview	obj1,label
;	s_jmp_rightofview	obj1,label
;	s_jmp_objpointnegZ	obj1,label
;	s_jmp_objpointposZ	obj1,label
;	s_jmpNOT_objpointnegZ	obj1,label
;	s_jmpNOT_objpointposZ	obj1,label
;	s_jmp_objptrbad		obj1,label
;	s_jmp_objptrok		obj1,label
;	s_bra			label
;	s_beq			label
;	s_bne			label
;	s_bpl			label
;	s_bmi			label
;	s_bcc			label
;	s_bcs			label
;	s_bcs			label
;	s_jmp_ifplayerdead	label
;	s_jmp_ifplayeralive	label

;- STATE MACROS
;	s_set_state		obj1,state
;	s_next_state		obj1,[max state]
;	s_jmp_IFstate		obj1,#state,label
;	s_jmp_IFNOTstate 	obj1,#state,label
;	s_set_MAXstate		max state - USED ONLY FOR NEXTSTATE JMP

;- MOTHER AND CHILD MACROS.
;
;- These use AL_SBYTE1,AL_SWORD1,AL_PTR	
;	
;	s_make_mother		obj1
;	s_make_child		child number
;	s_set_objtobechild	obj2,mother obj,child number
;	s_set_objtobemother	obj2,child obj
;	s_remove_child		child obj,mother obj
;	s_make_childobjpos	shape,child num,x,y,z rel,#strategy ptr,[colltype]
;	s_make_childobj		shape,child num,#strategy ptr,[colltype]
;	s_count_childs		mother obj,to var BYTE
;	s_do_childrelpos	child obj1,#scale
;	s_set_relpos		obj1,x,y,z
;	s_set_childstate	child num,state ; MOTHER in X, puts child in Y
;	s_jmp_childdead		child num,label ; MOTHER in X, puts child in Y
;	s_jmp_childalive	child num,label	; MOTHER in X, puts child in Y

	
;	set_sound2		obj,sound port 2 number
;	s_dooropen_snd		[#anim frame num]
;	s_doorclose_snd		[#anim frame num]



;- OTHER ONES.
;	s_a16_mode		
;	s_a8_mode		
	

;- MACROS NOT AVAILABLE TO USER.
;	s_chkcoll		obj1
;	s_collpos_save		obj
;	s_playerfly_mode	name
;	s_make_immune

;-----------------------------------------------------------------------------
; DEBUG MACROS.
;	d_print_alvar		size,obj,alvar,pos code.
;	d_print_var		size,var,pos code.



;- Notes:
;
;    All size parameters MUST be upper case.
;
;    Friz Jizz and Bucks Fizz.
;
;



	INCLUDE	INC\STRATEQU.INC

;-----------------------------------------------------------------------------
strats_start	MACRO
total_stratfile_addr	=	*
	IFD	_SASM
	databank $7E
	ENDC
	shorta
	longi
	IFD	_ARGSFX
	SETDBR	$7E
	ENDC
		ENDM	


;-----------------------------------------------------------------------------
strats_end	MACRO
total_stratfile_len	=	total_stratfile_len+(*-total_stratfile_addr)
	IFD	_SASM
	databank 0
	ENDC
	IFD	_ARGSFX
	SETDBR	0
	ENDC
		ENDM	

;-----------------------------------------------------------------------------
stratmac_start	MACRO
	IFNE	MAKE_STRAT_REPORT	
	defs	$1,"%c"
	inc_cnt
	ENDC
		ENDM

inc_cnt	macro
	IFD	\$1_cnt
\$1_cnt	=	\$1_cnt+1
	ELSEIF
\$1_cnt	=	1
	ENDC
\$1_addr	=	*
	endm



;-----------------------------------------------------------------------------
stratmac_end	MACRO
	IFNE	MAKE_STRAT_REPORT	
	defs	$1,"%c"
	inc_len	 
	ENDC
		ENDM	


inc_len	macro
	IFD	\$1_len
\$1_len	=	\$1_len+(*-\$1_addr)
	ELSEIF
\$1_len	=	*-\$1_addr
	ENDC
	endm



;-----------------------------------------------------------------------------
stratmac_par	MACRO
	IFNE	MAKE_STRAT_REPORT	
;	defs	$1,"%c"
;	test_par 	\1
	ENDC
		ENDM

test_par	macro
	
	IFND	\1

	IFD	\$1_par1
\$1_par1	=	\$1_par1+1
	ELSEIF
\$1_par1	=	1
	ENDC

	ENDC

	endm



;-----------------------------------------------------------------------------
s_lda	MACRO
	
	IFC	"\2","x"
	lda	\1,x
	MEXIT
	ENDC
	IFC	"\2","X"
	lda	\1,x
	MEXIT
	ENDC

	IFC	"\2","y"
	lda.w	\1,y
	MEXIT
	ENDC
	IFC	"\2","Y"
	lda.w	\1,y
	MEXIT
	ENDC

	ENDM

;-----------------------------------------------------------------------------
s_sta	MACRO
	
	IFC	"\2","x"
	sta	\1,x
	MEXIT
	ENDC
	IFC	"\2","X"
	sta	\1,x
	MEXIT
	ENDC

	IFC	"\2","y"
	sta.w	\1,y
	MEXIT
	ENDC
	IFC	"\2","Y"
	sta.w	\1,y
	MEXIT
	ENDC

	ENDM


;-----------------------------------------------------------------------------
CHG_MODE	MACRO
	IFC	"W","\1"
	IFEQ	LONGA
	a16
	ENDC
	MEXIT
	ENDC

	IFC	"B","\1"
	MEXIT
	ENDC

	error	<Strategy parameter error! - wrong size type (B or W)>
		ENDM
;-----------------------------------------------------------------------------
CHG_MODEBACK	MACRO
	IFC	"W","\1"
	a8
	MEXIT
	ENDC

	IFC	"B","\1"
	MEXIT
	ENDC

	error	<Strategy parameter error! - wrong size type (B or W)>
	ENDM


;-----------------------------------------------------------------------------
big_circle_exp	MACRO
	a16
	lda	#smartbomb_circle
	sta	circleanim
	a8
	ENDM
;-----------------------------------------------------------------------------

s_test_special	MACRO
	lda_sflags	\1,special
	bit		#asf_special
	bne		.iss\@
	lda_sflags	\1,Cspecial
	bit		#asf_Cspecial
	beq		.ns\@
.iss\@	inc		specials_dead
.ns\@
	ENDM

;-----------------------------------------------------------------------------
set_sound2		MACRO	obj,sound number
	s_set_alvar.l	B,\1,alx_snd2,\2
		ENDM

;-----------------------------------------------------------------------------
lda_sflags	MACRO

	IFD	wsf1_\2
	s_lda.w	al_sflags,\1
	ENDC

	IFD	wsf2_\2
	s_lda.w	al_sflags2,\1
	ENDC

	IFD	wsf3_\2
	s_lda.w	al_sflags3,\1
	ENDC

	IFD	wsf4_\2
	s_lda.w	al_sflags4,\1
	ENDC

	ENDM

;-----------------------------------------------------------------------------
sta_sflags	MACRO


	IFD	wsf1_\2
	s_sta.w	al_sflags,\1
	ENDC

	IFD	wsf2_\2
	s_sta.w	al_sflags2,\1
	ENDC

	IFD	wsf3_\2
	s_sta.w	al_sflags3,\1
	ENDC

	IFD	wsf4_\2
	s_sta.w	al_sflags4,\1
	ENDC

	ENDM

;-----------------------------------------------------------------------------
d_print_alvar		MACRO	size,obj,alvar,pos code.
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1
	CHK_OBJ	\2
	lda.\0	\3,\2
	sta	tpa
	jsl	printa\1\4_l	
	CHG_MODEBACK	\1
  	ENDM
;-----------------------------------------------------------------------------
d_print_var		MACRO	size,var,pos code.
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda.\0	\2
	sta	tpa
	jsl	printa\1\3_l	
	CHG_MODEBACK	\1
  	ENDM

;-----------------------------------------------------------------------------
CHK_OBJ		MACRO
	IFC	"X","\1"
objxy	=	0
	MEXIT
	ENDC
	IFC	"Y","\1"
objxy	=	1
	MEXIT
	ENDC
	IFC	"x","\1"
objxy	=	0
	MEXIT
	ENDC
	IFC	"y","\1"
objxy	=	1
	MEXIT
	ENDC
	error	<Illegal strategy parameter! - has to be x or y.>
	kbjasdbjkasd
		ENDM

;-----------------------------------------------------------------------------
CHK_YONLYOBJ		MACRO
	IFC	"Y","\1"
	MEXIT
	ENDC
	IFC	"y","\1"
	MEXIT
	ENDC
	error	<Sorry ! - Y only.>
		ENDM



;-----------------------------------------------------------------------------
CHK_NARG	MACRO

	IFEQ	NARG-2
	IFEQ	MYNARG-\2
	MEXIT
	ENDC
	ENDC

	IFNE	MYNARG-\1
	error	<Strategy parameter error! - wrong amount of parms.>
	ENDC
		ENDM

;-----------------------------------------------------------------------------
CHK_SIZE	MACRO
	IFC	"W","\1"
	MEXIT
	ENDC
	IFC	"B","\1"
	MEXIT
	ENDC
	error	<Bad size.>
		ENDM


;-----------------------------------------------------------------------------
gjmp	MACRO
	jmp.l	\1
	ENDM
;-----------------------------------------------------------------------------
MODE_CHG_ON	MACRO
MODE_CHG	=	1
	ENDM
;-----------------------------------------------------------------------------
MODE_CHG_OFF	MACRO
MODE_CHG	=	0
	ENDM


;-----------------------------------------------------------------------------
exg_xyQ	MACRO

ASAVE	=	LONGA
	
	IFEQ	LONGA
	a16
	ENDC

	tya
	txy
	tax
	IFNE	LONGA-ASAVE
	a8
	ENDC
	
	ENDM
     
	
;-----------------------------------------------------------------------------
exg_xy	MACRO
	phx
	tyx
	ply
	ENDM

;-----------------------------------------------------------------------------
exg_ifY	MACRO	   
	CHK_OBJ	\1

	IFC	"y","\1"
	exg_xy
	ENDC
	IFC	"Y","\1"
	exg_xy
	ENDC

	ENDM

;-----------------------------------------------------------------------------
exg_ifX	MACRO	   
	CHK_OBJ	\1

	IFC	"x","\1"
	exg_xy
	ENDC
	IFC	"X","\1"
	exg_xy
	ENDC

	ENDM

;------------------------------------------------------------------
SEXAM	MACRO
	GET_lsz	\1
	bit	#128
	beq	*+7+lsz
	lda	#$ff
	sta	\1
	bra	*+3+lsz
	stz	\1
	
	ENDM
;-----------------------------------------------------------------------------
amul3	MACRO
	sta	tpa
	asl	a
	clc
	adc	tpa
	ENDM

;-----------------------------------------------------------------------------
mca8	MACRO
	IFNE	MODE_CHG
	a8
	ENDC
	ENDM

;-----------------------------------------------------------------------------
mca16	MACRO
	IFNE	MODE_CHG
	a16
	ENDC
	ENDM

;-----------------------------------------------------------------------------
ca8	MACRO
	IFNE	LONGA
	a8
	ENDC
	ENDM

;-----------------------------------------------------------------------------
ca16	MACRO
	IFEQ	LONGA
	a16
	ENDC
	ENDM

;-----------------------------------------------------------------------------
Achase_alvar2A 	MACRO	obj1,alvar,#chase rate,[label]
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ	\1


	cmp.\0	\2,\1
	IFEQ	NARG-4
	rlbeq	\4
	ELSEIF
	beq	.nc\@
	ENDC

	IFNE	\3
	sec
	sbc.\0	\2,\1

      
	nolessrange	-(1<<\3),(1<<\3)
	REPT	\3
	adiv2
	ENDR

	clc
	adc.\0	\2,\1
	ENDC
.nc\@
	sta.\0	\2,\1
		ENDM



;-----------------------------------------------------------------------------
Achase_var2A 	MACRO	var,#chase rate,[label]
MYNARG	=	NARG
	CHK_NARG	2,3


	cmp.\0	\1
	IFEQ	NARG-3
	rlbeq	\3
	ELSEIF
	beq	.nc\@
	ENDC

	IFNE	\2
	sec
	sbc.\0	\1

	nolessrange	-(1<<\2),(1<<\2)
;	IFNE	\2-1
	REPT	\2
	adiv2
;	asra
	ENDR
;	ENDC
;	adiv2

	clc
	adc.\0	\1
	ENDC
.nc\@	sta.\0	\1

		ENDM


;-----------------------------------------------------------------------------
Fchase_A 	MACRO	chase rate
MYNARG	=	NARG
	CHK_NARG	1
	beq	.dfc\@
	bmi	.fci\@
	sec
	sbc	\1
	bra	.dfc\@
.fci\@	clc	
	adc	\1
.dfc\@	
		ENDM


;------------------------------------------------------------------
; jump to \2 if A out of range  #-\1 to #\1.
jmp_outrange	MACRO
	cmp	#0
	bpl	.not_nega\@
	cmp	#-\1
	bcs	.end_jr\@
	gjmp	\2
.not_nega\@
	cmp	#\1
	bcc	.end_jr\@
	gjmp	\2
.end_jr\@
	ENDM

;------------------------------------------------------------------
; force range and jump to \3 if A out of range  #-\1 to #\2.
Fjmp_outrange	MACRO
	cmp	#0
	bpl	.not_nega\@
	cmp	#-\1
	bcs	.end_jr\@
	lda	#-\1
	gjmp	\3
.not_nega\@
	cmp	#\2
	bcc	.end_jr\@
	lda	#\2
	gjmp	\3
.end_jr\@
	ENDM

;------------------------------------------------------------------
; jump to \2 if A in range of #-\1 to #\1.

jmp_inrange	MACRO
	clc
	adc	#\1
	cmp	#\1*2
	bcs	.njir\@
	sec
	sbc	#\1
	gjmp	\2
.njir\@	sbc	#\1
	ENDM



;------------------------------------------------------------------
; force A to range   \1(-ve) to \2(+ve). 

range	MACRO
	ifle	\1

	ifle	\2	;-\1,-\2  **works
	cmp	#\1
	bpl	.oneok1\@
	lda	#\1
	bra	.range_done\@
.oneok1\@	cmp	#\2
	bmi	.range_done\@
	lda	#\2

	elseif		;-\1,+\2  **works

	cmp	#0
	bmi	.range_n_test\@
	cmp	#\2
	bmi	.range_done\@		
	lda	#\2
	bra	.range_done\@
.range_n_test\@
	cmp	#\1
	bpl	.range_done\@
	lda	#\1
	endc

	elseif		;+\1

	ifle	\2	;+\1,-\2  ** works
	cmp	#0
	bmi	.range_n_test2\@
	cmp	#\1
	bmi	.range_done\@		
	lda	#\1
	bra	.range_done\@
.range_n_test2\@
	cmp	#\2
	bpl	.range_done\@
	lda	#\2
	elseif		;+\2,+\2  ** works

	cmp	#\1
	bcs	.oneok4\@
	lda	#\1
.oneok4\@	cmp	#\2
	bcc	.range_done\@
	lda	#\2
	endc
	endc
.range_done\@
	ENDM



















;------------------------------------------------------------------
; force A to no less range than   #\1(-ve) to #\2(+ve). 

nolessrange	MACRO
	GET_ASZ
	cmp	#0
	bmi	*+8+asz*2
	cmp	#\2
	bpl	*+9+asz*3		
	lda	#\2
	bra	*+6+asz*2
	cmp	#\1
	bmi	*+3+asz
	lda	#\1
	ENDM

;-----------------------------------------------------------------------------

adiv2	MACRO
	IFEQ	LONGA
asz	=	1
	cmp #128
	ELSEIF
asz	=	2
	cmp #32768
	ENDC
	ror a
	bpl	*+asz+3
	adc	#0

	ENDM




;-----------------------------------------------------------------------------
s_a16_mode	MACRO
	a16
	MODE_CHG_OFF
	ENDM

;-----------------------------------------------------------------------------
s_a8_mode	MACRO
	MODE_CHG_ON
	a8
	ENDM

;-----------------------------------------------------------------------------
s_exg_objs		MACRO	
	EXG_XY
		ENDM
;-----------------------------------------------------------------------------
s_chk_objptr	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	cp\1	#0
	rlbeq	\2
	stratmac_end
		ENDM


;-----------------------------------------------------------------------------
s_jmp_objptrbad	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	cp\1	#0
	rlbeq	\2
	stratmac_end
		ENDM


;-----------------------------------------------------------------------------
s_jmp_objptrok	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	cp\1	#0
	rlbne	\2
	stratmac_end
		ENDM


;-----------------------------------------------------------------------------
s_start_strat	MACRO
	stratmac_start

startaddr	=	*

;	a16
;	stz	svar_dist
;	a8
;	lda	strat_valid
;	bne	.nss\@
;
;	inc	enemys
;
;	lda	#$ff
;	sta	strat_valid
;	
;
;.nss\@	
	shorta
	longi

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_start_collstrat	MACRO
	stratmac_start
	a16
	stz	svar_dist
	a8
	lda	strat_valid
	bne	.nss\@

	inc	enemys
	s_collpos_save		x

	lda	#$ff
	sta	strat_valid
.nss\@	
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_end_strat		MACRO
	stratmac_start

total_strat_len	=	total_strat_len+(*-startaddr)
startaddr	=	*

;	s_chkcoll	x
	rtl
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_end_collstrat		MACRO
	stratmac_start
;	s_chkcoll	x
	rtl
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
test_alflag	MACRO	; obj1,flag
	CHK_OBJ	\1
	s_lda.w	al_flags,\1
	and	#af\2
	ENDM
;-----------------------------------------------------------------------------
test_alsflag	MACRO	; obj1,flag
	CHK_OBJ	\1
	lda_sflags	\1,\2
	and	#asf_\2
	ENDM

;-----------------------------------------------------------------------------
test_sflag	MACRO	; flag
	lda	svar_flags
	and	#isf_\1
	ENDM
;-----------------------------------------------------------------------------
test_alcollflags	MACRO	; obj1,#flag
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	and	#\2
	ENDM
;-----------------------------------------------------------------------------
clr_sflag	MACRO	; flag
	lda	svar_flags
	and	#~(isf_\1)
	sta	svar_flags
	ENDM
;-----------------------------------------------------------------------------
set_sflag	MACRO	; flag
	lda	svar_flags
	ora	#(isf_\1)
	sta	svar_flags
	ENDM

;-----------------------------------------------------------------------------
frame_scale		MACRO
	ENDM


			
;-----------------------------------------------------------------------------
s_set_altype		MACRo	obj1,#ATflag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_type,\1
	ora	#at\2
	s_sta.w	al_type,\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_alflag	MACRO	; obj1,flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_flags,\1
	ora	#af\2
	s_sta.w	al_flags,\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_alsflag	MACRO	; obj1,flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	lda_sflags	\1,\2
	ora	#asf_\2
	sta_sflags	\1,\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_flag	MACRO	; var,#bit number
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	lda	\1
	ora	#1<<\2
	sta	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_clr_flag	MACRO	; var,#bit number
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	lda	\1
	and	#~(1<<\2)
	sta	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_test_flag	MACRO	; var,#bit number
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	lda	\1
	bit	#(1<<\2)
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_test_var	MACRO	; size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	bit	\3
	CHG_MODEback	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_NOT_var	MACRO	; size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	eor	\3
	sta	\2
	CHG_MODEback	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_OR_var	MACRO	; size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	ora	\3
	sta	\2
	CHG_MODEback	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_and_var	MACRO	; size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	and	\3
	sta	\2
	CHG_MODEback	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_OR_alvar	MACRO	; size,obj1,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	s_lda.w	\3,\2
	ora	\4
	s_sta.w	\3,\2
	CHG_MODEback	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_AND_alvar	MACRO	; size,obj1,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	s_lda.w	\3,\2
	and	\4
	s_sta.w	\3,\2
	CHG_MODEback	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_alcollflag	MACRO	obj1,#ACF_flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	ora	#acf_\2
	s_sta.w	al_collflags,\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_not_alsflag	MACRO	; obj1,flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	lda_sflags	\1,\2
	eor	#asf_\2
	sta_sflags	\1,\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_clr_altype		MACRo	obj1,#ATflag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_type,\1
	and	#~at\2
	s_sta.w	al_type,\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_clr_alflag	MACRO	; obj1,flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_flags,\1
	and	#~af\2
	s_sta.w	al_flags,\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_not_alflag	MACRO	; obj1,flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_flags,\1
	eor	#~af\2
	s_sta.w	al_flags,\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_clr_alsflag	MACRO	; obj1,flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	lda_sflags	\1,\2
	and	#~asf_\2
	sta_sflags	\1,\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_clr_alcollflag	MACRO	obj1,#ACF_flag
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	and	#~acf_\2
	s_sta.w	al_collflags,\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_colltype		MACRO	obj1,coll type number (1-2)
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	s_lda.w	al_collflags,\1
	ora	#colltype_\2
	s_sta.w	al_collflags,\1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_clr_colltype		MACRO	obj1,coll type number (1-2)
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	s_lda.w	al_collflags,\1
	and	#~colltype_\2
	s_sta.w	al_collflags,\1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_MAXstate		MACRO	max state - USED ONLY FOR NEXTSTATE JMP
	stratmac_start
	lda	\1
	sta	maxstate
	stratmac_end
		ENDM

;-----------------------------------------------------------------------------
s_set_state		MACRO	obj1,state
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	EXG_IFY	\1
	lda	\2
	sta	al_stratstate,x
	EXG_IFY	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_next_state		MACRO	obj1,[max state]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1,2
	CHK_OBJ	\1
	EXG_IFY	\1
	lda	al_stratstate,x
	inc	a

	IFEQ	NARG-2
	cmp	\2
	beq	.\@
	bmi	.\@
	lda	#1
.\@
	ENDC
	sta	al_stratstate,x
	EXG_IFY	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_statecode_start		MACRO	obj1,state name or #number
	defs	1,"slab","\2"
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ		\1


	EXG_IFY		\1
	lda		al_stratstate,x
	EXG_IFY		\1
	cmp		#\2
	slabbne


	stratmac_end
	ENDM
slabbne	MACRO
	rlbne		\$1
	ENDM

;-----------------------------------------------------------------------------
s_statecode_end		MACRO	
slab\$1	
	ENDM

;-----------------------------------------------------------------------------
s_jmp_IFstate		MACRO	obj1,#state,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ		\1
	EXG_IFY		\1
	lda		al_stratstate,x
	EXG_IFY		\1
	cmp		#\2
	rlbeq		\3
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_IFNOTstate		MACRO	obj1,#state,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ		\1
	EXG_IFY		\1
	lda		al_stratstate,x
	EXG_IFY		\1
	cmp		#\2
	rlbne		\3
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	gjmp	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jsl		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	jsl	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jsr		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	jsr	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_ldajsl	MACRO	; size,var,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	jsl	\3
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_rtl		MACRO	
	stratmac_start
	rtl	
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_rts		MACRO	
	stratmac_start
	rts
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_onfire	MACRO		obj,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ		\1
	s_jmp_alflag	\1,onfire,\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpNOT_onfire	MACRO		obj,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ		\1
	s_jmpNOT_alflag	\1,onfire,\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpeq		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	lrbeq	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpne		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	lrbne	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpmi		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	lrbmi	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmppl		MACRO	; label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	lrbpl	\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_keydown	MACRO	; #key,label
	stratmac_start
	test_key_\1
	rlbne	\2	
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_keyup	MACRO	; #key,label
	stratmac_start
	test_key_\1
	rlbeq	\2	
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_lastkeydown	MACRO	; #key,label
	stratmac_start
	test_key_\1	last
	rlbne	\2	
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_lastkeyup	MACRO	; #key,label
	stratmac_start
	test_key_\1	last
	rlbeq	\2	
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_anyJkeydown	MACRO	label
	stratmac_start
	lda	cont0
	and	#key_Jleft!key_Jright!key_Jup!key_Jdown
	rlbne	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_anyJkeyup	MACRO	label
	stratmac_start
	lda	cont0
	and	#key_Jleft!key_Jright!key_Jup!key_Jdown
	rlbeq	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_anyJLRkeydown	MACRO	label
	stratmac_start
	lda	cont0
	and	#key_Jleft!key_Jright
	rlbne	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_anyJLRkeyup	MACRO	label
	stratmac_start
	lda	cont0
	and	#key_Jleft!key_Jright
	rlbeq	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_anyLRkeydown	MACRO	label,[last]
	stratmac_start
	lda	\2contl0
	and	#key_leftl!key_rightl
	rlbne	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_anyLRkeyup	MACRO	label,[last]
	stratmac_start
	lda	\2contl0
	and	#key_leftl!key_rightl
	rlbeq	\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_random	MACRO	; label, [#random factor] (in percentage form)
	stratmac_start
randome	=	50
	IFEQ	NARG-2
randome	=	\2
	ENDC
	jsl	random_l
	cmp	#((randome)*255)/100
	rlbcc	\1
	stratmac_end
	ENDM
		
;-----------------------------------------------------------------------------
s_jmp_objplayer	MACRO	; obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
;	cp\1	playpt
;	rlbeq	\2
	cp\1	pcboxobj_B
	rlbeq	\2
	cp\1	pcboxobj_LW
	rlbeq	\2
	cp\1	pcboxobj_RW
	rlbeq	\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_objNOTplayer	MACRO	; obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
;	cp\1	playpt
;	beq	.\@
	cp\1	pcboxobj_B
	beq	*+16
	cp\1	pcboxobj_LW
	beq	*+11
	cp\1	pcboxobj_RW
	rlbne	\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_altype	MACRO	; obj1,flag,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_type,\1
	and	#(at\2)
	rlbne	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alflag	MACRO	; obj1,flag,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_flags,\1
	and	#(af\2)
	rlbne	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpNOT_alflag	MACRO	; obj1,flag,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_flags,\1
	and	#(af\2)
	rlbeq	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alsflag	MACRO	; obj1,flag,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	lda_sflags	\1,\2
	and	#(asf_\2)
	rlbne	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alcollflag	MACRO	; obj1,flag,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	and	#(acf_\2)
	rlbne	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpNOT_alcollflag	MACRO	; obj1,flag,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	and	#(acf_\2)
	rlbeq	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_colltype		MACRO	; obj1,flag,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	and	#(colltype_\2)
	rlbne	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpNOT_colltype	MACRO	; obj1,flag,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_collflags,\1
	and	#(colltype_\2)
	rlbeq	\3
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmpNOT_alsflag	MACRO	; obj1,flag,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	lda_sflags	\1,\2
	and	#(asf_\2)
	rlbeq	\3
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_NOTalsflag	MACRO	; obj1,flag,label 
	stratmac_start
	s_jmpNOT_alsflag	\1,\2,\3
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_aldata		MACRO	obj1,HP,AP
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1 

	s_set_alvar		B,\1,al_HP,\2
	s_set_alvar		B,\1,al_AP,\3
		stratmac_end
	ENDM	 


;-----------------------------------------------------------------------------
s_set_alptrs		MACRO	obj1,strat,collstrat,expstrat
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1 


code_hitflash_Istrat	=	0
code_explode_Istrat	=	0

	IFD	code_\3
code_\3	=	1
	ENDC

	IFD	code_\4
code_\4	=	1
	ENDC


;	s_set_strat		\1,\2
;	s_set_collstrat		\1,\3
;	s_set_expstrat		\1,\4

	IFEQ	0

	a16
	lda	#\2&WM
	s_sta.w	al_stratptr,\1
	a8
	lda	#\2>>16
	s_sta.w	al_stratptr+2,\1

	IFC	"0+0","\3+\4"
	jsl	set_0collptrs\1_l

	ELSEIF

	IFEQ    (code_hitflash_Istrat+code_explode_Istrat)-2
	jsl	set_normcollptrs\1_l


	ELSEIF
	
;	s_set_collstrat		\1,\3
;	s_set_expstrat		\1,\4


	lda	#\3>>16
	s_sta	al_collstratptr+2,\1
	lda	#\4>>16
	s_sta	al_expstratptr+2,\1

	a16
	lda	#\3&WM
	s_sta	al_collstratptr,\1
	lda	#\4&WM
	s_sta	al_expstratptr,\1

	a8

	ENDC
	ENDC

	ENDC

 
	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_set_WP		MACRO	obj1,obj2,obj1 #WP,x,y,z

	stratmac_start

MYNARG	=	NARG
	CHK_NARG	6,7
	CHK_OBJ	\1 
  
	IFNC	"x","\1"
	error	<Sorry can't do Y as obj1>
	ENDC

	a16

	IFEQ	"0"-"\2"
;-----------------------------------
; absolute
	lda	\4
	sta.l	alx_sWPx\3,\1
	lda	\5
	sta.l	alx_sWPy\3,\1
	lda	\6
	sta.l	alx_sWPz\3,\1

	ELSEIF
;-----------------------------------
; relative
	lda	\4
	sta	x1
	lda	\6
	sta	z1
	a8
	s_lda.w	al_roty,\2
	jsl	rotate_16xz_l

	a16

	lda	x2
	clc		  
	adc.w	al_worldx,\2
	sta.l	alx_sWPx\3,\1
	lda	\5
	clc		  
	adc.w	al_worldy,\2
	sta.l	alx_sWPy\3,\1
	lda	z2
	clc		  
	adc.w	al_worldz,\2
	sta.l	alx_sWPz\3,\1
;-----------------------------------
	ENDC


	a8

	stratmac_end
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_zero_vecs	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1	

;	a16
;	lda	#0
;	sta.w	al_vx,\1
;	sta.w	al_vy,\1
;	sta.w	al_vz,\1
;	a8
;	
;	sta.w	al_vel,\1  

	jsl	sr_zero_vecs\1

	stratmac_end
	ENDM	
;-----------------------------------------------------------------------------
s_zero_2dvecs	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1	

	a16
	lda	#0
	sta.\0	al_vx,\1
	sta.\0	al_vz,\1
	a8
	
	stratmac_end
	ENDM	
;-----------------------------------------------------------------------------
s_zero_rots	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1	

	lda	#0
	sta.\0	al_rotx,\1
	sta.\0	al_roty,\1
	sta.\0	al_rotz,\1
	
	stratmac_end
	ENDM	
;-----------------------------------------------------------------------------
s_zero_pos	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1	

	a16
	lda	#0
	sta.\0	al_worldx,\1
	sta.\0	al_worldy,\1
	sta.\0	al_worldz,\1
	a8
	
	stratmac_end
	ENDM	
;-----------------------------------------------------------------------------
s_move_obj	MACRO	      obj1,speed,#accel,#skid
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4

	CHK_OBJ	\1

	s_speedto	\1,\2,\3

	IFEQ	\4
	s_gen_vecs	\1,al_roty,al_vel
	ELSEIF
	s_gen_vecs	\1,al_skidy,al_vel
	s_Achase_alvar2alvar	B,\1,al_skidy,\1,al_roty,\4
	ENDC

	s_add_vecs2pos	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_move3D_obj	MACRO	      obj1,speed,#accel,#skid
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4

	CHK_OBJ	\1

	s_speedto	\1,\2,\3

	IFEQ	\4
	s_gen_3Dvecs	\1,al_roty,al_rotx,al_vel
	ELSEIF
	s_gen_3Dvecs	\1,al_skidy,al_rotx,al_vel
	s_Achase_alvar2alvar	B,\1,al_skidy,\1,al_roty,\4
	ENDC

	s_add_vecs2pos	\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_falldown_Yvec		MACRO	obj1,#bounceyness(1-4/high-low),gravity(WORD),ground Ypos,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHK_OBJ	\1

  	s_add_2Yvec	\1,\3
	
	s_jmp_higher	\1,\4,.e\@
	s_set_alvar	W,\1,al_worldy,\4

	a16
	lda.\0	al_vy,\1
	nega

	IFNE	\2
	REPT	\2
	adiv2
	ENDR
	ENDC

	cmp	#-5
	bcc  	*+2+3
	lda	#0
	sta.\0	al_vy,\1

	a8

	IFEQ	NARG-5
	cmp	#0
	a8
	rlbeq	\5
	ENDC
.e\@
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_set_strat		MACRO		obj1,#ptr to strategy
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	a16
	lda	#\2&WM
	s_sta.w	al_stratptr,\1
	a8
	lda	#\2>>16
	s_sta.w	al_stratptr+2,\1

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_collstrat		MACRO		obj1,#ptr to collision strategy
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	EXG_IFY	\1
	a16
	lda	#\2&WM
	sta.l	alx_collstratptr,x
	a8
	lda	#\2>>16
	sta.l	alx_collstratptr+2,x
	EXG_IFY	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_endcollstrat		MACRO		obj1,#ptr to end collision strategy
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	EXG_IFY	\1
	a16
	lda	#\2&WM
	sta.l	alx_endcollstratptr,x
	a8
	lda	#\2>>16
	sta.l	alx_endcollstratptr+2,x
	EXG_IFY	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_expstrat		MACRO		obj1,#ptr to explosion strategy
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

code_explode_Istrat	=	0
	IFD	code_\2
code_\2	=	1
	ENDC

	IFNE	code_explode_Istrat
	IFEQ	objxy
	jsl	sr_set_expstrat_expx
	ELSEIF
	jsl	sr_set_expstrat_expy
	ENDC
	
	ELSEIF

	EXG_IFY	\1
	a16
	lda	#\2&WM
	sta.l	alx_expstratptr,x
	a8
	lda	#\2>>16
	sta.l	alx_expstratptr+2,x
	EXG_IFY	\1

	ENDC

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_push_stratptr		MACRO		obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	EXG_IFY	\1
	a16
	lda	al_stratptr,x
	sta.l	alx_tempstratptr,x
	a8
	lda	al_stratptr+2,x
	sta.l	alx_tempstratptr+2,x
	EXG_IFY	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_pull_stratptr		MACRO		obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	EXG_IFY	\1
	a16
	lda.l	alx_tempstratptr,x
	sta	al_stratptr,x
	a8
	lda.l	alx_tempstratptr+2,x
	sta	al_stratptr+2,x
	EXG_IFY	\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_set_nmistrat		MACRO		obj1,#ptr to nmi strategy
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	EXG_IFY	\1
	IFNE	MODE_CHG
	a16
	ENDC
	lda	#\2&WM
;	sta.l	alx_nmistratptr,x
	error	<SORRY NOT NMISTRAT AVAILABLE !!>
	IFNE	MODE_CHG
	a8
	ENDC
	EXG_IFY	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_make_obj		MACRO	; shape,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3

	a16
	lda	\1
	sta	tpa
	a8
	jsl	sr_make_obj
	rlbcc	\2

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_make_immune		MACRO	
	stratmac_start
	s_set_alvartobeobj	y,al_immuneptr,x
	s_set_alvartobeobj	x,al_immuneptr,y
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_Initface_player		MACRO	obj1
	stratmac_start
	s_clr_alsflag		\1,smflag1
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_face_player		MACRO	obj1,#chase,#delay,[label] - USES SBYTE3,SBYTE4
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ	\1

	EXG_IFY	\1

	s_jmpNOT_alsflag	x,smflag1,.d\@

	stz	smvar_byte1

	IFEQ	NARG-4
	s_Achase_alvar2alvar	B,x,al_roty,x,al_sbyte3,\2,.dj\@
	s_jmp		.fc\@
.dj\@	inc		smvar_byte1
.fc\@
	s_Achase_alvar2alvar	B,x,al_rotx,x,al_sbyte4,\2,.dj2\@
	s_jmp		.fc2\@
.dj2\@	inc		smvar_byte1
.fc2\@
	lda		smvar_byte1
	cmp		#2
	rlbeq		\4

	ELSEIF

	s_Achase_alvar2alvar	B,x,al_roty,x,al_sbyte3,\2
	s_Achase_alvar2alvar	B,x,al_rotx,x,al_sbyte4,\2

	ENDC

	s_jmp_NOTdelay		\3,.nch\@
.d\@	
	s_set_alsflag		x,smflag1
	phy
	s_set_objtobeplayer	y
	s_obj2obj_3Dangle	x,y,al_sbyte3,al_sbyte4,0
	ply
.nch\@
	EXG_IFY	\1
	
	stratmac_end
	ENDM
	
;-----------------------------------------------------------------------------
s_weapon_pos		MACRO	 x,y,z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3

	lda	\1
	sta	svar_weapx
	lda	\2
	sta	svar_weapy
	lda	\3
	sta	svar_weapz

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_weapon_rot		MACRO	 x,y
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2

	lda	\1
	sta	svar_weapRx
	lda	\2
	sta	svar_weapRy

	stz	svar_weapobj
	stz	svar_weapobj+1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_weapon_rndrot		MACRO	 #rnd x AND,#rnd y AND
	stratmac_start
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	s_set_var2rnd		svar_byte1,#\1
	s_sub_var		B,svar_byte1,#\1/2
	s_set_var2rnd		svar_byte2,#\2
	s_sub_var		B,svar_byte2,#\2/2
	s_weapon_rot		svar_byte1,svar_byte2

	stratmac_end
		ENDM

;-----------------------------------------------------------------------------
s_weapon_rndrots2obj 	MACRO	obj1,#rnd x AND,#rnd y AND
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1,3
	CHK_OBJ	\1

	s_weapon_rndrot		\2,\3
	st\1	svar_weapobj

	stratmac_end
		ENDM

;-----------------------------------------------------------------------------
s_weapon_rots2obj 	MACRO	obj1,[x rot off,y rot off]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1,3
	CHK_OBJ	\1

	st\1	svar_weapobj


	IFEQ	NARG-3
	lda	\2
	sta	svar_weapRx
	lda	\3
	sta	svar_weapRy
	ELSEIF
	stz	svar_weapRx
	stz	svar_weapRy
	ENDC	

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_weapon_Yrot2obj 	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	CHK_YONLYOBJ	\1

	a16
	s_lda.w	al_worldx,y
	sta	x2
	s_lda.w	al_worldz,y
	sta	z2
	a8
;	exg_xy
	jsl	Yanglexabs_l  
;	nega
	sta	svar_weapRy
	stz	svar_weapRx
;	exg_xy

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_fire_weapon		MACRO		obj1,#WEAPON_name,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3

merr	=	1
	CHK_OBJ	\1

	EXG_IFY	\1


	IFEQ	WEAPON_\2-WEAPON_CURRENT
	s_lda.w	al_weapontype,x
	ELSEIF
	lda	#WEAPON_\2
	ENDC

	jsl	fire_weapon_l
	EXG_IFY	\1

	cpy	#0
	IFEQ	NARG-3
	rlbeq	\3
	ELSEIF
	bne	.ndum\@
	ldy	dummyobj
.ndum\@
	ENDC


	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_fire_Yweapon		MACRO	; obj1,WEAPON_name
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2

merr	=	1
	CHK_OBJ	\1

	EXG_IFY	\1


	IFEQ	WEAPON_\2-WEAPON_CURRENT
	s_lda.w	al_weapontype,\1
	ELSEIF
	lda	#WEAPON_\2
	ENDC

	jsl	fire_yweapon_l

	EXG_IFY	\1
		stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_obj2obj_angleOFF	MACRO	obj1,obj2,obj1 roty,OFFSET,#angle chase.,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHK_OBJ	\1
	CHK_OBJ	\2
	
	s_sub_alvar	B,\1,\3,\4


	jsl	anglexy_l
	a8
	xba
	nega

	IFEQ	NARG-6
	Achase_alvar2a.\0	\1,\3,\5,.fin\@
	ELSEIF
	Achase_alvar2a.\0	\1,\3,\5
	ENDC
	s_brl		.cont\@
.fin\@	s_add_alvar	B,\1,\3,\4
	s_jmp		\6
.cont\@	s_add_alvar	B,\1,\3,\4

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_obj2obj_angle		MACRO	obj1,obj2,obj1 roty,#angle chase,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHK_OBJ	\1
	CHK_OBJ	\2

	jsl	anglexy_l
	a8
	xba
	nega

	IFEQ	NARG-5
	Achase_alvar2a.\0	\1,\3,\4,\5
	ELSEIF
	Achase_alvar2a.\0	\1,\3,\4
	ENDC
	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_obj2obj_3DangleOFF 	MACRO	obj1,obj2,obj1 roty,roty offset,rotx,rotx offset,#angle chase.,[label]
;                                1   2      3         4          5     6           7		8
;s_obj2obj_3Dangle 	MACRO	obj1,obj2,obj1 roty,rotx,#angle chase.,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	7,8
	CHK_OBJ	\1
	CHK_OBJ	\2

	s_sub_alvar	B,\1,\3,\4
	s_sub_alvar	B,\1,\5,\6

	stz	smvar_byte1

;-------------------------------------------------
	jsl	Xanglexy_l
	a8
	xba

	IFEQ	NARG-8
	Achase_alvar2a.\0	\1,\5,\7,.dj\@
	s_jmp		.fc\@
.dj\@	inc		smvar_byte1
	ELSEIF
	Achase_alvar2a.\0	\1,\5,\7
	ENDC
.fc\@


;-------------------------------------------------
	jsl	Yanglexy_l
	a8
	xba
	nega

	IFEQ	NARG-8
	Achase_alvar2a.\0	\1,\3,\7,.dj2\@
	s_jmp		.fc2\@
.dj2\@	inc		smvar_byte1
	ELSEIF
	Achase_alvar2a.\0	\1,\3,\7
	ENDC
.fc2\@

	s_add_alvar	B,\1,\3,\4
	s_add_alvar	B,\1,\5,\6


	IFEQ	NARG-8
	lda		smvar_byte1
	cmp		#2
	rlbeq		\8
	ENDC


	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_obj2obj_3Dangle 	MACRO	obj1,obj2,obj1 roty,rotx,#angle chase.,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHK_OBJ	\1
	CHK_OBJ	\2

	stz	smvar_byte1

;-------------------------------------------------
	jsl	Xanglexy_l
	a8
	xba

	IFEQ	NARG-6
	Achase_alvar2a.\0	\1,\4,\5,.dj\@
	s_jmp		.fc\@
.dj\@	inc		smvar_byte1
	ELSEIF
	Achase_alvar2a.\0	\1,\4,\5
	ENDC
.fc\@


;-------------------------------------------------
	jsl	Yanglexy_l
	a8
	xba
	nega

	IFEQ	NARG-6
	Achase_alvar2a.\0	\1,\3,\5,.dj2\@
	s_jmp		.fc2\@
.dj2\@	inc		smvar_byte1
	ELSEIF
	Achase_alvar2a.\0	\1,\3,\5
	ENDC
.fc2\@

	IFEQ	NARG-6
	lda		smvar_byte1
	cmp		#2
	rlbeq		\6
	ENDC


	stratmac_end
	ENDM




;-----------------------------------------------------------------------------
s_obj2WP_angle	MACRO	obj1,obj2,#WP,obj1 alroty,obj1 alrotx,#angle chase.,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	6,7
	CHK_OBJ	\1
	CHK_OBJ	\2

	stz	smvar_byte1

	a16
	EXG_IFY	\2


;-------------------------------------------------
	lda.l	alx_sWPx\3,x
	sta	x2
	lda.l	alx_sWPz\3,x
	sta	z2
	a8
	jsl	anglexy_abs_l
	nega

	IFEQ	NARG-7
	Achase_alvar2a	\1,\4,\6,.dj\@
	s_jmp		.fc\@
.dj\@	inc		smvar_byte1
	ELSEIF
	Achase_alvar2a	\1,\4,\6
	ENDC
.fc\@



;-------------------------------------------------
	a16
	lda.l	alx_sWPx\3,x
	sta	x2
	lda.l	alx_sWPy\3,x
	sta	y2
	lda.l	alx_sWPz\3,x
	sta	z2
	a8
	jsl	Xanglexabs_l

	IFEQ	NARG-7
	Achase_alvar2a	\1,\5,\6,.dj2\@
	s_jmp		.fc2\@
.dj2\@	inc		smvar_byte1
	ELSEIF
	Achase_alvar2a	\1,\5,\6
	ENDC
.fc2\@

	EXG_IFY	\2

	IFEQ	NARG-7
	lda		smvar_byte1
	cmp		#2
	rlbeq		\7
	ENDC



	stratmac_end
	ENDM
	

;-----------------------------------------------------------------------------
s_goto_WP		MACRO	obj1,obj2,obj2 #WP,max speed,#accel,#angle chase rate,#skid,min dist,min dist speed,[label]

	stratmac_start

MYNARG	=	NARG
	CHK_NARG	9,10
	CHK_OBJ	\1
	CHK_OBJ	\2

	s_add_vecs2pos		\1

	s_jmp_WPdistmore	\1,\2,\3,\8,.f\@
	s_jmp_HWPmore		\1,\2,\3,\8,.f\@

	IFEQ	NARG-10
	s_speedto		\1,\9,2,\A
	ELSEIF
	s_speedto		\1,\9,2
	ENDC     
	brl		.n\@

.f\@
	s_speedto		\1,\4,\5

.n\@

	s_obj2WP_angle		\1,\2,\3,al_roty,al_rotx,\6
	

	IFEQ	\7
	s_gen_3dvecs		\1,al_roty,al_rotx,al_vel
	ELSEIF
	s_Achase_alvar2alvar	B,\1,al_skidy,\1,al_roty,\7
	s_gen_3dvecs		\1,al_skidy,al_rotx,al_vel
	ENDC

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_goto_WPpostab	MACRO	obj1,obj2,obj2 #WP,max speed,#accel,#angle chase rate,#skid,min dist,min dist speed,table name,[label]
	stratmac_start
  
MYNARG	=	NARG
	CHK_NARG	10,11
	CHK_OBJ	\1
	CHK_OBJ	\2

	EXG_IFY	\1

	IFEQ	NARG-10
	s_jmp_IFNOTstate	x,\A_len,.cont\@
	s_add_vecs2pos		x
	s_brl			.end\@
.cont\@
	ENDC


	s_set_objtobeplayer	y

	lda		al_stratstate,x
	asl		a
	asl		a
	asl		a
	sta		smvar_byte1


	s_set_var2vartab	B,W,W,smvar_word4,smvar_byte1,\A+6

	s_jmpNOT_varAND		W,smvar_word4,#wp_speedchg,.nspd\@
	s_set_alvar2vartab	B,B,B,x,al_sbyte2,smvar_byte1,\A
	s_brl			.fin\@
.nspd\@


	s_jmpNOT_varAND		W,smvar_word4,#wp_fire,.nfire\@
	s_jmp_notdelay		2,.nfire\@,al1pt
	s_set_objtobeplayer	y
	s_weapon_pos		#0,#0,#0
	s_set_var2rnd		svar_byte1,#7
	s_sub_var		B,svar_byte1,#3
	s_set_var2rnd		svar_byte2,#7
	s_sub_var		B,svar_byte2,#3
	s_weapon_rots2obj	y,svar_byte1,svar_byte2
	s_fire_weapon		x,RELSLOWELASER
.nfire\@


	s_set_var2vartab	B,W,W,smvar_word1,smvar_byte1,\A
	s_set_var2vartab	B,W,W,smvar_word2,smvar_byte1,\A+2
	s_set_var2vartab	B,W,W,smvar_word3,smvar_byte1,\A+4

	s_jmp_varAND		W,smvar_word4,#wp_fixpos,.nrelcont\@
	s_set_var		W,wpposZ,player_posz
.nrelcont\@
	s_add_var		W,smvar_word3,wpposZ

;	s_copy_alvar2var	B,x,smvar_byte1,al_sbyte2

	s_set_WP	x,0,1,smvar_word1,smvar_word2,smvar_word3
;	s_goto_WP	x,x,\3,smvar_byte1,\5,\6,\7,\8,smvar_byte1,.fin\@
	s_goto_WP	x,x,\3,\4,\5,\6,\7,\8,\9,.fin\@
	s_brl		.end\@
.fin\@
	s_next_state	x,#\A_len
	IFEQ		NARG-11
	s_jmp_IFstate	x,\A_len,\B
	ENDC
.end\@

	EXG_IFY	\1

	stratmac_end
		ENDM


;-----------------------------------------------------------------------------
defWPpostab	MACRO	name
\1_len	=	0
\1
	defs	$1,"\1"
	ENDM

;-----------------------------------------------------------------------------
defWPpos	MACRO	x,y,z,[wpflags]
\$1_len	=	\$1_len+1
	IFEQ	NARG-4
	dw	\1,\2,\3,\4
	ELSEIF
	dw	\1,\2,\3,0
	ENDC
	ENDM



;-----------------------------------------------------------------------------
s_goto_obj		MACRO	obj1,obj2,Xoff,Yoff,Zoff,max dist,min dist,max speed,#accel,#angle chase rate,#skid,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	8,9
	CHK_OBJ	\1
	CHK_OBJ	\2


	s_obj2obj_angle		\1,\2,al_roty,\7
	IFEQ	\8
	s_gen_vecs		\1,al_roty,al_vel
	ELSEIF
	s_Achase_alvar2alvar	B,\1,al_skidy,\1,al_roty,\8
	s_gen_vecs		\1,al_skidy,al_vel
	ENDC
	s_add_vecs2pos		\1

	s_jmp_distless		\1,\2,\4,.sfo\@
	s_jmp_distmore		\1,\2,\3,.st\@
	
	s_speedto		\1,\5,\6
	bra	.esfo\@
.sfo\@
	s_jmp_alvarmore		B,\1,al_vel,#4,.st\@
	s_set_speed		\1,#0
	s_zero_vecs		\1
	IFEQ	NARG-9
	gjmp			\9
	ENDC
.st\@
	s_speedto		\1,#0,1

.esfo\@
	
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_kill_obj		MACRO	   obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
  
	s_set_alsflag	\1,colldisable
	lda	#0
	s_sta.w	al_HP,\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_setnoremove_behind		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	s_clr_altype	\1,zremove	

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_setremove_behind		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	s_set_altype	\1,zremove	

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_remove_obj		MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	IFEQ	objxy
	jsl	sr_remove_objx
	ELSEIF
	jsl	sr_remove_objy
	ENDC

	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_remove_offscn	MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
  
	s_set_altype	\1,zremove	
	test_alflag	\1,inviewpl
	rlbne		.nro\@
    	s_remove_obj	\1
.nro\@
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_remove_fire	MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	EXG_IFY	\1
	phy
	a16
	lda.l			alx_fireobjptr,x
	beq	.bf\@
	tay
	lda	#0
	sta.l		alx_fireobjptr,x
	a8
	s_clr_alflag		x,onfire
	exg_xy
	jsl	removedeadal_l
	exg_xy
.bf\@
	a8
	ply
	EXG_IFY	\1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_doremove_obj		MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1



	cp\1	al1pt
	bne	.nar\@
	inc	aldead
	bra	.er\@
.nar\@

	EXG_IFY	\1
	jsl	removedeadal_l
	EXG_IFY	\1

.er\@
     	stratmac_end
	ENDM
	
;-----------------------------------------------------------------------------
s_circle_obj		MACRO	obj1,obj2,#distance,speed,#skid - USES SBYTE2
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2


	ifeq	1
	s_obj2obj_angle	\1,\2,al_roty,2
	s_set_var	B,smvar_byte1,#0
	s_jmp_distmore	\1,\2,#\3,.ndm\@
	s_set_var	B,smvar_byte1,#deg90
.ndm\@

	s_speedto	\1,\4,1

	IFEQ	\5
	s_add_alvar	B,\1,al_roty,smvar_byte1
	s_gen_vecs	\1,al_roty,al_vel
	s_sub_alvar	B,\1,al_roty,smvar_byte1
	ELSEIF
	s_add_alvar	B,\1,al_skidy,smvar_byte1
	s_gen_vecs	\1,al_skidy,al_vel
	s_sub_alvar	B,\1,al_skidy,smvar_byte1
	s_Achase_alvar2alvar	B,\1,al_skidy,\1,al_roty,\5
	ENDC

	s_add_vecs2pos	\1
	endc





	s_lda.w	al_roty,\2
	pha
	s_lda.w	al_sbyte2,\1
	s_sta.w	al_roty,\2
	s_set_WP		\1,\2,1,#0,#0,#\3
	pla
	s_sta.w	al_roty,\2


	s_goto_WP	\1,\1,1,\4,1,3,\5,#0,.nc\@
	s_jmp		.ec\@
.nc\@	s_add_alvar	B,\1,al_sbyte2,#deg90/4
.ec\@
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------

	ifeq	1
	s_jmp_IFstate		\1,0,.nextwp\@


	s_goto_WP		\1,\1,1,\4,1,2,\5,.nextwp\@

	s_jmp			.eco\@

.nextwp\@
	s_next_state		\1,#4


	s_jmp_IFNOTstate	\1,1,.ns0\@		; LEFT TOP
	s_set_var		W,smvar_word1,#-\3			
	s_set_var		W,smvar_word2,#\3	
	s_jmp			.ds\@
.ns0\@
	s_jmp_IFNOTstate	\1,2,.ns1\@		; RIGHT TOP
	s_set_var		W,smvar_word1,#\3			
	s_set_var		W,smvar_word2,#\3	
	s_jmp			.ds\@
.ns1\@
	s_jmp_IFNOTstate	\1,3,.ns2\@		; RIGHT BOTTOM
	s_set_var		W,smvar_word1,#\3			
	s_set_var		W,smvar_word2,#-\3	
	s_jmp			.ds\@
.ns2\@
	s_jmp_IFNOTstate	\1,4,.ns3\@		; LEFT BOTTOM
	s_set_var		W,smvar_word1,#-\3			
	s_set_var		W,smvar_word2,#-\3	
.ns3\@
	
.ds\@	
	s_lda.w	al_roty,\2
	lda	#0
	s_sta.w	al_roty,\2
	pha
	s_set_WP		\1,\2,1,smvar_word1,#0,smvar_word2	; TOP LEFT	
	pla
	s_sta.w	al_roty,\2

.eco\@
	endc

;-----------------------------------------------------------------------------
s_turnto_obj		MACRO	[obj1],[obj2],[yoffset],[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
	s_obj2obj_angleOFF	{obj1},{obj2},al_roty,{yoffset},3,{label}
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_speed		MACRO	obj1,speed
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	lda	\2
	s_sta.w	al_vel,\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_add_speed		MACRO	obj1,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	lda	al_vel,\1
	clc
	adc	\2
	sta	al_vel,\1

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_sub_speed		MACRO	obj1,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	lda	al_vel,\1
	sec
	sbc	\2
	sta	al_vel,\1
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_speedto		MACRO   obj1,speed,#acceleration,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ	\1
	
	IFEQ	objxy
	lda	\2
	sta	tpa
	lda	#\3
	jsl	sr_speedto

	IFEQ	NARG-4
	rlbcs	\4
	ENDC

	ELSEIF
	error	<Sorry can't use Y>
	ENDC

	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_iflevel		MACRO	#level(1-3),.label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	
	s_jmp_varEQ	B,currentlevel,#\1-1,\2

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_ifnotlevel		MACRO	#level(1-3),.label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	
	s_jmp_varNE	B,currentlevel,#\1-1,\2

	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmpto_strat	MACRO		
	stratmac_start
;	lda	al_stratptr+2,x
;	beq	.ejs\@
;	pha
;	a16
;	lda	al_stratptr,x
;	dec	a
;	pha
;	a8
;	rtl
;.ejs\@
;	rtl		; S_END_STRAT

	jml		jmptostratx_jml

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpto_tempstrat	MACRO		
	stratmac_start
	lda.l	alx_tempstratptr+2,x
	beq	.ejs\@
	pha
	a16
	lda.l	alx_tempstratptr,x
	dec	a
	pha
	a8
	rtl
.ejs\@
	s_end_strat
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_do_strat	MACRO		obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	
	phy
	phx
	EXG_IFY	\1

	lda	#(.ejs\@>>16)&255
	pha
	a16
	lda	#(.ejs\@-1)&WM
	pha

	a8
	s_lda.w	al_stratptr+2,\1
	pha
	a16
	s_lda.w	al_stratptr,\1
	dec	a
	pha
	a8
	rtl
.ejs\@
	plx
	ply

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpto_collstrat	MACRO		x
	stratmac_start
	lda.l	alx_collstratptr+2,x
	beq	.ejs\@
	pha
	a16
	lda.l	alx_collstratptr,x
	dec	a
	pha
	a8
	rtl
.ejs\@
	s_end_strat
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpto_expstrat	MACRO		x
	stratmac_start
	lda.l	alx_expstratptr+2,x
	beq	.ejs\@
	pha
	a16
	lda.l	alx_expstratptr,x
	dec	a
	pha
	a8
	rtl
.ejs\@
	s_end_strat
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_objlower		MACRO	obj1,obj2,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_worldy,\1
	cmp.w	al_worldy,\2
	mca8
	rlbpl	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_objhigher		MACRO	obj1,obj2,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_worldy,\1
	cmp.w	al_worldy,\2
	mca8
	rlbmi	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_higher		MACRO	obj1,height,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	mca16
	s_lda.w	al_worldy,\1
	cmp	\2
	mca8
	rlbmi	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_higheralvar		MACRO	obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	mca16
	s_lda.w	al_worldy,\1
	cmp	\2,\1
	mca8
	rlbmi	\3
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_lower		MACRO	obj1,height,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	mca16
	s_lda.w	al_worldy,\1
	cmp	\2
	mca8
	rlbpl	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_loweralvar		MACRO	obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	mca16
	s_lda.w	al_worldy,\1
	cmp	\2,\1
	mca8
	rlbpl	\3
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_dist		MACRO	obj1,obj2,XorYorZ
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\2

	mca16
	s_lda.w	al_world\3,\1
	sec
	sbc.w	al_world\3,\2
	bpl	.ndn\@
	nega
.ndn\@	sta	svar_dist
	mca8
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_Hdistmore		MACRO	obj1,obj2,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_worldy,\1
	sec
	sbc.w	al_worldy,\2
	bpl	.hdm\@
	nega
.hdm\@	cmp	\3 
	mca8	
	rlbcs	\4
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_Hdistless		MACRO	obj1,obj2,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_worldy,\1
	sec
	sbc.w	al_worldy,\2
	bpl	.hdl\@
	nega
.hdl\@	cmp	\3	
	mca8	
	rlbcc	\4
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_XYdistmore	MACRO	obj1,obj2,dist,label	16bit distance
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
;	a16
;	lda	svar_dist
;	bne	.got_distm\@
	jsl	xydiffs_l
	a16
	lda	rangexy
;	sta	svar_dist
;.got_distm\@
	cmp	\3
	a8
	rlbpl	\4
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_XYdistless	MACRO	obj1,obj2,dist,label	16bit distance
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
;	a16
;	lda	svar_dist
;	bne	.got_distl\@
	jsl	xydiffs_l
	a16
	lda	rangexy
;	sta	svar_dist
;.got_distl\@
	cmp	\3
	a8
	rlbmi	\4
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_outXYdistrng	MACRO	obj1,obj2,min dist,max dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
	jsl	xydiffs_l
	a16
	lda	rangexy

	cmp	\3
	bmi	.out\@
	cmp	\4
	bmi	.in\@

.out\@	a8
	s_jmp	\5
.in\@
	a8
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_inXYdistrng	MACRO	obj1,obj2,min dist,max dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
	jsl	xydiffs_l
	a16
	lda	rangexy

	cmp	\4
	bpl	.out\@
	cmp	\3
	bpl	.out\@

.in\@	a8
	s_jmp	\5
.out\@
	a8
	stratmac_end
	ENDM	  	
	  	
	

;-----------------------------------------------------------------------------
s_jmp_distmore		MACRO	obj1,obj2,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
;	lda	svar_dist
;	bne	.\@
	jsl	xzdiffs_l
	a16
	lda	rangexz
;	sta	svar_dist
.\@
	cmp	\3
	a8
	rlbpl	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_distless		MACRO	obj1,obj2,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
;	lda	svar_dist
;	bne	.\@
	jsl	xzdiffs_l
	a16
	lda	rangexz
;	sta	svar_dist
.\@
	cmp	\3
	a8
	rlbmi	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
jmp_outdistrng		MACRO	obj1,obj2,min dist,max dist,label,x/y/z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	6
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_world\6,y
	sec
	sbc	al_world\6,x
	bpl	.nnd\@
	nega
.nnd\@	
;	sta	svar_dist
	cmp	\3
	bmi	.\@
	cmp	\4
	bmi	.c\@
.\@
	mca8
	s_jmp	\5
.c\@
	mca8
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_outXdistrng		MACRO	obj1,obj2,min dist,max dist,label
	stratmac_start
	jmp_outdistrng		\1,\2,\3,\4,\5,x
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_outYdistrng		MACRO	obj1,obj2,min dist,max dist,label
	stratmac_start
	jmp_outdistrng		\1,\2,\3,\4,\5,y
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_outZdistrng		MACRO	obj1,obj2,min dist,max dist,label
	stratmac_start
	jmp_outdistrng		\1,\2,\3,\4,\5,z
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
jmp_distmore		MACRO	obj1,obj2,dist,label,x/y/z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_world\5,y
	sec
	sbc	al_world\5,x
	bpl	.nnd\@
	nega
.nnd\@	
;	sta	svar_dist
	cmp	\3
	mca8
	rlbpl	\4
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_Xdistmore		MACRO	obj1,obj2,dist,label
	stratmac_start
	jmp_distmore		\1,\2,\3,\4,x
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_Ydistmore		MACRO	obj1,obj2,dist,label
	stratmac_start
	jmp_distmore		\1,\2,\3,\4,y
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_Zdistmore		MACRO	obj1,obj2,dist,label
	stratmac_start
	jmp_distmore		\1,\2,\3,\4,z
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
jmp_distless		MACRO	obj1,obj2,dist,label,x/y/z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16
	s_lda.w	al_world\5,y
	sec
	sbc	al_world\5,x
	bpl	.nnd\@
	nega
.nnd\@	
;	sta	svar_dist
	cmp	\3
	mca8
	rlbmi	\4
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_Xdistless		MACRO	obj1,obj2,dist,label
	stratmac_start
	jmp_distless		\1,\2,\3,\4,x
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_Ydistless		MACRO	obj1,obj2,dist,label
	stratmac_start
	jmp_distless		\1,\2,\3,\4,y
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_Zdistless		MACRO	obj1,obj2,dist,label
	stratmac_start
	jmp_distless		\1,\2,\3,\4,z
		stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_jmp_objinfront	MACRO	obj1,obj2,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
	s_lda.w	al_worldz,\1
	cmp.w	al_worldz,\2
	a8
	rlbpl	\3

	stratmac_end
	ENDM




;-----------------------------------------------------------------------------
s_jmp_WPdistmore		MACRO	obj1,obj2,obj2 #WP,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16

	EXG_IFY	\2
	lda.l	alx_sWPx\3,x
	sta	x2
	lda.l	alx_sWPz\3,x
	sta	z2
	EXG_IFY	\2

	jsl	xzdiffs_abs_l
	a16		   
	lda	rangexz
	cmp	\4
	a8
	rlbpl	\5
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_WPdistless		MACRO	obj1,obj2,obj2 #WP,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16

	EXG_IFY	\2
	lda.l	alx_sWPx\3,x
	sta	x2
	lda.l	alx_sWPz\3,x
	sta	z2
	EXG_IFY	\2

	jsl	xzdiffs_abs_l
	a16
	lda	rangexz
;	sta	svar_dist
	cmp	\4
	a8
	rlbmi	\5
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_HWPmore		MACRO	obj1,obj2,obj2 #WP,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16

	EXG_IFY	\2
	lda.l	alx_sWPy\3,x
	sta	y1
	EXG_IFY	\2
	s_lda.w	al_worldy,\1

	sec
	sbc	y1
	bpl	.hwp\@
	nega
.hwp\@
	cmp	\4
	a8	
	rlbcs	\5
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_HWPless		MACRO	obj1,obj2,obj2 #WP,dist,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	mca16

	EXG_IFY	\2
	lda.l	alx_sWPy\3,x
	sta	y1
	EXG_IFY	\2
	s_lda.w	al_worldy,\1

	sec
	sbc	y1
	bpl	.hwp\@
	nega
.hwp\@
	cmp	\4
	mca8	
	rlbcc	\5
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_scale_vecs		MACRO	obj,#scale shift value.
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	mca16
	lda.\0	al_vx,\1
	rept	\2
	asl	a
	endr
	sta.\0	al_vx,\1

	lda.\0	al_vy,\1
	rept	\2
	asl	a
	endr
	sta.\0	al_vy,\1

	lda.\0	al_vz,\1
	rept	\2
	asl	a
	endr
	sta.\0	al_vz,\1

	mca8
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_scale_vec		MACRO	obj,vec,#scale shift value.
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1

	mca16
	lda.\0	al_v\2,\1
	rept	\3
	asl	a
	endr
	sta.\0	al_v\2,\1
	mca8
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_gen_Zvec		MACRO	obj1,alvel,[#scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3
	CHK_OBJ	\1

	lda.\0	\2,\1
	a16
	sexa

	IFEQ	NARG-3
	REPT	\3
	asl	a
	ENDR
	ENDC

	sta.\0	al_vz,\1
	a8
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_gen_vecs		MACRO	obj1,alvar,al_vel,[#scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ	\1

	lda.\0	\3,\1
	sta	tmpz
	lda.\0	\2,\1
	jsl	nvecs_l	; generate x,z vels from Y rot and speed.
	a16
	lda	x1
	IFEQ	NARG-4
	REPT	\4
	asl	a
	ENDR
	ENDC
	sta.\0	al_vx,\1
	lda	z1
	IFEQ	NARG-4
	REPT	\4
	asl	a
	ENDR
	ENDC
	sta.\0	al_vz,\1
	a8
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_gen_flatvecs		MACRO	obj1,alvar,al_vel,[#scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ	\1

	lda.\0	\3,\1
	sta	tmpz
	lda.\0	\2,\1
	jsl	nvecs_l	; generate x,y vels from rot and speed.
	a16
	lda	x1
	IFEQ	NARG-4
	REPT	\4
	asl	a
	ENDR
	ENDC
	sta.\0	al_vx,\1
	lda	z1
	IFEQ	NARG-4
	REPT	\4
	asl	a
	ENDR
	ENDC
	sta.\0	al_vy,\1
	a8
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_addgen_vecs		MACRO	obj1,alvar,al_vel,[#scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ	\1

	lda	\3,\1
	sta	tmpz
	lda	\2,\1
	jsl	nvecs_l	; generate x,z vels from Y rot and speed.
	a16

	lda	x1
	IFEQ	NARG-4
	REPT	\4
	asl	a
	ENDR
	ENDC
	clc
	adc.\0	al_vx,\1
	sta.\0	al_vx,\1

	lda	z1
	IFEQ	NARG-4
	REPT	\4
	asl	a
	ENDR
	ENDC
	clc
	adc.\0	al_vz,\1
	sta.\0	al_vz,\1

	a8
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_addgen_3Dvecs		MACRO	obj1,alroty,alrotx,alvel,[#scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHK_OBJ	\1


	lda	\4,\1
	sta	tmpz
	lda	\2,\1
	sta	troty
	lda	\3,\1
	sta	trotx
	jsl	n3Dvecs_l		; generate x,y,z vels from x,y rot and speed.
	a16

	lda	x1
	IFEQ	NARG-5
	REPT	\5
	asl	a
	ENDR
	ENDC
	clc
	adc.\0	al_vx,\1
	sta.\0	al_vx,\1

	lda	y1
	IFEQ	NARG-5
	REPT	\5
	asl	a
	ENDR
	ENDC
	clc
	adc.\0	al_vy,\1
	sta.\0	al_vy,\1

	lda	z1
	IFEQ	NARG-5
	REPT	\5
	asl	a
	ENDR
	ENDC
	clc
	adc.\0	al_vz,\1
	sta.\0	al_vz,\1

	a8
    
	stratmac_end
	ENDM

	ifeq	1
;-----------------------------------------------------------------------------
fiftyeightnops	macro
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	stratmac_end
	ENDM
	endc


;-----------------------------------------------------------------------------
s_gen_3Dvecs		MACRO	obj1,alroty,alrotx,al_vel,[#scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHK_OBJ	\1

	IFNE	objxy
	error	<Sorry X only obj>
	ENDC


	lda	\4,x
	sta	tmpz
	lda	\2,x
	sta	troty
	lda	\3,x
	sta	trotx
	
	IFNE	NARG-5
	jsl	sr_gen_3dvecs
	ELSEIF
	jsl	sr_gen_3dvecs\5
	ENDC

	stratmac_end
	ENDM
	
;-----------------------------------------------------------------------------
s_add_viewheight	MACRO	y,x
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	a16

	EXG_IFY	\1

	lda	al_worldy,x
	phx
	ldx	al_shape,y
	clc
	adc	sh_view_y,x
	plx
	sta	al_worldy,x

	EXG_IFY	\1

	a8
	   	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_sub_viewheight	MACRO	y,x
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	a16

	EXG_IFY	\1

	lda	al_worldy,x
	phx
	ldx	al_shape,y
	clc
	adc	sh_view_y,x
	plx
	sta	al_worldy,x

	EXG_IFY	\1

	a8
	   	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_add_cheight	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	EXG_IFY	\1
	sty	tpy
	a16
	ldy	al_shape,x
	lda	al_worldy,x
	clc
	adc.w	sh_height,y
	sta	al_worldy,x
	a8
	ldy	tpy
	EXG_IFY	\1
	   	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_sub_cheight	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	EXG_IFY	\1
	sty	tpy
	a16
	ldy	al_shape,x
	lda	al_worldy,x
	sec
	sbc.w	sh_height,y
	sta	al_worldy,x
	a8
	ldy	tpy
	EXG_IFY	\1
	   	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_copy_vheight2var	MACRO	obj1,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	EXG_IFY	\1
	sty	tpy
	a16
	ldy	al_shape,x
	s_lda.w	sh_view_y,y
	sta	\2
	a8
	ldy	tpy
	EXG_IFY	\1
	   	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_add_2pos		MACRO	obj1,x,y,z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1

	a16
	s_lda.w	al_worldx,\1
	clc
	adc	\2
	s_sta.w	al_worldx,\1
	s_lda.w	al_worldy,\1
	clc
	adc	\3
	s_sta.w	al_worldy,\1
	s_lda.w	al_worldz,\1
	clc
	adc	\4
	s_sta.w	al_worldz,\1
	a8
	
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_add_vecs2vecs		MACRO	obj2,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	CHK_OBJ	\2

	EXG_IFY	\1
	jsl	add_objvecs_l
	EXG_IFY	\1
   
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_add_vecs2pos		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	EXG_IFY	\1
	jsl	addalvecs_l
	EXG_IFY	\1

	
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_pos		MACRO	obj1,x,y,z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	a16
	lda	\2
	s_sta.w	al_worldx,\1
	lda	\3
	s_sta.w	al_worldy,\1
	lda	\4
	s_sta.w	al_worldz,\1
	a8
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_vecs		MACRO	obj1,x,y,z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	a16
	lda	\2
	sta.\0	al_vx,\1
	lda	\3
	sta.\0	al_vy,\1
	lda	\4
	sta.\0	al_vz,\1
	a8
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_vec		MACRO	obj1,X or Y or Z,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1

	a16
	lda	\3
	sta.\0	al_v\2,\1
	a8
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_add_2Yvec		MACRO	obj1,value (WORD)
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2

	a16
	lda.\0	al_vy,\1
	clc
	adc	\2
	sta.\0	al_vy,\1
	a8
	stratmac_end
	ENDM




;-----------------------------------------------------------------------------
s_add_Roffs2pos		MACRO	size,TO obj,POS obj,ROT obj,x,y,z,0/1,0/1,0/1 (x,y,z)rot on,[X #scale,Y #scale,Z #scale] 
	stratmac_start

MYNARG	=	NARG
	CHK_NARG  10,13	
	CHK_OBJ	\2
	CHK_OBJ	\3
	CHK_OBJ	\4


	IFC	"\1","B"

	lda	\5
	sta	x1
	sta	x2
	sexam	x2+1
	lda	\6
	sta	y1
	sta	y2
	sexam	y2+1
	lda	\7
	sta	z1
	sta	z2
	sexam	z2+1


	IFNE	\A
	s_lda.w	al_rotz,\4
	jsl	rotate_8yx_l
	lda	x2
	sta	x1
	lda	y2
	sta	y1
	lda	z2
	sta	z1
	ENDC

	IFNE	\8
	s_lda.w	al_rotx,\4
	jsl	rotate_8yz_l
	lda	x2
	sta	x1
	lda	y2
	sta	y1
	lda	z2
	sta	z1
	ENDC

	IFNE	\9
	s_lda.w	al_roty,\4
	jsl	rotate_8xz_l
	ENDC      




	a16		 

	IFEQ	NARG-$D

	IFNE	\B
	lda	x2
	REPT	\B
	asl	a
	ENDR
	sta	x2
	ENDC

	IFNE	\C
	lda	y2
	REPT	\C
	asl	a
	ENDR
	sta	y2
	ENDC

	IFNE	\D
	lda	z2
	REPT	\D
	asl	a
	ENDR
	sta	z2
	ENDC

	ENDC

	s_lda.w	al_worldx,\3
	clc
	adc	x2
	s_sta.w	al_worldx,\2
	s_lda.w	al_worldz,\3
	clc
	adc	z2
	s_sta.w	al_worldz,\2
	s_lda.w	al_worldy,\3
	clc
	adc	y2
	s_sta.w	al_worldy,\2
	a8

	ENDC


	IFC	"\1","W"
	error	<I'm sorry WORD usage doesn't work here,>
	error	<use BYTE and SHIFT to get bigger values.>
	error	<Thankyou for your co-operation, Goodnight !>
	ENDC

	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_keeprelto_player	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	jsl	sr_keeprelto_player\1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_add_playerZ	MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	jsl	sr_addplayerZ\1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_sub_playerZ	MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	s_sub_alvar		W,\1,al_worldz,pviewvelz

	stratmac_end
	ENDM

;-------------

;-----------------------------------------------------------------------------
s_copy_pos		MACRO	obj2,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	CHK_OBJ	\2
	jsl	sr_copypos\1\2
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_copy_pos2WP		MACRO		obj2,#WP,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\3

	EXG_IFY	\1
	a16
	s_lda.w	al_worldx,\3
	sta.l	alx_sWPx\2,\1
	s_lda.w	al_worldy,\3
	sta.l	alx_sWPy\2,\1
	s_lda.w	al_worldz,\3
	sta.l	alx_sWPz\2,\1
	a8
	EXG_IFY	\1
	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_copy_vecs		MACRO	obj2,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
	s_lda.w	al_vx,\2
	s_sta.w	al_vx,\1	
	s_lda.w	al_vy,\2
	s_sta.w	al_vy,\1	
	s_lda.w	al_vz,\2
	s_sta.w	al_vz,\1	
	a8
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_copy_rots		MACRO	obj2,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	CHK_OBJ	\2

	jsl	sr_copyrots\1\2
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_objrel_vecs		MACRO	obj1,obj2,x,z offset.
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_objrel_3vecs		MACRO	obj1,obj2,x,y,z offset.
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_carry_obj		MACRO	obj1,obj2,x,y,z offset
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16
	s_lda.w	al_worldx,\1
	clc
	adc	\3
	s_sta.w	al_worldx,\2

	s_lda.w	al_worldy,\1
	clc
	adc	\4
	s_sta.w	al_worldy,\2

	s_lda.w	al_worldz,\1
	clc
	adc	\5
	s_sta.w	al_worldz,\2
	a8
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_alvar		MACRO	size,obj1,alvar,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1

;	IFNC	"\4","#0"
	lda	\4

	IFC	"\2","y"
	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC
	s_sta.w	\3,\2
	ELSEIF
	sta.\0	\3,\2
	ENDC
	
;	ELSEIF

;	IFNC	"\0","L"
;
;	IFC	"\2","x"
;	stz	\3,\2
;	ENDC
;	IFC	"\2","X"
;	stz	\3,\2
;	ENDC
;	
;	ELSEIF
;
;	lda	#0
;	sta.\0	\3,\2
;	ENDC

;	ENDC
	
	


	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_alvar2rnd		MACRO	obj1,alvar,[AND value] - BYTE ONLY
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3
	CHK_OBJ	\1
	jsl	random_l

	IFEQ	NARG-3
	and	\3
	ENDC

	IFC	"\1","y"
	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC
	s_sta.w	\2,\1
	ELSEIF
	sta.\0	\2,\1
	ENDC
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_add_rnd2alvar		MACRO	obj1,alvar,[AND value] - BYTE ONLY
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3
	CHK_OBJ	\1
	jsl	random_l

	IFEQ	NARG-3
	and	\3
	ENDC

	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC

	clc
	adc.w	\2,\1
	s_sta.w	\2,\1
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_add_rnd2var		MACRO	var,[AND value] - BYTE ONLY
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1,2
	jsl	random_l

	IFEQ	NARG-2
	and	\2
	ENDC

	clc
	adc.w	\1
	sta	\1
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_add_alvar		MACRO	size,obj1,alvar,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1

	IFC	"\2","y"
	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC
	s_lda.w	\3,\2
	ELSEIF
	lda	\3,\2
	ENDC

	clc
	adc	\4
	IFC	"\2","y"
	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC
	s_sta.w	\3,\2
	ELSEIF
	sta	\3,\2
	ENDC

	CHG_MODEBACK	\1

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_sub_alvar		MACRO	size,obj1,alvar,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1

	IFC	"\2","y"
	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC
	s_lda.w	\3,\2
	ELSEIF
	lda.\0	\3,\2
	ENDC

	sec
	sbc	\4
	IFC	"\2","y"
	IFC	"\0","L"
	error	<Sorry Can't do .l with Y>
	ENDC
	s_sta.w	\3,\2
	ELSEIF
	sta.\0	\3,\2
	ENDC
;	sta.\0	\3,\2
	CHG_MODEBACK	\1

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_varsub_alvar		MACRO	size,obj1,var,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1
	lda		\3
	sec		
	sbc		\4,\2
	sta		\3
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_varadd_alvar		MACRO	size,obj1,var,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1
	lda		\3
	clc		
	adc.\0		\4,\2
	sta		\3
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_dec_alvar		MACRO	size,obj1,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\2
	CHG_MODE	\1
	EXG_IFY	\2
	dec	\3,x
	EXG_IFY	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_inc_alvar		MACRO	size,obj1,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\2
	CHG_MODE	\1
	EXG_IFY	\2
	inc	\3,x
	EXG_IFY	\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_neg_alvar		MACRO	size,obj1,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\2
	CHG_MODE	\1
	s_lda.w		\3,\2
	nega
	s_sta.w		\3,\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_scale_alvar		MACRO	size,obj1,var,scale
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2
	CHG_MODE	\1
	s_lda.w		\3,\2

	IFGT	\4
	REPT	\4
	asl	a 
	ENDR	  
	ELSEIF
	REPT	0-\4
	asra 
	ENDR	  
	ENDC
	
	s_sta.w		\3,\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_scale_var		MACRO	size,var,scale
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda		\2

	IFGT	\3
	REPT	\3
	asl	a 
	ENDR	  
	ELSEIF
	REPT	0-\3
	asra 
	ENDR	  
	ENDC
	
	sta		\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_get_obj2objdist	MACRO	obj1,obj2
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1	 
	CHK_OBJ	\2
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_damagesmoke		MACRO	obj1,smoke HP,#smoke rate(0-8),[x,y,z BYTES,scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,7
	CHK_OBJ	\1

     	s_jmp_alvarlesseq	B,\1,al_HP,\2,.\@
	s_jmp			.nf\@
.\@
	EXG_IFY	\1
	s_set_alflag		x,onfire
	s_jmp_notANDframe	#(1<<\3)-1,.nf2\@
	s_jsl			makesmoke_srou_l

	IFEQ	NARG-7
	s_chk_objptr	y,.nf2\@
	IFNE	\7
	s_add_Roffs2pos	B,y,x,x,\4,\5,\6,1,1,1,\7,\7,\7
	ELSEIF
	s_add_Roffs2pos	B,y,x,x,\4,\5,\6,1,1,1
	ENDC
	ENDC	
.nf2\@
	EXG_IFY	\1

.nf\@
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_damagefire		MACRO	obj1,smoke HC,#smoke rate(0-8) or ABS (9-255),[x,y,z BYTES,scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,7
	CHK_OBJ	\1

     	s_jmp_alvarlesseq	B,\1,al_HP,\2,.dofire\@
	s_jmp			nofire\@
.dofire\@
	EXG_IFY	\1
	s_jmp_onfire	x,nofire2\@

	IFGT	\3-8
	lda	#\3
	ELSEIF
	lda	#1<<\3
	ENDC
	sta	smvar_byte1
	s_jsl		makefire_srou_l
 
	IFEQ	NARG-7
	s_chk_objptr	y,nofire2\@
	IFNE	\7
	s_add_Roffs2pos	B,y,x,x,\4,\5,\6,1,1,1,\7,\7,\7
	ELSEIF
	s_add_Roffs2pos	B,y,x,x,\4,\5,\6,1,1,1
	ENDC
	ENDC	
nofire2\@
	EXG_IFY	\1
nofire\@
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_make_smoke	MACRO	[delay,label]
	
	IFEQ	NARG-2
	s_jmp_notdelay		\1,\2,al1pt
	ENDC
	jsl			makesmoke_srou_l
	ENDM


;-----------------------------------------------------------------------------
s_make_splash		MACRO	obj,[size(S)]
MYNARG	=	NARG
	CHK_NARG	1,2
	CHK_OBJ	\1
	EXG_IFY	\1
	
	IFEQ	NARG-2
	jsl	make\2splash_srou_l
	ELSEIF
	jsl	makesplash_srou_l
	ENDC

	s_chk_objptr	y,.badobj\@
	s_set_alvar	W,y,al_worldy,#0
.badobj\@

	EXG_IFY	\1
	ENDM


			
;-----------------------------------------------------------------------------
s_collpos_save	MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	
	a16
	s_lda.w	al_worldx,\1
	sta.l	svar_collx
	s_lda.w	al_worldy,\1
	sta.l	svar_colly
	s_lda.w	al_worldz,\1
	sta.l	svar_collz
	a8

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_chkcoll		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	ERROR <DONT DO THIS MACRO.>
	stratmac_end
	ENDM

			
;-----------------------------------------------------------------------------
s_limit_alvar		MACRO	size,obj1,alvar,#-ve value,#+ve value,[label]
	stratmac_start

MYNARG	=	NARG
	CHK_NARG	5,6
	CHG_MODE	\1
	lda.\0	\3,\2

	IFEQ	NARG-6
	Fjmp_outrange	\4,\5,.o\@
	bra	.i\@
.o\@	sta.\0	\3,\2
	CHG_MODEBACK	\1
	gjmp	\6
.i\@
	ELSEIF
	range	\4,\5
	sta.\0	\3,\2
	ENDC
	CHG_MODEBACK	\1
	  	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_limit_var		MACRO	size,var,#-ve value,#+ve value,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHG_MODE	\1
	lda	\2

	IFEQ	NARG-5
	Fjmp_outrange	\3,\4,.orng\@
	bra	.i\@
.o\@	sta	\2
	CHG_MODEBACK	\1
	gjmp	\5
.i\@
	ELSEIF
	range	\3,\4
	sta	\2
	ENDC
	CHG_MODEBACK	\1
	  	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_vartobeobj	MACRO	var,obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\2

	st\2	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_alvartobeobj	MACRO	obj2,obj2 alvar,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\3
	st\3	\2,\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_objtobealvar	MACRO	obj2,obj1,obj1 alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\2
	ld\1	\3,\2
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_objtobevar	MACRO	obj2,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	ld\1	\2
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_copy_sflags		MACRO	obj2,obj1		
	s_lda.w	al_sflags,\2
	s_sta.w	al_sflags,\1
	s_lda.w	al_sflags2,\2
	s_sta.w	al_sflags2,\1
	s_lda.w	al_sflags3,\2
	s_sta.w	al_sflags3,\1
	s_lda.w	al_sflags4,\2
	s_sta.w	al_sflags4,\1
		ENDM
;-----------------------------------------------------------------------------
s_copy_obj		MACRO	obj2,obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	CHK_OBJ	\2
	t\2\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_copy_var2var		MACRO	size,var,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\3
	sta	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_copy_var2alvar	MACRO	size,obj1,alvar,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	lda	\4
	s_sta.w	\3,\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_copy_var2alxvar	MACRO	size,obj1,alxvar,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	EXG_IFY	\2
	lda	\4
	sta.l	\3,\2
	EXG_IFY	\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_Achase_alvar		MACRO	size,obj1,alvar,value,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHK_OBJ	\2

	stratmac_par	\4

	CHG_MODE	\1
	

	s_lda.w	\3,\2
	sta	tpx
	lda	\4

	IFEQ	LONGA
	jsl   	sr8_achase_alvar\5
	ELSEIF
	jsl   	sr16_achase_alvar\5
	ENDC


	s_sta.w	\3,\2
	CHG_MODEBACK	\1
	IFEQ	NARG-6
	rlbcs	\6
	ENDC



	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_Achase_2alvars	MACRO	size,obj1,alvar1,value1,#chase rate,alvar2,value2,#chase rate,[label]
	stratmac_start

MYNARG	=	NARG
	CHK_NARG	8,9
	CHK_OBJ	\2

	CHG_MODE	\1

	stz	smvar_word1

;-------------------------------------------------
	lda	\4

	IFEQ	NARG-9
	Achase_alvar2a	\2,\3,\5,.d\@
	s_jmp		.f\@
.d\@	inc		smvar_word1
	ELSEIF
	Achase_alvar2a	\2,\3,\5
	ENDC
.f\@


;-------------------------------------------------
	lda	\7

	IFEQ	NARG-9
	Achase_alvar2a	\2,\6,\8,.dj2\@
	s_jmp		.fc2\@
.dj2\@	inc		smvar_word1
	ELSEIF
	Achase_alvar2a	\2,\6,\8
	ENDC
.fc2\@
	CHG_MODEBACK	\1

	IFEQ	NARG-9
	lda		smvar_word1
	cmp		#2
	rlbeq		\9
	ENDC

	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_Achase_var2alvar	MACRO	size,obj1,var,alvar,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHK_OBj		\2

	CHG_MODE	\1
	lda	\4,\2

  	IFEQ	NARG-6
	Achase_var2A	\3,\5,.l1\@
	bra	.l2\@	
.l1\@	CHG_MODEBACK	\1
	gjmp	\6
	ELSEIF
	Achase_var2A	\3,\5
	ENDC

.l2\@	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_Achase_alvar2alvar	MACRO	size,obj1,alvar,obj2,alvar,#chase rate,[label]
	stratmac_start

MYNARG	=	NARG
	CHK_NARG	6,7
	CHK_OBJ	\2
	CHK_OBJ	\4

	CHG_MODE	\1
	

	s_lda.w	\3,\2
	sta	tpx
	s_lda.w	\5,\4

	IFEQ	LONGA
	jsl   	sr8_achase_alvar\6
	ELSEIF
	jsl   	sr16_achase_alvar\6
	ENDC

	s_sta.w	\3,\2
	CHG_MODEBACK	\1

	IFEQ	NARG-7
	rlbcs	\7
	ENDC

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_Achase_var		MACRO	size,var,value,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5

	CHG_MODE	\1
	lda	\3

  	IFEQ	NARG-5
	Achase_var2A	\2,\4,.l1\@
	bra	.l2\@	
.l1\@	CHG_MODEBACK	\1
	gjmp	\5
	ELSEIF
	Achase_var2A	\2,\4
	ENDC

.l2\@	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_Fchase_var 	MACRO	size,var,value,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHG_MODE	\1

	lda.\0	\2
	cmp	\3
	IFEQ	NARG-5
	CHG_MODEBACK	\1
	rlbeq	\5
	CHG_MODE	\1
	ENDC
	Fchase_A	#\4

	sta.\0	\2

	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_Fchase_alvar 	MACRO	size,obj1,alvar,value,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHG_MODE	\1

	lda	\3,\2
	cmp	\4
	IFEQ	NARG-6
	CHG_MODEBACK	\1
	rlbeq	\6
	CHG_MODE	\1
	ENDC
	Fchase_A	#\5

	sta	\3,\2

	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_Fchase_alxvar 	MACRO	size,obj1,alvar,value,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHG_MODE	\1

	lda.l	\3,\2
	cmp	\4
	IFEQ	NARG-6
	CHG_MODEBACK	\1
	rlbeq	\6
	CHG_MODE	\1
	ENDC
	Fchase_A	#\5

	sta.l	\3,\2

	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_Fchase_alvar2alvar 	MACRO	size,obj1,alvar,obj2,alvar,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	6,7
	CHG_MODE	\1

	lda	\3,\2
	cmp.w	\5,\4
	IFEQ	NARG-7
	CHG_MODEBACK	\1
	rlbeq	\7
	CHG_MODE	\1
	ENDC
	Fchase_A	#\6

	sta	\3,\2

	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_Fchase_var2alvar	MACRO	size,obj1,var,alvar,#chase rate,[label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5,6
	CHG_MODE	\1

	lda	\3
	cmp	\4,\2
	IFEQ	NARG-6
	CHG_MODEBACK	\1
	rlbeq	\6
	CHG_MODE	\1
	ENDC
	Fchase_A	#\5

	sta	\3

	CHG_MODEBACK	\1
	stratmac_end
	ENDM
	
;-----------------------------------------------------------------------------
s_copy_alvar2var	MACRO	size,obj1,var,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1
	s_lda	\4,\2
	sta.\0	\3
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_copy_alxvar2var	MACRO	size,obj1,var,alxvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\2

	CHG_MODE	\1
	EXG_IFY	\2
	lda.l	\4,\2
	sta.\0	\3
	EXG_IFY	\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_copy_alvar2alvar	MACRO	size,obj1,alvar,obj2,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\2
	CHG_MODE	\1
	s_lda.w	\5,\4
	s_sta.w	\3,\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_copy_alvar2alxvar	MACRO	size,obj1,alxvar,obj2,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\2
	CHG_MODE	\1
	s_lda.w	\5,\4
	sta.l	\3,\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_find		MACRO		obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1

	IFNE	"0"-"\1"
	CHK_OBJ	\1
	st\1	fobj
	ELSEIF
	a16
	lda	allst
	sta	fobj
	a8
	ENDC
		
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_find_nearobj		MACRO	obj2,obj1,shape,min radius,max radius,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	6
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16

	EXG_IFY	\2
	lda	\4
	sta	tpz
	lda	\5
	sta	tpx

	lda	\3
	jsl	find_nearobject_l
	EXG_IFY	\2

	cpy	#0
	a8
	rlbeq	\6
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_find_radiusobj		MACRO	obj2,obj1,shape,min radius,max radius,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	6
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16

	EXG_IFY	\2
	lda	\4
	sta	tpz
	lda	\5
	sta	tpx

	lda	\3
	jsl	find_radiusobject_l
	EXG_IFY	\2

	cpy	#0
	a8
	rlbeq	\6
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_find_obj		MACRO	obj2,obj1,shape,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1
	CHK_OBJ	\2
	a16

	EXG_IFY	\2
	lda	\3
	jsl	find_object_l
	EXG_IFY	\2

	cpy	#0
	a8
	rlbeq	\4

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_find_Mobj		MACRO	obj2,obj1,shape,ASF_name mask,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ	\1
	CHK_OBJ	\2

	EXG_IFY	\2
	lda	#ASF_\4
	sta	x1
	a16
	lda	\3
	jsl	find_Mobject_l
	EXG_IFY	\2

	cpy	#0
	a8
	rlbeq	\5

		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_push_obj		MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	ph\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_pull_obj		MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	pl\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_push_alvar		MACRO	size,obj1,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ		\2
	
	CHG_MODE	\1
	s_lda.w		\3,\2
	pha
	CHG_MODEBACK	\1

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_pull_alvar		MACRO	size,obj1,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ		\2
	
	CHG_MODE	\1
	pla
	s_sta.w		\3,\2
	CHG_MODEBACK	\1

	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_push_var		MACRO	size,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHG_MODE	\1
	lda		\2
	pha
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_pull_var		MACRO	size,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHG_MODE	\1
	pla
	sta		\2
	CHG_MODEBACK	\1

	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_clr_var		MACRO	size,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHG_MODE	\1
	stz	\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_clr_alvar		MACRO	size,obj,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	CHK_OBJ		\2
	stz	\3,\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_set_var		MACRO	size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\3
	sta	\2
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_3vars		MACRO	size,var1,var2,var3,value1,value2,value3
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	7
	CHG_MODE	\1
	lda	\5
	sta	\2
	lda	\6
	sta	\3
	lda	\7
	sta	\4
	CHG_MODEBACK	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_var2rnd		MACRO	alvar,[AND value] - BYTE ONLY
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1,2
	jsl	random_l
	IFEQ	NARG-2
	and	\2
	ENDC
	sta	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_add_var		MACRO	size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	clc
	adc	\3
	sta	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_sub_var		MACRO	size,var,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	sec
	sbc	\3
	sta	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_dec_var		MACRO	size,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHG_MODE	\1
	dec	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_inc_var		MACRO	size,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHG_MODE	\1
	inc	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_neg_var		MACRO	size,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHG_MODE	\1
	lda		\2
	nega
	sta		\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_cmp_var		MACRO	size,var,cmp value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	cmp	\3
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_cmp_alvars		MACRO	size,obj1,alvar,obj2,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHG_MODE	\1
	s_lda.w	\3,\2
	cmp.w	\5,\4
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_cmp_alvar		MACRO	size,obj1,alvar,cmp value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1
	s_lda.w	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
	
;-----------------------------------------------------------------------------
s_sub_alvars		MACRO	size,obj1,alvar,obj2,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHG_MODE	\1
	s_lda.w	\3,\2
	sec
	sbc.w	\5,\4
	s_sta.w	\3,\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
  
;-----------------------------------------------------------------------------
s_add_alvars		MACRO	size,obj1,alvar,obj2,alvar
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHG_MODE	\1
	s_lda.w	\3,\2
	clc
	adc.w	\5,\4
	s_sta.w	\3,\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
  
;-----------------------------------------------------------------------------
s_add_vars		MACRO	size,var,var
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\3
	clc
	adc	\2
	sta	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_set_alvar2alvartab	MACRO	OFFSET size,FROM size,TO size,obj1,alvar,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	8,9
	CHK_OBJ		\4
	CHK_OBJ		\6
	CHK_SIZE	\1
	CHK_SIZE	\2
	CHK_SIZE	\3


;      1         2        3        4     5    6     7             8        9
; OFFSET size,FROM size,TO size,obj1,alvar,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]


	ph\6

	a16

	s_lda.w		\7,\6

	IFC		"B","\1"
	and		#$00ff
	ENDC
	ta\6

	IFC		"B","\2"
	IFC		"B","\3"
	IFC		"B","\1"
	a8
	ENDC
	ENDC
	ENDC


	IFC		"W","\2"
	ca16
	ENDC
	lda.l		\8,\6

	IFC		"W","\3"
	ca16
	ENDC


	IFNC		"\2","\3"
	sexa
	ENDC

	
	pl\6

;--------------------------------------------------------
; scale
	IFEQ	NARG-9
	IFNE	\9
	IFLT	\9
	REPT	0-\9
;	asra
	adiv2
	ENDR
	ELSEIF
	REPT	\9
	asl	a
	ENDR
	ENDC
	ENDC
	ENDC
;--------------------------------------------------------

	IFC	"B","\3"
	ca8
	ENDC

	sta.\0		\5,\4

	ca8

	stratmac_end
	ENDM
          

;-----------------------------------------------------------------------------
s_set_var2alvartab	MACRO	OFFSET size,FROM size,TO size,alvar,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	7,8
	CHK_OBJ		\5
	CHK_SIZE	\1
	CHK_SIZE	\2
	CHK_SIZE	\3


	EXG_IFY		\5

;      1         2        3        4     5    6     7             8        9
; OFFSET size,FROM size,TO size,obj1,alvar,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
;      1         2        3      4     5      6            7          8        
; OFFSET size,FROM size,TO size,var,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]

	phx
	   
	a16

	s_lda.w		\6,x

	IFC		"B","\1"
	and		#$00ff
	ENDC
	tax

	IFC		"B","\2"
	IFC		"B","\3"
	IFC		"B","\1"
	a8
	ENDC
	ENDC
	ENDC


	IFC		"W","\2"
	ca16
	ENDC
	lda.l		\7,x

	IFC		"W","\3"
	ca16
	ENDC


	IFNC		"\2","\3"
	sexa
	ENDC

	plx
;--------------------------------------------------------
; scale
	IFEQ	NARG-8
	IFNE	\8
	IFLT	\8
	REPT	0-\8
;	asra
	adiv2
	ENDR
	ELSEIF
	REPT	\8
	asl	a
	ENDR
	ENDC
	ENDC
	ENDC
;--------------------------------------------------------

	IFC	"B","\3"
	ca8
	ENDC

	sta		\4

	ca8
	EXG_IFY		\5


	stratmac_end
	ENDM
  


;-----------------------------------------------------------------------------
s_set_alvar2vartab	MACRO	OFFSET size,FROM size,TO size,obj1,alvar,var OFFSET,table ptr,[#scale(-7 -> 7)]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	7,8
	CHK_OBJ		\4
	CHK_SIZE	\1
	CHK_SIZE	\2
	CHK_SIZE	\3

	EXG_IFY		\4

	phx

	a16

	lda		\6

	IFC		"B","\1"
	and		#$00ff
	ENDC
	tax

	IFC		"B","\2"
	IFC		"B","\3"
	IFC		"B","\1"
	a8
	ENDC
	ENDC
	ENDC


	IFC		"W","\2"
	ca16
	ENDC
	lda.l		\7,x


	IFC		"W","\3"
	ca16
	ENDC


	IFNC		"\2","\3"
	sexa
	ENDC

	plx	

;--------------------------------------------------------
; scale
	IFEQ	NARG-8
	IFNE	\8
	IFLT	\8
	REPT	0-\8
;	asra
	adiv2
	ENDR
	ELSEIF
	REPT	\8
	asl	a
	ENDR
	ENDC
	ENDC
	ENDC
;--------------------------------------------------------

	IFC	"B","\3"
	ca8
	ENDC

	sta		\5,x

	ca8

	EXG_IFY		\4

	stratmac_end
	ENDM




;------------------------------------------------------------

s_set_var2vartab	MACRO	OFFSET size,FROM size,TO size,var,var OFFSET,table ptr,[#scale(-7 -> 7)]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	6,7
	CHK_SIZE	\1
	CHK_SIZE	\2
	CHK_SIZE	\3

	phx
	a16

	lda.w		\5

	IFC		"B","\1"
	and		#$00ff
	ENDC
	tax

	IFC		"B","\2"
	IFC		"B","\3"
	IFC		"B","\1"
	a8
	ENDC
	ENDC
	ENDC


	IFC		"W","\2"
	ca16
	ENDC
	lda.l		\6,x


	IFC		"W","\3"
	ca16
	ENDC


	IFNC		"\2","\3"
	sexa
	ENDC

	plx

;--------------------------------------------------------
; scale
	IFEQ	NARG-7
	IFNE	\7
	IFLT	\7
	REPT	0-\7
;	asra
	adiv2
	ENDR
	ELSEIF
	REPT	\7
	asl	a
	ENDR
	ENDC
	ENDC
	ENDC
;--------------------------------------------------------

	IFC	"B","\3"
	ca8
	ENDC

	sta.\0		\4

	ca8

	stratmac_end
	ENDM



	    
;-----------------------------------------------------------------------------
s_set_lifecnt		MACRO	obj1,value
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	lda	\2
	s_sta.w	al_count,\1

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_dec_lifecnt		MACRO	obj1,[1=kill]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1,2
	CHK_OBJ	\1

	s_decbne_alvar	B,\1,al_count,.\@
;	dec	al_count,\1
;	rlbpl	.\@
	IFEQ	NARG-1
	s_remove_obj	\1
	ELSEIF
	s_kill_obj	\1
	ENDC
.\@

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_decbpl_lifecnt		MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	dec	al_count,\1
	rlbpl	\2

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_decbne_lifecnt		MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	dec	al_count,\1
	rlbne	\2

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_objtobeplayer	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	ld\1	playpt
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_DIScolls	MACRO		obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	s_set_alsflag		\1,colldisable


	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_ENAcolls	MACRO		obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	s_clr_alsflag		\1,colldisable


	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_docoll		MACRO	obj1,frames per AP,[#AP scale down]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3
	CHK_OBJ	\1

	EXG_IFY	\1
  	phy

	ldy	al_collobjptr,x
	beq	.\@

     
	s_lda.w	al_AP,y
	IFEQ	NARG-3
	REPT	\3
	asra
	ENDR
	ENDC
	sta	x1

	lda	\2
	sta	tpa

      	jsl	do_coll_l
.\@
	ply
	EXG_IFY	\1
	stratmac_end
	ENDM
	

;-----------------------------------------------------------------------------
s_docollAP		MACRO	obj1,frames per AP,AP override
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1

	EXG_IFY	\1

	lda	\3
	sta	x1

	lda	\2
	sta	tpa

	jsl	do_coll_l
	EXG_IFY	\1
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_obj2collide		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	1
	CHK_OBJ	\1

	s_set_alsflag	\1,collide

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_hardvars		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	1
	CHK_OBJ	\1
;	s_set_alcollflag	\1,hard
	s_set_aldata		\1,#-1,#hardAP
	stratmac_end
	ENDM
  


	
;-----------------------------------------------------------------------------
s_inrng_strat		MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	test_alflag	\1,inrngpl
	rlbeq	\2	
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_inview_strat		MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	test_alflag	\1,inviewpl
	rlbeq	\2	
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_leftview_strat	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	test_alflag	\1,leftpl
	rlbne	\2	
		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
			
s_jmp_rightofview	MACRO
	stratmac_start
	s_rightview_strat	\1,\2
	stratmac_end
	ENDM
			
			
;-----------------------------------------------------------------------------
s_rightview_strat	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	test_alflag	\1,leftpl
	rlbeq	\2	
		stratmac_end
	ENDM

			
s_jmp_leftofview	MACRO
	stratmac_start
	s_leftview_strat	\1,\2
	stratmac_end
	ENDM
      
;-----------------------------------------------------------------------------
s_jmp_objpointnegZ	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_jmp_alvarINLIMIT	B,\1,al_roty,-(deg180+deg45),\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_objpointposZ	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_jmp_alvarINLIMIT	B,\1,al_roty,-deg45,\2
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmpNOT_objpointnegZ	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_jmp_alvarLESS		B,\1,al_roty,#deg180-deg45,\2
	s_jmp_alvarMORE		B,\1,al_roty,#deg180+deg45,\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpNOT_objpointposZ	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	s_jmp_alvarOUTLIMIT	B,\1,al_roty,-deg45,\2
	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_player_strat	MACRO	obj1,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	cp\1	playpt
	rlbne	\2	
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
;s_bump_strat	MACRO	obj1,label
;MYNARG	=	NARG
;	CHK_NARG	2
;	CHK_OBJ	\1
;
;	EXG_IFY	\1
;	sty	tpy
;	ldy	al_collobj,x
;	s_lda.w	al_type,y
;	and	#ATMISSILE
;	beq	.ibs\@
;	ldy	tpy
;	EXG_IFY	\1
;	gjmp	\2
;.ibs\@
;	ldy	tpy
;	EXG_IFY	\1
;		stratmac_end
;	ENDM
;-----------------------------------------------------------------------------
s_rots_flat	MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	lda			outvy+1
	nega
	clc
	adc			#deg180
	clc
	adc			player_turnrot+1
	s_sta.w			al_roty,\1

	lda			outvx+1
	s_sta.w			al_rotx,\1

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_beqdec_alvar		MACRO	size,obj1,alvar,label,[value to cmp]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHK_OBJ		\2
	CHG_MODE	\1
	s_lda.w	\3,\2
	IFEQ	NARG-5
	cmp	\5
	ENDC
	CHG_MODEBACK	\1
	rlbeq	\4
	CHG_MODE	\1
	IFC	"\2","x"
	dec	\3,x
	ELSEIF
	s_lda.w	\3,y
	dec	a
	s_sta.w	\3,y	
	ENDC
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_beqinc_alvar		MACRO	size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	s_lda.w	\3,\2
	CHG_MODEBACK	\1
	rlbeq	\4
	CHG_MODE	\1
	IFC	"\2","x"
	inc	\3,x
	ELSEIF
	s_lda.w	\3,y
	dec	a
	s_sta.w	\3,y	
	ENDC
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_decbne_alvar		MACRO	size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	IFC	"\2","x"
	dec	\3,x
	ELSEIF
	s_lda.w	\3,y
	dec	a
	s_sta.w	\3,y	
	ENDC
	CHG_MODEBACK	\1
	rlbne	\4
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_decbeq_alvar		MACRO	size,obj1,alvar,label,[value to cmp]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4,5
	CHK_OBJ		\2
	CHG_MODE	\1
	IFC	"\2","x"
	dec	\3,x
	ELSEIF
	s_lda.w	\3,y
	dec	a
	s_sta.w	\3,y	
	ENDC
	IFEQ	NARG-5
	cmp	\5
	ENDC
	CHG_MODEBACK	\1
	rlbeq	\4
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_decbpl_alvar		MACRO	size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	IFC	"\2","x"
	dec	\3,x
	ELSEIF
	s_lda.w	\3,y
	dec	a
	s_sta.w	\3,y	
	ENDC
	CHG_MODEBACK	\1
	rlbpl	\4
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_beqdec_var		MACRO	size,var,label,[value to cmp]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3,4
	CHG_MODE	\1
	lda	\2
	IFEQ	NARG-4
	cmp	\4
	ENDC
	CHG_MODEBACK	\1
	rlbeq	\3
	CHG_MODE	\1
	dec	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_beqinc_var		MACRO	size,var,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda	\2
	CHG_MODEBACK	\1
	rlbeq	\3
	CHG_MODE	\1
	inc	\2
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_decbne_var		MACRO	size,var,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	dec	\2
	CHG_MODEBACK	\1
	rlbne	\3
	CHG_MODEBACK	\1
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_lifemore		MACRO	obj1,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_count,\1
	cmp	\2
	rlbpl	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_lifeless		MACRO	obj1,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	s_lda.w	al_count,\1
	cmp	\2
	rlbmi	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_notdelay		MACRO		#delay(1-8),label,[offset]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3
	lda	gameframe
	IFEQ	NARG-3
	clc
	adc	\3
	ENDC
	and	#(1<<\1)-1
	rlbne	\2
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_ifdelay		MACRO		#delay(1-8),label,[offset]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2,3
	lda	gameframe
	IFEQ	NARG-3
	clc
	adc	\3
	ENDC
	and	#(1<<\1)-1
	rlbeq	\2
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_ANDframe		MACRO	AND,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	lda	gameframe
	and	\1
	rlbeq	\2
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_notANDframe		MACRO	AND,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	lda	gameframe
	and	\1
	rlbne	\2
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_frameLESS	MACRO		#frame num,#max frame AND value,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	lda	gameframe
	and	#\2
	cmp	#\1
	rlbpl	\3
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_frameMORE	MACRO		#frame num,#max frame AND value,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	lda	gameframe
	and	#\2
	cmp	#\1
	rlbmi	\3
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_onframe		MACRO	#frame num,#max frame AND value,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	lda	gameframe
	and	#\2
	cmp	#\1
	rlbeq	\3
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmpNOT_onframe		MACRO	#frame num,#max frame AND value,label 
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	lda	gameframe
	and	#\2
	cmp	#\1
	rlbne	\3
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_alvarAND		MACRO	size,obj1,alvar,value,label	
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1
	lda	\3,\2
	and	\4
	CHG_MODEBACK	\1
	rlbne	\5
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmpNOT_alvarAND		MACRO	size,obj1,alvar,value,label	
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1
	lda	\3,\2
	and	\4
	CHG_MODEBACK	\1
	rlbeq	\5
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_varAND		MACRO	size,var,value,label	
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1
	lda	\2
	and	\3
	CHG_MODEBACK	\1
	rlbne	\4
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmpNOT_varAND		MACRO	size,var,value,label	
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1
	lda	\2
	and	\3
	CHG_MODEBACK	\1
	rlbeq	\4
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_ABSalvarmore	MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	bpl	.nneg\@
	nega
.nneg\@
	cmp	\4
	CHG_MODEBACK	\1
	beq	.\@
	rlbpl	\5
.\@

		stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_ABSalvarless	MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	bpl	.nneg\@
	nega
.nneg\@
	cmp	\4
	CHG_MODEBACK	\1
	beq	.\@
	rlbmi	\5
.\@

		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_jmp_alvarmore	MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
	beq	.\@
	rlbpl	\5
.\@

		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarmoreEQ	MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
	rlbpl	\5
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varmoreEQ	MACRO		size,var,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1

	lda	\2
	cmp	\3
	CHG_MODEBACK	\1
	rlbpl	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarless	MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
	rlbmi	\5
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarlesseq	MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
	rlbeq	\5
	rlbmi	\5
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarOUTLIMIT	MACRO		size,obj1,alvar,#-+range,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1
	lda.\0	\3,\2
	jmp_inrange		\4,.i\@
	CHG_MODEBACK	\1
	s_jmp		\5
.i\@
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_alvarINLIMIT	MACRO		size,obj1,alvar,#-+range,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1
	lda.\0	\3,\2
	jmp_outrange		\4,.o\@
	CHG_MODEBACK	\1
	s_jmp		\5
.o\@
	CHG_MODEBACK	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_jmp_varzero		MACRO		size,var,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda.\0	\2
	CHG_MODEBACK	\1
	rlbeq	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varnotzero		MACRO		size,var,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1
	lda.\0	\2
	CHG_MODEBACK	\1
	rlbne	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarzero		MACRO		size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	s_lda.w		\3,\2
	CHG_MODEBACK	\1
	rlbeq	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarNOTzero		MACRO		size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	s_lda.w	\3,\2
	CHG_MODEBACK	\1
	rlbne	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarmi		MACRO		size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	lda.\0	\3,\2
	CHG_MODEBACK	\1
	rlbmi	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarpl		MACRO		size,obj1,alvar,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ		\2
	CHG_MODE	\1
	lda.\0	\3,\2
	CHG_MODEBACK	\1
	rlbpl	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvareq		MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
	rlbeq	\5
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_alvarne		MACRO		size,obj1,alvar,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	5
	CHK_OBJ		\2
	CHG_MODE	\1

	lda.\0	\3,\2
	cmp	\4
	CHG_MODEBACK	\1
	rlbne	\5
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varne		MACRO		size,var,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1

	lda	\2
	cmp	\3
	CHG_MODEBACK	\1
	rlbne	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varpl		MACRO		size,var,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHG_MODE	\1

	lda	\2
	CHG_MODEBACK	\1
	rlbpl	\3
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_vareq		MACRO		size,var,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1

	lda	\2
	cmp	\3
	CHG_MODEBACK	\1
	rlbeq	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varmore	MACRO		size,var,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1

	lda.\0	\2
	cmp	\3
	CHG_MODEBACK	\1
	beq	*+2+6 ;.\@
	rlbpl	\4
;.\@
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varless	MACRO		size,var,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1

	lda.\0	\2
	cmp	\3
	CHG_MODEBACK	\1
	rlbmi	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_jmp_varlesseq	MACRO		size,var,value,label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHG_MODE	\1

	lda.\0	\2
	cmp	\3
	CHG_MODEBACK	\1
	rlbeq	\4
	rlbmi	\4
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_brl		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	brl	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_bra		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	bra	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_beq		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	rlbeq	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_bne		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	rlbne	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_bpl		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	rlbpl	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_bmi		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	rlbmi	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_bcc		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	rlbcc	\1
	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_bcs		MACRO	label
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	rlbcs	\1
	stratmac_end
	ENDM

;*****************************************************************************
; mother and child macros.


;-----------------------------------------------------------------------------
s_jmp_childdead	MACRO	child num,label  ; MOTHER in X, puts child in Y
MYNARG	=	NARG
	CHK_NARG	2
	
	s_set_objtobechild	y,x,\1
	s_jmp_objptrbad		y,\2

		ENDM


;-----------------------------------------------------------------------------
s_jmp_childalive	MACRO	child num,label  ; MOTHER in X, puts child in Y
MYNARG	=	NARG
	CHK_NARG	2
	
	s_set_objtobechild	y,x,\1
	s_jmp_objptrok		y,\2

		ENDM




;-----------------------------------------------------------------------------
s_set_childstate	MACRO	child num,state ; MOTHER in X, puts child in Y
MYNARG	=	NARG
	CHK_NARG	2
	s_set_objtobechild	y,x,\1
	s_chk_objptr		y,.bad\@
	s_set_state		y,\2
.bad\@
		ENDM


;-----------------------------------------------------------------------------
s_set_objtobemother	MACRO	obj2,child obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	ld\1	al_ptr,\2
		stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_set_objtobechild	MACRO	obj2,mother obj,child number
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	\1
	CHK_OBJ	\2

	lda	\3
	jsl	setobjtobechild\1\2_srou

;	ph\2
;
;.nc\@	ld\1	al_sword1,\2
;	beq	.fc\@
;.gc\@
;	s_lda.w	al_sbyte1,\1
;	cmp	\3
;	beq	.fc\@
;	t\1\2
;	bra	.nc\@
;.fc\@
;	pl\2
		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_make_mother		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	1
	CHK_OBJ	\1

	s_set_alvar	B,\1,al_sbyte1,#0
	s_set_alvar	W,\1,al_ptr,#0
	s_set_alvar	W,\1,al_sword1,#0

	stratmac_end
	ENDM
;-----------------------------------------------------------------------------
s_make_child		MACRO	child number

; Y - output pointer = child
; X - ptr. to mother obj

	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	1

	lda	\1
	jsl	sr_make_child


	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_remove_child		MACRO	child obj,mother obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	2
	CHK_OBJ	\1
	CHK_OBJ	\2

	s_clr_alsflag	\1,childobj

	a16
	st\1	tpy

	ph\2
asz	=	*
	s_lda.w	al_sword1,\2
	beq	.bc\@
.gc\@	cmp	tpy
	beq	.fc\@	
	ta\2
	bra	asz
.fc\@
	s_lda.w	al_sword1,\1
	s_sta.w	al_sword1,\2
.bc\@
	pl\2

	a8
	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_make_childobj	MACRO	shape,child num,#strategy ptr,[colltype]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	3,4


	s_make_obj	\1,.\@

;	s_setnoremove_behind	y
	s_make_child	\2
	s_set_strat	y,\3
	IFEQ		NARG-4
	s_set_colltype	y,\4
	ENDC
	brl		.done\@
.\@
	blink

.done\@
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_make_childobjpos	MACRO	shape,child num,x,y,z rel,#strategy ptr,[colltype]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	6,7

	s_make_obj	\1,.\@
	s_make_child	\2
	s_copy_pos	y,x
	s_add_2pos	y,\3,\4,\5
	s_set_strat	y,\6
	IFEQ		NARG-7
	s_set_colltype	y,\7
	ENDC
.\@
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_count_childs		MACRO	mother obj,var BYTE
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	
	stz	\2

	EXG_IFY	\1

	phy
	phx

asz	=	*
	ldy	al_sword1,x
	beq	.fc\@
	inc	\2
	tyx
	bra	asz
.fc\@
	plx
	ply

	EXG_IFY	\1

		stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_set_relpos	MACRO	obj1,x,y,z
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1

	s_set_alvar	B,\1,al_relposx,\2
	s_set_alvar	B,\1,al_relposy,\3
	s_set_alvar	B,\1,al_relposz,\4

	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_do_childrelpos	MACRO	child obj1,#scale
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	EXG_IFY	\1

	s_set_objtobemother	y,x
	s_chk_objptr		y,.bad\@

	s_copy_alvar2var	B,x,smvar_byte1,al_relposX
	s_copy_alvar2var	B,x,smvar_byte2,al_relposY
	s_copy_alvar2var	B,x,smvar_byte3,al_relposZ

	s_add_Roffs2pos		B,x,y,y,smvar_byte1,smvar_byte2,smvar_byte3,1,1,1,\2,\2,\2
	
	s_copy_rots		x,y
.bad\@

	EXG_IFY	\1
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_float	MACRO		; obj1,size(32/64)

	stratmac_start

MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	EXG_IFY	\1
	s_jsl		float\2_srou_l
	EXG_IFY	\1

	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
s_nodepthcue	MACRO	obj

	s_set_alvar	B,\1,al_depthoffset,#1

	ENDM


;-----------------------------------------------------------------------------
s_set_debrisdata	MACRO	obj1,shape
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	2
	CHK_OBJ	\1
	
	s_set_alvar	W,\1,al_debrisshape,\2

	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_make_xyvec	MACRO	obj,angle,speed
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	3
	CHK_OBJ	\1
	EXG_IFY	\1

	lda	\2
	sta	x1
	lda	\3
	sta	z1
	jsl	sr_make_xyvec	

	EXG_IFY	\1


	stratmac_end
	ENDM



;-----------------------------------------------------------------------------
s_spacemist		MACRO	obj1
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	1
	CHK_OBJ	\1

	a16
	s_lda		al_worldz,\1
	sec
	sbc		pviewposz
	clc
	adc		#500
	asra
	xba
	a8

	cmp		#8
	bmi		.ok\@
	lda		#7
.ok\@

	sta		smvar_byte1
	s_init_colanim	\1,smvar_byte1

	stratmac_end
	ENDM


;-----------------------------------------------------------------------------
s_add_rnd2pos		MACRO	obj1,#X AND,#Y AND,#Z AND,[#X scale,#Y scale,#Z scale]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	4,7
	CHK_OBJ	\1

	s_set_var2rnd	smvar_word1,#\2
	s_set_var	B,smvar_word1+1,#0
	s_sub_var	W,smvar_word1,#(\2)/2
	IFEQ		NARG-7
	IFNE		\5
	s_scale_var	W,smvar_word1,\5
	ENDC
	ENDC
	s_add_alvar	W,\1,al_worldx,smvar_word1


	s_set_var2rnd	smvar_word1,#\3
	s_set_var	B,smvar_word1+1,#0
	s_sub_var	W,smvar_word1,#(\3)/2
	IFEQ		NARG-7
	IFNE		\6
	s_scale_var	W,smvar_word1,\6
	ENDC
	ENDc
	s_add_alvar	W,\1,al_worldy,smvar_word1


	s_set_var2rnd	smvar_word1,#\4
	s_set_var	B,smvar_word1+1,#0
	s_sub_var	W,smvar_word1,#(\4)/2
	IFEQ		NARG-7
	IFNE		\7
	s_scale_var	W,smvar_word1,\7
	ENDC
	ENDC 
	s_add_alvar	W,\1,al_worldz,smvar_word1

	stratmac_end
	ENDM


;*****************************************************************************


;-----------------------------------------------------------------------------
test_key_Jup	MACRO
	lda	\1cont0
	and	#key_Jup	
	ENDM
;-----------------------------------------------------------------------------
test_key_Jdown	MACRO
	lda   	\1cont0
	and	#key_Jdown
	ENDM
;-----------------------------------------------------------------------------
test_key_Jleft	MACRO
	lda	\1cont0
	and	#key_Jleft
	ENDM
;-----------------------------------------------------------------------------
test_key_Jright	MACRO
	lda    	\1cont0
	and	#key_Jright
	ENDM
;-----------------------------------------------------------------------------
test_key_left	MACRO
	lda	\1contl0
	and	#key_leftl
	ENDM
;-----------------------------------------------------------------------------
test_key_right	MACRO
	lda	\1contl0
	and	#key_rightl
	ENDM
;-----------------------------------------------------------------------------
test_key_start	MACRO
	lda	\1cont0
	and	#key_start
	ENDM
;-----------------------------------------------------------------------------
test_key_select	MACRO
	lda	\1cont0
	and	#key_select
	ENDM
;-----------------------------------------------------------------------------
test_key_y	MACRO
	lda	\1cont0
	and	#key_y
	ENDM
;-----------------------------------------------------------------------------
test_key_x	MACRO
	lda	\1contl0
	and	#key_xl
	ENDM
;-----------------------------------------------------------------------------
test_key_b	MACRO
	lda	\1cont0
	and	#key_b
	ENDM
;-----------------------------------------------------------------------------
test_key_a	MACRO
	lda	\1contl0
	and	#key_al
	ENDM



;*****************************************************************************
;*****************************************************************************
rlbeq	macro
	bne	*+6
	jml	\1
	ENDM

rlbne	macro
	beq	*+6
	jml	\1
	ENDM

rlbpl	macro
	bmi	*+6
	jml	\1
	ENDM

rlbmi	macro
	bpl	*+6
	jml	\1
	ENDM

rlbcc	macro
	bcs	*+6
	jml	\1
	ENDM

rlbcs	macro
	bcc	*+6
	jml	\1
	ENDM

rlbvc	macro
	bvs	*+6
	jml	\1
	ENDM

rlbvs	macro
	bvc	*+6
	jml	\1
	ENDM

rlblo	macro
	bcs	*+6
	jml	\1
	ENDM

rlbhs	macro
	bcc	*+6
	jml	\1
	ENDM


;*****************************************************************************
stratdebug	MACRO
	a8

	lda	#$0
	sta.l	inidisp
	lda	#0
.loop\@
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec	a
	bne	.loop\@

	lda	#$F
	sta.l	inidisp


	ENDM
;*****************************************************************************
badstrat	MACRO

    	a8
	stz	nmitimen
	stz	hdmaen
	stz	tm
	stz	ts
	pha
.\@	screenoff
	pla
	stz	cgadd
	sta	cgdata
	inc	a
	sta	cgdata
	inc	a
	and	#$0f
	pha
	screenon
	nop
	nop
	nop
	nop
	bra	.\@
	ENDM

;---------------------------------------------------------------------------

	ifeq	1
	s_lda.w	al_vel,\1
	eor	#128
	cmp	#\2^128
	bcc	.upvel\@
	sec
	sbc	#\3^128
	bra	.endts\@
.upvel\@
	clc
	adc	#\3^128
.endts\@
	endc
;----------------------------------------------------------------------



;*****************************************************************************
player_immune	MACRO	obj
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1

	EXG_IFY	\1
	phy
	ldy	pcboxobj_LW
	s_make_immune	
	ldy	pcboxobj_RW
	s_make_immune	
	ldy	pcboxobj_B
	s_make_immune	
	ply
	EXG_IFY	\1

	
	stratmac_end
	ENDM


;*****************************************************************************
s_playerfly_mode	MACRO	name, [NOMACRO]
	stratmac_start

	s_set_var	W,viewCY,#\1_viewCY	

	s_set_var	W,minPmoveX,#\1_minX
	s_set_var	W,maxPmoveX,#\1_maxX
	s_set_var	W,minMmoveX,#\1_MminX
	s_set_var	W,maxMmoveX,#\1_MmaxX
	s_set_var	W,maxMmoveY,#\1_MmaxY

	s_set_var	W,minPWmoveY,#\1_minY
	s_set_var	W,maxPWmoveY,#\1_maxY+5

	s_set_var	W,minPmoveY,#\1_minY
	s_set_var	W,maxPmoveY,#\1_maxY+playerB_Ystop

	s_set_var	B,playerflymode,#\1_flymode
	s_set_var	B,pmovelimitAND,#\1_pmovelimitAND
	s_set_var	B,missboundflags,#\1_missboundflags

	s_or_var	B,gameflags,#\1_gameflagsON
	s_and_var	B,gameflags,#~(\1_gameflagsOFF)

	s_and_var	B,pstratflags,#~pstf_noviewmove

	s_or_var		B,pshipflags3,#psf3_enginesnd

	IFEQ	NARG-1
	\1_macro
	ENDC

	stratmac_end
	ENDM



;*****************************************************************************
s_setpctrl_off	MACRO
	stratmac_start
	s_or_var		B,pshipflags,#psf_noctrl!psf_nofire

	IFNE	mouseon
	stz	mousemode
	ENDC

	stratmac_end
	ENDM

s_setpctrl_on	MACRO
	stratmac_start
	s_and_var		B,pshipflags,#~(psf_noctrl!psf_nofire!psf_noYctrl)

	IFNE	mouseon
	lda	mousemodetemp
	sta	mousemode
	ENDC	

	stratmac_end
	ENDM

s_playerctrl		MACRO	off/on
	stratmac_start
	s_setpctrl_\1
	stratmac_end
	ENDM

;*****************************************************************************
s_setpfire_off	MACRO
	stratmac_start
	s_or_var		B,pshipflags,#psf_nofire
	stratmac_end
	ENDM

s_setpfire_on	MACRO
	stratmac_start
	s_and_var		B,pshipflags,#~psf_nofire
	stratmac_end
	ENDM

s_playerfire		MACRO	off/on
	stratmac_start
	s_setpfire_\1
	stratmac_end
	ENDM

;*****************************************************************************


shadow	equ	0


make_shadow	MACRO		shape
	IFNE	shadow
	phy
	s_jmp_alvarNOTzero	W,x,al_sword1,.nso\@
	s_make_obj		\1,.nso\@
	s_set_altype		y,gnd
	s_setnoremove_behind	y
	s_clr_alsflag		y,colldisable
	s_clr_alsflag		y,realobj
	sty			al_sword1,x
.nso\@
	ply
	move_shadow
	ENDC
	ENDM

move_shadow	MACRO		
	IFNE	shadow
	phy
	s_set_objtobealvar	y,x,al_sword1
	s_chk_objptr		y,.nms\@
	s_copy_pos		y,x
	s_copy_alvar2alvar	B,y,al_roty,x,al_roty
	s_set_alvar		W,y,al_worldy,#0
	s_add_alvars		W,y,al_worldz,x,al_worldy
.nms\@
	ply
	ENDC
	ENDM

remove_shadow	MACRO		
	IFNE	shadow
	phy
	s_set_objtobealvar	y,x,al_sword1
	s_chk_objptr		y,.nrs\@
	s_remove_obj		y
	s_set_alvar		W,x,al_sword1,#0
.nrs\@
	ply
	ENDC
	ENDM



boost_sprite	MACRO	[size]
	s_make_obj		#boostshape,.bad1\@
	IFEQ			NARG-1
	s_set_alvar		B,y,al_sbyte1,\1
	ENDC
       	s_set_strat		y,boost_Istrat
	s_set_alsflag		y,invisible
.bad1\@
	ENDM

bigFOexp_sprite	MACRO
	a16
	lda			#fillscreen_circle
	sta			circleanim
	a8
	ENDM


;-----------------------------------------------------------------------------
s_particle_data		MACRO	obj1,#type,#amount,#life
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	4
	CHK_OBJ	\1 

	s_set_alsflag	\1,partobj
	s_set_alvar	B,\1,al_sbyte3,#\2
	s_set_alvar	B,\1,al_sbyte1,#\3
	s_set_alvar	B,\1,al_sbyte2,#\4
	s_clr_alsflag	\1,shadow
		stratmac_end
	ENDM	 
;-----------------------------------------------------------------------------
s_boss_dying	MACRO
	s_jmp_varAND	B,bossflags,#bf_dying,.nsnd\@
	trigse		$1e
	startbgm		$f1
	s_or_var	B,bossflags,#bf_dying
	s_or_var	B,pstratflags,#pstf_notdie
	s_playerfire	off
.nsnd\@	
;	s_playerctrl	off
	ENDM	
	
;-----------------------------------------------------------------------------


;*****************************************************************************
s_banktoplayer	MACRO
	jsl	sr_banktoplayer
	ENDM


;*****************************************************************************
s_dooropen_snd	MACRO	[#anim frame num]
	IFEQ	NARG-1
	s_cmp_anim	x,#\1
	s_bne		.nsnd\@
	ENDC
	jsl		dooropensound_l
.nsnd\@
		ENDM
;*****************************************************************************
s_doorclose_snd	MACRO	[#anim frame num]
	IFEQ	NARG-1
	s_cmp_anim	x,#\1
	s_bne		.nsnd\@
	ENDC
	jsl		doorclosesound_l
.nsnd\@
		ENDM


;*****************************************************************************
s_remove_ifplayerdead	MACRO	obj1
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1 

	lda		pshipflags2
	and		#psf2_playerHP0
	beq		.ok\@
	s_remove_obj	\1
.ok\@


	ENDM


;*****************************************************************************
s_jmp_ifplayerdead	MACRO	label
MYNARG	=	NARG
	CHK_NARG	1

	lda		pshipflags2
	and		#psf2_playerHP0
	lbne		\1

	ENDM


;*****************************************************************************
s_jmp_ifplayeralive	MACRO	label
MYNARG	=	NARG
	CHK_NARG	1

	lda		pshipflags2
	and		#psf2_playerHP0
	lbeq		\1

	ENDM
;*****************************************************************************
; language extension by kando
s_say_msg	MACRO	[message]
	phy
	s_make_obj			#nullshape,.no\@
	s_set_alvar			B,y,al_sbyte1,#{message}
	s_set_strat			y,path_istrat
	s_set_path			y,mes_message
.no\@
	ply
	ENDM
;*****************************************************************************
s_camera_lockon	macro	[obj]
	IFEQ	NARG
	error
	ENDC
	CHK_OBJ	\1
	a8
	EXG_IFY	\1	;xchange x/y if the obj we're referencing is Y
	stx	viewtoobj
	lda	viewtype
	ora	#viewtype_toobj
	sta	viewtype
	EXG_IFY	\1	;xchange x/y if the obj we're referencing is Y
	endm
;*****************************************************************************
s_return_camera	macro
	php
	pha
	a8
	lda	#viewtype_norm
	sta	viewtype
	pla
	plp
	endm
;*****************************************************************************










