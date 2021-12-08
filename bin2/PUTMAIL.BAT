@echo off
c:
cd \ameol
echo Archiving.
del>NUL: am_%user.zip
pkzip>NUL: -e0 -rP am_%user %user\*.*
echo Finished.
