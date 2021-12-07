set path=%path%;c:\bin
set sasmheap=14400
cd sg
make sg.rom > ..\build.log
cd ..
copy sg\sg.rom SF.SFC
del sg\sg.rom
del sg\*.sob
pause
exit
