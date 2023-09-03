# SASMX Directives

## Processor Registers
``shorta``  - Tells the assembler the code is to be assembled with the accumulator as 8 bits.  
``longa``  - Tells the assembler the code is to be assembled with the accumulator as 16 bits.  
``shorti`` - Tells the assembler the code is to be assembled with the index regs. as 8 bits.  
``longi``  - Tells the assembler the code is to be assembled with the index regs. as 16 bits.  
## Conditionals
``IFEQ`` - If equal to 0  
``IFNE`` - If not equal to 0  
``IFGT`` - If greater than  
``IFLT`` - If less than  
``IFD`` - If defined  
``IFND`` - If not defined  
``ELSEIF`` - Else if  
``FAIL`` - end assembly (typically preceded by a printf specifying the error)  
``ENDC`` - End conditional  
## Macros
``macroname	MACRO`` - Start macro definition (replace ``macroname`` w/ name of your macro)  
``ENDM`` - End Macro  
## Input/Output
``fopen	(file)`` - write to new file  
``fclose	!`` - save file  
``printf "string"`` - print string to command line at assembly  
## Variables
_SASM - Defined if SASM
``NARG`` - Number of arguments in a macro  
``LONGA`` - Non-zero if in long accumulator mode  
``LONGI`` - Non-zero if in long index mode  
``_DAY`` - Day 1-31
``_MONTH`` - Month 1-12
``_YEAR`` - 1992-????
``_DATE`` - Date in format yyyymmdd  yyyy=year mm=month dd=day  
## Unknown
``IFC`` - If condition?  
``IFNC`` - If not condition?  
