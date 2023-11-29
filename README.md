# UltraStarFox
Star Fox / StarWing (SNES, 1993), with modifications for easier creation of ROM hacks and general ease-of-use.

## Features

- SuperFX Fast mode (21Mhz) support and various optimizations
- FastROM (A bug with the SD2SNES (FXPak Pro) causes freezes and crashes on SHVC revisions of the SNES)
- Lots of free bank space for new models, assets and code
- 256 texture slots
- 250 Faces/Vertices limit
- Bugfixes and improvements
- Uses ARGLINK from Star Fox 2 as linker instead of SL
- rebuild color palette data using the palette packer (bldpal.bat)
- Easier creation of wireframe models
- Matching text data
- Working StarWing title screen and German/PAL StarWing assets
- SNES Mouse support
- MSU-1 support (in progress)
- Kando was involved so you know it's good

## Building on Windows

Requirements: Microsoft Windows

Download repo as ZIP and extract somewhere, or clone the repo with git via the command line.  

To build ROM, run ``build.cmd``  

To build ROM with Logging, run ``build to log.cmd``

To rebuild color palettes, run ``build palette.cmd``  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.

## Building on Linux (Ubuntu)

**NOTE: this was tested on WSL with Ubuntu installed. there is a chance stuff doesn't work.**  

Requirements: Ubuntu (might work with Debian) DOSBox-X, git  

[DOSBox-X deb package](https://cdn.discordapp.com/attachments/928458781266960415/1007476106485583872/dosbox-x_0.83.4-0.83.4_amd64-SDL2-deb.zip)  

Clone repository: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

To build ROM, run ``build.sh``  

To build ROM with logging, run ``buildtolog.sh``  

To rebuild color palettes, run ``buildpalette.sh``  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.  

## Helpful Links/tools

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[65c816 Opcodes](https://undisbeliever.net/snesdev/65816-opcodes.html)  
[65c816 Reference](https://wiki.superfamicom.org/65816-reference)  
[MARIO (SuperFX) Chip ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)  
[EarthBound Music Editor (But for Star Fox)](https://github.com/phonymike/ebmused4sf/)  
[Star Fox Music Programming Starter Kit (by livvy94)](https://www.dropbox.com/sh/m3sk75dmsyx5tey/AACLDXVcQEJk3ezQCDBitEs7a?dl=0)

## Discord Server
[Exploratorium](https://discord.gg/VqvsTSmy)


## TODO
1. OPTIMIZE  
2. Strip out all Super Star Fox weekend-related code  
3. Annotate and document code  
4. Disassemble all BIN files in SND directory, add documentation on custom music and the like  

## Maybe?
- MSU-1 support (big maybe, probably won't happen)

## Project Structure
```
ultrastarfox
├── BIN: exe files needed to assemble game code
├── optionalstuff: optional graphics files
├── SF: Main source code is located here
│   ├── ASM: Main game code located here (65816)
│   ├── BANK: Bank data\ASM files
│   ├── DATA: GFX files
│   │   └── COL: Palette files and Palette Packer
│   ├── EXT: .ext files needed by several .asm files
│   ├── INC: .inc files, arc tangent table
│   ├── MAPS: level scripts
│   ├── MARIO: .MC MARIO (SuperFX) ASM code
│   ├── MSG: Message files for English, Japanese, German, and French
│   ├── MSPRITES: contains 4 DAT files (interleaved textures)
│   ├── PATH: contains all PATH language code
│   ├── SHAPES: contains all shape files
│   ├── SND: sound/music data
│   └── STRAT: Code for Strategies (Object behaviors)
└──  tools: tools such as PACKER and SHAPED
```
