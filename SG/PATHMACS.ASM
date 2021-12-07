;************************** PATH MACROS *****************************

; MISCELLANEOUS MACROS:
;----------------------
; START_PATH		name		; define the beginning of a path
; P_END                              ; end of path
; P_DEBRIS           shape           ; sets debris explosions to use 'shape'
; P_EXPLODE                          ; explodes the object
; P_REMOVE                           ; remove object
; P_DEBUG                            ; causes 'blink'
; P_SETANIM          value           ; initialise animation to value
; P_ADDANIM          rate,max        ; adds [rate] to animation, max=last frame
; P_SPRITE           colour[,size]   ; makes shape a software sprite
; P_TEXT             addr,color[,size] ; change path type to message
; P_TRAIL            OFF|num         ; (for use with P_TEXT) num = trail colour
; P_TRIGGER          addr,trigger|OFF ; trigger this routine if... (see 'triggers')
; P_FORCE            addr            ; sets address to begin execution AFTER
;                                    ; current trigger routine has finished
;                                    ; (if breaks DO-NEXT, then next RETURN is
;                                    ;  invalid!)
;                                    ; (must be used from within trigger routine)
; P_START65816                       ; begin 65816 code
; P_END65816                         ; end 65816 code
; P_JSL65816         routine         ; call 65816 code
; P_SWITCHOUT        addr            ; switch out of 65816 to specified address
; P_PARTICLES                        ; create particles shower
; P_SOUNDEFFECT      num             ; trigger one-shot sound effect
; P_SOUND            num             ; trigger continuous sound effect
; P_BECOME                           ; becomes the last shape created
; P_BECOMESHAPE                      ; become shape
; P_BECOMEMOTHER                     ; become mother
; P_BECOMECHILD      num             ; become the child specified
;                                    ; this allows access to a child's
;                                    ; variables
; P_UNBECOME                         ; back to normal
; P_SCORE            num             ; add to player's score

; MODE MACROS:
;-------------
; P_RELTOPLAYER      ON|OFF          ; make z relative to player
; P_ALWAYSGENVECS    ON|OFF          ; always generate vectors
; P_SPACESHIP        ON|OFF          ; y rotation is relative to z rotation
; P_HELICOPTER       ON|OFF          ; velocity is relative to x rotation
; P_SMOKE            ON|OFF          ; turn smoke on/off
; P_INVINCIBLE       ON|OFF          ; turn invincibility off or on
; P_ZREMOVE          ON|OFF          ; turns on automatic removal of shape when z<0
; P_INVISIBLE        ON|OFF          ; makes shape invisible and no collisions
; P_HITFLASH         ON|OFF          ; turns hit flash on or off (on is default)
; P_COLLISIONS       ON|OFF          ; turns collision detection on or off
; P_SHADOW           ON|OFF          ; turn shadow on or off (default=on)
; P_BOOST            ON|OFF          ; turn software sprite boost on/off
; P_POLLEN           ON|OFF          ; turn on or off pollen

; FRIEND MACROS:
;---------------
; P_FRIEND                           ; define path as a friend's path
; P_IFFRIEND         friend,address  ; if friend then goes to address
; P_NOTFRIEND        friend,address  ; if not friend then goes to address
; P_MSG              num[,METER]     ; Displays message num (if METER then shows hp)
; P_DAMAGE                           ; takes one 'unit' of damage from friend
; P_ALMOSTDEAD       address         ; if friend is almost dead then goto address

; CREATE MACROS:
;---------------
; P_SPAWN            x,y,z,          ; creates a new path object
;                    xrot,yrot,zrot, ; xyz rotation (relative to original)
;                    shape,path,     ; shape and path name
;                    hp,ap           ; hit points and attack points
;                    [,LINK]         ; links newly created shape
;                    [,n]            ; n = child number (use child macros)
; P_QSPAWN           shape,path,hp,ap; short version of above (x,y,etc = 0)

