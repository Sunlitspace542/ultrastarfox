@echo off

echo ======
echo Star Fox Background Optimizer 9000
echo Tool by Sunlit, version 1.0
echo ======

set /p infile="Enter the input 512x512 PNG file prefix (without extension): "
set /p inpal="Enter Source .PAL Palette (no SCAD stamp, w/o extension): "
set /p outfile="Enter the prefix for the output CGX/SCR/COL and CCR/PCR files: "

echo[
echo ======
echo Converting BG PNG to proper format...
echo ======
echo[

python3 .\bin\pngformatter.py %infile%.png

echo[
echo ======
echo Running superfamiconv...
echo ======
echo[

.\bin\superfamiconv.exe tiles -v -i .\%infile%_tall.png -p .\%inpal%.PAL --out-data %outfile%.cgx --bpp 4
.\bin\superfamiconv.exe map -v -i .\%infile%_tall.png -p .\%inpal%.PAL -t %outfile%.cgx --out-data %outfile%.scr --bpp 4
del %infile%_tall.png

echo[
echo ======
echo PNG to CGX/SCR conversion complete!
echo ======
echo[

echo[
echo !!!!!!
echo Do you want to crunch the new gfx data? if yes, press any key, if no, close script
echo !!!!!!

pause

bin\sf_crunch.exe %outfile%.cgx %outfile%.ccr
bin\sf_crunch.exe %outfile%.scr %outfile%.pcr

echo[
echo ======
echo GFX crunch successful!
echo ======
echo[

pause
exit