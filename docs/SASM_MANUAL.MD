

```
╔════════════════════════════════════════════════════════════════════╗
║         SASMX Copyright (c) Argonaut Software Ltd. 1992            ║
╠════════════════════════════════════════════════════════════════════╣
║                                                                    ║
║              ████   ████    █████   ██ ██   █    █                 ║
║             █    █ █    █  █       █  █  █  █    █                 ║
║             █      █    █  █       █  █  █   █  █                  ║
║              ████  ██████   ████   █  █  █    ██                   ║
║                  █ █    █       █  █  █  █   █  █                  ║
║             █    █ █    █       █  █     █  █    █                 ║
║              ████  █    █  █████   █     █  █    █                 ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
Version 2.02
```
# Contents                                                    
[1 : Changelog](#changelog)  
[2 : SASM Assembler Directives](#sasm-assembler-directives)  
[3 : ``PRINTF`` Commands](#printf-commands)  
[4 : CLI Options](#cli-options)  
[5 : Environment Variables](#environment-variables)  
[6 : Assembler Variables](#assembler-variables)  
[7 : Assembler Strings](#assembler-strings)  
[8 : Expression Evaluation](#expression-evaluation)  
[9 : Special Notes](#special-notes)  

# Changelog


## Version 0.99

Assembler shell finished.


## Version 1.00

Bugs fixed so that it assembles Starglider 2.  
Some things put in EMS.


## Version 1.01

 MARIO parser added.


## Version 1.02

MARIO parser bugs fixed.


## Version 1.03

Bugs fixed and lots of things changed so that it assembles Starglider 1.  
Most notable changes are everything except symbols has been put in EMS, making it slower but using less base memory.  
Features added...  
``Suppress <parameter>`` Can be used to suppress errors,warnings or expression printouts.  
Parameter can be :    ``ERRORS``, ``WARN``,  ``EXPR``

``RELEASE <parameter>`` Is used to reverse the effect of ``SUPPRESS``.

``CHECKMAC <ON,OFF>`` Can be used to switch on or off double macro name checking. It is slightly slower to assemble.


## Version 1.05

CTRL break handler added so it frees memory when CTRL+C is hit.


## Version 1.06

``PRINTF`` command added.  
This prints any combination of text,expressions and special assembler variables. See bottom for guide to ``%`` commands.

A field can be added on expressions and variables by specifying the field like   ``[field,fillchar]``  where ``field`` is a decimal number from 0-9 and ``fillchar`` is any character.


Example:
Base memory left = 32 and label kris = 1234

``	PRINTF	"Mem : %m"`` would print ``Mem : 32``  
but  
``	PRINTF	"Mem : %[5,.]m"`` would print ``Mem : ...32``

``	PRINTF	"Kris has a value of : ",[5]kris,"	Memory = %[5]m	byebye"``  
would print  
``	Kris has a value of :  1234   Memory =	32	byebye``  

``	PRINTF "[10,.]kris","wobble"``  
would print  
`` kris......wobble``

``printf "[3]krister"``  
would print  
``kri``  

``FOPEN	name`` Redirects printf's to file ``<name>``.  
If a '+' is added before the name then the file will be opened in append mode (the file must exist).

``FCLOSE`` Redirects printf's back to the screen.

NOTE: ``FCLOSE`` does not close the file, but redirects output to the screen, when a new ``FOPEN`` is executed then SASM will determine if the name is the same, if it is the same then the file will be appended, if the name is not the same then SASM will close the old file and create a new one, saving lots of time by not closing and then opening the same file. However the following code will not work because of this feature...
```
fopen kris                          ;Open file kris.. OK
printf "wobble equ ",oranges        ;OK
fclose                              ;Redirects to
                                    ;screen, file NOT closed
include kris                        ;File not closed, so
                                    ;garbage is read.
```
To fix the bug insert a line like  '``FOPEN garbage``' which will close KRIS and open garbage.  
*** FIXED v1.26+, just specify a ``!`` as an ``fclose`` parameter, this will close the file completely. ***
    
``DEFERROR <"PRINTF STRING">`` Redefines the error message.

``DEFEND <"PRINTF STRING">`` Redefines the end message.


## Version 1.09

String definition is possible using the command ``DEFS <1-5>,"PRINTF STRING"`` which assigns a string from 1 to 5 with the "evaluated" ``printf`` string.  
There are 5 user definable strings and currently 1 assembler string.  The assembler string is number 6 and contains the current filename being assembled. String lengths are 150 chars max.


The string can now be used in the ``printf`` command by using  ``%$<String number 1-6>``.

Or inserted into a macro like this:
```
	defs       1,"Hello"

kris	MACRO
\$1
	ENDM
```
When expanded, produces:

``Hello``



## Version 1.10
```diff  
- !! These changes are now null and void, and should be avoided.
-
-         DEFSEND <printf string>
-           Defines the send message.
-
-         Two new assembler symbols defined when sending...
-           TOTALBYTES : total number of bytes assembled
-           TOTALSENT : total number of bytes sent
-
- !! These changes are now null and void, and should be avoided.
 ```


## Version 1.11

Just some bug fixes.


## Version 1.12

Optimised EMS macro swapping, so assembly is faster than ARGASM (not that it wasn't before anyway).

New command line option "``-t``" which will disable the title text. (changed 27-7-92, now equate a label called "``_NOTITLE``" on the command line.)

New directive ``TIME <label>``   which will get the current time in MS-DOS format and put it into ``<label>``.


## Version 1.13

New ``PRINTF`` bits, hex numbers, extended line printing etc.

New ``SUPPRESS``/``RELEASE`` option - ``ANSI`` which will turn on and off ANSI codes in ``PRINTF`` commands.

Some more bug fixes, had to go back to an earlier backup, so maybe some bits are missing??

## Version 1.14

Local labels now store a pointer to the parent label rather than storing the text, saving immense amounts of memory.


## Version 1.15

Local labels now delete their texts when a new parent label is defined. To declare a local label to be used by another parent section use the directive  LOCAL  which will add the local symbol to the parent symbol table as parent.local
 Example:
```parent1
.local    local

parent2
          jmp       parent1.local
```
Something decided to delete the entire directory, had to use NDD to recover, some bits may be wrong.

Have a strange bug where a few bytes in one block are being written out incorrectly, but when I singled stepped the code the bytes were correct before and after the write, and during when the DOS routine was moving the bytes for later encoding! (FIXED, I think this was the send message corrupting when it called the DOS routine and therefore not calling the write routine, but maybe something completely different!)


## Version 1.16

Some bug fixes.

WRITE command added. This allows the user to write only specific blocks of code. Object code is split into separate parts every so often, this forms one block. The assembler will create a block if an ``ORG`` is reached, an ``incbin``/``inccol`` is reached or if the block being generated goes above about 15/16K (One EMS page). If you want to write a certain bit of code then you must force an object split by doing an ``org`` or something.  
Example if you want to write this bit of code...
```
	lda	#65
	sta	message,x
```
then do this..
```
	write	on
	org	*,@
	lda #65
	sta message,x
	write	off
	org	*,@
```
The blocks created inside the ``write	on/off`` section will be flagged as to be written out. The assembler will always SEND ALL THE CODE but only WRITE the selected blocks to disk. DEFAULT IS ON so all code is written to disk.


## Version 1.17

Text files, can now be displayed on the screen using the ``TYPE`` command, so status reports created by ``PRINTF`` can be displayed on the screen.


## Version 1.18

When defining a macro, instead of using ``\X`` as the macro parameter number you can specify some parameter names in square brackets after the ``MACRO`` directive.

Example...
```
s_jmp_lifeless	MACRO	[obj1,value,label]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ	{obj1}
	s_lda.w	al_count,{obj1}
	cmp	{value}
	rlbmi	{label}
	stratmac_end
	ENDM
```

For the assembler to recognise that you want a parameter taken from the list you must have ``{label}``.  The expansion of the labels is done at at macro definition time not when the macro is being parsed. It is of course still possible to use ``\n`` in a macro and the new feature. It is only permitted to have up to 36 parameters specified.

This feature works by assigning the text of ``\1`` to the first parameter, ``\2`` to the second etc..
So in the above example ``{label}`` would be converted to ``\3`` and then stored in the definition.

If you want a real "``{``" in the macro definition you must do "``{{``".

 Example....
```
kris	MACRO	[value,value2]
	lda	#{value}4+{value2}
	ENDM
```
which stores...
```
          lda	#\14+\2
```



## Version 1.19

Added command line options ``-e`` ``-s`` which define or set labels.


## Version 1.20

Writes ROMs correctly now. When it can't find the command line file it doesn't print stupid errors.

Added ``-d`` which defines a string from the command line. When you expand a string in a macro the ``\@ \0`` will work the 2nd time! If a macro includes a file the line numbers are all wrong in forward reference errors, this was fixed by setting a line override flag if the source pointer was within the macro expansion space at the time of including it.

Tested linking 386 code generated by MASM in with 8086 code generated by OPTASM, it works so I copied the CPUTYPE source from the ZORTECH source(Compaq P.D.).   I suppose if I wanted to I could copy the alloc memory source and store symbol text in extended memory, but it would probably take ages, so I'll leave it for the moment!



## Version 1.21

Environment variable parser added. Only one environment variable tested at the moment, "``SASMSRC``"

ex. (in ``AUTOEXEC.bat``)  
``set SASMSRC=8mbsg.asm``  

The priority for file names is now(lowest to highest),  
Environment variables  
Command line  

``GETENV`` directive added, this gets an environment variable and puts it in string number 1-5.

``DATE`` directive added, this puts the date (in MS-DOS format) into a label.

example....
```
	DATE	date
year	=	date>>16&$ffff
month	=	date>>8&$ff
day		=	date&$ff
          PRINTF	"The date is ",day,"/",month,"/",year,"%n"
```
Fixed cute bug, if you defined a variable on the command line such as ``NARG`` or ``LONGA`` etc. then every thing goes horribly wrong.



## Version 1.22

Detects illegal first character in symbol.

Some optimisations.

Fixed the listing so it works properly except in the case where a macro includes a file (line numbers are wrong), because that's a really stupid thing to do and I can't suss out how to fix it this time anyway.  ``LIST	OFF``  will now turn off macro expansion listing so that it is possible to list just some macros and then stop it.

``PRINTF`` feature. If you do a ``:$`` before an expression the number will be printed in hex. ``:$`` has to be put before any field.

Bug, couldn't use ``LIST`` in MARIO code  -  Fixed

Gives error if a ``sty(x) NNNN,x(y)``

Only one error per line now.


## Version 1.23

Outputs symbols now in the format ``symbol	EQU	value``.

Use the directive ``SYMBOLS  [on/off]``  
Symbols will be output to the screen by default or to the file name specified. The filename can be specified on the command line by the ``-x`` option, this also turns on symbol listing.

Added the ``-e__heap=xxxx`` option on the command line which defines the size of the heap in bytes.

Fixed a small bug with ``IFD`` and ``IFND``, these commands used to create an FR block if the symbol was not defined, which did not affect assembly but did take some memory.

New ``SUPPRESS``/``RELEASE`` option - ``PRTF`` which will switch off/on all ``PRINTF`` writes except errors.


## Version 1.24

Fixed bug, if a condition is not true and an EOF occurred, SASM used to keep reading the last two bytes, it now gives a premature end of file error.

Now gives a missing expression error.

Environment variable ``SASMHEAP`` which defines the default heap size. Priority for heap is:  
1 : Default of 2048  
2 : Environment variable  
3 : Symbol ``__heap=size`` defined from command line  



## Version 1.25

New expression evaluator with error reporting.

``DS`` directive added.

``SASMDIR`` environment variable added, this specifies a default incdir name. The incdir name is cleared if a name is specified on the command line. ``-i`` option added to command line, a backslash can be used as well as a dash now to specify options.

Checks DOS version number.

New base accepted in expression evaluator, '``@``' which gets the current ROM position.

New printf feature %x which will print the following expression, a white space is needed after the expression as a terminating character (this will be skipped over).

``RUN	<"printf string">`` command added. This will assemble the ``PRINTF`` result. The usefulness is in the fact you can do string replacements and lots of things without creating macros!! i.e. if string 1 contains "``stratmac_start``" and I want to pass the current filename to the macro ``stratmac_start`` I can do this...
``run " %$1 %f"``

But the assembler can go very wrong if you give it strange hex numbers in the ``PRINTF`` string, you have been warned!

New operator in expression evaluator, ``|``, which performs a MOD. It has a priority equal to divide.
MOD calculates the remainder of a divide function.  
ex. ``7|45 = 3``

``ROLS`` command added. This rotates a string left by the amount specified hence ``ROLS 1,1`` would turn "KRIS" into "RIS".

``DEFS`` with a null parameter used to crash the system when SASM exited.

If conditionals unbalanced, it now says if too many ``IF``s or ``ENDC``s.

``REPTS`` with missing or silly expressions don't crash the assembler.

Errors limited to one per line now.

``UPPER`` and ``LOWER`` commands added, these uppercase and lowercase a string.  
Usage....  
``	UPPER 1       ;1 is the string number``

``IFS`` and ``IFNS`` commands added, these test a certain character
within a string.  ``IFS`` to check if they are the same and
 IFNS if they are not the same.  Usage....
```
	IFS	2,4,"K" ;This will compare character 4 in string 2
                ;with character "K"
```

You can know implicitly close a ``PRINTF`` file by putting a ``!`` as a parameter for the ``FCLOSE`` command.

Line number fixing.

Doesn't need 32k for an ``INCBIN`` buffer when sending.

OOPS! MARIO move instruction now inserts forward references!!

Symbol outputting fixed.

Number of other small bugs fixed.



## Version 1.26

For relative branches to backward references out of range -1 to -128 the assembler will now automatically encode a jump around either a ``JMP`` or a ``JMPL`` to the label you want to jump to.  
Example......
```
	org	$8000,0
loop
	REPT	200
	nop
	ENDR
	bne	loop	;Used to generate "out of range" error
```
will actually produce object that does this...
```
	org	$8000,0
loop
	rept	200
	nop
	endr
	beq	*+3
	jmp	loop
```

 And....
```
	org	$8000,$8000*0
label

	org	$018000,$8000*1
	bne	label		;Used to generate "out of range" error
```

will actually produce object that does this...

```
	org	$008000,$8000*0
label
	org	$018000,$8000*1
	beq	*+4
	jmp.l	label
```



New command ``IRP``.  This will replace the symbol specified with a value taken from a list using the current ``REPT`` count as an index.  Usage is..  
``IRP     [symbol,value,value,......]``  
Example...
```
	REPT	10
	IRP	parm,1,3,9,27,81,243,729,2187,6561,19683
	DW	parm
	ENDR
```
which will produce a table of words with the powers of 3 in the range 0-9.

The equivalent string command is called ``IRS`` and instead of symbols and values, a string is specified first and then a list of ASCII text.

MARIO code now checks for white spaces after the opcode so it is now possible to make macros with the first part of the name the same as a MARIO opcode i.e. ``plotbolox`` will execute the macro ``plotbolox`` and not the ``PLOT`` operation.

## Version 2.00

SASMX - This version supports up to 16 megabytes of memory, which is taken from the EMS pool.
SASMX works on the 286|DOS EXTENDER specification. Therefore a 286 machine or above will be needed to run SASMX.


## Version 2.01

``SL.EXE`` - The integrated linker for SASMX v2.01+, look at ``SL.DOC`` for more information on ``SL.EXE``.

SASMX has two new opcodes and one command line option to support the linker.  The command line option is ``-V<filename.SOB>`` which will output a SASMX OBject file, the file does not have to be ``.SOB`` but SL reads only ``.SOB`` extensions.  

The opcodes are ``PUBLIC`` and ``EXTERN``.  ``PUBLIC`` makes a symbol usable by another file and ``EXTERN`` uses a symbol created by another file. ``PUBLIC`` must come before the symbol is defined and ``EXTERN`` must come before the symbol is used for the first time.  

The only restriction is that a relative branch will not work with an ``EXTERN``.
As the linker is fully integrated it is possible to do expressions such as:  
```
	extern	kris,dyl,giles  
	lda	#kris/dyl+giles
```
because the assembler will store an expression which is evaluated at link time.

 The ``IRS`` opcode has been modified, so that is the ``REPT`` count is greater than the number of ``IRS`` parameters then it will 'wrap' round.

Numbers can be expressed as ``1234h`` or ``01000b`` instead of ``$`` and ``%`` before the number.

 "Macro defined twice" prints the macro name defined twice.


## Version 2.02

Specifying a "``/``" or a "``\``" in a filename will override the incdir setting.

``MARIO	OFF`` symbol defined twice bug fixed.

``IRS`` will now look for quotes around it's parameters so that it is possible to put spaces, commas etc. in the string

Line number fixing has been fixed (honest) and improved. Line number format is now expressed as the line in the current file being assembled
then all the macros that have been invoked to the current source
level and then the line number within the last macro.

New directive ``STRLEN`` which will put the length into a variable.  
Usage is:  
``	strlen	kris,1``   
Where ``kris`` is the variable and ``1`` is the string number.

New CLI option ``-m`` which specifies how many errors to print up before stopping assembly.

``MOVEB``/``MOVEW`` will now work in the case of ``moveb [r1],r0``

There was a certain complex condition when the filename would be incorrect in errors, this has been fixed.

NEW directive ``SETDBR``. It tells the assembler what the current DBR is, so that when effective address calculations are done, proper error reporting can be done. It also enables the user not to start putting ``&$FFFF`` onto expressions or sticking a ``.W`` on the end of the opcode.

One error per macro is now the limit, so that all the strategy macros don't churn out 10 errors because one parameter was wrong which was detected in the first error.

 New directive ``ERROR+`` which increments the number of errors.


# SASM Assembler Directives
```
<label>   =   <expression>          Sets <label> to be <expression>.
                                    see EQU, EQUR
          CHECKMAC ON/OFF           Will turn on and off duplicate
                                    macro name checking.

          DATE <label>              Puts the date into <label>.

          DB,DW expr., etc.         Defines a string of bytes or words.

          DS <bytes>                Reserves specified amount of bytes.

          DEFEND "<string>"         Defines the end message with a
                                    printf string.
                                    see PRINTF

          DEFERROR,ERROR "<string>" Defines the error message with a
                                    printf string.
                                    see PRINTF
                                    
          ERROR+                    Increments the number of errors.
                                    
          DEFS strnum,"<string>"    Defines string number 1-5 with
                                    the result of a printf string.
                                    see PRINTF,ROLS,STRLEN

          ELSEIF                    Swaps the condtional level.
                                    see IF, ENDC, ENDIF

          END                       Stops assembly of the current
                                    source file.

          ENDC,ENDIF                Ends a conditional check.
                                    see IF

          ENDM                      Ends a macro definition.
                                    see MACRO, MEXIT

          ENDR                      Ends a repeat loop.
                                    see REPT

<label>   EQU <expression>          Sets the <label> to be <expression>.
                                    see =, EQUR

<reg>     EQUR <expression>         Sets the <register> to be <expression>,
                                    can be used in MARIO code only.
                                    see =, EQU

          EXTERN <symbol>           Marks all expressions using this
                                    symbol to be written out in the .SOB file
                                    if linkable code is on.

          FABCARD <expression>      Sets the FABcard port address.
                                    see SEND

          FAIL                      Causes a fatal error.

          FOPEN <(+)name>           Redirects printf's to file <name>
                                    if a "+" is added before the file name
                                    then the file will be opened in append
                                    mode. It is neccassary for a file to
                                    exist if append mode is chosen.
                                    see FCLOSE, PRINTF

          FCLOSE                    Redirects the printf's to the screen.
                                    see FOPEN, PRINTF

          GETENV strnum,<ENV VAR>   Puts the contents of the enviroment
                                    variable into string number 1-5.
          
          GETHEAP <heap>            Gets as much of the heap (in bytes)
                                    as specified. This is an internal
                                    directive and should never be invoked
                                    by the user. (See Special Notes)

          IFxx                      Starts a conditional check where
                                    xx is one of the following...
                                    EQ - equal         NE - not equal
                                    GE - gt. or equal  LE - less or equal
                                    GT - gt.           LT - less
                                    D  - label def.    ND - label not def.
                                    C  - strings eq.   NC - strings not eq.
                                    V  - env. exist    NV - env. not exist
                                    S  - string char   NS - not string char
                                    see. ELSEIF, ENDC, ENDIF

          INCBIN <name>             Copies the contents of file <name> into
                                    the object buffer.

          INCCOL <name,start,end>   Copies the contents of file <name>
                                    and offset start*32 until end*32
                                    into the object buffer, used to read
                                    Nintendo .COL style palettes.

          INCDIR <dir>              Sets the directory name to be added to
                                    The start of INCLUDE,INCBIN,INCCOL.

          INCLUDE <name>            Includes source file of <name>

          IRP <symbol>,[value]....  Iterate Rept Parameter, puts the
                                    value into the symbol using the rept count.
                                    see REPT,ENDR,IRS

          IRS <string>,[ascii]....  Same as IRP but uses strings instead.
                                    see REPT,ENDR,IRP

          LIST <on/off/macros>      Turns on or off listing of the source.
                                    If macros is specified then macro
                                    expansions will be listed also. The OFF
                                    option will turn off macro expansion
                                    listing.

          LOCAL                     Declares a local label as parent.local

          LONGA                     Tells the assembler the code is to be
                                    assembled with the accumulator as 16 bits.
                                    see SHORTA,SHORTI,LONGI

          LONGI                     Tells the assembler the code is to be
                                    assembled with the index regs. as 16 bits.
                                    see SHORTI,SHORTA,LONGA

          LOWER <string>            Lowercases string <string>
                                    see UPPER

          MACRO                     Starts a macro definition
                                    see ENDM, MEXIT

          MARIO <on/off>            Set MARIO instruction set parsing to be
                                    on or off

          MEXIT                     Exits the current macro, ignores
                                    conditional levels.

          ORG <pcorg>(,rompos)      Orgs the code. Rom position is
                                    optional, if not present then code
                                    will be put at the following byte.

          OUTPUT <name>             Outputs the object code to file <name>.
                                    see WRITE

          PRINTF "<string>"         Prints a printf string.
                                    See above for more detailed description
                                    on the use and section 3 for details
                                    on printF commands.
                                    see FOPEN, FCLOSE, DEFEND,DEFERROR, DEFS

          PUBLIC <symbol>....       Make a symbol public. If the link
                                    option is on the symbol will declared
                                    to the linker.
                                    see EXTERN

          ROLS <string>,<offset>    Moves string left by offset.
                                    see DEFS,PRINTF,STRLEN

          RUN "<string>"            This will run the result of a printf string
                                    (use with care, read notes on v1.25)
                                    see PRINTF

          RELEASE <option>          Starts printing the option specified
                                    again.
                                     Options are :
                                      EXPR - Expressions
                                      ERRO - Errors
                                      ANSI - Ansi codes in printfs
                                      WARN - Warnings
                                      PRTF - Printf's
                                    see SUPPRESS

          REPT                      Starts a repeat loop (nested is ok)
                                    see ENDR

          ROLS str,offset           Rotates a string left by the
                                    amount specified.

          SEND (expression)         Send the object code to a RAMBOY
                                    of type (expression) default=$3d
                                    see FABCARD

          SETDBR <bank>	            Tells the assembler what the current
                                    DBR(data bank register) is.

          SHORTA                    Tells the assembler the code is to be
                                    assembled with the accumulator as 8 bits.
                                    see LONGA,SHORTI,LONGI

          SHORTI                    Tells the assembler the code is to be
                                    assembled with the index regs. as 8 bits.
                                    see LONGI,SHORTA,LONGA

          SICE                      Does an invalid instruction (Invokes
                                    soft ice if present.)

          STRLEN <label>,<string>   Puts the length of string in to
                                    the label.
                                    see DEFS,PRINTF,ROLS

          SUPPRESS <option>         Stops printing the option specified
                                    again.
                                     Options are :
                                      EXPR - Expressions
                                      ERRO - Errors
                                      ANSI - Ansi codes in printfs
                                      WARN - Warnings
                                      PRTF - Printf's
                                    see RELEASE

          TIME <Label>              Gets the time in MSDOS format and
                                    puts it in the specified label as a
                                    SET type variable.

          TYPE <filename>           Prints <filename> to the screen.

          UPPER <string>            Uppercases string <string>.
                                    see LOWER

          WRITE <ON,OFF>            When object code is written out to
                                    disk then only blocks blocks flagged
                                    to be output are written.
                                    ON  -  Ouput blocks (Default)
                                    OFF -  Stop outputting
                                    see OUTPUT
```


# ``PRINTF`` Commands

- ``$<str>`` - print string ``<str>``.
- ``%`` - prints a real percent mark
- ``<xx>`` - prints ``ESC[xxm (ANSI command)`` where ``xx`` is a 2 digit ANSI code.
- ``b`` - prints a backspace
- ``c`` - prints the second nested macro name
- ``d`` - prints the error description (ERROR or WARNING)
- ``e`` - prints the error message (Bad byte value, etc.)
- ``f`` - prints the current file name
- ``h`` - converts a 2 digit ASCII hex number to a real hex number and inserts it.
- ``i<N>`` - prints an extended command where ``N`` is the command(see below)
- ``k`` - total memory free available to SASM
- ``l`` - prints the current line number
- ``m`` - prints the current macro name
- ``n`` - prints a carriage return
- ``p`` - prints the parent label name
- ``q`` - prints a quote (")
- ``s`` - switch on a listing for one line (error string handler)
- ``t`` - prints a tab
- ``u`` - prints the unknown symbol in forward reference errors
- ``x<expr >`` - print an expression. (note the whitespace after the expression.)

## Extended commands - ``I(x)``
- ``b`` - total number of bytes (End message only)
- ``c`` - prints processor type
- ``e`` - number of errors
- ``f`` - number of files
- ``l`` - number of lines
- ``s`` - number of symbols
- ``w`` - number of warnings

Remember that a ``:$`` before an expression will print the value in hex.

# CLI options

- ``-d<value>,"<str>"`` - Defines a string.
- ``-e<label>(=value)`` - Equate label with the optional value.
- ``-f<Name>`` - Show file listing on screen or write to file.
- ``-h`` - Show help text.
- ``-i`` - Specifies an incdir name.
- ``-l`` - Turns on listing.
- ``-m<value>`` - Specifies maximum errors before stopping.
- ``-o<Name>`` - Write object code to ``<Name>``.
- ``-r`` - Display ROM listing on screen.
- ``-s<label>(=value)`` - Set the label with the optional value.
- ``-v<filename.SOB>``  - Writes a linkable file ``<filename.SOB>``.
- ``-x[filename]`` - Turns on symbol listing.

The following are labels which if defined on the command line, do various things:
- ``-e__notitle`` - Don't display a title message.
- ``-e__mario`` - Default source code is MARIO code.
- ``-e__heap=xxxx`` - Defines the heap size (in bytes).


# Environment Variables

- ``SASMSRC`` - Specifies the default source name.
- ``SASMHEAP`` - Specifies the default heap size (in bytes).
- ``SASMDIR`` - Specifies a default incdir name (cleared if name specified on command line).



# Assembler Variables

- ``_SASM`` - Defined if SASM
- ``NARG`` - Number of arguments in a macro
- ``LONGA`` - Non-zero if in long accumulator mode
- ``LONGI`` - Non-zero if in long index mode
- ``_DAY`` - Day 1-31
- ``_MONTH`` - Month 1-12
- ``_YEAR`` - Year 1992-????
- ``_DATE`` - Date in format ``yyyymmdd`` , ``yyyy=year mm=month dd=day``



# Assembler Strings

- ``6`` - Last filename included
- ``7`` - Date in text format i.e. Monday 1st January 1999
- ``8`` - First filename included


# Expression Evaluation

Expression evaluation is done in order of precedence, if two operators have equal precedence then they are evaluated left to right.
This table is a list of the operators available and their precedence (A high number means it has a high precedence).....
```
    Operator     Name             Action               Precedence
      >        Hi-byte      Gets the hi byte               10
      <        Lo-byte      Gets the low byte              10
      +        Unary pos    Sets the sign                   9
      -        Unary neg    Sets the sign                   9
      ~        Unary not    Nots a number                   9
      $        Sine         Gets a sine value               8
     >>        Shift right  Shifts the number right         8
     <<        Shift left   Shifts the number left          8
      >        Greater      Returns true if x>y             7
      <        Lower        Returns true if x<y             7
      =        Equal        Returns true if x=y             6
      &        Logical and  Logical ANDs two numbers        5
      ^        Logical xor  Logical XORs two numbers        4
      !        Logical or   Logical ORs two numbers         3
      |        MOD          Calculates the MOD of 1 to 2    2
      /        Divide       Divides two numbers             2
      *        Multiply     Multiplies two numbers          2
      +        Add          Adds two numbers                1
      -        Subtract     Subtracts two numbers           1
```
Partially enclosing an expression in brackets will give that part of the expression a higher priority, hence ``1+2*3 = 7``, but ``(1+2)*3 = 9``.

 All expressions are done with a 32 bit expression evaluator, if an overflow occurs while performing an operator, no overflow error will be given, however overflow errors will be given if a number is too big, i.e. a hex number has more than 8 digits, etc.



## Special Notes

Hidden symbols --
As the assembler runs it's own internal source file before including the source file specified, it is possible to attempt to define symbols in your source code which are the same as some defined in the internal source, if this happens you will have to redefine your symbol.

There is a command hidden to the user called ``GETHEAP``, which will get as much heap as specified, this is used by the assembler on startup and shouldn't be used by the user. However ``GETHEAP`` cannot be defined as a macro, but unless ``GETHEAP`` is on this error will not be reported.

Do not define string 5 on the command line if you have a ``SASMHEAP`` environment variable defined as the assembler uses string 5 as a temporary storage for the heap size in its internal source code.

The assembler supports ASCII codes, that is characters from 0 to 127, if a character higher than 127 is used in a macro,symbol etc. things may go very wrong!

It is possible to use INCCOL as a CGX and SCR file includer too!
To include a CGX file you will have to know how many chars are in it, and to include a SCR file you will have to know how many screens are used.  Below are some macros to include them!
```
; Incbin an 8 bit CGX file
inccgx8	MACRO
	inccol	<name>.cgx,0,_NUMCHRS*2
	ENDM

; Incbin a 4 bit CGX file
inccgx4	MACRO
	inccol	<name>.cgx,0,_NUMCHRS
	ENDM

; Incbin a 2 bit CGX file
inccgx2	MACRO
	inccol	<name>.cgx,0,_NUMCHRS/2
	ENDM

; Incbin a screen file
incscr	MACRO
	inccol	<name>.scr,first screen*64,_NUMSCRS*64
	ENDM
```

Downloading to SFC can sometimes go wrong, if it does switch on ROM listing and note which bank goes wrong (not ROM pos.), go into the source code and put a few extra bytes at the start of the bank! (Fixed now I think)

If you appear to run out of EMS memory then try using ``EMM386.EXE`` instead of whatever EMM handler you are using, use this line..
``device=c:\dos\emm386.exe 1392 h=255 ram``
Or look at the documentation for whatever EMM handler you are using and increase the number of handles available.
-- NB.  --  As SASM is only DOS-Extender compatible now, this is now void. --
