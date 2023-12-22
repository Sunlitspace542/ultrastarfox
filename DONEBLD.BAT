@echo off
copy sf\sf.rom SF.SFC
del sf\sf.rom
del sf\BANK\*.sob
del sf\status.doc
del sf\lastasm.tmp
del sf\msgs.txt
del sf\alvars.txt
copy sf\symbols.txt symbols.txt
del sf\symbols.txt
del sf\msprites\*.bin
del sf\data\col\*.pac
del SF\DATA\*.CCR
del SF\DATA\*.PCR