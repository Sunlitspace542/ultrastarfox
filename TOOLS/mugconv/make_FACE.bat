@echo off

@superfamiconv\superfamiconv.exe tiles -i FACE.png -p superfamiconv\mugs-transparent.pal --out-data FACE.CGX --bpp 4 --no-discard
@foxchr FACE.CGX

@del FACE.cgx
