#########################
# UltraStarFox Makefile #
#########################

# Configuration

# Silence the assembler+linker unless an error occurs
QUIET ?= false

# Whether to colorize build messages
COLOR ?= 1

# Disable assembler ANSI codes (must be handled differently for MSYS2, see below)
#NOANSI=-eNOANSI
NOANSI=

# Build MSU-1 data file?
MSU1 ?= 0

# You must obtain the disassembly files for the sound driver and sound BINs for these options to function correctly. TBD.
# Assemble sound driver?
SNDDRIVER ?= 1

# Assemble sound BINs?
SNDBINS ?= 0

# Detect what we're running on
ifeq ($(OS),Windows_NT)
    ifndef MSYSTEM
        # Windows without MSYS2
        PLATFORM := windows
    else
        # Windows with MSYS2
        PLATFORM := msys2
    endif
else
    # Assume Linux/UNIX if not Windows
    PLATFORM := linux
endif

ifeq ($(PLATFORM),windows)
else
	UNAME_S := $(shell uname -s)
endif

# Newline character to use (adjust this if newlines aren't working in your terminal)
ifeq ($(PLATFORM),windows)
COLOR=1
NEWLINE=
else ifeq ($(PLATFORM),msys2)
# If we detect MSYS, handle disabling asssembler ANSI codes internally in INC/HEADER.INC and use the correct newline
NOANSI=
NEWLINE=\r\n
else ifeq ($(PLATFORM),linux)
NEWLINE=\n
endif

# DOSBox-X Headless DOS userland application emulator executable
ifeq ($(PLATFORM),windows)
MSDOS=dosbox-x.exe
else
MSDOS=./dosbox-x
endif

# 65816/Super FX Assembler
ASM=$(MSDOS) ARGSFXX.EXE
# Setup heap for SASM and export symbols for ARGSFX
ASMFLAGS= $(NOANSI) -e__notitle -e__heap=14400 -z

# SPC700 Assembler
SPCASM=../bin/asar

# MSU-1 Data file Assembler
MSUASM=$(MSDOS) SASMX.EXE
MSUFLAGS= -m30 -e__heap=14400 -e__notitle

# Linker
LINK=$(MSDOS) ARGLINK.EXE
LOPTS=-b30 -h1024 -t7d -z

# ROM Extender
ifeq ($(PLATFORM),windows)
EXTEND=../bin/romextender.exe
else
EXTEND=../tools/romextender
endif

# Extended size in Mbits, byte to pad with
EXTOPTS= 16 ff

# Checksum Fixer
ifeq ($(UNAME_S),linux)
CHECK=../bin/superfamicheck_linux
else
CHECK=../bin/superfamicheck.exe
endif
COPTS=-s -f

# FXGFX Interleaver
ifeq ($(PLATFORM),windows)
MERGE=..\bin\cgx2fx.exe
else
MERGE=../tools/cgx2fx
endif

# Graphics Cruncher
ifeq ($(PLATFORM),windows)
CRU=..\bin\sf_crunch.exe
else
CRU=../tools/sf_crunch
endif

# ALLCOLS Builder
ifeq ($(PLATFORM),windows)
MC=DATA\COL\MC.BAT
else
MC=DATA/COL/mc.sh
endif

# Font Converter
ifeq ($(PLATFORM),windows)
FONT=../bin/foxfont.exe
else
FONT=../tools/foxfont
endif

# Argonaut .MAP File Decoder
ifeq ($(PLATFORM),windows)
MAPDEC=..\bin\argonautmapdecoder.exe
else
MAPDEC=../tools/argonautmapdecoder
endif

# Script Tokenizer
ifeq ($(PLATFORM),windows)
CHRMAP=..\bin\chrmap.exe
else
CHRMAP=../tools/chrmap
endif

# USB2SNES CLI Utility
USB2SNES=../bin/usb2snes-cli.exe

# Terminal-specific commands

# Print Command
ifeq ($(PLATFORM),windows)
PRINT ?= ..\bin\printf.exe
else
PRINT ?= printf
endif

