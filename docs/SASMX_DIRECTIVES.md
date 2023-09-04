# SASMX Directives

## Processor Register-related
``shorta``  - Tells the assembler the code is to be assembled with the accumulator as 8 bits.  
``longa``  - Tells the assembler the code is to be assembled with the accumulator as 16 bits.  
``shorti`` - Tells the assembler the code is to be assembled with the index regs. as 8 bits.  
``longi``  - Tells the assembler the code is to be assembled with the index regs. as 16 bits.  
## Conditionals
``IFEQ`` - If equal to 0  
``IFNE`` - If not equal to 0  
``IFGT`` - If greater than  
``IFLT`` - If less than  
``IFGE`` - If greater than or equal to  
``IFLE`` - IF less than or equal to  
``IFD`` - If label defined  
``IFND`` - If label not defined  
``IFC`` - If strings equal  
``IFNC`` - If strings not equal  
``IFV`` - If Env. Variable exists  
``IFNV`` - If Env. Variable does not exist  
``IFS`` - If string char  
``IFNS`` - If not string char  
``ELSEIF`` - Else if  
``FAIL`` - end assembly via fatal error (typically preceded by a printf specifying the error)  
``ENDC`` - End conditional  
``END`` - Stops assembly of the current source file  
## Loops
``REPT`` - Starts a repeat loop (can be nested)  
``ENDR`` - Ends a repeat loop  
``IRP (symbol,value)`` - Iterate Rept Parameter, puts the value into the symbol using the rept count  
``IRS (string, ascii)`` - Same as IRP but uses strings instead  
## Macros
``macroname	MACRO`` - Start macro definition (replace ``macroname`` w/ name of your macro)  
``ENDM`` - End Macro  
``MEXIT`` - Exits the current macro, ignores conditional levels.  
## Input/Output
``fopen	(file)`` - write to new file  
``fclose	!`` - save file  
``printf "string"`` - print string to command line at assembly (or into a file if used with fopen/fclose  
``LIST (on/off/macros)`` - Turns on or off listing of the source. If macros is specified then macro expansions will be listed also. The OFF option will turn off macro expansion listing.  
## Including Files
``INCBIN (name)`` - Includes binary file  
``INCCOL (name,start,end)`` - Includes .COL format palettes.  
``INCDIR (dir)`` - Include directory name to be added to the start of INCLUDE, INCBIN, INCCOL.  
``INCLUDE (name)`` - Includes source file.  
## Variables
``_SASM`` - Defined if SASM  
``NARG`` - Number of arguments in a macro  
``LONGA`` - Non-zero if in long accumulator mode  
``LONGI`` - Non-zero if in long index mode  
``_DAY`` - Day 1-31  
``_MONTH`` - Month 1-12  
``_YEAR`` - 1992-????  
``_DATE`` - Date in format yyyymmdd  yyyy=year mm=month dd=day  
## Misc.
``LOCAL`` - Declares a local label as parent.local  
``DATE (label)`` - Puts the date into (label).  
Example:  
```
          date       date
year      =          date>>16&$ffff
month     =          date>>8&$ff
day       =          date&$ff
          printf     "The date is ",day,"/",month,"/",year,"%n"
```
