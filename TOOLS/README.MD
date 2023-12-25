# Tools
All these tools are DOS executables and are intended to be run through DOSBox, unless otherwise noted.

## PACKER
Star Fox Palette packer. A copy of this EXE is run from BIN\ when you run ``build.cmd`` or ``build to log.cmd``.  

## MERGE
Texture interleaving tool.
To use:  
``merge.exe [infile1] [infile2] [outfile] /cgx``  

## mugconv / foxchr
**Tool made by Phonymike**  
**Windows executable**  
Converts the provided FACE.png image into a scrambled FACE.CGX file.  
uses BLUE.COL as its palette. a blue.col.png file is provided to use while editing.  

## fontconv / foxfont
**Tool made by Phonymike**  
**Windows executable**  
Converts a BMP image to a matching .fon file.  
To use:  
Drag the BMP file onto foxfont.exe, or:  
``foxfont.exe [filename]``  (no brackets)
Outputs ``[filename].fon``.  

## unmerge
**Windows executable**  
Texture deinterleaving tool. Based on fx.cpp from [Star Fox 2 Font Tools](https://www.romhacking.net/utilities/346/), modified by Sega Mega Drive.  
To use:  
``unmerge extract [bin/dat file] [file1] [file2]`` (no brackets, obviously)  
outputs 2 files in MSX 4bpp format.  

## SHAPED
Tool that can convert Videoscape 3DG1 models to Star Fox ASM BSP format.  

## EXTEND.EXE
romExtender.py rewritten in C and compiled for MS-DOS, with improvements.   
Usage: EXTEND.EXE (rom) (padded size in mbits) (pad byte)  
Pads/extends ROM image to the desired size in Mbits padded with the chosen pad byte.  
The original Python version can be found in the old/ directory if you still need it.  

## SFCHECK.EXE  
Superfamicheck, **Tool made by [Optiroc](https://github.com/Optiroc) on GitHub**  
Super NES checksum tool, compiled for MS-DOS. The old 64-bit Windows version that was used in this repo previously is in old\ if you need it.  

## sf_crunch + sf_decrunch
**Tool made by [Everything](https://www.romhacking.net/community/3898/) on RHDN**  
**Windows/DOS executables**  
sf_crunch is used to compress .CGX and .SCR files into .CCR (crunched cgx) and .PCR (crunched scr) files.
sf_decrunch is used to decompress .CCR and .PCR files into .CGX and .SCR files.

The prebuilt versions included here are command line utilities for Windows, the c++ source files are on RHDN (link below)  
CRU.EXE and DECRU.EXE are versions prebuilt for MS-DOS.  

[sf_crunch + decrunch RHDN page](https://www.romhacking.net/utilities/1543/)
