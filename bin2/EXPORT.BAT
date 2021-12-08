@echo off
if "%1" NE "NOTOUCH" touch *.asm *.mc
if "%1" NE "NOTOUCH" copy stdfiles.log files.log
make.exe ASMFLAGS=-efilelist=1
if ERRORLEVEL == 0 lha u -x sf @files.log

