@echo off

@call version.cmd

echo Building full release of UltraStarFox %VER%...

@call build.cmd

mkdir ".\releases\Release %VER%\USA Patches\"
mkdir ".\releases\Release %VER%\PAL Patches\"
mkdir ".\releases\Release %VER%\Japan Patches\"

echo Making USA rev 0 patches...
.\flips.exe --create --bps-delta ".\baseroms\Star Fox (USA).sfc" "SF.SFC" ".\releases\Release %VER%\USA Patches\UltraStarFox (USA) %VER%.bps"

echo Making USA rev 1 patches...
.\flips.exe --create --bps-delta ".\baseroms\Star Fox (USA) (Rev 1).sfc" "SF.SFC" ".\releases\Release %VER%\USA Patches\UltraStarFox (USA) (Rev 1) %VER%.bps"

echo Making USA rev 2 patches...
.\flips.exe --create --bps-delta ".\baseroms\Star Fox (USA) (Rev 2).sfc" "SF.SFC" ".\releases\Release %VER%\USA Patches\UltraStarFox (USA) (Rev 2) %VER%.bps"

echo Making JP rev 0 patches...
.\flips.exe --create --bps-delta ".\baseroms\Star Fox (Japan).sfc" "SF.SFC" ".\releases\Release %VER%\Japan Patches\UltraStarFox (Japan) %VER%.bps"

echo Making JP rev 1 patches...
.\flips.exe --create --bps-delta ".\baseroms\Star Fox (Japan) (Rev 1).sfc" "SF.SFC" ".\releases\Release %VER%\Japan Patches\UltraStarFox (Japan) (Rev 1) %VER%.bps"

echo Making PAL rev 0 patches...
.\flips.exe --create --bps-delta ".\baseroms\Starwing (Europe).sfc" "SF.SFC" ".\releases\Release %VER%\PAL Patches\UltraStarFox (PAL) %VER%.bps"

echo Making PAL rev 1 patches...
.\flips.exe --create --bps-delta ".\baseroms\Starwing (Europe) (Rev 1).sfc" "SF.SFC" ".\releases\Release %VER%\PAL Patches\UltraStarFox (PAL) (Rev 1) %VER%.bps"

echo Making PAL-G patches...
.\flips.exe --create --bps-delta ".\baseroms\Starwing (Germany).sfc" "SF.SFC" ".\releases\Release %VER%\PAL Patches\UltraStarFox (Germany) %VER%.bps"

echo All done!

pause