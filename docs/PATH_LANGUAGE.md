# Path Language Documentation (from PATHMACS.ASM)
```
************************** PATH MACROS *****************************

 MISCELLANEOUS MACROS:
----------------------
 START_PATH		name		 define the beginning of a path
 P_END                               end of path
 P_DEBRIS           shape            sets debris explosions to use 'shape'
 P_EXPLODE                           explodes the object
 P_REMOVE                            remove object
 P_DEBUG                             causes 'blink'
 P_SETANIM          value            initialise animation to value
 P_ADDANIM          rate,max         adds [rate] to animation, max=last frame
 P_SPRITE           colour[,size]    makes shape a software sprite
 P_TEXT             addr,color[,size]  change path type to message
 P_TRAIL            OFF|num          (for use with P_TEXT) num = trail colour
 P_TRIGGER          addr,trigger|OFF  trigger this routine if... (see 'triggers')
 P_FORCE            addr             sets address to begin execution AFTER
                                     current trigger routine has finished
                                     (if breaks DO-NEXT, then next RETURN is
                                      invalid!)
                                     (must be used from within trigger routine)
 P_START65816                        begin 65816 code
 P_END65816                          end 65816 code
 P_JSL65816         routine          call 65816 code
 P_SWITCHOUT        addr             switch out of 65816 to specified address
 P_PARTICLES                         create particles shower
 P_SOUNDEFFECT      num              trigger one-shot sound effect
 P_SOUND            num              trigger continuous sound effect
 P_BECOME                            becomes the last shape created
 P_BECOMESHAPE                       become shape
 P_BECOMEMOTHER                      become mother
 P_BECOMECHILD      num              become the child specified
                                     this allows access to a child's
                                     variables
 P_UNBECOME                          back to normal
 P_SCORE            num              add to player's score

 MODE MACROS:
-------------
 P_RELTOPLAYER      ON|OFF           make z relative to player
 P_ALWAYSGENVECS    ON|OFF           always generate vectors
 P_SPACESHIP        ON|OFF           y rotation is relative to z rotation
 P_HELICOPTER       ON|OFF           velocity is relative to x rotation
 P_SMOKE            ON|OFF           turn smoke on/off
 P_INVINCIBLE       ON|OFF           turn invincibility off or on
 P_ZREMOVE          ON|OFF           turns on automatic removal of shape when z<0
 P_INVISIBLE        ON|OFF           makes shape invisible and no collisions
 P_HITFLASH         ON|OFF           turns hit flash on or off (on is default)
 P_COLLISIONS       ON|OFF           turns collision detection on or off
 P_SHADOW           ON|OFF           turn shadow on or off (default=on)
 P_BOOST            ON|OFF           turn software sprite boost on/off
 P_POLLEN           ON|OFF           turn on or off pollen

 FRIEND MACROS:
---------------
 P_FRIEND                            define path as a friend's path
 P_IFFRIEND         friend,address   if friend then goes to address
 P_NOTFRIEND        friend,address   if not friend then goes to address
 P_MSG              num[,METER]      Displays message num (if METER then shows hp)
 P_DAMAGE                            takes one 'unit' of damage from friend
 P_ALMOSTDEAD       address          if friend is almost dead then goto address

 CREATE MACROS:
---------------
 P_SPAWN            x,y,z,           creates a new path object
                    xrot,yrot,zrot,  xyz rotation (relative to original)
                    shape,path,      shape and path name
                    hp,ap            hit points and attack points
                    [,LINK]          links newly created shape
                    [,n]             n = child number (use child macros)
 P_QSPAWN           shape,path,hp,ap short version of above (x,y,etc = 0)

 GENERAL PROGRAM FLOW MACROS:
-----------------------------
 P_WAIT             frames           wait for some time
 P_GOTO             addr             goto specified address (waits one frame)
 P_IGOTO            addr             immediately goto specified address
 P_GOSUB            addr|alvar       fully nested gosub (alvar must be word)
 P_RETURN                            return to gosub call
 P_RANDOMGOTO       addr             will go to address (50% of the time)
 P_LOOP             number,address   loop to address another 'number' times (0-255)
 P_DO               number|alvar     do code until P_NEXT 'number' times (0-65535)
 P_NEXT                              repeat DO loop (fully nested)
 P_INEXT                             repeat DO loop (fully nested) (immediately)
 P_BREAK            [address]        break DO-NEXT loop goto address (kaitara)
 P_IFLEVEL          number,address   if level=number then go to address
 P_IFNOTLEVEL       number,address   if level!=number then go to address
 P_HITGROUND        ground,address   when hits [ground] (normally 0) goes to address
 P_NOTHITGROUND     ground,address   if not hitting [ground] (normally 0) goes to addr
 P_HITWALL          address          goes to the address when hits tunnel walls
 P_SETSTRAT         address          sets normal strategy (active immediately)
 P_IFHITFLAG        addr[,1[,2]]...  check for hitflags (and clear them)
                                     if none specified.. checks for any hitflag

 PLAYER CONDITIONAL MACROS:
---------------------------
 P_PLAYERDEAD       address          if player is dead then go to address
 P_LEFTOFPLAYER     address          if left of player go to address
 P_RIGHTOFPLAYER    address          if right of player go to address
 P_ABOVEPLAYER      address          if above player go to address
 P_BELOWPLAYER      address          if below player go to address
 P_BEHINDPLAYER     address          if behind player go to address
 P_WAITFACEPLAYER                    turns to face the player (until finished)
 P_FACEPLAYER                        face player (1 stage - use with LOOP or GOTO)
 P_GOTOPOS          x,y,z,maxspeed   goes to position relative to player
 P_DISTLESS         value,address    when distance from player < value, goto address
 P_DISTMORE         value,address    when distance from player > value, goto address
 P_WITHINRADIUS     radius,address   when player is within the specified radius

 WEAPON MACROS:
---------------
 P_WEAPON           weaponname       sets default weapon for path object
 P_FIRE             [CANHIT]         fires default weapon
 P_FIRE             ATPLAYER,[CANHIT]  fires default weapon at player
 P_FIRE             ATSHAPE,[CANHIT]   fires default weapon at found shape

 VARIABLE MACROS:
-----------------
 P_CHASE            var,value        smoothly set var to value (use with LOOP command)
 P_WAITCHASE        var,value        smoothly set var to value (wait until finished)
 P_SET              var,value        immediately set var
 P_SET              var1,var2        set var1 to var2
 P_ZERO             var              zero var
 P_SETRANDOM        var[,rndmask]    set var to random value
                                     (rndmask = 1,3,7,15,31...65535)
 P_ADD              var,value        add value to var (sign extended if nec.)
 P_ADD              var,var          add var to var (sign extended if nec.)
 P_INC              var              increment var by 1
 P_DEC              var              decrement var by 1
 P_NEG              var              negate var
 P_DIV2             var              signed divide by 2
 P_SETVEL           velocity         change speed (will regenerate vectors)
 P_ACCEL            velocity,rate    change speed by rate (smooth setvel)
 P_IFSAME           var,value,addr   if var=value then go to addr
 P_IFNOTSAME        var,value,addr   if var!=value then go to addr
 P_IFZERO           var,addr         if var=0 then go to addr
 P_IFNOTZERO        var,addr         if var!=0 then go to addr
 P_IFBETWEEN        min,var,max,adr  if min>var>max then go to addr
 P_IFNOTBETWEEN     min,var,max,adr  if min<var or var>max then go to addr
 P_IMPORT           var,global var   var = global var
 P_EXPORT           global var,var   global var = var
                                     global var must be same size as var...
                                     ie. a byte=byte or word=word
                                     see 'global variables'
 P_INDEX            dest,table,index takes a value from a table (see tables)
 P_PUSH             var              pushes var onto the stack
 P_PULL             var              pulls var from the stack (see stack)

 LINKING MACROS:
----------------
 P_FINDSHAPE        shape            finds the shape specified
 P_LINK             shape            link this path to the next path created
 P_FINDNEXTSHAPE    shape            finds the next closest shape specified
 P_FACESHAPE                         faces the previously found shape
 P_GOTOSHAPEPOS     x,y,z,maxspeed   goes to position relative to found shape
 P_IMMUNE                            stops collisions between the found shape (reset if weapon fired)
 P_SHAPEDISTLESS    value,address    when distance from shape < value, goto address
 P_SHAPEDEAD        address          if shape is dead, goes to address
 P_SPAWN            ...,LINK         see spawn command above
 P_FLAGSHAPE                         set flag for linked shape
                                     (only if linked shape is path obj)
 P_IFFLAG           address          if flag set goto address (clears flag)
 P_SHAPEINRADIUS    radius,address   when linked shape is within the specified radius

 CHILD MACROS:
--------------
 P_SPAWN            ...,n            see spawn command above
 P_CHILDDEAD        n,address        if CHILD n is dead, goto address
 P_FLAGCHILD        n                flag child (from child or mother)
 P_FLAGMOTHER                        flag mother (from child)
 P_IFFLAG           address          if flag set goto address (clears flag)
 P_UNLINKCHILD      n                make child into normal object
 P_REMOVE           n                remove child n

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 Note #1: NEVER use FINDSHAPE, LINK, or FINDNEXTSHAPE with CHILD macros
 Note #2: P_GOTO P_NEXT, and P_LOOP AUTOMATICALLY do a P_WAIT 1
 Note #3: P_TRIGGER should NOT be used from within a trigger subroutine
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 valid 'var's are:

                    worldx           object's x
                    worldy           object's y
                    rotx             object's x rotation
                    roty             object's y rotation
                    rotz             object's z rotation
                    hp               object's hp
                    ap               object's ap
                    shape            object's shape
                    coltab           object's colour table
                    tx               texture map x coordinate (or sprite size)
                    ty               texture map y coordinate
---------------------------------------------------------------------
 vars available for child macros:

                    childx           relative x
                    childy           relative y
                    childz           relative z (relative to mother)
                    childrotx        x rotation
                    childroty        y rotation
                    childrotz        z rotation
---------------------------------------------------------------------
 temporary variables available for use are:

                    pbyte1           temporary byte #1
                    pbyte2           temporary byte #2
                    pword1           temporary word #1
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 current valid weapons are: (for use with P_WEAPON)

   SlowElaser         - Elaser (use for ground based objects)
   RelSlowElaserHome  - Relative slow laser (homes towards player)
   RelSlowElaser      - Relative slow laser
   hmissile1          - Normal homing missile
   chickhmissile1     - Chicken missile
   missile1           - Straight firing missile
   plasma             - Plasma ball
   shortplasma        - Plasma ball (disappears quicker)
   Hplasma            - Homing plasma ball
   ovalbeam           - Oval (ellipse) beam
   ringlaser          - Ring laser
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 current valid triggers (for the P_TRIGGER instruction):
 TRIGGER should not use P_WAIT, P_GOTO, P_LOOP, P_WAITxxxx
 (anything which causes the next game frame to be displayed)
 (doing so will cause a blue BLINK |^) )

   Always             - calls the routine on every game frame
   2,4,8,...,128      - ... once every n frames
   WhenHit            - ... if hit
   WhenHitByPlayer    - ... if shot by player
   WhenFlagged        - ... if flag is set (clears the flag automatically)
   WhenDead           - ... if hp=0 (explodes regardless- but you can spawn)
   WhenShapeDead      - ... if the LINK'd or FOUND shape dies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 Global Variables:

 Global variables are available for use by all strategies they are
 completely independent of the strategy that uses them.. ie. if one
 strategy changes a global variable, another strategy can read or change
 it.  Use IMPORT to copy a global variable into an alien variable.
 Use EXPORT to copy an alien variable into a global variable.
 Global variables available for use:

   gbyte1        = global byte 1
   gbyte2        = global byte 2
   gbyte3        = global byte 3
   gword1        = global word 1
   gword2        = global word 2
   gword3        = global word 3

 NOTE: you can ONLY copy a byte into a byte or a word into a word, ie.
 you cannot copy a byte into a word or vice versa.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 Tables:

 The INDEX feature allows you to retrieve data from tables.  The index
 should be a byte alien variable, if it is a word then only the bottom
 8 bits are utilised.
 If the destination is a word then the index is automatically multiplied
 by 2 assuming you are indexing into a table of words.

 There are some default tables you can use:

   sintab - sine table (index should be 0-255, destination must be a byte)
   costab - cosine table (index should be 0-255, destination must be a byte)

 eg.
   P_SET   pbyte1,5
   P_INDEX pword1,mytab,pbyte1
   ...
 mytab
   dw      0,500,400,300,200,400,500

 This will set pword1 to equal mytab+5*2 (400)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 The Stack:

 The stack is used for DO-NEXT loops and GOSUB-RETURN subroutines.
 It is also used for the PUSH/PULL commands therefore there is of
 course some possibility of a clash.  You cannot PULL a variable
 from a level different to that from which it was PUSHed.
 ie.  P_DO    5
      P_PUSH  pbyte1
      ...
      P_PULL  pbyte1
      P_NEXT
 is valid, but:
      P_DO    5
      P_PUSH  pbyte1
      ...
      P_NEXT
      P_PULL  pbyte1
 is invalid and will probably crash
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```
