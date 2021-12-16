cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
@echo off
del *.sob
del lastasm.*
del *.bak /s
@echo on
make sg.rom > ..\build.log
cd ..
copy sf\sg.rom build\SF.SFC
del sf\sg.rom
del sf\*.sob
del sf\status.doc
del sf\lastasm.tmp
pause
exit
