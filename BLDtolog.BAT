cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
@echo off
del \BANK\*.sob
del lastasm.*
del *.bak /s
@echo on
make sg.rom > ..\build.log
cd ..
copy sf\sg.rom SFBuilt.SFC
del sf\sg.rom
del sf\BANK\*.sob
del sf\status.doc
del sf\lastasm.tmp
del sf\msgs.txt
del sf\alvars.txt
pause
exit
