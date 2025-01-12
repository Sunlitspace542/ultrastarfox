# Tools

## mugconv / foxchr
**Tool made by Phonymike**  
**Windows/Linux executable**  
Converts the provided FACE.png image into a scrambled FACE.CGX file.  
uses BLUE.COL as its palette. a blue.col.png file is provided to use while editing.  
To use:  
Run ``make_FACE.bat`` (Windows) or ``make_FACE.sh`` (Linux).  

## foxfont
**Tool made by Phonymike**  
Converts a BMP image to a matching .fon file.  
To use:  
Drag the BMP file onto foxfont.exe, or:  
``foxfont.exe [filename]``  (no brackets)  
Outputs ``[filename].fon``.  

## bgconv
**Tool made by Sunlit**  
**Windows/Linux executables/batch/bash script**  
Converts a 256x1024px PNG to a 512x512px background for use with the game.  
(can also be used with 256x256px PNGs to make single-screen BGs.)  
Run ``convert.bat`` (Windows) or ``convert.sh`` (Linux) and follow the instructions on-screen.  
Outputs a CGX tileset, SCR tilemap, and COL and PAL format palettes, and optionally, CCR and PCR compressed tiles and tilemap for versions of ultrastarfox below 2.0.  

## cgx2fx / fx2cgx
**Tool made by Sega Mega Drive**  
  
``cgx2fx`` interleaves two 4BPP CGX files into one FXGfx file.  
Usage: ``cgx2fx <input_cgx1> <input_cgx2> <output_bin>``  
  
``fx2cgx`` deinterleaves a FXGfx file back into two 4BPP CGX files.  
Usage: ``fx2cgx <input_bin>``  

## romextender
**Tool made by Sunlit**  
romExtender.py rewritten in C and compiled for MS-DOS, with improvements.   
Usage: ``EXTEND.EXE [rom] [padded size in mbits] [pad byte]``  
Pads/extends ROM image to the desired size in Mbits padded with the chosen pad byte.  
The original Python version can be found in the ``old/`` directory if you still need it.  

## sf_crunch + sf_decrunch
**Tool made by [Everything](https://www.romhacking.net/community/3898/) on RHDN**  
sf_crunch is used to compress .CGX and .SCR files into .CCR (crunched cgx) and .PCR (crunched scr) files.
sf_decrunch is used to decompress .CCR and .PCR files into .CGX and .SCR files.  

[sf_crunch + decrunch RHDN page](https://www.romhacking.net/utilities/1543/)

## inccol
**Tool made by Sunlit**  
A custom tool written for the palette packing process.  
Takes a col file and a start and end offset parameter.  
The start and end offsets are multiplied by 32.  
To use:  
``inccol [.col file] [start offset] [end offset]``  
Output is written to ``col.tmp``.  

## palconv
**Tool made by Sunlit**  
Tool that can convert to/from PAL/COL/SCL palettes.  
To use:  
``Usage: pc.exe [input_file] [output_file] [conversion type]``  
Types: ``col2scl`` ``scl2col`` ``scl2pal`` ``pal2scl`` ``pal2col``  

## argonautmapdecoder
**Tool made by Sunlit**  
Tool to decode Argonaut .MAP linker address map files into a usable symbol listing.  
To use:  
``Usage: mapdec.exe [.MAP file] [output file]``  
