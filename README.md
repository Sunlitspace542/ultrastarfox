
# UltraStarFox
Star Fox / Starwing (SNES 1993) source code, modified for ease-of-use and ROMHacking.

## Features

- SuperFX 21Mhz support
- FastROM (A bug with the SD2SNES/FXPak Pro causes freezes and crashes on SHVC revisions of the SNES)
- Lots of free bank space for new models, assets and code
- 256 texture slots
- 250 Faces/Vertices limit
- Bugfixes and improvements
- Uses ARGLINK from Star Fox 2 as linker instead of SL
- Color palette data, MSPRITES, and crunched (compressed) graphics rebuilt at assembly
- Easier creation of wireframe models (replace face3 and face4 macros with aface3 and aface4 macros in the shape file)
- All Starwing PAL and Germany text/GFX for PAL builds
- SNES Mouse support
- MSU-1 support (Original ASM patch by Kurrono, ported by Kando and Sunlit)
- Very configurable, see SF\CONFIG\CONFIG.INC for more info
- Kando was involved so you know it's good

## Building on Windows

Requirements: Microsoft Windows

Download repo as ZIP and extract somewhere, or clone the repo with git via the command line.  

To build ROM, run ``build.cmd``  

To build ROM with Logging, run ``build to log.cmd`` 

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.

## Building on Linux

**NOTE: this was tested on WSL with Ubuntu installed. Your mileage may vary.**  

Requirements: Ubuntu (might work with other distros) snap, DOSBox-X, git  

Install snapstore: ``sudo apt install snapd``  

Install DOSBOX-X from snap: ``sudo snap install dosbox-x``  

Clone repository: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

To build ROM, run ``build.sh``  

To build ROM with logging, run ``buildtolog.sh``  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.  

## Helpful Links/tools

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[65c816 Opcodes](https://undisbeliever.net/snesdev/65816-opcodes.html)  
[65c816 Reference](https://wiki.superfamicom.org/65816-reference)  
[MARIO (SuperFX) Chip ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)  
[EarthBound Music Editor (But for Star Fox)](https://github.com/phonymike/ebmused4sf/)  
[Star Fox Music Programming Starter Kit (by livvy94)](https://www.dropbox.com/sh/m3sk75dmsyx5tey/AACLDXVcQEJk3ezQCDBitEs7a?dl=0)

## TODO
1. OPTIMIZE  
2. Strip out all Super Star Fox weekend-related code  
3. Annotate and document code  
4. MAYBE: Disassemble all BIN files in SND directory, add documentation on custom music and the like  

## Project Structure
```
ultrastarfox
├── BIN: exe files needed to assemble game code
├── optionalstuff: optional graphics files
├── SF: Main source code is located here
│   ├── ASM: Main game code located here (65816)
│   ├── BANK: Bank data\ASM files
│   ├── CONFIG: Various game aspects can be configured here
│   ├── DATA: GFX files
│   │   ├── COL: Palette files and Palette Packer
│   │   ├── CGX: .CGX graphics files that are crunched
│   │   └── SCR: .SCR tilemap files that are crunched
│   ├── EXT: .ext files needed by several .asm files
│   ├── INC: .inc files, arc tangent table
│   ├── MAPS: level scripts
│   ├── MARIO: .MC MARIO (SuperFX) ASM code
│   ├── MSG: Message files for English, Japanese, German, and French
│   ├── MSPRITES: contains interleaved FXGfx format textures
│   ├── PATH: contains all PATH language code
│   ├── SHAPES: contains all shape files
│   ├── SND: sound/music data
│   └── STRAT: Code for Strategies (Object behaviors)
├── TOOLS: tools such as PACKER and SHAPED
├── DOCS: .md format text files covering various aspects of Star Fox 2
├── OPTIONALSTUFF: optional graphics files
└── OTHER: Files for building MSPRITES .bin files
```
