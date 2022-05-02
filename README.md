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
- Kando was involved so you know it's good

## Building

Requirements: Microsoft Windows, Python 3

Download repo as ZIP and extract somewhere, or clone the repo with git via the command line.  

to build ROM, run ``build.cmd``  

to build ROM with Logging, run ``build to log.cmd``

to rebuild color palettes, run ``build palette.cmd``  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``.

## Helpful Links

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[65c816 reference](https://en.wikibooks.org/wiki/Super_NES_Programming/65c816_reference)  
[SuperFX ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)

## Discord Server
[Star Fox: ES + SF Modding](https://discord.gg/fE5Xx99kWb) (MAIN)  
[Star Fox Hacking Project](https://discord.gg/GgyP84e)


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
│   ├── MARIO: .MC SuperFX Code files
│   ├── MSG: Message files for English, Japanese, German, and French
│   ├── MSPRITES: contains 4 DAT files (interleaved textures)
│   ├── PATH: contains all PATH language code
│   ├── SHAPES: contains all shape files
│   ├── SND: sound/music data
│   └── STRAT: Code for Strategies (Object behaviors)
└──  tools: tools such as packer and ShapeEd
```
    
