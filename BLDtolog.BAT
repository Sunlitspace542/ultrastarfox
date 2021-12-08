cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
make sg.rom > ..\build.log
cd ..
copy sf\sg.rom SF.SFC
del sf\sg.rom
del sf\*.sob
pause
exit

