###############################
# UltraStarFox Tools Makefile #
###############################

# C/C++ compiler
CC=gcc

EXT=
OPT= -O2

ifdef MSYSTEM
EXT=.exe
endif

# Everything to be done
all: sf_crunch cgx2fx romextender foxfont inccol argonautmapdecoder

clean:
	@rm -rf ./sf_crunch ./cgx2fx ./romextender ./foxfont ./inccol ./argonautmapdecoder

sf_crunch:
	@$(CC) $(OPT) sf_crunch.cpp -o $@$(EXT)

cgx2fx:
	@$(CC) $(OPT) cgx2fx.c -o $@$(EXT)

romextender:
	@$(CC) $(OPT) romextender.c -o $@$(EXT)

foxfont:
	@$(CC) $(OPT) foxfont.c -o $@$(EXT)

inccol:
	@$(CC) $(OPT) inccol.c -o $@$(EXT)

argonautmapdecoder:
	@$(CC) $(OPT) argonautmapdecoder.c -o $@$(EXT)