; GENERAL PROGRAM FLOW MACROS:
;-----------------------------
; P_WAIT             frames          ; wait for some time
; P_GOTO             addr            ; goto specified address (waits one frame)
; P_IGOTO            addr            ; immediately goto specified address
; P_GOSUB            addr|alvar      ; fully nested gosub (alvar must be word)
; P_RETURN                           ; return to gosub call
; P_RANDOMGOTO       addr            ; will go to address (50% of the time)
; P_LOOP             number,address  ; loop to address another 'number' times (0-255)
; P_DO               number|alvar    ; do code until P_NEXT 'number' times (0-65535)
; P_NEXT                             ; repeat DO loop (fully nested)
; P_INEXT                            ; repeat DO loop (fully nested) (immediately)
; P_BREAK            [address]       ; break DO-NEXT loop goto address (kaitara)
; P_IFLEVEL          number,address  ; if level=number then go to address
; P_IFNOTLEVEL       number,address  ; if level!=number then go to address
; P_HITGROUND        ground,address  ; when hits [ground] (normally 0) goes to address
; P_NOTHITGROUND     ground,address  ; if not hitting [ground] (normally 0) goes to addr
; P_HITWALL          address         ; goes to the address when hits tunnel walls
; P_SETSTRAT         address         ; sets normal strategy (active immediately)
; P_IFHITFLAG        addr[,1[,2]]... ; check for hitflags (and clear them)
;                                    ; if none specified.. checks for any hitflag

; PLAYER CONDITIONAL MACROS:
;---------------------------
; P_PLAYERDEAD       address         ; if player is dead then go to address
; P_LEFTOFPLAYER     address         ; if left of player go to address
; P_RIGHTOFPLAYER    address         ; if right of player go to address
; P_ABOVEPLAYER      address         ; if above player go to address
; P_BELOWPLAYER      address         ; if below player go to address
; P_BEHINDPLAYER     address         ; if behind player go to address
; P_WAITFACEPLAYER                   ; turns to face the player (until finished)
; P_FACEPLAYER                       ; face player (1 stage - use with LOOP or GOTO)
; P_GOTOPOS          x,y,z,maxspeed  ; goes to position relative to player
; P_DISTLESS         value,address   ; when distance from player < value, goto address
; P_DISTMORE         value,address   ; when distance from player > value, goto address
; P_WITHINRADIUS     radius,address  ; when player is within the specified radius

; WEAPON MACROS:
;---------------
; P_WEAPON           weaponname      ; sets default weapon for path object
; P_FIRE             [CANHIT]        ; fires default weapon
; P_FIRE             ATPLAYER,[CANHIT] ; fires default weapon at player
; P_FIRE             ATSHAPE,[CANHIT]  ; fires default weapon at found shape

; VARIABLE MACROS:
;-----------------
; P_CHASE            var,value       ; smoothly set var to value (use with LOOP command)
; P_WAITCHASE        var,value       ; smoothly set var to value (wait until finished)
; P_SET              var,value       ; immediately set var
; P_SET              var1,var2       ; set var1 to var2
; P_ZERO             var             ; zero var
; P_SETRANDOM        var[,rndmask]   ; set var to random value
;                                    ; (rndmask = 1,3,7,15,31...65535)
; P_ADD              var,value       ; add value to var (sign extended if nec.)
; P_ADD              var,var         ; add var to var (sign extended if nec.)
; P_INC              var             ; increment var by 1
; P_DEC              var             ; decrement var by 1
; P_NEG              var             ; negate var
; P_DIV2             var             ; signed divide by 2
; P_SETVEL           velocity        ; change speed (will regenerate vectors)
; P_ACCEL            velocity,rate   ; change speed by rate (smooth setvel)
; P_IFSAME           var,value,addr  ; if var=value then go to addr
; P_IFNOTSAME        var,value,addr  ; if var!=value then go to addr
; P_IFZERO           var,addr        ; if var=0 then go to addr
; P_IFNOTZERO        var,addr        ; if var!=0 then go to addr
; P_IFBETWEEN        min,var,max,adr ; if min>var>max then go to addr
; P_IFNOTBETWEEN     min,var,max,adr ; if min<var or var>max then go to addr
; P_IMPORT           var,global var  ; var = global var
; P_EXPORT           global var,var  ; global var = var
;                                    ; global var must be same size as var...
;                                    ; ie. a byte=byte or word=word
;                                    ; see 'global variables'
; P_INDEX            dest,table,index; takes a value from a table (see tables)
; P_PUSH             var             ; pushes var onto the stack
; P_PULL             var             ; pulls var from the stack (see stack)

; LINKING MACROS:
;----------------
; P_FINDSHAPE        shape           ; finds the shape specified
; P_LINK             shape           ; link this path to the next path created
; P_FINDNEXTSHAPE    shape           ; finds the next closest shape specified
; P_FACESHAPE                        ; faces the previously found shape
; P_GOTOSHAPEPOS     x,y,z,maxspeed  ; goes to position relative to found shape
; P_IMMUNE                           ; stops collisions between the found shape (reset if weapon fired)
; P_SHAPEDISTLESS    value,address   ; when distance from shape < value, goto address
; P_SHAPEDEAD        address         ; if shape is dead, goes to address
; P_SPAWN            ...,LINK        ; see spawn command above
; P_FLAGSHAPE                        ; set flag for linked shape
;                                    ; (only if linked shape is path obj)
; P_IFFLAG           address         ; if flag set goto address (clears flag)
; P_SHAPEINRADIUS    radius,address  ; when linked shape is within the specified radius

