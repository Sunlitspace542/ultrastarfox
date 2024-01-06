
## SASM Manual (From ARGSFX.DOC)
```
######################################################################
#              SASM (c)1992 Argonaut Software Ltd                    #
######################################################################

######################################################################
# Contents :                                                         #
#   1 : SASM assembler directives                                    #
#   2 : Printf % commands                                            #
#   3 : CLI options                                                  #
#   4 : Enviroment variables used by SASM                            #
#   5 : Assembler variables                                          #
#   6 : Assembler strings                                            #
#   7 : Expression evaluation                                        #
#   8 : Special notes                                                #
#                                                                    #
######################################################################

----------------------------------------------------------------------
1  SASM assembler directives
----------------------------------------------------------------------
<label>   =   <expression>          Sets <label> to be <expression>,
                                    cannot be redefined
                                    see EQU, EQUR
          CHECKMAC ON/OFF           Will turn on and off duplicate
                                    macro name checking.

          DATE <label>              Puts the date into <label>.

          DB,DW expr., etc.         Defines a string of Bytes or Words

          DEFEND "<string>"         Defines the end message with a
                                    printf string.
                                    see PRINTF

          DEFERROR "<string>"       Defines the error message with a
                                    printf string.
                                    see PRINTF

          DEFS strnum,"<string>"    Defines string number 1-5 with
                                    the result of a printf string
                                    see PRINTF,ROLS,STRLEN

          ELSEIF                    Swaps the condtional level
                                    see IF, ENDC

          END                       Stops assembly of the current
                                    source file

          ENDM                      Ends a macro definition
                                    see MACRO, MEXIT

          ENDR                      Ends a repeat loop
                                    see REPT

<label>   EQU <expression>          Sets the <label> to be <expression>,
                                    cannot be redefined
                                    see =, EQUR

<reg>     EQUR <expression>        Sets the <register> to be <expression>,
                                    can be used in MARIO code only
                                    see =, EQU

          EXTERN <symbol>           Marks all expressions using this
                                    symbol to be written out in the .SOB file
                                    if linkable code is on.

          FABCARD <expression>      Sets the FABcard port address.
                                    see SEND

          FAIL                      Causes a fatal error

          FOPEN <(+)name>           Redirects printf's to file <name>
                                    if a "+" is added before the file name
                                    then the file will be opened in append
                                    mode. It is neccassary for a file to
                                    exist if append mode is chosen.
                                    see FCLOSE, PRINTF

          FCLOSE                    Redirects the printf's to the screen.
                                    see FOPEN, PRINTF

          GETENV strnum,<ENV VAR>   Puts the contents of the enviroment
                                    variable into string number 1-5

          IFxx                      Starts a conditional check where
                                    xx is one of the following...
                                    EQ - equal         NE - not equal
                                    GE - gt. or equal  LE - less or equal
                                    GT - gt.           LT - less
                                    D  - label def.    ND - label not def.
                                    C  - strings eq.   NC - strings not eq.
                                    V  - env. exist    NV - env. not exist
                                    S  - string char   NS - not string char
                                    see. ELSEIF, ENDC

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
                                    value into the symbol using the rept count
                                    see REPT, ENDR,IRS

          IRS <string>,[ascii]....  Same as IRP but uses strings instead
                                    see REPT, ENDR,IRP

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

          OUTPUT <name>             Outputs the object code to file <name>
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

          TYPE <filename>           Prints <filename> to the screen

          UPPER <string>            Uppercases string <string>
                                    see LOWER

          WRITE <ON,OFF>            When object code is written out to
                                    disk then only blocks blocks flagged
                                    to be output are written.
                                    ON  -  Ouput blocks (Default)
                                    OFF -  Stop outputting
                                    see OUTPUT




----------------------------------------------------------------------
2  PrintF commands
----------------------------------------------------------------------
          $<str> -          print string x.
          %      -          prints a real percent mark
          <xx>   -          prints ESC[xxm (ANSI command) where xx is a 2
                            digit ANSI code.
          b      -          prints a backspace
          c      -          prints the second nested macro name
          d      -          prints the error description(ERROR or WARNING)
          e      -          prints the error message(Bad byte value etc.)
          f      -          prints the current file name
          h      -          converts a 2 digit ASCII hex number to a real
                            hex number and inserts it.
          i<N>   -          prints an extended command where N is the
                            command(see below)
          k      -          total memory free available to Sasm
          l      -          prints the current line number
          m      -          prints the current macro name
          n      -          prints a carriage return
          p      -          prints the parent label name
          q      -          prints a quote (")
          s      -          switch on a listing for one line(error string
                            handler)
          t      -          prints a tab
          u      -          prints the unknown symbol in forward
                            reference errors
          x<expr >-         print the expression. (note the white space
                            after the expression.)

Extended commands I(x)
          b          -          total number of bytes(End message only)
          c          -          prints processor type
          e          -          number of errors
          f          -          number of files
          l          -          number of lines
          s          -          number of symbols
          w          -          number of warnings


Remember a :$ before an expression will print the value in hex.



----------------------------------------------------------------------
3  CLI options
----------------------------------------------------------------------
-d<value>,"<str>" - Defines a string
-e<label>(=value) - Equate label with the optional value
-f<Name>          - Show file listing on screen or write to file
-h                - This text
-i                - Specifies an incdir name
-l                - Turns on listing
-m<value>         - Specifies maximum errors before stopping
-o<Name>          - Write object code to <Name>
-r                - Display rom listing on screen
-s<label>(=value) - Set the label with the optional value
-v<filename.SOB>  - Write linkable file <filename.SOB>
-x[filename]      - Turns on symbol listing

The following are labels which if defined on the command line do
various things
-e__notitle       - Don't display a title message
-e__mario         - Defualt source code is MARIO code
-e__heap=xxxx     - Defines the heap size in bytes


----------------------------------------------------------------------
4  Enviroment variables
----------------------------------------------------------------------
SASMSRC           - Specifies the default source name.
SASMHEAP          - Specifies the default heap size.
SASMDIR           - Specifies a default incdir name (cleared if name
                    specified on command line)


----------------------------------------------------------------------
5  Assembler variables
----------------------------------------------------------------------
_SASM             - Defined if SASM
NARG              - Number of arguments in a macro
LONGA             - Non-zero if in long accumulator mode
LONGI             - Non-zero if in long index mode
_DAY              - Day 1-31
_MONTH            - Month 1-12
_YEAR             - 1992-????
_DATE             - Date in format yyyymmdd  yyyy=year mm=month dd=day


----------------------------------------------------------------------
6  Assembler strings
----------------------------------------------------------------------
6                 - Last filename included
7                 - Date in text format ie. Monday 1st January 1999
8                 - First filename included


----------------------------------------------------------------------
7  Expression evaluation
----------------------------------------------------------------------
  Expression evaluation is done in order of precedance, if two
operators have equal precedance then they are evaluated left to right.
  This table is a list of the operators available and there
precedance(A high number means it has a high precedance).....

    Operator     Name             Action               Precedance
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

   Partially enclosing an expression in brackets will give that part
of the expression a higher priority hence 1+2*3 = 7 but (1+2)*3 = 9.

   All expressions are done with a 32 bit expression evaluator, if an
overflow occurs while performing an operator, no overflow error will
be given, however overflow errors will be given if a number is too
big ie. a hex number has more than 8 digits etc.



----------------------------------------------------------------------
8  Special notes
----------------------------------------------------------------------
Hidden symbols --
 As the assembler runs it's own internal source file before including
the source file specified, it is possible to attempt to define
symbols in your source code which are the same as some defined in the
internal source, if this happens you will have to redefine your
symbol.

   There is a command hidden to the user called getheap, which will
get as much heap as specified, this is used by the assembler on
startup and shouldn't be used by the user. However GETHEAP cannot be
defined as a macro, but unless checkmac is on this error will not
be reported.

   Do not define string 5 on the command line if you have a sasmheap
enviroment variable defined as the assembler uses string 5 as a
temporary storage for the heap size in its internal source code.

   The assembler supports ASCII codes, that is characters from 0 to
127, if a character higher than 127 is used in a macro,symbol etc.
things may go very wrong!

 It is possible to use INCCOL as a CGX and SCR file includer too!
  To include a CGX file you will have to know how many chars are in
it, and to include a SCR file you will have to know how many screens
are used.  Below are some macros to include them!

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

   Downloading to SFX can sometimes go wrong, if it does switch on
rom listing and note which bank goes wrong(not rom pos.), go into the
source code and put a few extra bytes at the start of the bank!
(Fixed now I think)
```

## SASM help text
```
SASMX v2.02  Copyright (c) Argonaut Software Ltd 1992
Usage: SASMX [options] sourcefile
 Options are:
   -d<value>,"<str>" - Defines a string.
   -e<label>(=value) - Equate label with the optional value.
   -f<Name>          - Show file listing on screen or write to file.
   -h                - This text.
   -i<Name>          - Specifies an incdir name.
   -l                - Turns on listing.
   -m<value>         - Specifies maximum errors before stopping.
   -o<Name>          - Write object code to <Name>.
   -r                - Display rom listing on screen.
   -s<label>(=value) - Set the label with the optional value.
   -v<filename.SOB>  - Write linkable file <filename.SOB>.
   -x<Name>          - Turns on symbol listing to optional file.

 Valid enironment variables : 
   sasmdir           - Default directory for the source code.
   sasmsrc           - Default source code file.
   sasmheap          - Default heap size.
```

## Other notes
- SASM does not support the ``MVN`` / ``MVP`` instructions. Macros are provided in this repository (``sasm_mvn`` / ``sasm_mvp``) that get around this.  
- SASM is only capable of assembling in LoROM.  
