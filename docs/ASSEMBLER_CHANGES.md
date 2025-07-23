

```
╔════════════════════════════════════════════════════════════════════╗
║    SASMX & ArgSfx Copyright (c) Argonaut Software Ltd. 1992,1994   ║
║  SL & ArgLink SFX Copyright (c) Argonaut Software Ltd. 1992,1994   ║
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
╠════════════════════════════════════════════════════════════════════╣
║                                                                    ║
║              ████   ████   ████   ████  █████ █    █               ║
║             █    █ █    █ █      █    █ █     █    █               ║
║             █    █ █    █ █      █      █      █  █                ║
║             ██████ █████  █  ███  ████  █████   ██                 ║
║             █    █ █    █ █    █      █ █      █  █                ║
║             █    █ █    █ █    █ █    █ █     █    █               ║
║             █    █ █    █  ████   ████  █     █    █               ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
```
## ArgSfx (ArgAsm - Super FX) 

## General Changes From SASM

Around mid-1993, SASM and SL were heavily modified and renamed to ArgSfx and ARGLINK, used during the development of Star Fox 2.  
In ArgSfx, strings can be defined with names instead of numbers 1-5 using the ``STRING`` directive.  
ArgSfx replaces ``ROLS`` with ``SUBSTR``, and adds a new ``STRING`` directive, which allows for greater manipulation of strings.  
The character index for strings now begins at 0 instead of 1.  
Two new ``IF`` directives, ``IFFE`` and ``IFFNE``, have been added that check for the existence/nonexistence of a specified file.  
ArgSfx's error checking is a bit stricter than SASM, watch out for "bad word/byte size" and "macro defined twice" errors.  
In the event you run into a bad word or byte size, try tagging ``&$FFFF`` at the end of the value for DW directives and ``&FF`` for DB directives.  

## Version 1.44

``WAI`` 65816 opcode implemented.  

## Version 1.49

``IFFE``/``IFFNE`` directives added to check if a file does/doesn't exist at a specified path.  
Example...  
```
	iffe "c:\autoexec.bat"
	nop
	endc

	iffne "c:\rats.doc"
	nop
	endc
```

## Modifications by Sunlit

## Unofficial Version 1.53

``_SASM`` label no longer defined on startup, fixes expressions that check for SASM specifically evaluating as true.  

## Unofficial Version 1.54

``CHECKMAC`` disabled by default.  

## Unofficial Version 1.55

An error message referring to ``sasm.doc`` (the original SASM manual file) was changed to "see the manual".  