; CHILD MACROS:
;--------------
; P_SPAWN            ...,n           ; see spawn command above
; P_CHILDDEAD        n,address       ; if CHILD n is dead, goto address
; P_FLAGCHILD        n               ; flag child (from child or mother)
; P_FLAGMOTHER                       ; flag mother (from child)
; P_IFFLAG           address         ; if flag set goto address (clears flag)
; P_UNLINKCHILD      n               ; make child into normal object
; P_REMOVE           n               ; remove child n

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Note #1: NEVER use FINDSHAPE, LINK, or FINDNEXTSHAPE with CHILD macros
; Note #2: P_GOTO P_NEXT, and P_LOOP AUTOMATICALLY do a P_WAIT 1
; Note #3: P_TRIGGER should NOT be used from within a trigger subroutine
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; valid 'var's are:
;
;                    worldx          ; object's x
;                    worldy          ; object's y
;                    rotx            ; object's x rotation
;                    roty            ; object's y rotation
;                    rotz            ; object's z rotation
;                    hp              ; object's hp
;                    ap              ; object's ap
;                    shape           ; object's shape
;                    coltab          ; object's colour table
;                    tx              ; texture map x coordinate (or sprite size)
;                    ty              ; texture map y coordinate
;---------------------------------------------------------------------
; vars available for child macros:
;
;                    childx          ; relative x
;                    childy          ; relative y
;                    childz          ; relative z (relative to mother)
;                    childrotx       ; x rotation
;                    childroty       ; y rotation
;                    childrotz       ; z rotation
;---------------------------------------------------------------------
; temporary variables available for use are:
;
;                    pbyte1          ; temporary byte #1
;                    pbyte2          ; temporary byte #2
;                    pword1          ; temporary word #1
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; current valid weapons are: (for use with P_WEAPON)
;
;   SlowElaser         - Elaser (use for ground based objects)
;   RelSlowElaserHome  - Relative slow laser (homes towards player)
;   RelSlowElaser      - Relative slow laser
;   hmissile1          - Normal homing missile
;   chickhmissile1     - Chicken missile
;   missile1           - Straight firing missile
;   plasma             - Plasma ball
;   shortplasma        - Plasma ball (disappears quicker)
;   Hplasma            - Homing plasma ball
;   ovalbeam           - Oval (ellipse) beam
;   ringlaser          - Ring laser
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; current valid triggers (for the P_TRIGGER instruction):
; TRIGGER should not use P_WAIT, P_GOTO, P_LOOP, P_WAITxxxx
; (anything which causes the next game frame to be displayed)
; (doing so will cause a blue BLINK |^) )
;
;   Always             - calls the routine on every game frame
;   2,4,8,...,128      - ... once every n frames
;   WhenHit            - ... if hit
;   WhenHitByPlayer    - ... if shot by player
;   WhenFlagged        - ... if flag is set (clears the flag automatically)
;   WhenDead           - ... if hp=0 (explodes regardless- but you can spawn)
;   WhenShapeDead      - ... if the LINK'd or FOUND shape dies
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Global Variables:
;
; Global variables are available for use by all strategies; they are
; completely independent of the strategy that uses them.. ie. if one
; strategy changes a global variable, another strategy can read or change
; it.  Use IMPORT to copy a global variable into an alien variable.
; Use EXPORT to copy an alien variable into a global variable.
; Global variables available for use:
;
;   gbyte1        = global byte 1
;   gbyte2        = global byte 2
;   gbyte3        = global byte 3
;   gword1        = global word 1
;   gword2        = global word 2
;   gword3        = global word 3
;
; NOTE: you can ONLY copy a byte into a byte or a word into a word, ie.
; you cannot copy a byte into a word or vice versa.
;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Tables:
;
; The INDEX feature allows you to retrieve data from tables.  The index
; should be a byte alien variable, if it is a word then only the bottom
; 8 bits are utilised.
; If the destination is a word then the index is automatically multiplied
; by 2 assuming you are indexing into a table of words.
;
; There are some default tables you can use:
;
;   sintab - sine table (index should be 0-255, destination must be a byte)
;   costab - cosine table (index should be 0-255, destination must be a byte)
;
; eg.
;   P_SET   pbyte1,5
;   P_INDEX pword1,mytab,pbyte1
;   ...
; mytab
;   dw      0,500,400,300,200,400,500
;
; This will set pword1 to equal mytab+5*2 (400)
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; The Stack:
;
; The stack is used for DO-NEXT loops and GOSUB-RETURN subroutines.
; It is also used for the PUSH/PULL commands therefore there is of
; course some possibility of a clash.  You cannot PULL a variable
; from a level different to that from which it was PUSHed.
; ie.  P_DO    5
;      P_PUSH  pbyte1
;      ...
;      P_PULL  pbyte1
;      P_NEXT
; is valid, but:
;      P_DO    5
;      P_PUSH  pbyte1
;      ...
;      P_NEXT
;      P_PULL  pbyte1
; is invalid and will probably crash
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


