cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
@echo off
del .\BANK\*.sob
del lastasm.*
del *.bak /s
@echo on
make
cd ..
@call DONEBLD
pause
exit
