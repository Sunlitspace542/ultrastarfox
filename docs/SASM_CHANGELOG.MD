## SASM changelog
Long, but it does contain some useful information about assembler syntax.  

```
----------------------------------------------------------------------
  Update log
----------------------------------------------------------------------

Version 0.99
------------
    Assembler shell finished.


Version 1.00
------------
    Bugs fixed so that it assembles Starglider 2.
    Some things put in EMS.


Version 1.01
------------
    Mario parser added.


Version 1.02
------------
    Mario parser bugs fixed.


Version 1.03
------------
    Bugs fixed and lots of things changed so that it assembles Starglider 1
    Most notable changes are everything except symbols has been put in EMS.
    making it slower but using less base memory.
 Features added...
       Supress <parameter>
          Can be used to suppress errors,warnings or expression print
          outs. Parameter can be :    ERRORS
                                      WARN
                                      EXPR

         Release <parameter>
            Is used to reverse the effect of suppress.

         Checkmac <ON,OFF>
            Can be used to switch on or off double macro name
            checking. It is slightly slower to assemble.


Version 1.05
------------
        Ctrl break handler added so it frees memory when Ctrl-C is hit.


Version 1.06
------------
        PrintF command added
          This prints any combination of text,expressions and special
          assembler variables. See bottom for guide to % commands

          A field can be added on expressions and variables by
          specifying the field like   [field,fillchar]  where field is a
          decimal number from 0-9 and fillchar is any character.


          Example:
   Base memory left = 32 and label kris = 1234

            printf "Mem : %m"    would print    Mem:32
     but
            printf "Mem : %[5,.]m"  would print    Mem : ...32


          printf "Kris has a value of : ",[5]kris,"   Memory = %[5]m   byebye"
     would print
          Kris has a value of :  1234   Memory =    32   byebye


            printf "[10,.]kris","wobble"
                                  would print
            kris......wobble

            printf "[3]krister" would print
            kri

          FOPEN          name
            Redirects printf's to file <name>.
            If a '+' is added before the name then the file will be
            opened in append mode. (The file must exist)

          FCLOSE
            Redirects printf's back to the screen.

NOTE:       FCLOSE does not close the file, but redirects output to
            the screen, when a new FOPEN is executed then SASM will
            determine if the name is the same, if it is the same then
            the file will be appended, if the name is not the same
            then SASM will close the old file and create a new one,
            saving lots of time by not closing and then opening the
            same file.
            However the following code will not work because of this
            feature...

             fopen kris                          ;Open file kris.. OK
             printf "wobble equ ",oranges        ;OK
             fclose                              ;Redirects to
                                                 ;screen, file NOT closed
             include kris                        ;File not closed, so
                                                 ;garbage is read.

            To fix the bug insert a line like  'FOPEN garbage' which
            will close KRIS and open garbage.
    *** FIXED v1.26+, just specify a ! as an fclose parameter, this
              will close the file completely. ***


          DEFERROR <"PRINTF STRING">
            Redefines the error message.

          DEFEND <"PRINTF STRING">
            Redefines the end message.


Version 1.09
------------
          String definition is possible using the command
          DEFS <1-5>,"PRINTF STRING"
          which assigns a string from 1 to 5 with the "evaluated"
          printf string.
          There are 5 user definable strings and currently 1 assembler
          string.  The assembler string is number 6 and contains the
          current filename being assembled. String lengths are 150
          chars max.


    The string can now be used in the printf command by using
          %$<String number 1-6>

    Or inserted into a macro like this
Example.

          defs       1,"Hello"

kris      macro
\$1
          endm

When expanded produces:-

Hello



Version 1.10
------------
{         DEFSEND <printf string>
{           Defines the send message.
{
{         Two new assembler symbols defined when sending...
{           TOTALBYTES : total number of bytes assembled
{           TOTALSENT : total number of bytes sent
{
{ These changes are now null and void, and should be avoided.


Version 1.11
------------
          Just some bug fixes.


Version 1.12
------------
          Optimised EMS macro swapping, so assembly is faster than
          Argasm (not that it wasn't before anyway).

          New command line option "-t" which will disable the title
          text. (changed 27-7-92, now equate a label called "_NOTITLE"
          on the command line.)

          New directive..
            TIME <label>   which will get the current time in MSDOS
            format and put it into the label time.


Version 1.13
------------
          New printf bits, hex number, extended line printing etc.

          New suppress/release option - ANSI which will turn on and off
          ansi codes in printf commands.

          Some more bug fixes, had to go back to an earlier backup, so
          maybe some bits are missing??



Version 1.14
------------
          local labels now store a ptr to the parent label rather than
          storing the text, saving immense amounts of memory.


Version 1.15
------------
          Local labels now delete their texts when a new parent label is
          defined.
          To declare a local label to be used by another parent
          section use the directive  LOCAL  which will add the local symbol
          to the parent symbol table as parent.local
 Example:
parent1
.local    local

parent2
          jmp       parent1.local

          Something decided to delete the entire directory, had to use
          NDD to recover, some bits may be wrong.

          Have a strange bug where a few bytes in one block are being
          written out incorrectly, but when I singled stepped the code
          the bytes were correct before and after the write, and during
          when the DOS routine was moving the bytes for later encoding!
          (FIXED, I think this was the send message corrupting ah
          when it called the DOS routine and therefore not calling the
          write routine, but maybe something completely different!)


Version 1.16
------------
          Some bug fixes.

          WRITE command added. This allows the user to write only
          specific blocks of code.
           Object code is split into seperate parts every so often,
          this forms one block. The assembler will create a
          block if an ORG is reached, an incbin/col is reached
          or if the block being generated goes above about
          15/16K (One EMS page). If you want to write a certain
          bit of code then you must force an object split by
          doing an org or something. Example if you want to
          write this bit of code...

                    lda #65
                    sta message,x

                    then do this..

                    write          on
                    org          *,@
                    lda #65
                    sta message,x
                    write          off
                    org          *,@

          The blocks created inside the write on/off section will be
          flagged as to be written out.
          The assembler will always SEND ALL THE CODE but only WRITE
          the selected blocks to disk.
          DEFAULT IS ON so all code is written to disk.


Version 1.17
------------
          Text files, can now be displayed on the screen using the
          TYPE command, so status reports created by PRINTF can be
          displayed on the screen.


Version 1.18
------------
          When defining a macro, instead of using \X as the macro
          parameter number you can specify some parameter names in
          square brackets after the MACRO op code.

Example...

s_jmp_lifeless MACRO [obj1,value,label]
          stratmac_start
MYNARG    =          NARG
          CHK_NARG   3
          CHK_OBJ    {obj1}
          s_lda.w    al_count,{obj1}
          cmp        {value}
          rlbmi      {label}
          stratmac_end
          ENDM


          For the assembler to recognise that you want a parameter
          taken from the list you must have {label}.  The expansion
          of the labels is done at at macro definition time not when
          the macro is being parsed.
          It is of course still possible to use \n in a macro and the
          new feature.
          It is only permitted to have upto 36 paremeters specified.

          This feature works by assigning the text of \1 to the first
          parameter, \2 to the second etc..
          So in the above example {label} would be converted to \3 and
          then stored in the definition.

          If you want a real "{" in the macro definition you must do "{{".

 Example....
kris      macro        [value,value2]
          lda          #{value}4+{value2}
          endm
which stores...
          lda          #\14+\2



Version 1.19
------------
          Added command line options -e -s which define or set labels.


Version 1.20
------------
          Writes ROM's correctly now.
          When it can't find the command line file it doesn't print
          stupid errors.

          Added -d which defines a string from the command line.

          When you expand a string in a macro the \@ \0 will work the
          2nd time!

          If a macro includes a file the line numbers are all wrong
          in forward reference errors, this was fixed by setting a line
          over ride flag if the source ptr was within the macro
          expansion space at the time of including it.

          Tested linking 386 code generated by MASM in with 8086 code
          generated by OPTASM, it works so I copied the CPUTYPE source
          from the ZORTECH source(Compaq P.D.).   I suppose if I wanted
          to I could copy the alloc memory source and store symbol
          text in extended memory, but it would probably take ages, so
          I'll leave it for the moment!



Version 1.21
------------
          Enviroment variable parser added. Only one enviroment
          variable tested at the moment, "SASMSRC"

ex. (in AUTOEXEC.bat)
          set SASMSRC=8mbsg.asm

          The priority for file names is now(lowest to highest),
          enviroment variables
          command line

          GETENV directive added, this gets an enviroment variable and
          puts it in string number 1-5.

          DATE directive added, this puts the date(in MSDOS format)
          into a label.

example....
          date       date
year      =          date>>16&$ffff
month     =          date>>8&$ff
day       =          date&$ff
          printf     "The date is ",day,"/",month,"/",year,"%n"

          Fixed cute bug, if you defined a variable on the command line
          such as NARG or LONGA etc. then every thing goes horribly
          wrong.



Version 1.22
------------
          Detects illegal first character in symbol.

          Some optimisations.

          Fixed the listing so it works properly except in the case
          where a macro includes a file(line numbers are wrong),
          because thats a really stupid thing to do and I can't suss
          out how to fix it this time anyway.  LIST OFF  will now
          turn off macro expansion listing so that it is possible to
          list just some macros and then stop it.

          PRINTF feature. If you do a :$ before an expression the
          number will be printed in hex. :$ has to be put before any
          field.

          Bug, couldn't use LIST in mario code  -  Fixed

          Gives error if a sty(x) NNNN,x(y)

          Only one error per line now.


Version 1.23
------------
          Ouputs symbols now in the format
symbol	EQU	value

          Use the directive:
	SYMBOLS  [on/off]
          Symbols will be output to the screen by default or to the
          file name specified.   The filename can be specified on the
          command line by the -x option, this also turns on symbol
          listing.

          Added the -e__heap=xxxx option on the command line which
          defines the size of the heap in bytes.

          Fixed a small bug with IFD and IFND, these commands used to
          create an FR block if the symbol was not defined, which did
          not affect assembly but did take some memory.

          New suppress/release option - PRTF which controls will
          switch on and off all PRINTF writes except errors.



Version 1.24
------------
          Fixed bug, if a condition is not true and an eof occurred,
          SASM used to keep reading the last two bytes, it now gives
          a premature end of file error.

          Now gives a missing expression error.

          Enviroment variable SASMHEAP which defines the default heap
          size. Priority for heap is
             1 : Default of 2048
             2 : Enviroment variable
             3 : Symbol __heap=size defined from command line



Version 1.25
------------
          New expression evaluator with error reporting.

          DS command added.

          SASMDIR enviroment variable added, this specifies a default
          incdir name. The incdir name is cleared if a name is
          specified on the command line.
          -i option added to command line, a backslash can be used as
          well as a dash now to specify options.

          Checks DOS version number.

          New base accepted in expression evaluator, '@' which gets
          the current rom position.

          New printf feature %x which will print the following
          expression, a white space is needed after the expression as
          a terminating character (this will be skipped over).

          RUN <"printf string"> command added this will assemble the
          printf result. The usefulness is in the fact you can do
          string replacements and lots of things without creating
          macros!! ie.
               if string 1 contains "stratmac_start" and I want to
               pass the current filename to the macro stratmac_start
               I can do this...
                    run " %$1 %f"

          But the assembler can go very wrong if you give it strange
          hex numbers in the printf string, you have been warned!

          New operator in expression evaluator, |, which does a MOD.
          It has a priority equal to divide.
          Mod calculates, the remainder of a divide function.
               7|45 = 3

          ROLS command added. This rotates a string left by the
          amount specified hence ROLS 1,1 would turn "KRIS" into
          "RIS".

          DEFS with a null parameter used to crash the system when
          SASM exited.

          If condionals unbalanced, it now says if too many IFs or
          ENDCs.

          REPTS with missing or silly expressions don't crash the
          assembler.

          Errors limited to one per line now.

          UPPER and LOWER commands added, these uppercase and
          lowercase a string.  Usage....
              UPPER 1       ;1 is the string number

          IFS and IFNS commands added, these test a certain character
          within a string.  IFS to check if they are the same and
          IFNS if they are not the same.  Usage....
              IFS 2,4,"K"   ;This will compare character 4 in string 2
                            ;with character "K"

          You can know implicitily close a printf file by putting a !
          as a parameter for the fclose command.

          Line number fixing.

          Doesn't need 32k for an incbin buffer when sending

OOOPS!    Mario move instruction now inserts forward references!!

          Symbol outputing fixed

          Number of other small bugs fixed.



Version 1.26
------------
          For relative branches to backward references out of range
          -1 to -128 the assembler will now automatically
          encode a jump around either a JMP or a JMPL to the label
          you want to jump to.

 Example......
	org	$8000,0
loop
	rept	200
	nop
	endr
	bne	loop		;Used to generate "out of range" error

          will actually produce object that does this...

	org	$8000,0
loop
	rept	200
	nop
	endr
	beq	*+3
	jmp	loop


 And....

	org	$8000,$8000*0
label

	org	$018000,$8000*1
	bne	label		;Used to generate "out of range" error


          will actually produce object that does this...


	org	$008000,$8000*0
label
	org	$018000,$8000*1
	beq	*+4
	jmp.l	label




          New command IRP.  This will replace the symbol specified
          with a value taken from a list using the current REPT count
          as an index.  Usage is..
                     IRP     symbol,value,value,......
Example...
          REPT     10
          IRP      parm,1,3,9,27,81,243,729,2187,6561,19683
          DW       parm
          ENDR

   which will produce a table of words with the powers of 3 in the range 0-9.

          The equivalent string command is called IRS and instead of
          symbols and values, a string is specified first and then a
          list of ascii text.



          Mario code now checks for white spaces after the OPcode so
          it is now possible to make macros with the first part of
          the name the same as a MARIO OPcode ie. plotbolox will
          execute the macro plotbolox and not the command PLOT.


Version 2.00
-------------
    SASMX - This version supports upto 16 megabytes of memory, which
is taken from the EMS pool.
    SASMX works on the 286|DOS EXTENDER specification. Therefore a
286 machine or above will be needed to run SASMX.





Version 2.01
-------------
   SL.EXE - The integrated linker for SASMX v2.01+, look at
SL.DOC for more information on SL.EXE.

   SASMX has two new opcodes and one command line option to support
the linker.  The command line option is -V<filename.SOB> which will
output a SASMX OBject file, the file does not have to be .SOB but
SL reads only .SOB extensions.
   The opcodes are PUBLIC and EXTERN.  PUBLIC makes a symbol usable
by another file and EXTERN uses a symbol created by another file.
  PUBLIC must come before the symbol is defined and EXTERN must come
before the symbol is used for the first time.
  The only restriction is that a relative branch will not work with
an extern.
  As the linker is fully integrated it is possible to do expressions
such as 

	extern kris,dyl,giles

	lda #kris/dyl+giles

 because the assembler will store an expression which is evaluated
at link time.


 The IRS opcode has been modified, so that is the rept count is
greater than the number of IRS parameters then it will 'wrap' round.

 Numbers can be expressed as 1234h or 01000b instead of $ and %
before the number.

 Macro defined twice prints the macro name defined twice.



Version 2.02
-------------
 Specifying a "/" or a "\" in a filename will override the incdir
setting.

 MARIO OFF symbol defined twice bug fixed.

 IRS will now look for quotes around it's parameters so that it is
possible to put spaces, commas etc. in the string

 Line number fixing has been fixed(honest) and improved. Line number
format is now expressed as the line in the current file being assembled
then all the macros that have been invoked to the current source
level and then the line number within the last macro.

 New operand STRLEN which will put the length into a variable.
Usage is:
	strlen	kris,1
 where kris is the variable and 1 is the string number.

 New CLI option -m which specfies how many errors to print up before
stopping assembly.

 MOVEB/MOVEW will now work in the case of moveb [r1],r0

 There was a certain complex condition when the filename would be
incorrect in errors, this has been fixed.

 NEW opcode SETDBR which is an assembler directive. It tells the
asseembler what the current DBR is, so that when effective
address calculations are done, proper error reporting can be done.
It also enables the user not to start putting &$ffff onto
expressions or sticking a .W on the end of the opcode.

 One error per macro is now the limit. SO that all the strategy macros
don't churn out 10 errors because one parameter was wrong which was
detected in the first error.

 New opcode ERROR+ which increments the number of errors.


            ------------------ END ---------------------
```