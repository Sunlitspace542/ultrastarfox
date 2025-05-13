# Strat Macro Documentation (From STRATMAC.INC and STRATLIB.INC)
```
************************** STRAT MACROS *****************************

	macro name		dest,(source),parms

- OBJECT MISC. MACROS
	s_make_obj		shape,label - returns new obj in Y
	s_push_stratptr		obj1 - one level only !
	s_pull_stratptr		obj1 - one level only !
	s_set_strat		obj1,#ptr to strategy
	s_set_collstrat		obj1,#ptr to collision strategy
	s_set_endcollstrat	obj1,#ptr to end collision strategy
	s_set_expstrat		obj1,#ptr to explosion strategy
	s_set_aldata		obj1,HP,AP
	s_set_alptrs		obj1,#strategy,#collstrat,#expstrat
	s_set_nmistrat		obj1,#ptr to nmi strategy
	s_goto_obj		obj1,obj2,Xoff,Yoff,Zoff,max dist,min dist,max speed,#accel,#angle chase rate,#skid,[label]
	s_goto_WP		obj1,obj2,obj2 #WP,max speed,#accel,#angle chase rate,#skid,min dist,min dist speed,[label]
	s_goto_WPpostab		obj1,obj2,obj2 #WP,max speed,#accel,#angle chase rate,#skid,min dist,min dist speed,table name,label
	s_set_WP		obj1,obj2 or 0,obj1 #WP,x,y,z
	s_set_dist		obj1,obj2,XorYorZ
	s_kill_obj		obj1
	s_setnoremove_behind	obj1
	s_setremove_behind	obj1
	s_remove_offscn		obj1
	s_remove_obj		obj1
	s_remove_fire		obj1
	s_circle_obj		obj1,obj2,#distance,speed,#skid - USES SBYTE2
	s_turnto_obj		obj1,obj2,Y rotation offset,label
	s_carry_obj		obj1,obj2,#x,#y,#z offset.	16bit offsets. obj1 carry obj2
	s_damagesmoke		obj1,smoke HP,#smoke rate(0-8),[x,y,z offset BYTES,scale] 
	s_damagefire		obj1,smoke HP,#smoke rate(0-8),[x,y,z offset BYTES,scale] 
	s_make_smoke		[delay,label]
	s_make_splash		obj,[size(S)]
	s_set_find		obj1 (0= start of list)
	s_find_nearobj		obj2,obj1,shape,min radius,max radius,label 
	s_find_radiusobj	obj2,obj1,shape,min radius,max radius,label 
	s_find_obj		obj2,obj1,shape,label
	s_find_Mobj		obj2,obj1,shape,ASF_name mask,label 
	s_rots_flat		obj1
	s_chk_objptr		obj1,label
	s_weapon_pos		x,y,z
	s_weapon_rot		x,y
	s_weapon_rndrot		#rnd x AND,#rnd y AND
	s_weapon_rndrots2obj 	obj1,#rnd x AND,#rnd y AND
	s_weapon_rots2obj 	obj1,[x rot off,y rot off]
	s_weapon_Yrot2obj 	obj1
	s_fire_weapon		obj1,#WEAPON_name,[label] - if can't gen.
	s_fire_Yweapon		obj1,#WEAPON_name 
	s_Initface_player	obj1
	s_face_player		obj1,#chase,#delay,[label] - USES SBYTE2,SBYTE3
	s_exg_objs		
	s_start_strat
	s_start_collstrat
	s_start_nmistrat
	s_end_strat
	s_end_nmistrat
	s_end_collstrat		
	s_DIScolls		obj1
	s_ENAcolls		obj1
	s_docoll		obj1,frames per AP,[#AP scale down]
	s_docollAP		obj1,frames per AP,AP override 
	s_obj2collide		obj1 
	s_hardvars		obj1
	s_playerctrl		off/on
	s_make_xyvec		onj1,angle,speed
	s_set_debrisdata	obj1,shape
	s_banktoplayer	
	s_float			obj1,size(32/64)
	s_spacemist		obj1
	s_add_rnd2pos		obj1,#X AND,#Y AND,#Z AND,[#X scale,#Y scale,#Z scale]
	s_particle_data		obj1,#type,#amount,#life
	s_boss_dying		
	s_remove_ifplayerdead	obj1

- VARIABLES AND COUNTERS MACROS
	s_set_alvartobeobj	obj2,obj2 alvar,obj1
	s_set_vartobeobj	var,obj
	s_set_objtobealvar	obj2,obj1,obj1 alvar
	s_set_objtobevar	obj2,var
	s_set_objtobeplayer	obj1

	s_copy_sflags		obj2,obj1		
	s_copy_obj		obj2,obj1		
	s_copy_var2var		size,var,var
	s_copy_var2alvar	size,obj1,alvar,var
	s_copy_var2alxvar	size,obj1,alxvar,var
	s_copy_alvar2var	size,obj1,var,alvar
	s_copy_alxvar2var	size,obj1,var,alxvar
	s_copy_alvar2alvar	size,obj1,alvar,obj2,alvar
	s_copy_alvar2alxvar	size,obj1,alxvar,obj2,alvar
	s_Achase_alvar		size,obj1,alvar,value,#chase rate,[label]
	s_Achase_2alvars	size,obj1,alvar1,value1,#chase rate,alvar2,value2,#chase rate,[label]
	s_Achase_var2alvar	size,obj1,var,alvar,#chase rate,[label]
	s_Achase_alvar2alvar	size,obj1,alvar,obj2,alvar,#chase rate,[label]
	s_Achase_var		size,var,value,#chase rate,[label]
	s_Fchase_alvar		size,obj1,alvar,value,#chase rate,[label]
	s_Fchase_var2alvar	size,obj1,var,alvar,#chase rate,[label]
	s_Fchase_alvar2alvar	size,obj1,alvar,obj2,alvar,#chase rate,[label]
	s_Fchase_var		size,var,value,#chase rate,[label]
	s_set_alvar		size,obj1,alvar,value
	s_clr_alvar		size,obj1,alvar
	s_set_alvar2rnd		obj1,alvar,[AND value] - BYTE ONLY
	s_add_rnd2alvar		obj1,alvar,[AND value] - BYTE ONLY
	s_add_rnd2var		alvar,[AND value] - BYTE ONLY
	s_add_alvar		size,obj1,alvar,value
	s_varadd_alvar		size,obj1,var,alvar
	s_sub_alvar		size,obj1,alvar,value
	s_varsub_alvar		size,obj1,var,alvar
	s_dec_alvar		size,obj1,alvar
	s_inc_alvar		size,obj1,alvar
	s_neg_alvar		size,obj1,var
	s_scale_alvar		size,obj1,var,#scale(-ve/+ve)
	s_scale_var		size,var,#scale(-ve/+ve)
	s_set_var		size,var,value
	s_clr_var		size,var
	s_set_var2rnd		var,[AND value]  -  BYTE ONLY
	s_add_var		size,var,value
	s_sub_var		size,var,value
	s_dec_var		size,var
	s_inc_var		size,var
	s_neg_var		size,var
	s_add_alvars		size,obj1,alvar,obj2,alvar
	s_add_vars		size,var,var
	s_sub_alvars		size,obj1,alvar,obj2,alvar
	s_cmp_alvars		size,obj1,alvar,obj2,alvar
	s_cmp_alvar		size,obj1,alvar,cmp value
	s_cmp_var		size,var,cmp value
	s_set_alvar2alvartab	OFFSET size,FROM size,TO size,obj1,alvar,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
	s_set_alvar2vartab	OFFSET size,FROM size,TO size,obj1,alvar,var OFFSET,table ptr,[#scale(-7 -> 7)]
	s_set_var2alvartab	OFFSET size,FROM size,TO size,var,obj2,alvar OFFSET,table ptr,[#scale(-7 -> 7)]
	s_set_var2vartab	OFFSET size,FROM size,TO size,var,var OFFSET,table ptr,[#scale(-7 -> 7)]
	s_set_3vars		size,var1,var2,var3,value1,value2,value3

	s_set_lifecnt		obj1,value
	s_dec_lifecnt		obj1,[1=kill]
	s_decbpl_lifecnt	obj1,label
	s_decbne_lifecnt	obj1,label
	s_set_altype		obj1,#ATflag
	s_set_alflag		obj1,#AFflag
	s_set_alsflag		obj1,#AFS_flag
	s_set_flag		var,#bit number
	s_clr_flag		var,#bit number
	s_test_flag		var,#bit number
	s_test_var		size,var,#value
	s_or_var		size,var,#value
	s_not_var		size,var,#value
	s_and_var		size,var,#value
	s_or_alvar		size,obj1,var,#value
	s_and_alvar		size,obj1,var,#value
	s_set_alcollflag	obj1,#ACF_flag
	s_clr_atype		obj1,#ATflag
	s_not_alflag		obj1,#AFS_flag
	s_clr_alflag		obj1,#AFflag
	s_clr_alsflag		obj1,#AFS_flag
	s_clr_alcollflag	obj1,#ACF_flag
	s_set_colltype		obj1,coll type (LASER/ENEMY1)
	s_clr_colltype		obj1,coll type (LASER/ENEMY1)
	s_not_alsflag		obj1,#AFS_flag
	s_limit_alvar		size,obj1,alvar,#min value,#max value,[label]
	s_limit_var		size,var,#min value,#max value,[label]

	s_push_obj		obj
	s_pull_obj		obj
	s_push_alvar		size,obj1,alvar
	s_pull_alvar		size,obj1,alvar
	s_push_var		size,var
	s_pull_var		size,var


- VECTOR MACROS
	s_set_speed		obj1,speed
	s_add_speed		obj1,value
	s_sub_speed		obj1,value
	s_speedto		obj1,speed,#acceleration,[label]
	s_zero_vecs		obj1
	s_zero_2dvecs		obj1
	s_zero_rots		obj1
	s_zero_pos		obj1
	s_scale_vecs		obj1,#scale shift value
	s_gen_vecs		obj1,alroty,alvel,[#scale]
	s_gen_Zvec		obj1,alvel,[#scale]
	s_gen_flatvecs		obj1,alroty,alvel,[#scale]
	s_addgen_vecs		obj1,alroty,alvel,[#scale]
	s_addgen_3Dvecs		obj1,alroty,alrotx,alvel,[#scale]
	s_gen_3Dvecs		obj1,alroty,alrotx,alvel,[#scale]
	s_scale_vec		obj1,vec,#scale shift value
	s_add_2pos		obj1,x,y,z
	s_add_vecs2pos		obj1
	s_add_vecs2vecs		obj2,obj1
	s_set_pos		obj1,x,y,z
	s_set_vecs		obj1,x,y,z
	s_set_vec		obj1,X or Y or Z,value
	s_add_2Yvec		obj1,value (WORD)
	s_copy_pos		obj2,obj1
	s_copy_pos2WP		obj2,#WP,obj1
	s_copy_vecs		obj2,obj1
	s_copy_rots		obj2,obj1
	s_objrel_vecs		obj1,obj2,x,z offset.
	s_objrel_3vecs		obj1,obj2,x,y,z offset.
	s_obj2obj_angle		obj1,obj2,obj1 roty,#angle chase.,[label]
	s_obj2obj_3Dangle 	obj1,obj2,obj1 roty,rotx,#angle chase.,[label]
	s_obj2obj_3DangleOFF 	obj1,obj2,obj1 roty,roty offset,rotx,rotx offset,#angle chase.,[label]
	s_obj2obj_angleOFF	obj1,obj2,obj1 roty,offset,#angle chase.,[label]
	s_obj2WP_angle		obj1,obj2,#WP,obj1 alroty,obj1 alrotx,#angle chase.,[label]
	s_move_obj		obj1,speed,#accel,#skid
	s_move3D_obj		obj1,speed,#accel,#skid
	s_add_viewheight	obj1
	s_sub_viewheight	obj1
	s_add_cheight		obj1
	s_sub_cheight		obj1
	s_copy_vheight2var	obj1,var
	s_falldown_Yvec		obj1,#bounceyness(1-4/high-low),gravity(WORD),ground Ypos,[label]
	s_add_Roffs2pos		size,TO obj,POS obj,ROT obj,x,y,z,0/1,0/1,0/1 (x,y,z)rot on,[X #scale,Y #scale,Z #scale] 
	s_keeprelto_player	obj1
	s_add_playerZ		obj1
	s_sub_playerZ		obj1

- STRATEGY MASKING MACROS 
	s_inrng_strat		obj1,label
	s_inview_strat		obj1,label
	s_leftview_strat	obj1,label
	s_rightview_strat	obj1,label
	s_player_strat		obj1,label

- CONDITIONAL MACROS
	s_jmp_iflevel		#level(1-3),.label
	s_jmp_ifnotlevel	#level(1-3),.label
	s_jmp			label
	s_jsr			label
	s_jsl			label
	s_ldajsl		size,var,label
	s_rtl			
	s_jmp_onfire		obj1,label
	s_jmpNOT_onfire		obj1,label
	s_jmpto_strat		x
	s_jmpto_tempstrat	x
	s_do_strat		obj1
	s_jmpto_collstrat	x
	s_jmpto_expstrat 	x
	s_jmp_higher		obj1,height,label	16bit height
	s_jmp_higheralvar	obj1,alvar,label	16bit height
	s_jmp_objhigher		obj1,obj2,label		
	s_jmp_lower		obj1,height,label	16bit height
	s_jmp_loweralvar	obj1,alvar,label	16bit height
	s_jmp_objlower		obj1,obj2,label		
	s_jmp_Hdistmore		obj1,obj2,dist,label	16bit distance
	s_jmp_Hdistless		obj1,obj2,dist,label	16bit distance
	s_jmp_distmore		obj1,obj2,dist,label	16bit distance
	s_jmp_distless		obj1,obj2,dist,label	16bit distance
	s_jmp_XYdistmore	obj1,obj2,dist,label	16bit distance
	s_jmp_XYdistless	obj1,obj2,dist,label	16bit distance
	s_jmp_outXYdistrng	obj1,obj2,min dist,max dist,label
	s_jmp_objinfront	obj1,obj2,label
	s_jmp_Zdistmore		obj1,obj2,dist,label
	s_jmp_Zdistless		obj1,obj2,dist,label
	s_jmp_outXdistrng	obj1,obj2,min dist,max dist,label
	s_jmp_outYdistrng	obj1,obj2,min dist,max dist,label
	s_jmp_outZdistrng	obj1,obj2,min dist,max dist,label
	s_jmp_Xdistmore		obj1,obj2,dist,label
	s_jmp_Xdistless		obj1,obj2,dist,label
	s_jmp_WPdistmore	obj1,obj2,#WP,dist,label	16bit distance
	s_jmp_WPdistless	obj1,obj2,#WP,dist,label	16bit distance
	s_jmp_lifemore		obj1,value,label   			
	s_jmp_lifeless		obj1,value,label			
	s_jmp_ifdelay		#delay(1-8)(min-max),label,[offset]
	s_jmp_notdelay		#delay(1-8)(min-max),label,[offset]
	s_jmp_ANDframe		AND value,label
	s_jmp_notANDframe	AND value,label
	s_jmp_frameMORE		#frame num,#max frame AND value,label 
	s_jmp_frameLESS		#frame num,#max frame AND value,label 
	s_jmp_onframe		#frame num,#max frame AND value,label 
	s_jmpNOT_onframe	#frame num,#max frame AND value,label 
	s_jmp_alvarAND		size,obj1,alvar,value,label	
	s_jmpNOT_alvarAND	size,obj1,alvar,value,label	
	s_jmp_varAND		size,var,value,label	
	s_jmpNOT_varAND		size,var,value,label	
	s_jmp_ABSalvarmore	size,obj1,alvar,value,label	UNSIGNED
	s_jmp_alvarmore		size,obj1,alvar,value,label	UNSIGNED
	s_jmp_alvarmoreEQ	size,obj1,alvar,value,label	UNSIGNED
	s_jmp_ABSalvarless	size,obj1,alvar,value,label	UNSIGNED
	s_jmp_alvarless		size,obj1,alvar,value,label	UNSIGNED
	s_jmp_alvarlesseq	size,obj1,alvar,value,label	UNSIGNED
	s_jmp_alvarpl		size,obj1,alvar,label
	s_jmp_alvarmi		size,obj1,alvar,label
	s_jmp_alvareq		size,obj1,alvar,value,label
	s_jmp_alvarzero		size,obj1,alvar,label
	s_jmp_alvarNOTzero	size,obj1,alvar,label
	s_jmp_varzero		size,var,label
	s_jmp_varNOTzero	size,var,label
	s_jmp_alvarne		size,obj1,alvar,value,label
	s_jmp_varpl		size,obj1,var,value,label
	s_jmp_varne		size,obj1,var,value,label
	s_jmp_vareq		size,obj1,var,value,label
	s_jmp_varmoreEQ		size,var,value,label	UNSIGNED
	s_jmp_varmore		size,var,value,label	UNSIGNED
	s_jmp_varless		size,var,value,label	UNSIGNED
	s_jmp_alvarOUTLIMIT	size,obj1,alvar,#-+range,label
	s_jmp_alvarINLIMIT	size,obj1,alvar,#-+range,label
	s_beqdec_alvar		size,obj1,alvar,label
	s_beqinc_alvar		size,obj1,alvar,label
	s_decbeq_alvar		size,obj1,alvar,label
	s_decbne_alvar		size,obj1,alvar,label
	s_decbpl_alvar		size,obj1,alvar,label
	s_beqdec_var		size,var,label
	s_beqinc_var		size,var,label
	s_decbne_var		size,var,label
	s_jmp_altype		obj1,#ATflag,label
	s_jmp_alflag		obj1,#AFflag,label
	s_jmpNOT_alflag		obj1,#AFflag,label
	s_jmp_alsflag		obj1,#ASF_flag,label
	s_jmpNOT_alsflag	obj1,#ASF_flag,label
	s_jmp_alcollflag	obj1,#ACF_flag,label
	s_jmpNOT_alcollflag	obj1,#ACF_flag,label
	s_jmp_colltype		obj1,#colltype,label
	s_jmpNOT_colltype	obj1,#colltype,label
	s_jmp_random		label,[#percentage]
	s_jmp_objplayer		obj1,label
	s_jmp_objNOTplayer	obj1,label
	s_jmp_keydown		#key,label
	s_jmp_keyup		#key,label
	s_jmp_anyJkeydown	label
	s_jmp_anyJkeyup		label
	s_jmp_leftofview	obj1,label
	s_jmp_rightofview	obj1,label
	s_jmp_objpointnegZ	obj1,label
	s_jmp_objpointposZ	obj1,label
	s_jmpNOT_objpointnegZ	obj1,label
	s_jmpNOT_objpointposZ	obj1,label
	s_jmp_objptrbad		obj1,label
	s_jmp_objptrok		obj1,label
	s_bra			label
	s_beq			label
	s_bne			label
	s_bpl			label
	s_bmi			label
	s_bcc			label
	s_bcs			label
	s_bcs			label
	s_jmp_ifplayerdead	label
	s_jmp_ifplayeralive	label

- STATE MACROS
	s_set_state		obj1,state
	s_next_state		obj1,[max state]
	s_jmp_IFstate		obj1,#state,label
	s_jmp_IFNOTstate 	obj1,#state,label
	s_set_MAXstate		max state - USED ONLY FOR NEXTSTATE JMP

- MOTHER AND CHILD MACROS.

- These use AL_SBYTE1,AL_SWORD1,AL_PTR	
	
	s_make_mother		obj1
	s_make_child		child number
	s_set_objtobechild	obj2,mother obj,child number
	s_set_objtobemother	obj2,child obj
	s_remove_child		child obj,mother obj
	s_make_childobjpos	shape,child num,x,y,z rel,#strategy ptr,[colltype]
	s_make_childobj		shape,child num,#strategy ptr,[colltype]
	s_count_childs		mother obj,to var BYTE
	s_do_childrelpos	child obj1,#scale
	s_set_relpos		obj1,x,y,z
	s_set_childstate	child num,state  MOTHER in X, puts child in Y
	s_jmp_childdead		child num,label  MOTHER in X, puts child in Y
	s_jmp_childalive	child num,label	 MOTHER in X, puts child in Y

	
	set_sound2		obj,sound port 2 number
	s_dooropen_snd		[#anim frame num]
	s_doorclose_snd		[#anim frame num]



- OTHER ONES.
	s_a16_mode		
	s_a8_mode		
	

- MACROS NOT AVAILABLE TO USER.
	s_chkcoll		obj1
	s_collpos_save		obj
	s_playerfly_mode	name
	s_make_immune

-----------------------------------------------------------------------------
 DEBUG MACROS.
	d_print_alvar		size,obj,alvar,pos code.
	d_print_var		size,var,pos code.



- Notes:

    All size parameters MUST be upper case.
```
# Extra Strat Macros:
```

--------------- Memory macros -------------------------------
	sobj = stack's object (normally same as obj)
	s_mpush		MACRO		[size,sobj,obj,alvar] | [size,sobj,A] | [size,sobj,mem] | [size,sobj,X] | [size,sobj,Y]
	s_mpull		MACRO		[size,sobj,obj,alvar] | [size,sobj,A] | [size,sobj,mem] | [size,sobj,X] | [size,sobj,Y]
	mobj = alien to resource track, Y|X is set to allocated memory address
	s_alloc		MACRO		[mobj,Y|X,amount]
	s_free		MACRO		[mobj,Y|X]

--------------- Animation macros ----------------------------
	s_init_anim	MACRO		obj1,frame
	s_init_colanim	MACRO		obj1,colframe
	s_add_colanim	MACRO		obj1,amount,maxframes[,label][,firstframe][NOJUMP,firstframe]
	s_add_anim		MACRO		obj1,amount,maxframes[,label][,firstframe][NOJUMP,firstframe]
	s_cmp_anim		MACRO		obj1,value
	s_cmp_colanim	MACRO		obj1,value

--------------- Hitflag macros ------------------------------
	s_test_hitflags	MACRO		obj1,mask (e.g. #HF1...HF8)
	s_clr_hitflags	MACRO		obj1,mask (e.g. #HF1...HF8)

--------------- Miscellaneous -------------------------------
	s_implode		MACRO		obj1,strat
	s_bemother		MACRO		obj1
	s_move_objtoend	MACRO		obj
	s_set_path		MACRO		obj,pathname
	s_set_pstrat	MACRO		obj1
	s_text_obj		MACRO		[obj,text,colour[,size]]
	s_sprite_obj	MACRO		[obj,colour,32|64,size]
	s_score		MACRO		[score]

--------------- Strategy mode changing macros ---------------
	s_mode_table	MACRO
	s_mode_entry	MACRO		routine name[,labelname]
	s_mode_label	MACRO		label name
	s_mode_change	MACRO		obj,((ABS modenumber OR #+/-offset)|obj,alvar)
	s_mode_table_end	MACRO

--------------- Colour table macros -------------------------
	s_set_coltab	MACRO	obj,colour table
	s_clr_coltab	MACRO	obj

--------------- Boss HP Meter Macros ------------------------
	s_set_bossmaxHP	MACRO	maxHP | obj,alvar
	s_add_bossHP	macro	([var] | [obj,alvar]), ([offset | []  ] | [obj2,alvar])
	s_add_bossmaxHP	macro	([var] | [obj,alvar]), ([offset | []  ] | [obj2,alvar])

--------------- Extended Children Macros -----------------------
	s_make_childobjrotpos	MACRO	shape,child,x,y,z,rotx,roty,rotz,#strategy ptr,[colltype]
	s_rotpos_child		MACRO	childobj
	s_rotpos_allchildren	MACRO	motherobj
	s_set_childs_sflag		MACRO	motherobj,sflag[,rangebegin,rangeend]|[,child num]
	s_clr_childs_sflag		MACRO	motherobj,sflag[,rangebegin,rangeend]|[,child num]
	s_jmp_childrendead		MACRO	motherobj[,rangebegin,rangeend]|[,child num],label

--------------- UltraStarFox Language extensions -----------------------
	s_becomesprite	[obj] - simplified version of s_sprite_obj
	s_say_msg		[msg] - call a message
	s_camera_lockon	[obj] - lock the camera onto an object
	s_return_camera - return the camera to the player after a lock-on

--------------------------------------------------------------------------
```

# Running a PATH script from a strat

Let's say you want to run a PATH script from a strat.  
first in your strat, add a line with  
```s_set_strat   X,path_istrat```  
then add another line directly after with  
```s_set_path x,(path script name)``` replacing (path script name) with the name of the PATH script you wish to run. (no parentheses)  
What these 2 lines do is stop running the strat, then run the desired PATH script. from your PATH script, you can then return to your strat.

