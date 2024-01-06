
# UltraStarFox
Star Fox / Starwing source code, modified for ease-of-use and ROMHacking.

## Features

- Uses GSU-2/Super FX 2 @21.4Mhz instead of MC1 @10.7Mhz
- FastROM support (An SD2SNES/FXPak Pro bug causes instability on 2CHIP SNES revisions)
- MSU-1 support (Original ASM patch by Kurrono, ported by Kando and Sunlit)
- SNES Mouse support and analog stick support via the SNES mouse
- Very configurable, see SF\CONFIG\CONFIG.INC for more info
- Lots of free ROM space
- Bugfixes and improvements
- 256 texture slots
- 250 faces/vertices limit for models
- Build process optimized for speed
- Palettes and graphics crunched, textures interleaved, and fonts built at assembly
- Uses ARGLINK from Star Fox 2 as linker instead of SL
- Easier creation of wireframe models (replace face3 and face4 with aface3 and aface4 in your shape file)
- All Starwing PAL and Germany text/GFX for PAL builds
- **Kando was involved so you know it's good**

## Building on Windows

Requirements: Microsoft Windows

Download repo as ZIP and extract somewhere, or clone the repo with git via the command line.  

To build ROM, run ``build.cmd``.  

To build ROM with Logging, run ``build to log.cmd``.  

To clean, run ``clean.cmd``.  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.

## Building on Linux

**NOTE: this was tested on WSL with Ubuntu installed. Your mileage may vary.**  

Requirements: Ubuntu (might work with other distros) snap, DOSBox-X, git  

Install snapstore: ``sudo apt install snapd``  

Install DOSBOX-X from snap: ``sudo snap install dosbox-x``  

Clone repository: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

To build ROM, run ``make``.  

To build ROM with logging, run ``make log``.  

To clean, run ``make clean``.  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.  

## Helpful Links/tools

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[65c816 Opcodes](https://undisbeliever.net/snesdev/65816-opcodes.html)  
[65c816 Reference](https://wiki.superfamicom.org/65816-reference)  
[MARIO (SuperFX) Chip ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)  
[EarthBound Music Editor (But for Star Fox)](https://github.com/phonymike/ebmused4sf/)  
[Star Fox Music Programming Starter Kit (by livvy94)](https://www.dropbox.com/sh/m3sk75dmsyx5tey/AACLDXVcQEJk3ezQCDBitEs7a?dl=0)

## TODO
1. Optimize game where possible (We already have FastROM and 21Mhz SuperFX 2, can we go any further?)  
2. Strip out all Super Star Fox weekend(contest)-related code (may not happen, contest is IFEQ/IFNE hell)  
3. Annotate and document code (in progress)  
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
