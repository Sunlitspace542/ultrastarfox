@echo off

@superfamiconv -i FACE.png -t FACE.CGX --no-remap --no-discard
@foxchr FACE.CGX

@del FACE.cgx

@ren FACE-SCRAMBLED.cgx FACE.cgx
