#########################
# UltraStarFox Makefile #
#########################

# Silence the assembler+linker unless an error occurs
QUIET ?= true

UNAME_S := $(shell uname -s)

# Whether to colorize build messages
ifeq ($(UNAME_S),Linux)
COLOR ?= 1
NOANSI=
else
# Assume we can't use ANSI codes if UNAME_S != linux
COLOR ?= 0
NOANSI= -eNOANSI
endif

# If on Linux, use Wine to run msdos.exe
ifeq ($(UNAME_S),Linux)
WINE=wine
else
WINE=
endif

# MS-DOS player userland application emulator
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
CHECK=../tools/superfamicheck_linux
else
CHECK=../tools/superfamicheck
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

# Terminal-specific commands

# Print Command
PRINT ?= echo

# File Checksum Calculator
SHA1SUM=sha1sum

# Delete Command
DEL=rm -rf

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
  @$(PRINT) "$(GREEN)$(1) $(YELLOW)$(2)$(GREEN) -> $(BLUE)$(3)$(NO_COL)"
endef

define print2
  @$(PRINT) "$(GREEN)$(1) $(BLUE)$(2)$(NO_COL)"
endef

define print3
  @$(PRINT) "$(GREEN)$(1)$(NO_COL)"
endef

# Function to interleave FXGfx
define merge
	$(call print2,Interleaving FXGfx:,$@)
	@$(MERGE) MSPRITES/$(1) MSPRITES/$(2) MSPRITES/$@
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
CGXFILES= DATA/1-3-B.CCR DATA/2-3B.CCR DATA/3-4.CCR DATA/B.CCR DATA/CONT.CCR DATA/DOG.CCR \
 DATA/F-1.CCR DATA/FS-BG3.CCR DATA/MAP-G.CCR DATA/OBJ-2.CCR DATA/SPACE.CCR DATA/T-ST.CCR \
 DATA/1-4.CCR DATA/2-4.CCR DATA/AND.CCR DATA/C-M.CCR DATA/CP-P.CCR DATA/E-TEST.CCR \
 DATA/F-OBJ.CCR DATA/HOLE-A.CCR DATA/MAP.CCR DATA/OBJ-3.CCR DATA/ST-P.CCR DATA/TI-3-G.CCR \
 DATA/2-2.CCR DATA/3-2.CCR DATA/B-HOLE.CCR DATA/CONT-2-G.CCR DATA/CP.CCR DATA/E-TEST2.CCR \
 DATA/FOX-G.CCR DATA/LSB.CCR DATA/OBJ-1-G.CCR DATA/OBJ-4.CCR DATA/OOPS.CCR DATA/STARS.CCR \
 DATA/TI-3-US.CCR DATA/2-3.CCR DATA/3-3.CCR DATA/B-M.CCR DATA/CONT-2.CCR DATA/DEMO.CCR \
 DATA/FOX.CCR DATA/M.CCR DATA/OBJ-1.CCR DATA/T-SP.CCR DATA/TI-3.CCR

# Crunched tilemaps
SCRFILES= DATA/1-3-B.PCR DATA/2-3.PCR DATA/3-2.PCR DATA/B-HOLE.PCR DATA/CONT.PCR DATA/DOG.PCR \
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
ALLFILES= \
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
all: allcols.pac msprites crunch fonts sf.sfc donebld

# Initialize allcols.col
init-allcols:
	@rm -f DATA/COL/allcols.col
	@touch DATA/COL/allcols.col
	@touch DATA/COL/col2.tmp

# Palettes to include in ALLCOLS
process-palettes:
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
allcols.pac: init-allcols process-palettes
	@$(CRU) DATA/COL/allcols.col DATA/COL/allcols.pac
	@$(PRINT) "$(GREEN)Palette crunching complete.$(NO_COL)"

# FXGFX files to be interleaved
msprites: tex_01.bin tex_23.bin tex_23_a.bin

# MSPRITES .BIN recipes
tex_01.bin:
	$(call merge,tex_0.CGX,tex_1.CGX)

tex_23.bin:
	$(call merge,tex_2.CGX,tex_3.CGX)

tex_23_a.bin:
	$(call merge,tex_2.CGX,tex_3_a.CGX)

# Crunch all compressible GFX
crunch: $(CGXFILES) $(SCRFILES)

# Convert fonts
fonts: $(FONFILES)

# The ROM Itself
sf.sfc: $(ALLFILES)
	$(call print2,Linking ROM:,$@)
	@echo $(ALLFILES) | sed 's/\//\\/g' > flist.tmp

	@bash -c '\
	if [ "$(QUIET)" = "true" ]; then \
		$(LINK) $(LOPTS) -o$@ @flist.tmp > /dev/null 2>&1 || \
		$(LINK) $(LOPTS) -o$@ @flist.tmp; \
	else \
		$(LINK) $(LOPTS) -o$@ @flist.tmp; \
	fi'

	@$(DEL) flist.tmp

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
	@$(PRINT) "${BLINK}Build succeeded.\n$(NO_COL)"

donebld: sf.sfc
	@mv sf.sfc ../sf.sfc
	@mv BANKS.CSV ../banks.csv
# temporarily clearing object files for time being
	@$(DEL) BANK/*.SOB
	@$(DEL) BANK/*.MAP
	@$(MAPDEC) sf.MAP ../symbols.txt
	@rm -rf sf.MAP
	@rm -rf msgs.txt

clean:
	@$(DEL) ../sf.sfc
	@$(DEL) ../banks.csv
	@$(DEL) BANK/*.SOB
	@$(DEL) BANK/*.MAP *.MAP
	@$(DEL) MSPRITES/*.bin
	@$(DEL) DATA/*.CCR
	@$(DEL) DATA/*.PCR
	@$(DEL) DATA/FONT/MOJI_0.fon
	@$(DEL) DATA/FONT/MOJI_D.fon
	@$(DEL) DATA/COL/allcols.pac
	@$(DEL) sf.sfc
	@$(DEL) BANKS.CSV

## Banks to assemble

## Banks 0, 32
BANK/BANK0.SOB: \
 BANK/BANK0.ASM

## Banks 1, 41
BANK/BANK1.SOB: \
 BANK/BANK1.ASM

## Banks 2, 3, 31, 36
BANK/BANK2.SOB: \
 BANK/BANK2.ASM

## Bank 4
BANK/BANK4.SOB: \
 BANK/BANK4.ASM

## Banks 5, 13, 39
BANK/BANK5.SOB: \
 BANK/BANK5.ASM

## Banks 6, 33
BANK/BANK6.SOB: \
 BANK/BANK6.ASM

## Bank 7
BANK/BANK7.SOB: \
 BANK/BANK7.ASM

## Bank 8
BANK/BANK8.SOB: \
 BANK/BANK8.ASM

## Bank 9
BANK/BANK9.SOB: \
 BANK/BANK9.ASM

## Bank 10
BANK/BANK10.SOB: \
 BANK/BANK10.ASM

## Banks 11, 40
BANK/BANK11.SOB: \
 BANK/BANK11.ASM

## Banks 12, 14, 15, 16, 17, 37, 38
BANK/SHBANKS.SOB: \
 BANK/SHBANKS.ASM

## Banks 18, 19, 20, 21, 22, 23, 35 
BANK/INCBINS.SOB: \
 BANK/INCBINS.ASM