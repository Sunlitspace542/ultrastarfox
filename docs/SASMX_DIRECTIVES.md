# SASMX Directives

## Conditionals
``IFEQ`` - If equal to 0  
``IFNE`` - If not equal to 0  
``IFGT`` - If greater than  
``IFLT`` - If less than  
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
## Unknown
``shorta``  
``longa``  
``shorti``   
``longi``  