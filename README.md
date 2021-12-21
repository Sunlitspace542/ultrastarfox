# HackerStarFox / HackerStarWing
Star Fox / StarWing (SNES, 1993), with modifications for easier creation of ROM hacks and general ease-of-use.

## Features

- SuperFX Fast mode (21Mhz) support and various optimizations
- Lots of free bank space for new models, assets and code
- 256 texture slots
- 250 Faces/Vertices limit
- Bugfixes and improvements
- Uses ARGLINK from Star Fox 2 as linker instead of SL
- rebuild color palette data using the palette packer (bldpal.bat)
- Easier creation of wireframe models
- Matching text data
- Working StarWing title screen and German/PAL StarWing assets
- Kando was involved so you know it's good

## Building

Requirements: Microsoft Windows, DOSBox (DOSBox-X for Windows included)

Download repo as ZIP and extract somewhere or clone repo with git via the command line.  

to build ROM, run ``build.cmd`` (Windows) or ``BUILD.BAT`` (DOSBox)  

to build ROM with Logging, run ``build to log.cmd`` (Windows) or ``BLDtolog.BAT`` (DOSBox)  

to rebuild color palettes, run ``build palette.cmd`` (Windows) ``BLDPAL.BAT`` (DOSBox)  

the .BAT versions of these can be run via DOSBox if you do not use Windows.  

After building, a debug symbol map will be created at ``SF\SYMBOLS.TXT``.

## Helpful Links

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[Star Fox Mods Wiki](https://starfox-mods.fandom.com)  
[65c816 reference](https://en.wikibooks.org/wiki/Super_NES_Programming/65c816_reference)  
[SuperFX ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)

## Discord Server
[Star Fox: ES + SF Modding](https://discord.gg/fE5Xx99kWb) (MAIN)  
[Star Fox Hacking Project](https://discord.gg/GgyP84e)


## TODO
1. OPTIMIZE
2. Strip out all Super Star Fox weekend-related code
3. Annotate and document code

## Maybe?
- MSU-1 support (big maybe, probably won't happen)

## Project Structure
```
hackerstarfox
├── BIN: exe files needed to compile game
├── optionalstuff: optional graphics files
├── SF: Main source code is located here
│   ├── ASM: Main game code located here (65816)
│   ├── BANK: Bank data\ASM files
│   ├── DATA: GFX files
│   │   └── GFX: Palette files and Palette Packer
│   ├── EXT: .ext files needed by several .asm files
│   ├── INCLUDE: .inc files, arc tangent table
│   ├── MAPS: level scripts
│   ├── MARIO: .MC SuperFX Code files
│   ├── MSG: Message files for English, Japanese, German, and French
│   ├── MSPRITES: contains 4 DAT files (interleaved textures)
│   ├── SHAPES: contains all shape files
│   └── SND: sound/music data
└──  tools: tools such as packer and ShapeEd
```
    