;--------------------------------------------------------------------


getparam	macro	[offset]
	jsr	getparam{offset}
	endm

getparam_codegen	macro	[offset]
getparam{offset}
	phx
	phy
	ldy	al_sword2,x
	tyx
	lda.l	paths+{offset},x
	ply
	plx
	rts
	endm

;--------------------------------------------------------------------

; nullify path info macros:
	IFEQ	pathinfo

pathmac_start	MACRO
	ENDM
;--------------------------------------------------------------------
pathmac_end	MACRO
	ENDM

;--------------------------------------------------------------------
	ELSEIF
; path info macros:

	FOPEN	pathinfo.asm
	printf	"; ------------ PATH MACRO INFORMATION ------------%n"
	FCLOSE

;--------------------------------------------------------------------
pathmac_start	MACRO
	run	" IFND pathmac_%c"

	FOPEN	+pathinfo.asm

	printf	" printf %q%c: %q,pathmac_%c,%q %q,pathmacmem_%c,%q%%n%q%n"
	
	FCLOSE

	run	"pathmac_%c = 1"
	run	"pathmacmem_%c = 0"

	ELSEIF

	run	"pathmac_%c = pathmac_%c+1"
	ENDC
__pms	=	*

		ENDM
;--------------------------------------------------------------------
pathmac_end	MACRO
	run	"pathmacmem_%c = pathmacmem_%c+*-__pms"
	ENDM

;--------------------------------------------------------------------

	ENDC

;--------------------------------------------------------------------

addalvaroffset	MACRO	[param]
	IFNE	LONGA
	printf	"addalvaroffset needs a8 %l%n"
	ENDC
	stx	pathx1
	getparam	{param}
	jsr	.addalvaroffset
		ENDM
	
	

;--------------------------------------------------------------------

psetalvars	MACRO	[code,alvar,var]
	IFEQ	size_al_{alvar}-1
	IFEQ	size_al_{var}-1
	db	p_{code}BB
	ELSEIF
	db	p_{code}BW
	ENDC
	ELSEIF

	IFEQ	size_al_{var}-1
	db	p_{code}WB
	ELSEIF
	db	p_{code}WW
	ENDC
	ENDC

	PALVAROFFSET	{alvar}
	PALVAROFFSET	{var}

	ENDM
;--------------------------------------------------------------------

numpaths	=	0

start_path	MACRO	[name]

p{name}
path_{name}	equ	*-paths

numpaths	=	numpaths+1
	ENDM

;--------------------------------------------------------------------
PCHKSIZE	MACRO	[alvar,size]
	defs	1,"word"
	IFEQ	{size}-1
	defs	1,"byte"
	ENDC

	IFNE	size_al_{alvar}-{size}
	printf	"%00%31%01Error: Size of alvar must be a %$1 (%l: %c).%n%00"
	ENDC
	ENDM
;--------------------------------------------------------------------
PNARG	MACRO	[n1,n2]
	IFEQ	NARG-1
	IFNE	MYNARG-{n1}
	printf	"%00%31%01Error: Incorrect parameters specified (%l: %c).%n%00"
	fail
	ENDC
	ELSEIF
	IFNE	MYNARG<{n1}
	printf	"%00%31%01Error: Incorrect parameters specified (%l: %c).%n%00"
	fail
	ENDC
	IFNE	MYNARG>{n2}
	printf	"%00%31%01Error: Incorrect parameters specified (%l: %c).%n%00"
	fail
	ENDC
	ENDC
	ENDM

;--------------------------------------------------------------------
PALVAR	MACRO	[alvar]
	IFND	al_{alvar}
	printf	"%00%31%01Error: No such alien variable - {alvar} (%l: %c).%n%00"
	fail
	ENDC
	ENDM

;--------------------------------------------------------------------
PALVAROFFSET	MACRO	[alvar]
	IFEQ	al_{alvar}&$ffffff00
	db	al_{alvar}
	ELSEIF
	db	(al_{alvar}-alx_start)!128
	ENDC
	ENDM
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------

