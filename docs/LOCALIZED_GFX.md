# Localization of 2D graphics
Graphic files are located in SF/DATA, palettes in SF/DATA/COL.

|                  | Japanese  | GB English | US English  | German       | CGX palette | SCR palette |
|------------------|-----------|------------|-------------|--------------|-------------|-------------|
| Title logo       | TI-3.CGX  | TI-3-G.CGX | TI-3-US.CGX | TI-3-G.CGX   | CP*.COL?    | CP*.COL     |
| Press Start      | CP.CGX    | CP.CGX     | CP.CGX      | CP-P.CGX     | BG2-D.COL?  | CP*.COL     |
| Controls screen  | CONT.CGX  | CONT-2.CGX | CONT-2.CGX  | CONT-2-G.CGX | BG2-E*.COL? | BG2-E*.COL  |
| Training/Game    | OBJ-2.CGX | OBJ-3.CGX  | OBJ-3.CGX   | OBJ-4.CGX    | OBJ-1.COL?  | ?           |
| Lylat system map | MAP.CGX   | MAP.CGX    | MAP.CGX     | MAP-G.CGX    | NIGHT.COL   | MAP_C.COL   |
| Scramble/Stage   | OBJ-1.CGX | OBJ-1.CGX  | OBJ-1.CGX   | OBJ-1-G.SGX  | ?           | ?           |
| Continue screen  | FOX.CGX   | FOX.CGX    | FOX.CGX     | FOX-G.CGX    | BG2-C.COL?  | BG2-B.COL   |

Which graphic files gets included to the ROM is defined in SF/BANK/INCBINS.ASM source file.

## Role of OBJ-1*.CGX
Training/Scramble/Stage/Clear in large font are displayed through series of macro invocations in SF/ASM/SPRITES.ASM between lines 450 and 500 approximately, one invocation per letter. Look for the GERMAN conditional assembly directive. In OBJ-1.CGX or OBJ-1-G.CGX, you will find tiles for those messages. Tiles are numbered starting with 0, horizontally from left to right, just like the Western reading order. Either file is 4 bits per pixel.

It is a mostly monospace 16x16 font (letter I being thinner than others as a special case), of square appearance, made from four 8x8 tiles arranged in a square block:

| . | . |
|---|---|
|1st|2nd|
|3rd|4th|

Macros defined further down SF/ASM/SPRITES.ASM (search aspr with the entire words option) tell which tiles to use for each letter. For example, letter A uses tiles 8, 9, 10, 11 (decimal, but other letters often use hexadecimal tile numbers with the $ prefix). Not all letters are defined, though. The German OBJ-1-G.CGX added tiles for drawing letters D and P. You can also flip horizontally or vertically a tile by appending "+1<<14" or "+1<<15" to spradd, respectively. This feature is used for rendering letters V and D.
