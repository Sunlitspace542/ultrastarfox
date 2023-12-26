cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
make > ..\build.log
cd ..
del SF\BANK\*.SOB
pause
exit
