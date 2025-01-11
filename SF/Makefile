#########################
# UltraStarFox Makefile #
#########################

# Silence the assembler+linker unless an error occurs
QUIET ?= true

UNAME_S := $(shell uname -s)

# Whether to colorize build messages
COLOR ?= 1

# Disable assembler ANSI codes (must be handled differently for MSYS2, see below)
NOANSI=

# Newline character to use (adjust this if newlines aren't working in your terminal)
NEWLINE=\n

# If we detect MSYS, handle disabling asssembler ANSI codes internally in INC/HEADER.INC and use the correct newline
ifdef MSYSTEM
NOANSI=
NEWLINE=\r\n
endif

# If on Linux, use Wine to run MS-DOS Player
ifeq ($(UNAME_S),Linux)
WINE=wine
else
WINE=
endif

# MS-DOS player DOS userland application emulator executable
MSDOS=../bin/msdos.exe

# Assembler
ASM=$(WINE) $(MSDOS) ../bin/ARGSFXX.EXE
# Setup heap for SASM and export symbols for ARGSFX
ASMFLAGS= $(NOANSI) -e__notitle -e__heap=14400 -z

# Linker
LINK=$(WINE) $(MSDOS) ../bin/ARGLINK.EXE
LOPTS=-b30 -h1024 -t7d -z

# ROM Extender
EXTEND=../tools/romextender
# Extended size in Mbits, byte to pad with
EXTOPTS= 16 ff

# Checksum Fixer
ifeq ($(UNAME_S),Linux)
CHECK=../bin/superfamicheck_linux
else
CHECK=../bin/superfamicheck
endif
COPTS=-s -f

# FXGFX Interleaver
MERGE=../tools/cgx2fx

# Graphics Cruncher
CRU=../tools/sf_crunch

# ALLCOLS Builder
MC=DATA/COL/mc.sh

# Font Converter
FONT=../tools/foxfont

# Argonaut .MAP File Decoder
MAPDEC=../tools/argonautmapdecoder

# USB2SNES CLI Utility
USB2SNES=../bin/usb2snes-cli.exe

# Terminal-specific commands

# Print Command
PRINT ?= printf

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
	$(call print2,Interleaving FXGfx:,$@)
	@$(MERGE) MSPRITES/$(1) MSPRITES/$(2) $@
endef

# Recipe to assemble a .ASM file and create a linkable .SOB file
BANK/%.SOB: BANK/%.ASM
	$(call print,Assembling:,$<,$@)
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(ASM) $(NOANSI) -m30 $(ASMFLAGS) $< -v$@ > /dev/null 2>&1 || \
		$(ASM) $(NOANSI) -m30 $(ASMFLAGS) $< -v$@; \
	else \
		$(ASM) $(NOANSI) -m30 $(ASMFLAGS) $< -v$@; \
	fi'

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
all: check-jobs make-allcols msprites crunch fonts sf.sfc donebld

# Check for job flags and print a warning
check-jobs:
	@$(PRINT) "$(GREEN)Checking parallel build jobs...$(NO_COL)$(NEWLINE)"
	@case "$(MAKEFLAGS)" in \
		*-j*) \
			echo "$(RED)WARNING: A parallel job count greater than 1 may cause issues!!$(NO_COL)$(NEWLINE)"; \
		;; \
	esac

# Initialize allcols.col
init-allcols:
	@rm -f DATA/COL/allcols.col
	@touch DATA/COL/allcols.col
	@touch DATA/COL/col2.tmp

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
	@echo $(SOBFILES) | sed 's/\//\\/g' > flist.tmp

	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(LINK) $(LOPTS) -o$@ @flist.tmp > /dev/null 2>&1 || \
		$(LINK) $(LOPTS) -o$@ @flist.tmp; \
	else \
		$(LINK) $(LOPTS) -o$@ @flist.tmp; \
	fi'

	@rm -f flist.tmp

	$(call print2,Extending ROM:,$@)
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(EXTEND) $@ $(EXTOPTS) > /dev/null 2>&1 || \
		$(EXTEND) $@ $(EXTOPTS); \
	else \
		$(EXTEND) $@ $(EXTOPTS); \
	fi'

	$(call print2,Fixing Checksum:,$@)
	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(CHECK) $(COPTS) $@ > /dev/null 2>&1 || \
		$(CHECK) $(COPTS) $@; \
	else \
		$(CHECK) $(COPTS) $@; \
	fi'

	@$(SHA1SUM) $@
	@$(PRINT) "${BLINK}Build succeeded.$(NO_COL)$(NEWLINE)"

donebld: sf.sfc
	@mv sf.sfc ../sf.sfc
	@{ [ -f BANKS.CSV ] && mv BANKS.CSV ../banks.csv || true; }
	@$(MAPDEC) sf.MAP ../symbols.txt
	@rm -rf sf.MAP
	@rm -rf msgs.txt

clean:
	@rm -rf ../sf.sfc
	@rm -rf ../banks.csv
	@rm -rf BANK/*.SOB
	@rm -rf BANK/*.MAP *.MAP
	@rm -rf MSPRITES/*.BIN
	@rm -rf DATA/*.CCR
	@rm -rf DATA/*.PCR
	@rm -rf DATA/FONT/MOJI_0.fon
	@rm -rf DATA/FONT/MOJI_D.fon
	@rm -rf DATA/COL/allcols.pac
	@rm -rf sf.sfc
	@rm -rf BANKS.CSV

upload:
	@$(USB2SNES)	--upload ../sf.sfc --path ./sf.sfc
	@$(PRINT) "$(NEWLINE)"

boot:
	@$(USB2SNES) --boot ./sf.sfc
	@$(PRINT) "$(NEWLINE)"

## The great big list of source files to detect changes for and whatnot

INCFILES = $(wildcard INC/*.INC)
EXTFILES = $(wildcard EXT/*.EXT)
CFGFILES = $(wildcard CONFIG/*.INC)
MAPFILES = $(wildcard MAPS/*.*)
SNDFILES = $(wildcard SND/*.*)
MSPRITESFILES = $(wildcard MSPRITES/*.BIN)
STRATFILES = $(wildcard STRAT/*.ASM)
SHAPEFILES = $(wildcard SHAPES/*.ASM)
PATHFILES = $(wildcard PATH/*.ASM)
MSGFILES = $(wildcard MSG/*.INC)
ALLFONFILES = $(wildcard DATA/FONT/*.*)
COLFILES = $(wildcard DATA/COL/*.COL)
MARIOFILES = $(wildcard MARIO/*.MC)

STDFILES = $(INCFILES) $(EXTFILES) $(CFGFILES)

## Banks to assemble and files they include

## Banks 0, 32
BANK/BANK0.SOB: \
 $(STDFILES) $(ALLFONFILES) $(STRATFILES) $(PCRFILES) $(SHAPEFILES) \
 BANK/BANK0.ASM \
 ASM/SGTABS.ASM ASM/SGDATA.ASM ASM/MSU.ASM \
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