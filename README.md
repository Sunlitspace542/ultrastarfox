# HackerStarFox
Star Fox (SNES, 1993), with modifications for easier creation of ROM hacks and general ease-of-use.

## Features

- SuperFX 2 (21Mhz) support and various optimizations
- Lots of free bank space for new models, assets and code
- Bugfixes and improvements
- Uses ARGLINK from Star Fox 2 as linker instead of SL
- rebuild color palette data using the palette packer (bldpal.bat)
- Easier creation of wireframe models
- Kando was involved so you know it's good
- Matching text data
- (soon to be) Working StarWing title screen

## Building

Requirements: Microsoft Windows, DOSBox (DOSBox-X for Windows included)

Download repo as ZIP and extract somewhere or clone repo with git via the command line.  

to build ROM, run ``build.cmd`` (Windows) or ``BUILD.BAT`` (DOSBox)  

to build ROM with Logging, run ``build to log.cmd`` (Windows) or ``BLDtolog.BAT`` (DOSBox)  

to rebuild color palettes, run ``build palette.cmd`` (Windows) ``BLDPAL.BAT`` (DOSBox)  

the .BAT versions of these can be run via DOSBox if you do not use Windows.

## Helpful Links

[Star Fox - Source Code Mods](https://docs.google.com/document/d/1kdgPCBeQFYsAepSDNpmwO8ZysRJjdnwK_5gWT2FFQEk/edit?usp=sharing)  
[Star Fox Mods Wiki](https://starfox-mods.fandom.com)  
[65c816 reference](https://en.wikibooks.org/wiki/Super_NES_Programming/65c816_reference)  
[SuperFX ASM Tutorial/Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)

## Discord Server
[Star Fox: ES + SF Modding](https://discord.gg/fE5Xx99kWb) (MAIN)  
[Star Fox Hacking Project](https://discord.gg/GgyP84e)


## Future things to do
3. Figure out German ALARM text
2. OPTIMIZE
3. Expanded texture space
4. Annotate and document code
5. FastROM
6. Organize source files and edit makefile accordingly

## Project Structure
```
hackerstarfox
├── BIN: exe files needed to compile game
├── optionalstuff: optional graphics files
├── SF: Main source code is located here
│   ├── DATA: GFX files, arc tangent table
│   │   └── GFX: Palette files and Palette Packer
│   ├── MAPS: level scripts
│   ├── MSPRITES: contains 4 DAT files (interleaved textures)
│   └── SOUND: sound/music data
└──  tools: tools such as packer and ShapeEd
```
    
