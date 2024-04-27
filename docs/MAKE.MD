# MAKE.EXE Info
```
MAKE 2.4r1 Copyright (C) 1985-1991 by Zortech,   written by Walter Bright
All Rights Reserved. Usage:
	MAKE {target} {macro=text} {-dilnqst} [-fmakefile] {@file}

@file	Get command args from environment or file
target	What targets to make	    macro=text	Define macro to be text
-d	Output debugging info	    -ffile	Use file instead of makefile
-f-	Read makefile from stdin    -i	Ignore errors from executing make rules
-l	List macro expansions	    -n	Just echo rules that would be executed
-q	If rules would be executed  -s	Do not echo make rules
	then exit with errorlevel 1 -t	Just touch files

Predefined macros:
	$$	Expand to $
	$@	Full target name
	$?	List of dependencies that are newer than target
	$**	Full list of dependencies
	$*	Name of current target without extension
	$<	From name of current target, if made using an implicit rule
Rule flags:
	+	Force use of COMMAND.COM to execute rule
	-	Ignore exit status
	@	Do not echo rule
	*	Can handle environment response files
```
## Other notes  
- Macro names cannot be longer than 8 characters.