P_RELTOPLAYER	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_reltoplayer{onoff}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_INVISIBLE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_invisible{onoff}

	pathmac_end
		ENDM


;--------------------------------------------------------------------

P_SPACESHIP		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_spaceship{onoff}

	pathmac_end
		ENDM


;--------------------------------------------------------------------

P_HELICOPTER		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_zaco{onoff}

	pathmac_end
		ENDM



;--------------------------------------------------------------------
P_WAIT		MACRO	[numframes]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFC	"{numframes}","1"
	db	p_wait1
	ELSEIF
	db	p_wait
	db	{numframes}
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_ALWAYSGENVECS	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_alwaysgenvecs{onoff}

	pathmac_end
	ENDM

;--------------------------------------------------------------------

P_SETVEL		MACRO	[velocity]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_setvel
	db	{velocity}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_LOOP		MACRO	[number,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_loop
	db	{number}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_INC	MACRO	[alvar]
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_incb
	ELSEIF
	db	p_incw
	ENDC

	PALVAROFFSET	{alvar}

	ENDM
;--------------------------------------------------------------------
P_DEC	MACRO	[alvar]
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_decb
	ELSEIF
	db	p_decw
	ENDC

	PALVAROFFSET	{alvar}

	ENDM

;--------------------------------------------------------------------

P_ADD		MACRO	[alvar,num]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	PALVAR	{alvar}

	IFC	"1","{num}"
	P_INC	{alvar}
	ELSEIF
	IFC	"-1","{num}"
	P_DEC	{alvar}
	ELSEIF

	IFD	al_{num}

	psetalvars	<addv>,{alvar},{num}

	ELSEIF

	IFEQ	size_al_{alvar}-1
padddone	=	0

	IFEQ	al_rotx-al_{alvar}
padddone	=	1
	db	p_addrotx
	ENDC

	IFEQ	al_roty-al_{alvar}
padddone	=	1
	db	p_addroty
	ENDC

	IFEQ	al_rotz-al_{alvar}
padddone	=	1
	db	p_addrotz
	ENDC

	IFEQ	padddone
	db	p_addb
	PALVAROFFSET	{alvar}
	ENDC

	db	{num}
	ELSEIF
padddone	=	0

	IFEQ	({num}+128)&$ffffff00

	IFEQ	al_worldx-al_{alvar}
padddone	=	1
	db	p_addworldx
	ENDC

	IFEQ	al_worldy-al_{alvar}
padddone	=	1
	db	p_addworldy
	ENDC

	IFEQ	al_worldz-al_{alvar}
padddone	=	1
	db	p_addworldz
	ENDC

	IFEQ	padddone
	db	p_addws
	PALVAROFFSET	{alvar}
	ENDC
	db	{num}

	ELSEIF

	db	p_addw
	PALVAROFFSET	{alvar}
	dw	{num}
	ENDC

	ENDC

	ENDC
	ENDC
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_FACEPLAYER		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_faceplayer

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_WAITFACEPLAYER		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_waitfaceplayer

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_FIRELASER		MACRO	[option]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	P_WEAPON	RELSLOWELASER
	P_FIRE		{option}

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_FIREMISSILE	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	P_WEAPON	HMISSILE1
	P_FIRE		ATPLAYER

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_CHASE		MACRO	[alvar,val]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_achaseB
	db	{val}
	PALVAROFFSET	{alvar}
	ELSEIF
	db	p_achaseW
	dw	{val}
	PALVAROFFSET	{alvar}
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_WAITCHASE		MACRO	[alvar,val]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_waitachaseB
	db	{val}
	PALVAROFFSET	{alvar}
	ELSEIF
	db	p_waitachaseW
	dw	{val}
	PALVAROFFSET	{alvar}
	ENDC


	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_END		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_end
	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_SET		MACRO	[alvar,val]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFC	"{val}","0"

	P_ZERO	{alvar}

	ELSEIF

	IFD	al_{val}
; set alvar to another alvar

	psetalvars	setv,{alvar},{val}

	ELSEIF
; set alvar to immediate
	IFEQ	size_al_{alvar}-1
	db	p_setb
	db	{val}
	PALVAROFFSET	{alvar}
	ELSEIF
	db	p_setw
	dw	{val}
	PALVAROFFSET	{alvar}
	ENDC

	ENDC
	ENDC
	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_ZERO		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFEQ	size_al_{alvar}-1
	db	p_set0b
	ELSEIF
	db	p_set0w
	ENDC

	PALVAROFFSET	{alvar}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_FINDSHAPE		MACRO	[shape]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_findshape
	dw	{shape}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_FINDNEXTSHAPE	MACRO	[shape]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_findnextshape
	dw	{shape}

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_FACESHAPE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_faceshape
	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_EXPLODE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_explode

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_REMOVE		MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	IFEQ	NARG
	db	p_remove
	ELSEIF
	db	p_removechild
	db	{child}
	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------


P_GOTOPOS		MACRO	[x,y,z,speed]
	pathmac_start
MYNARG	=	NARG
	PNARG	4

	db	p_gotopos
	dw	{x},{y},{z}
	db	{speed}

	pathmac_end
		ENDM

;--------------------------------------------------------------------


P_GOTOSHAPEPOS	MACRO	[x,y,z,speed]
	pathmac_start
MYNARG	=	NARG
	PNARG	4

	db	p_gotoshapepos
	dw	{x},{y},{z}
	db	{speed}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_IMMUNE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_immune

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_GOTO		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_goto
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IGOTO		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_igoto
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DISTLESS		MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_distless
	dw	{value}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEDISTLESS	MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_shapedistless
	dw	{value}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DISTMORE		MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_DISTLESS	{value},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEDISTMORE	MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_SHAPEDISTLESS	{value},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ACCEL		MACRO	[speed,rate]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_accel
	db	{speed}
	db	{rate}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_HITGROUND		MACRO	[groundheight,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_hitground
	dw	{groundheight}
	dw	{addr}-paths

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_NOTHITGROUND		MACRO	[groundheight,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_HITGROUND	{groundheight},{addr}

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_HITWALL		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_hitwall
	dw	{addr}-paths

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_SETANIM		MACRO	[value]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_initanim
	db	{value}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ADDANIM		MACRO	[rate,limit]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_addanim
	db	{rate},{limit}
	

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DEBRIS		MACRO	[shape]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_debris
	dw	{shape}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FRIEND		MACRO	[friend]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	IFEQ	NARG-1
	db	p_friend
	db	friend_{friend}
	ELSEIF
	db	p_friend
	db	friend_anyone
	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_LINK		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_link

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEDEAD		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_shapedead
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFLEVEL		MACRO	[level,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_iflevel
	db	{level}
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFNOTLEVEL		MACRO	[level,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_IFLEVEL	{level},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_LEFTOFPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_leftofplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_RIGHTOFPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_rightofplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BEHINDPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_behindplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ABOVEPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_aboveplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BELOWPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_belowplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_NOTFRIEND		MACRO	[friend,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_notfriend
	db	friend_{friend}
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFFRIEND		MACRO	[friend,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_NOTFRIEND	{friend},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
pm__meter
P_MSG		MACRO	[msg,meter]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2

	IFND	pm__{meter}
	db	p_msg
	ELSEIF
	db	p_msgwithmeter
	ENDC
	db	{msg}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DAMAGE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_damage
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ALMOSTDEAD		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_almostdead
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SMOKE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_smoke{onoff}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_RANDOMGOTO		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_randomgoto
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFSAME		MACRO	[alvar,val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	3
	PALVAR	{alvar}

	IFC	"{val}","0"

	P_IFZERO	{alvar},{addr}

	ELSEIF

	IFEQ	size_al_{alvar}-1
	db	p_ifsameb
	PALVAROFFSET	{alvar}
	db	{val}
	dw	{addr}-paths
	ELSEIF
	db	p_ifsamew
	PALVAROFFSET	{alvar}
	dw	{val}
	dw	{addr}-paths
	ENDC

	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_IFZERO		MACRO	[alvar,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_ifzerob
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ELSEIF
	db	p_ifzerow
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_IFNOTZERO		MACRO	[alvar,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_ifnotzerob
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ELSEIF
	db	p_ifnotzerow
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_IFNOTSAME		MACRO	[alvar,val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	3
	PALVAR	{alvar}

	IFC	"0","{val}"

	P_IFNOTZERO	{alvar},{addr}

	ELSEIF

	db	p_ifnot

	P_IFSAME	{alvar},{val},{addr}

	ENDC

	pathmac_end
		ENDM


;--------------------------------------------------------------------
P_IFBETWEEN		MACRO	[val1,alvar,val2,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	4
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_ifbetweenB
	PALVAROFFSET	{alvar}
	db	{val1},{val2}
	dw	{addr}-paths
	ELSEIF
	db	p_ifbetweenW
	PALVAROFFSET	{alvar}
	dw	{val1},{val2}
	dw	{addr}-paths
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFNOTBETWEEN	MACRO	[val1,alvar,val2,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	4
	PALVAR	{alvar}

	db	p_ifnot

	P_IFBETWEEN	{val1},{alvar},{val2},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_INVINCIBLE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_invincible{onoff}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ZREMOVE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_zremove{onoff}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_PLAYERDEAD		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_playerdead
	dw	{addr}-paths
	pathmac_end
		ENDM

;--------------------------------------------------------------------
__psp_link	equ	0
__psp_	equ	0

P_SPAWN		MACRO	[x,y,z,xrot,yrot,zrot,shape,path,hp,ap,linkonoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	10,11

	IFD	__psp_{linkonoff}
	db	p_spawn{linkonoff}
	ELSEIF
	db	p_spawnchild
	ENDC

	dw	{shape}
	dw	path_{path}
	db	{xrot},{yrot},{zrot}
	db	{hp},{ap}
	db	({x})/4,({y})/4,({z})/4

	IFND	__psp_{linkonoff}
	db	{linkonoff}
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_QSPAWN		MACRO	[shape,path,hp,ap]
	pathmac_start
MYNARG	=	NARG
	PNARG	4
	db	p_qspawn
	dw	{shape}
	dw	path_{path}
	db	{hp},{ap}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DEBUG		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_debug
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_WEAPON		MACRO	[weapon]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_weapon
	db	WEAPON_{weapon}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
pft_canhit	=	0
pft_	=	0
pft_atplayer	=	0
pft_atshape	=	0
P_FIRE		MACRO	[opt1,opt2]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,2

	IFNE	NARG<2
	db	p_fire{opt1}
	ELSEIF
	db	p_fire{opt1}{opt2}
	ENDC


	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_CHILDDEAD		MACRO	[child,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_childdead
	db	{child}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_LINKCHILD		MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_linkchild
	db	{child}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FLAGCHILD		MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_flagchild
	db	{child}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FLAGMOTHER		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_flagmother

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFFLAG		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_ifflag
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FLAGSHAPE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_flagshape

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_TEXT		MACRO	[text,colour,size]
	pathmac_start
MYNARG	=	NARG
	PNARG	2,3
	db	p_text
	dw	{text}&WM
	db	{colour}
	IFEQ	NARG-3
	db	{size}
	ELSEIF
	db	0
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
pt_off
P_TRAIL		MACRO	[colour]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_trail
	IFD	pt_{colour}
	db	0
	ELSEIF
	db	{colour}
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_GOSUB		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	IFD	al_{addr}
	PCHKSIZE	{addr},2
	db	p_gosubalvar
	PALVAROFFSET	{addr}
	ELSEIF
	db	p_gosub
	dw	{addr}-paths
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_RETURN		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_return
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DO		MACRO	[num]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFD	al_{num}
	IFEQ	size_al_{num}-1
	db	p_doalvarb
	ELSEIF
	db	p_doalvarw
	ENDC
	PALVAROFFSET	{num}
	ELSEIF

	IFEQ	({num})&$ffffff00
	db	p_doq
	db	{num}
	ELSEIF
	db	p_do
	dw	{num}
	ENDC
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_NEXT		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_next
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_INEXT		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_inext
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BREAK		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1
	IFEQ	NARG-1
	db	p_break
	dw	{addr}-paths
	ELSEIF
	db	p_breakc
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------

; timing triggers:

trigger_always	equ	0
trigger_2		equ	1
trigger_4		equ	2
trigger_8		equ	3
trigger_16		equ	4
trigger_32		equ	5
trigger_64		equ	6
trigger_128		equ	7

; event triggers:

trigger_whenhit	equ	8
trigger_whenhitbyplayer equ	9
trigger_whenflagged	equ	10
trigger_whenshapedead equ	11
trigger_whendead	equ	12

trigger_off		equ	-1

P_TRIGGER		MACRO	[addr,trigger]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2

	IFEQ	trigger_off-trigger_{trigger}
	db	p_alwaysoff
	dw	{addr}-paths
	ELSEIF
	
	db	p_always
	dw	{addr}-paths
	db	trigger_{trigger}

	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FORCE	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_force
	dw	{addr}-paths
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SPRITE	MACRO	[colour,size]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2

	db	p_sprite
	db	{colour}
	IFEQ	NARG-2
	db	{size}
	ELSEIF
	db	0
	ENDC

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_HITFLASH	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_hitflash{onoff}
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SETSTRAT	MACRO	[strat]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_setstrat
	dw	{strat}&WM
	db	{strat}>>16
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_NEG	MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_negB
	dw	al_{alvar}
	ELSEIF
	db	p_negW
	dw	al_{alvar}
	ENDC
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SETRANDOM	MACRO	[alvar,rndmask]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2
	PALVAR	{alvar}

	IFEQ	NARG-1

	IFEQ	size_al_{alvar}-1
	db	p_setrandomB
	dw	al_{alvar}
	db	-1
	ELSEIF
	db	p_setrandomW
	dw	al_{alvar}
	dw	-1
	ENDC

	ELSEIF

	IFEQ	size_al_{alvar}-1
	db	p_setrandomB
	dw	al_{alvar}
	db	{rndmask}
	ELSEIF
	db	p_setrandomW
	dw	al_{alvar}
	dw	{rndmask}
	ENDC

	
	ENDC

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_IFHITFLAG	MACRO	[addr,1,2,3,4,5,6,7,8]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,9

	db	p_ifhitflag
	dw	{addr}-paths
	IFEQ	NARG-1
pifhitmask	=	255
	ELSEIF
pifhitmask	=	0
	REPT	NARG-1
	irs	1,"{1}","{2}","{3}","{4}","{5}","{6}","{7}","{8}"
	run	"pifhitmask = pifhitmask!(1<<(%$1-1)"
	ENDR
	ENDC

	printf	pifhitmask,"%n"
	db	pifhitmask

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_COLLISIONS	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_collisions{onoff}

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SHADOW	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_shadow{onoff}

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_START65816	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_start65816
	SHORTA
	LONGI
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_END65816	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	a16
	lda	#.\@-paths
	rtl
.\@
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SWITCHOUT	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFEQ	LONGA
	lda	#({addr}-paths)>>8
	xba
	lda	#({addr}-paths)&255
	ELSEIF
	lda	#{addr}-paths
	ENDC
	rtl
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_PARTICLES	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_particle

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SOUNDEFFECT	MACRO	[sound]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_sound
	db	{sound}

	pathmac_end
	ENDM

;--------------------------------------------------------------------
P_SOUND	MACRO	[sound]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_sound2
	db	{sound}

	pathmac_end
	ENDM
	
;--------------------------------------------------------------------
P_UNLINKCHILD	MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	IFEQ	NARG-1
	db	p_unlinkchild
	db	{child}
	ELSEIF
	db	p_unlinkself
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IMPORT		MACRO	[alvar,var]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_importb
	ELSEIF
	db	p_importw
	ENDC
	PALVAROFFSET	{alvar}
	dw	{var}&WM
	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_EXPORT		MACRO	[var,alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_exportb
	ELSEIF
	db	p_exportw
	ENDC
	PALVAROFFSET	{alvar}
	dw	{var}&WM
	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_DIV2		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_div2b
	ELSEIF
	db	p_div2w
	ENDC

	dw	al_{alvar}

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_INDEX		MACRO	[alvar,table,index]
	pathmac_start
MYNARG	=	NARG
	PNARG	3
	PALVAR	{alvar}
	PALVAR	{index}

	IFEQ	size_al_{alvar}-1
	db	p_indexb
	ELSEIF
	db	p_indexw
	ENDC

	dw	{table}&WM
	db	{table}>>16
	dw	al_{index}
	dw	al_{alvar}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_PUSH		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_pushb
	ELSEIF
	db	p_pushw
	ENDC

	PALVAROFFSET	{alvar}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_PULL		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_pullb
	ELSEIF
	db	p_pullw
	ENDC

	PALVAROFFSET	{alvar}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_WITHINRADIUS	MACRO	[val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	db	p_withinrange
	dw	{val}
	dw	{addr}-paths
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEINRADIUS	MACRO	[val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	db	p_shapeinrange
	dw	{val}
	dw	{addr}-paths
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_JSL65816		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	P_START65816
	jsl	{addr}
	P_END65816
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BOOST		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	P_GOSUB	pboost{onoff}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BECOMECHILD	MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_becomechild
	db	{child}
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BECOMEMOTHER	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_becomemother
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BECOMESHAPE	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_becomeshape
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_UNBECOME		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_unbecome
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_BECOME		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_become
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SETCOLANIM		MACRO	[val]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	P_START65816
	s_init_colanim	x,#{val}
	P_END65816

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_ADDCOLANIM		MACRO	[val,endval]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	P_START65816
	s_add_colanim	x,#{val},#{endval}
	P_END65816

	pathmac_end
		ENDM

;--------------------------------------------------------------------
pollenon	=	0
pollenoff	=	1
P_POLLEN		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFEQ	pollen{onoff}
	P_JSL65816	makepollen_srou_l
	ELSEIF
	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SCORE	MACRO	[score]
	pathmac_start
	IFNE	contest
MYNARG	=	NARG
	PNARG	1

	db	p_score
	dw	{score}

	ENDC
	pathmac_end
	ENDM
;--------------------------------------------------------------------