# Move Command
ifeq ($(PLATFORM),windows)
MV=move
else
MV=mv
endif

# Delete Command

ifeq ($(PLATFORM),windows)
DEL=del
else
DEL=rm -rf
endif

# File Checksum Calculator
SHA1SUM=sha1sum

############################

# ANSI color codes for status messages
ifeq ($(COLOR),1)
NO_COL=\033[0m
GREEN=\033[32m
YELLOW=\033[33m
BLUE=\033[34m
RED=\033[31m
BLINK=\033[32;5m
endif

# Common build print status functions
define print
  @$(PRINT) "$(GREEN)$(1) $(YELLOW)$(2)$(GREEN) -> $(BLUE)$(3)$(NO_COL)$(NEWLINE)"
endef

define print2
  @$(PRINT) "$(GREEN)$(1) $(BLUE)$(2)$(NO_COL)$(NEWLINE)"
endef

define print3
  @$(PRINT) "$(GREEN)$(1)$(NO_COL)$(NEWLINE)"
endef

# Function to interleave FXGfx
define merge
	@$(PRINT) "$(GREEN)Interleaving FXGfx: $(YELLOW)$(1) + $(2) $(GREEN) -> $(BLUE)$@$(NEWLINE)"
	@$(MERGE) MSPRITES/$(1) MSPRITES/$(2) $@
endef

# Recipe to assemble a .ASM file and create a linkable .SOB file
BANK/%.SOB: BANK/%.ASM
	$(call print,Assembling:,$<,$@)

ifeq ($(PLATFORM),windows)
	@$(ASM) -o "$(NOANSI) -m30 $(ASMFLAGS) $(subst /,\,$<) -v$(subst /,\,$@)"
else
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(ASM) -o "$(NOANSI) -m30 $(ASMFLAGS) $< -v$@" > /dev/null 2>&1 || \
		$(ASM) -o "$(NOANSI) -m30 $(ASMFLAGS) $< -v$@"; \
	else \
		$(ASM) -o "$(NOANSI) -m30 $(ASMFLAGS) $< -v$@"; \
	fi'
endif

# Recipes to crunch graphics
DATA/%.CCR: DATA/%.CGX
	$(call print,Crunching Tiles:,$<,$@)
	@$(CRU) $< DATA/$*.CCR

DATA/%.PCR: DATA/%.SCR
	$(call print,Crunching Screen:,$<,$@)
	@$(CRU) $< DATA/$*.PCR

# Recipe to convert BMP to FON
DATA/FONT/%.fon: DATA/FONT/%.bmp
	$(call print,Encoding Font:,$<,$@)
	@$(FONT) $<

#!! If you add/remove a cgx/scr in these two lists, make sure to add/remove the corresponding file.

# Crunched tilesets
CCRFILES= DATA/1-3-B.CCR DATA/2-3B.CCR DATA/3-4.CCR DATA/B.CCR DATA/CONT.CCR DATA/DOG.CCR \
 DATA/F-1.CCR DATA/FS-BG3.CCR DATA/MAP-G.CCR DATA/OBJ-2.CCR DATA/SPACE.CCR DATA/T-ST.CCR \
 DATA/1-4.CCR DATA/2-4.CCR DATA/AND.CCR DATA/C-M.CCR DATA/CP-P.CCR DATA/E-TEST.CCR \
 DATA/F-OBJ.CCR DATA/HOLE-A.CCR DATA/MAP.CCR DATA/OBJ-3.CCR DATA/ST-P.CCR DATA/TI-3-G.CCR \
 DATA/2-2.CCR DATA/3-2.CCR DATA/B-HOLE.CCR DATA/CONT-2-G.CCR DATA/CP.CCR DATA/E-TEST2.CCR \
 DATA/FOX-G.CCR DATA/LSB.CCR DATA/OBJ-1-G.CCR DATA/OBJ-4.CCR DATA/OOPS.CCR DATA/STARS.CCR \
 DATA/TI-3-US.CCR DATA/2-3.CCR DATA/3-3.CCR DATA/B-M.CCR DATA/CONT-2.CCR DATA/DEMO.CCR \
 DATA/FOX.CCR DATA/M.CCR DATA/OBJ-1.CCR DATA/T-SP.CCR DATA/TI-3.CCR

# Crunched tilemaps
PCRFILES= DATA/1-3-B.PCR DATA/2-3.PCR DATA/3-2.PCR DATA/B-HOLE.PCR DATA/CONT.PCR DATA/DOG.PCR \
 DATA/F-1.PCR DATA/LAST.PCR DATA/T-SP.PCR DATA/TI-3-US.PCR DATA/1-3.PCR DATA/2-3B.PCR \
 DATA/3-3.PCR DATA/B.PCR DATA/CP-P.PCR DATA/E-TEST.PCR DATA/FOX.PCR DATA/LSB.PCR DATA/ST-P.PCR \
 DATA/T-SS.PCR DATA/TI-3.PCR DATA/1-4.PCR DATA/2-3H.PCR DATA/3-4.PCR DATA/CONT-2-G.PCR \
 DATA/CP.PCR DATA/E-TEST2.PCR DATA/FS-NI.PCR DATA/M.PCR DATA/OOPS.PCR DATA/STARS.PCR DATA/T-ST.PCR \
 DATA/2-2.PCR DATA/2-4.PCR DATA/AND.PCR DATA/CONT-2.PCR DATA/DEMO.PCR DATA/HOLE-A.PCR DATA/MAP.PCR \
 DATA/T-F-S.PCR DATA/TI-3-G.PCR

#!! If you add/remove a font, make sure to add/remove the corresponding file.

# Font files converted from bmp
FONFILES= DATA/FONT/MOJI_0.fon DATA/FONT/MOJI_D.fon

# Banks to assemble
SOBFILES= \
 BANK/BANK0.SOB \
 BANK/BANK1.SOB \
 BANK/BANK2.SOB \
 BANK/BANK4.SOB \
 BANK/BANK5.SOB \
 BANK/BANK6.SOB \
 BANK/BANK7.SOB \
 BANK/BANK8.SOB \
 BANK/BANK9.SOB \
 BANK/BANK10.SOB \
 BANK/BANK11.SOB \
 BANK/SHBANKS.SOB \
 BANK/INCBINS.SOB

#!! If you add/remove/modify a cgx/bin in these two lists, make sure the corresponding files are present here.

# Everything that should be done when make is executed
all: welcome check-jobs text make-allcols msprites crunch fonts SGSOUND0.BIN soundbins sf.msu sf.sfc donebld

welcome:
	@$(PRINT) "$(YELLOW)Welcome to UltraStarFox!$(NO_COL)$(NEWLINE)"
# Platform Detection
ifeq ($(PLATFORM),windows)
	@$(PRINT) "$(GREEN)You're on $(YELLOW)Windows!$(NO_COL)$(NEWLINE)"
else ifeq ($(PLATFORM),msys2)
	@$(PRINT) "$(GREEN)You're on $(YELLOW)MSYS2!$(NO_COL)$(NEWLINE)"
else ifeq ($(PLATFORM),linux)
	@$(PRINT) "$(GREEN)You're on $(YELLOW)*nix!$(NO_COL)$(NEWLINE)"
endif


# Check for job flags and print a warning
check-jobs:
ifeq ($(PLATFORM), windows)
else
	@$(PRINT) "$(GREEN)Checking parallel build jobs...$(NO_COL)$(NEWLINE)"
	@case "$(MAKEFLAGS)" in \
		*-j*) \
			$(PRINT) "$(RED)WARNING: A parallel job count greater than 1 may cause issues!!$(NO_COL)$(NEWLINE)"; \
		;; \
	esac
endif

# Tokenize German/Japanese script
text: MSG/GERMAN.MSG MSG/JAPANESE.MSG

MSG/GERMAN.MSG: MSG/JAPANESE.INC
	$(call print3,Tokenizing German script...)
ifeq ($(PLATFORM),windows)
	@$(CHRMAP) --tokenize MSG/chrmapde.dat MSG/GERMAN.INC MSG/GERMAN.MSG
else
	@$(CHRMAP) --tokenize MSG\chrmapde.dat MSG\GERMAN.INC MSG\GERMAN.MSG
endif

MSG/JAPANESE.MSG: MSG/JAPANESE.INC
	$(call print3,Tokenizing Japanese script...)
ifeq ($(PLATFORM),windows)
	@$(CHRMAP) --tokenize MSG/chrmapjp.dat MSG/JAPANESE.INC MSG/JAPANESE.MSG
else
	@$(CHRMAP) --tokenize MSG\chrmapjp.dat MSG\JAPANESE.INC MSG\JAPANESE.MSG
endif

# Initialize allcols.col
init-allcols:
ifeq ($(PLATFORM),windows)
	@$(DEL) DATA\COL\allcols.col
	@copy NUL DATA\COL\allcols.col >nul
	@copy NUL DATA\COL\col2.tmp >nul
else
	@$(DEL) DATA/COL/allcols.col
	@touch DATA/COL/allcols.col
	@touch DATA/COL/col2.tmp
endif


# List of palette source files
# Both of these lists must match SF/INC/KALCS.INC's list!!
ALLCOLS_PALETTES := \
 DATA/COL/OOPS.COL \
 DATA/COL/BG2-A.COL \
 DATA/COL/BG2-B.COL \
 DATA/COL/BG2-C.COL \
 DATA/COL/BG2-D.COL \
 DATA/COL/BG2-E.COL \
 DATA/COL/BG2-F.COL \
 DATA/COL/BG2-G.COL \
 DATA/COL/T-M.COL \
 DATA/COL/T-M-2.COL \
 DATA/COL/T-M-3.COL \
 DATA/COL/T-M-4.COL \
 DATA/COL/B-M.COL \
 DATA/COL/LIGHT.COL \
 DATA/COL/SPACE.COL \
 DATA/COL/STARS.COL \
 DATA/COL/CP.COL \
 DATA/COL/CP-US.COL \
 DATA/COL/CP-USP.COL \
 DATA/COL/CP-P.COL \
 DATA/COL/HOLE.COL \
 DATA/COL/L.COL \
 DATA/COL/E-TEST0.COL \
 DATA/COL/E-TEST.COL \
 DATA/COL/OBJ-1.COL \
 DATA/COL/BG2-E-P.COL

# Palettes to include in ALLCOLS
DATA/COL/allcols.pac: $(ALLCOLS_PALETTES)
	$(call print3,Building ALLCOLS...)

	@$(MC) OOPS 0 2
	@$(MC) BG2-A 0 7
	@$(MC) BG2-B 0 13
	@$(MC) BG2-C 0 7
	@$(MC) BG2-D 0 7
	@$(MC) BG2-E 0 9
	@$(MC) BG2-F 0 7
	@$(MC) BG2-G 0 7
	@$(MC) T-M 0 7
	@$(MC) T-M-2 0 7
	@$(MC) T-M-3 0 7
	@$(MC) T-M-4 0 7
	@$(MC) B-M 0 7
	@$(MC) LIGHT 0 7
	@$(MC) SPACE 0 7
	@$(MC) STARS 0 7
	@$(MC) CP 0 7
	@$(MC) CP-US 0 7
	@$(MC) CP-USP 0 7
	@$(MC) CP-P 0 7
	@$(MC) HOLE 0 7
	@$(MC) L 0 7
	@$(MC) E-TEST0 0 7
	@$(MC) E-TEST 0 7
	@$(MC) OBJ-1 8 13
	@$(MC) BG2-E-P 0 9

# Final step: Crunch all palettes into allcols.pac
	@$(CRU) DATA/COL/allcols.col DATA/COL/allcols.pac
	@$(PRINT) "$(GREEN)Palette crunching complete.$(NO_COL)$(NEWLINE)"

make-allcols: init-allcols DATA/COL/allcols.pac

# FXGFX files to be interleaved
msprites: MSPRITES/TEX_01.BIN MSPRITES/TEX_23.BIN MSPRITES/TEX_23_A.BIN

# MSPRITES .BIN recipes
MSPRITES/TEX_01.BIN:
	$(call merge,tex_0.CGX,tex_1.CGX)

MSPRITES/TEX_23.BIN:
	$(call merge,tex_2.CGX,tex_3.CGX)

MSPRITES/TEX_23_A.BIN:
	$(call merge,tex_2.CGX,tex_3_a.CGX)

# Crunch all compressible GFX
crunch: $(CCRFILES) $(PCRFILES)

# Convert fonts
fonts: $(FONFILES)

# The ROM Itself
sf.sfc: $(SOBFILES)
	$(call print2,Linking ROM:,$@)

ifeq ($(PLATFORM),windows)
	@echo $(SOBFILES) > flist.tmp
else
	@echo $(SOBFILES) | sed 's/\//\\/g' > flist.tmp
endif

ifeq ($(PLATFORM),windows)
	@$(LINK) -o "$(LOPTS) -o$@ @flist.tmp"
else
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(LINK) -o "$(LOPTS) -o$@ @flist.tmp" > /dev/null 2>&1 || \
		$(LINK) -o "$(LOPTS) -o$@ @flist.tmp"; \
	else \
		$(LINK) -o "$(LOPTS) -o$@ @flist.tmp"; \
	fi'
endif

	@$(DEL) flist.tmp

ifeq ($(PLATFORM),windows)
	@$(EXTEND) $@ $(EXTOPTS)
else
	$(call print2,Extending ROM:,$@)
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(EXTEND) SF.SFC $(EXTOPTS) > /dev/null 2>&1 || \
		$(EXTEND) SF.SFC $(EXTOPTS); \
	else \
		$(EXTEND) SF.SFC $(EXTOPTS); \
	fi'
endif

ifeq ($(PLATFORM),windows)
	@ren SF.SFC sf.sfc
ifeq ($(MSU1),1)
	@ren SF.MSU sf.msu
endif
else
	@$(MV) SF.SFC sf.sfc
ifeq ($(MSU1),1)
	@$(MV) SF.MSU sf.msu
endif
endif
ifeq ($(PLATFORM),windows)
	@$(CHECK) $(COPTS) $@
else
	$(call print2,Fixing Checksum:,$@)
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(CHECK) $(COPTS) sf.sfc > /dev/null 2>&1 || \
		$(CHECK) $(COPTS) sf.sfc; \
	else \
		$(CHECK) $(COPTS) sf.sfc; \
	fi'
endif

ifeq ($(PLATFORM),windows)
	@certutil -hashfile sf.sfc SHA1
else
	@$(SHA1SUM) sf.sfc
endif
	@$(PRINT) "${BLINK}Build succeeded.$(NO_COL)$(NEWLINE)"

# MSU-1 Data File
sf.msu:
ifeq ($(MSU1),1)
ifeq ($(PLATFORM),windows)
	@$(MSUASM) -o "$(NOANSI) $(MSUFLAGS) MSUDATA\MSUDATA.ASM -o$@"
else
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(MSUASM) -o "$(NOANSI) $(MSUFLAGS) MSUDATA\MSUDATA.ASM -o$@" > /dev/null 2>&1 || \
		$(MSUASM) -o "$(NOANSI) $(MSUFLAGS) MSUDATA\MSUDATA.ASM -o$@"; \
	else \
		$(MSUASM) -o "$(NOANSI) $(MSUFLAGS) MSUDATA\MSUDATA.ASM -o$@"; \
	fi'
endif
endif

# Sound driver (Sources must be provided by user)
SGSOUND0.BIN: SND/SGSOUND0/*.*
ifeq ($(SNDDRIVER),1)
	@$(SPCASM) SND/SGSOUND0/SGSOUND0.asm $@
endif

# Sound data BINs (Sources must be provided by user)
soundbins:
ifeq ($(SOUNDBINS),1)

endif

donebld: sf.sfc

ifeq ($(PLATFORM),windows)
# I would use move here, but for some reason it doesn't work here
	@copy sf.sfc ..\sf.sfc >nul
	@del sf.sfc
ifeq ($(MSU1),1)
	@copy sf.msu ..\sf.msu >nul
	@del /q sf.msu
endif
	@if exist BANKS.CSV $(MV) BANKS.CSV ..\banks.csv
	@$(MAPDEC) SF.MAP ..\symbols.txt
	@$(DEL) SF.MAP
	@if exist MSGS.TXT $(DEL) MSGS.TXT
else
	@$(MV) sf.sfc ../sf.sfc
ifeq ($(MSU1),1)
	@$(MV) sf.msu ../sf.msu
endif
	@{ [ -f BANKS.CSV ] && $(MV) BANKS.CSV ../banks.csv || true; }
	@$(MAPDEC) SF.MAP ../symbols.txt
	@$(DEL) SF.MAP
	@$(DEL) MSGS.TXT
endif

clean:

ifeq ($(PLATFORM),windows)
	@$(DEL) ..\sf.sfc
ifeq ($(MSU1),1)
	@$(DEL) ..\sf.msu
endif
	@$(DEL) ..\banks.csv
	@$(DEL) BANK\*.SOB
	@$(DEL) BANK\*.MAP 
	@$(DEL) *.MAP
	@$(DEL) MSPRITES\*.BIN
	@$(DEL) DATA\*.CCR
	@$(DEL) DATA\*.PCR
	@$(DEL) DATA\FONT\MOJI_0.fon
	@$(DEL) DATA\FONT\MOJI_D.fon
	@$(DEL) DATA\COL\allcols.pac
	@$(DEL) sf.sfc
	@$(DEL) BANKS.CSV
	@$(DEL) ..\symbols.txt
	@$(DEL) MSUDATA\MSUDATA.INC
	@$(DEL) MSG\GERMAN.MSG
	@$(DEL) MSG\JAPANESE.MSG

else
	@$(DEL) ../sf.sfc
ifeq ($(MSU1),1)
	@$(DEL) ../sf.msu
endif
	@$(DEL) ../banks.csv
	@$(DEL) BANK/*.SOB
	@$(DEL) BANK/*.MAP *.MAP
	@$(DEL) MSPRITES/*.BIN
	@$(DEL) DATA/*.CCR
	@$(DEL) DATA/*.PCR
	@$(DEL) DATA/FONT/MOJI_0.fon
	@$(DEL) DATA/FONT/MOJI_D.fon
	@$(DEL) DATA/COL/allcols.pac
	@$(DEL) sf.sfc
	@$(DEL) BANKS.CSV
	@$(DEL) ../symbols.txt
	@$(DEL) MSUDATA/MSUDATA.INC
	@$(DEL) MSG/GERMAN.MSG
	@$(DEL) MSG/JAPANESE.MSG
endif

upload:
	@$(USB2SNES)	--upload ../sf.sfc --path ./sf.sfc
	@$(PRINT) "$(NEWLINE)"

boot:
	@$(USB2SNES) --boot ./sf.sfc
	@$(PRINT) "$(NEWLINE)"

## The great big list of source files to detect changes for and whatnot

INCFILES = $(wildcard INC/*.INC)
MSUDATA = $(wildcard MSUDATA/*.INC)
EXTFILES = $(wildcard EXT/*.EXT)
CFGFILES = $(wildcard CONFIG/*.INC)
MAPFILES = $(wildcard MAPS/*.*)
SNDFILES = $(wildcard SND/*.BIN)
MSPRITESFILES = $(wildcard MSPRITES/*.BIN)
STRATFILES = $(wildcard STRAT/*.ASM)
SHAPEFILES = $(wildcard SHAPES/*.ASM)
PATHFILES = $(wildcard PATH/*.ASM)
MSGFILES = $(wildcard MSG/*.*)
ALLFONFILES = $(wildcard DATA/FONT/*.*)
COLFILES = $(wildcard DATA/COL/*.COL)
MARIOFILES = $(wildcard MARIO/*.MC)

STDFILES = $(INCFILES) $(MSUDATA) $(EXTFILES) $(CFGFILES)

## Banks to assemble and files they include

## Banks 0, 32
BANK/BANK0.SOB: \
 $(STDFILES) $(ALLFONFILES) $(STRATFILES) $(PCRFILES) $(SHAPEFILES) \
 BANK/BANK0.ASM \
 ASM/SGTABS.ASM ASM/SGDATA.ASM ASM/MSUDRV.ASM \
 DATA/ETABS.DAT DATA/MAP-OBJ.CGX

## Banks 1, 41
BANK/BANK1.SOB: \
 $(STDFILES) $(ALLFONFILES) $(MSGFILES) $(MARIOFILES) \
 BANK/BANK1.ASM \
 ASM/FONTDATA.ASM ASM/GAMETEXT.ASM

## Banks 2, 3, 31, 36
BANK/BANK2.SOB: \
 $(STDFILES) $(STRATFILES) $(COLFILES) $(PCRFILES) \
 BANK/BANK2.ASM \
 ASM/RAMSTUFF.ASM ASM/IRQ.ASM ASM/HDMATABS.ASM ASM/COLDET.ASM ASM/COLBOXES.ASM ASM/TRANS.ASM \
 ASM/MAIN.ASM ASM/GAME.ASM ASM/WINDOWS.ASM ASM/COLTABS.ASM ASM/DEFSPR.ASM ASM/COLTAB.ASM \
 ASM/LIGHT.ASM ASM/BGS.ASM ASM/OBJ.ASM ASM/PLANETS.ASM ASM/SPRITES.ASM ASM/CONTINUE.ASM \
 ASM/WORLD.ASM ASM/MOTHER.ASM ASM/DEBUG.ASM ASM/BOOTNMI.ASM ASM/BLINK.ASM ASM/NMI.ASM \
 ASM/DRAW.ASM ASM/ENDSEQ.ASM ASM/CONT.ASM ASM/SOUND.ASM \
 DATA/MAPANIM.CHR DATA/MAP-OBJ.COL

## Bank 4
BANK/BANK4.SOB: \
 $(STDFILES) $(STRATFILES) $(PATHFILES) \
 BANK/BANK4.ASM

## Banks 5, 13, 39
BANK/BANK5.SOB: \
 $(STDFILES) $(MAPFILES) $(CCRFILES) $(PCRFILES) $(STRATFILES) \
 BANK/BANK5.ASM

## Banks 6, 33
BANK/BANK6.SOB: \
 $(STDFILES) $(STRATFILES) $(MARIOFILES) \
 BANK/BANK6.ASM

## Bank 7
BANK/BANK7.SOB: \
 $(STDFILES) $(STRATFILES) \
 BANK/BANK7.ASM

## Bank 8
BANK/BANK8.SOB: \
 $(STDFILES) $(STRATFILES) $(SNDFILES) \
 BANK/BANK8.ASM

## Bank 9
BANK/BANK9.SOB: \
 $(STDFILES) $(STRATFILES) $(SNDFILES) \
 BANK/BANK9.ASM

## Bank 10
BANK/BANK10.SOB: \
 $(STDFILES) $(STRATFILES) $(SNDFILES) \
 BANK/BANK10.ASM \
 ASM/MEM.ASM

## Banks 11, 40
BANK/BANK11.SOB: \
 $(STDFILES) $(STRATFILES) \
 BANK/BANK11.ASM \
 ASM/STRINGS.ASM

## Banks 12, 14, 15, 16, 17, 37, 38
BANK/SHBANKS.SOB: \
 $(STDFILES) $(CCRFILES) $(PCRFILES) $(STRATFILES) $(SHAPEFILES) $(SNDFILES) \
 BANK/SHBANKS.ASM

## Banks 18, 19, 20, 21, 22, 23, 35 
BANK/INCBINS.SOB: \
 $(STDFILES) $(CCRFILES) $(PCRFILES) $(COLFILES) $(SNDFILES) $(MSPRITESFILES) $(MARIOFILES) \
 BANK/INCBINS.ASM \
 DATA/COL/allcols.pac DATA/FACE.CGX