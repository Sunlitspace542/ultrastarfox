# Tools
All these tools are DOS executables and are intended to be run through DOSBox, unless otherwise noted.

## PACKER
**Tool made by Argonaut Software**  
Star Fox Palette packer/graphics cruncher. No longer used in this repo.  
sf_crunch is faster and saves more bytes compared to PACKER.  

## MERGE
**Tool made by Argonaut Software**  
Texture interleaving tool. No longer used in this repo. It is recommended you use cgx2fx instead.  
To use:  
``merge.exe [infile1] [infile2] [outfile] /cgx``  

## mugconv / foxchr
**Tool made by Phonymike**  
**Windows/Linux executable**  
Converts the provided FACE.png image into a scrambled FACE.CGX file.  
uses BLUE.COL as its palette. a blue.col.png file is provided to use while editing.  
To use:  
Run ``make_FACE.bat`` (Windows) or ``make_FACE.bat`` (Linux).  

## fontconv / foxfont
**Tool made by Phonymike**  
**Windows executable**  
Converts a BMP image to a matching .fon file.  
To use:  
Drag the BMP file onto foxfont.exe, or:  
``foxfont.exe [filename]``  (no brackets)  
Outputs ``[filename].fon``.  

## bgconv
**Tool made by Sunlit**  
**Windows/Linux executables/batch/bash script**  
**Requires Python 3 and Pillow library**
Converts a 512x512px PNG to a 512x512px background for use with the game.  
Run ``convert.bat`` (Windows) or ``convert.sh`` (Linux) and follow the instructions on-screen.  
Outputs a CGX tileset, SCR tilemap, and COL and PAL format palettes, and optionally, CCR and PCR compressed tiles and tilemap for versions of ultrastarfox below 2.0.  

## bgoptimize
**Tool made by Sunlit**  
**Windows batch script**  
**Requires Python 3 and Pillow library**
In the same directory as bgconv  
Optimizes an existing background to save on tiles, while keeping the original palette for it untouched.  
Run ``optimize.bat`` and follow the instructions on-screen.  
Outputs a CGX tileset and SCR tilemap, and optionally, CCR and PCR compressed tiles and tilemap for versions of ultrastarfox below 2.0.  

## unmerge
**Windows executable**  
Texture deinterleaving tool. Based on fx.cpp from [Star Fox 2 Font Tools](https://www.romhacking.net/utilities/346/) by Matthew Callis, modified by Sega Mega Drive.  
To use:  
``unmerge extract [bin/dat file] [file1] [file2]`` (no brackets, obviously)  
Outputs 2 files in MSX 4BPP format.  
This tool is now obsolete, it is recommended that you use cgx2fx and fx2cgx for interleaving and deinterleaving texture files.  

## cgx2fx / fx2cgx
**Tool made by Sega Mega Drive**  
**DOS/Windows executables**  
  
``cgx2fx`` interleaves two 4BPP CGX files into one FXGfx file.  
Usage: ``cgx2fx <input_cgx1> <input_cgx2> <output_bin>``  
  
``fx2cgx`` deinterleaves a FXGfx file back into two 4BPP CGX files.  
Usage: ``fx2cgx <input_bin>``  

## SHAPED
**Tool made by Argonaut Software**  
Tool that can convert Videoscape 3DG1 models to Star Fox ASM BSP format.  

## EXTEND.EXE
**Tool made by Sunlit**  
romExtender.py rewritten in C and compiled for MS-DOS, with improvements.   
Usage: ``EXTEND.EXE [rom] [padded size in mbits] [pad byte]``  
Pads/extends ROM image to the desired size in Mbits padded with the chosen pad byte.  
The original Python version can be found in the ``old/`` directory if you still need it.  

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

## INCCOL.EXE
**Tool made by Sunlit**  
A custom tool written for the palette packing process.  
Takes a col file and a start and end offset parameter.  
The start and end offsets are multiplied by 32.  
To use:  
``inccol [.col file] [start offset] [end offset]``  
Output is written to ``col.tmp``.  

## palconv.exe/palconv_win64.exe
**Tool made by Sunlit**  
**Windows/DOS executables**  
Tool that can convert to/from PAL/COL/SCL palettes.  
To use:  
``Usage: pc.exe [input_file] [output_file] [conversion type]``  
Types: ``col2scl`` ``scl2col`` ``scl2pal`` ``pal2scl`` ``pal2col``  

## MAPDEC.EXE
**Tool made by Sunlit**  
Tool to decode Argonaut .MAP linker address map files into a usable symbol listing.  
To use:  
``Usage: mapdec.exe [.MAP file] [output file]``  

## CHRMAP
**Tool made by Sunlit**
Tool to (de)tokenize message files for Star Fox (2).  
To use:  
``chrmap --detokenize|--tokenize [charmap txt file] [infile] [outfile]``
The charmap text file should look something like this:  
```
// token byte = "text"
0x27 = "[St]" // Example of bracketed multi-character symbolic token (and comments!)
0x80 = "ä" // Example of a quoted UTF-8 token
```
### Tokenization example
Charmap file has:  
```
0x83 = "Ü" // Cap. U w/ umlaut
```
This line:  
```
message	white,fox,<        ASTEROIDEN GÜRTEL>,other	; (94)
```
Becomes:  
```
message	white,fox,<        ASTEROIDEN GƒRTEL>,other	; (94)
```
For detokenization, it does the reverse.  
