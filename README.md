
# UltraStarFox
Star Fox / Starwing source code, modified for ease-of-use and ROMHacking.

## Features

- Uses GSU-2/Super FX 2 @21.4Mhz instead of MARIO Chip 1 @10.7Mhz
- FastROM support (not recommended to use if you are targeting real hardware with a real Super FX cartridge as it will not boot; SD2SNES/FXPak Pro currently work with FastROM just fine)
- MSU-1 support (Original ASM patch by Kurrono, ported by Kando and Sunlit)
- SNES Mouse support and analog stick support via the SNES mouse
- Very configurable, see SF\CONFIG\CONFIG.INC for more info
- Lots of free ROM space
- Bugfixes and improvements
- 256 texture slots
- 250 faces/vertices limit for models
- Build process modernized and optimized for speed
- Uses [MS-DOS Player](http://takeda-toshiya.my.coocan.jp/msdos/index.html) to emulate the toolchain, everything else uses modern tools
- Palettes and graphics crunched, textures interleaved, and fonts built at assembly
- Uses ARGLINK and ARGSFX from Star Fox 2 as linker and assembler instead of SL and SASM
- Easier creation of wireframe models (replace face3 and face4 with aface3 and aface4 in your shape file)
- All Starwing PAL and Germany text/GFX for PAL builds
- **Kando was involved so you know it's good**

## Building

```diff  
-IMPORTANT!-
Note that if you run make with parallel jobs (-j), certain files relevant for debugging will fail to generate properly.
```

## Windows Setup

Requirements: Microsoft Windows, MSYS2

Download repository and extract it somewhere or clone it with git: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

## Windows (MSYS2) Setup

Requirements: Microsoft Windows, MSYS2

Install MSYS2.  

Run ``MSYS2 MINGW64``.  

Update MSYS2: ``pacman -Syu``  

Install dependencies:  ``pacman -Sy git make gcc``  

Clone repository: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

## Linux/WSL Setup

**NOTE: this was tested on WSL with Ubuntu installed. Your mileage may vary.**  

Requirements: Ubuntu (might work with other distros) Wine, Git  

Update if necessary: ``sudo apt-get update``  

Install dependencies: ``sudo apt install -y wine build-essential git``  

Clone repository: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

## Usage

Go to the directory in your terminal where you cloned the repo.  

Windows without MSYS2:
To build, run ``build.cmd``.

To clean, run ``clean.cmd``.

MSYS2/Linux:
To build, run ``make``.  

To clean, run ``make clean``.  

To clean everything (game code + tools), run ``make distclean``.  

All:

After building, a debug symbol map will be created in the root directory at ``SYMBOLS.TXT``, and a bank space report will be at ``BANKS.CSV``. The ROM will also be with these files.  

## Uploading ROM to SNES over USB with SD2SNES/FXPak(Pro) (Currently Windows Only)

Uses [USB2SNES-cli](https://github.com/Hyphen-ated/usb2snes-cli) fork by Hyphen-ated. A prebuilt windows EXE is provided.  
Download [QUSB2SNES](https://github.com/Skarsnik/QUsb2snes/releases).  
Extract it somewhere and run it. Set it up for an SD2SNES/FXPak Pro.  
**QUSB2SNES must be running in the background for uploading to function.**  
You can then run ``make upload`` to upload the ROM to the SNES. ``make boot`` boots the ROM.  

## Notes

- All files that the assembler/linker will interact with should have all caps filenames that follow the MS-DOS 8.3 name format; up to 8 characters for the filename, up to 3 characters for the extension.
- If you need access to the old MS-DOS/DOSBox-X based build system, see the [legacy](https://github.com/Sunlitspace542/ultrastarfox/tree/legacy) branch.

## Contributing

PRs are welcome!  
All changes to be submitted should be made to the [dev](https://github.com/Sunlitspace542/ultrastarfox/tree/dev) branch.  

## Helpful Links/tools

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[65c816 Opcodes](https://undisbeliever.net/snesdev/65816-opcodes.html)  
[65c816 Reference](https://wiki.superfamicom.org/65816-reference)  
[MARIO (SuperFX) Chip ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)  
[EarthBound Music Editor (But for Star Fox)](https://github.com/phonymike/ebmused4sf/)  
[Star Fox Music Programming Starter Kit (by livvy94)](https://www.dropbox.com/sh/m3sk75dmsyx5tey/AACLDXVcQEJk3ezQCDBitEs7a?dl=0)

## TODO
1. Optimize game where possible (We already have FastROM and 21Mhz SuperFX 2, can we go any further?)  
2. Annotate and document code (in progress)  
3. Disassemble all BIN files in SND directory and integrate into build system, add documentation on custom music and the like  

## Project Structure
```
ultrastarfox
├── bin: exe files needed to assemble game code
├── extras: extra graphics files
├── SF: Main source code is located here
│   ├── ASM: Main game code located here (65816)
│   ├── BANK: Bank data\ASM files
│   ├── CONFIG: Various game aspects can be configured here
│   ├── DATA: GFX files
│   │   └── COL: Palette files and Palette Packer
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
├── tools: tools such as PACKER and SHAPED
└── docs: .md format text files covering various aspects of Star Fox
```
