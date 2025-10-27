# UltraStarFox

Star Fox / Starwing source code, modified for ease-of-use and ROMhacking.  

Go [here](#building) to jump straight to the building instructions.  

## Credits (A-Z)

- **H A M G E R** - Wireframe shield meter color changing Super FX code
- **Kandowontu** - The Original Star Fox Guy, Lifesaver, Rumble System Programmer (Sequences), Rumble Effect Programmer/Polishing, Implemented several features (Mouse, Debug Mode/Crash Handler Restoration, Limit Removals, Easy Wireframes, other fixes and improvements)  
- **MrL314** - Texture Limit Removal Super FX Code  
- **Phonymike** - Tools (mugconv, fontconv), ROM Header  
- **Randal Linden** - Rumble Pad Designer, Rumble Pad Docs, Rumble System Programmer (Rumble Pad NMI Code)  
- **Repzilon** - Misc. documentation
- **SegaRetro92** - Texture/Palette Docs, General Graphics Stuff, Author of Several Graphics Tools, German Version GFX/Text Restoration   
- **Sunlit** - Maintainer, Documentation, Toolchain Engineer, Rumble System Programmer ("Flat Rate" Rumble), Rumble Effect Programmer, Tool Author, German Version GFX/Text Restoration, Release Builder Script  

## Features

## Cartridge Hardware Support and ROM Configuration

- Uses GSU-2/Super FX 2 @21.4Mhz instead of MARIO Chip 1 @10.7Mhz
- Super FX MS1 high-speed multiply enabled (if 21mhz is enabled)
- FastROM support (Do not enable if you are targeting a real cartridge with a real MARIO/GSU-1/GSU-2 IC chip!)

## Accessory Support

- SNES Mouse support and "analog stick" support via the SNES mouse
- SNES Rumble Pad support and macros (see ``SF\INC\RMBLMACS.INC`` for macros)

## QOL / Ease-of-use

- Very configurable out-of-the-box, see ``SF\CONFIG\CONFIG.INC`` for more info
- Lots of free ROM space (2MB/16Mbit ROM)
- Bugfixes and improvements
- Build process optimized for speed
- Palettes and graphics crunched, textures interleaved, and fonts built at assembly
- Uses ARGLINK and ARGSFX from Star Fox 2 as linker and assembler instead of SL and SASM
- Easier creation of wireframe models (replace face3 and face4 with aface3 and aface4 in your shape file)
- Upload ROM directly to SNES and boot with QUsb2Snes and a SD2SNES/FXPak Pro flash cartridge
- Easily create patches for your ROMhack with ``buildrelease.cmd``

## Limits Removed/Increased

- 256 texture slots
- 250 faces/vertices limit for models

## Miscellaneous

- All Starwing PAL and Germany text/GFX for PAL builds
- **Kando and Randy were involved so you know it's good**

## Building

## Building on Windows

Requirements: Microsoft Windows

Download repo as ZIP and extract somewhere, or clone the repo with git via the command line.  

To build ROM, run ``build.cmd``.  

To build ROM with Logging, run ``build to log.cmd``.  

To clean, run ``clean.cmd``.  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``, and a bank space report at ``BANKS.CSV``.  

## Building on Linux

**NOTE: this was tested on WSL with Ubuntu installed. YMMV.**  

Requirements: Ubuntu (might work with other distros) snap, DOSBox-X, git  

Install snapstore: ``sudo apt install snapd``  

Install DOSBOX-X from snap: ``sudo snap install dosbox-x``  

Clone repository: ``git clone https://github.com/Sunlitspace542/ultrastarfox``  

To build ROM, run ``make``.  

To build ROM with logging, run ``make log``.  

To clean, run ``make clean``.  

After building, a debug symbol map will be created at ``SYMBOLS.TXT``, and a bank space report at ``BANKS.CSV``.  

## Uploading ROM to SNES over USB with SD2SNES/FXPak(Pro)

Uses [USB2SNES-cli](https://github.com/Hyphen-ated/usb2snes-cli) fork by Hyphen-ated. A prebuilt windows EXE is provided.  
Download [QUSB2SNES](https://github.com/Skarsnik/QUsb2snes/releases).  
Extract it somewhere and run it. Set it up for an SD2SNES/FXPak Pro.  
**QUSB2SNES must be running in the background for uploading to function.**  
You can then run ``send2snes.cmd`` or ``build and send to snes.cmd`` to either upload the current ROM to the SNES or rebuild and upload the freshly built ROM.  

## Contributing

PRs are welcome!  
All changes to be submitted should be made to the [main](https://github.com/Sunlitspace542/ultrastarfox/tree/main) branch.  

## Helpful Links/Tools

[Star Fox Sound Binary Disassemblies](https://github.com/Sunlitspace542/star-fox-sound-bins)  
[Star Fox Sound Driver Disassembly](https://github.com/phonymike/starfox_spc_driver)  
[FastFX Blender Plugin](https://github.com/Sunlitspace542/FastFX)  
[Argonaut 65816/Super FX Assembly Extension for VS Code](https://github.com/Sunlitspace542/65816-superfx-asm-argonaut-vscode)  
[ArgSfx/SASM Assembler Manual](https://github.com/Sunlitspace542/ArgSfx-SASM-Docs/tree/main)  
[SNES Development Manual](https://archive.org/details/SNESDevManual)  
[fullsnes - SNES Hardware Specifications (by Nocash)](https://problemkaputt.de/fullsnes.htm)  
[MSU-1 Documentation](https://github.com/Sunlitspace542/MSU-1-Docs)  
[65c816 Opcodes](https://undisbeliever.net/snesdev/65816-opcodes.html)  
[65c816 Reference](https://wiki.superfamicom.org/65816-reference)  
[Super FX (MARIO) Chip ASM Reference](https://en.m.wikibooks.org/wiki/Super_NES_Programming/Super_FX_tutorial)  
[EarthBound Music Editor (But for Star Fox)](https://github.com/phonymike/ebmused4sf/)  
[Star Fox Music Programming Starter Kit (by livvy94)](https://www.dropbox.com/sh/m3sk75dmsyx5tey/AACLDXVcQEJk3ezQCDBitEs7a?dl=0)

## TODO

1. Optimize game where possible (We already have FastROM and 21Mhz SuperFX 2, can we go any further?)  
2. Annotate and document code (not so sure about doing this anymore)  
3. Reimplement MSU-1 support using the driver I wrote for Star Fox CD

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
│   │   └── COL: Palette files and Palette Packer
│   ├── EXT: .ext files needed by several .asm files
│   ├── INC: .inc files, arc tangent table
│   ├── MAPS: level scripts
│   ├── MARIO: .MC MARIO (SuperFX) ASM code
│   ├── MSG: Message files for English, Japanese, German, and French
│   ├── MSPRITES: contains interleaved FXGfx format textures
│   ├── PATH: contains all PATH language code (used for some object behaviors)
│   ├── SHAPES: contains all shape (model) files
│   ├── SND: sound/music data
│   └── STRAT: Code for Strategies (object behaviors)
├── TOOLS: tools such as PACKER and SHAPED
└── DOCS: .md format text files covering various aspects of Star Fox
```
