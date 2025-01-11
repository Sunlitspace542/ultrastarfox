###############################
# UltraStarFox Tools Makefile #
###############################

# C/C++ compiler
CC=gcc

ifeq ($(UNAME_S),Linux)
EXT=
else
EXT=.exe
endif

# Everything to be done
all: sf_crunch cgx2fx romextender foxfont inccol argonautmapdecoder

clean:
	@rm -rf ./sf_crunch ./cgx2fx ./romextender ./foxfont ./inccol ./argonautmapdecoder

sf_crunch:
	@$(CC) sf_crunch.cpp -o $@$(EXT)

cgx2fx:
	@$(CC) cgx2fx.c -o $@$(EXT)

romextender:
	@$(CC) romextender.c -o $@$(EXT)

foxfont:
	@$(CC) foxfont.c -o $@$(EXT)

inccol:
	@$(CC) inccol.c -o $@$(EXT)

argonautmapdecoder:
	@$(CC) argonautmapdecoder.c -o $@$(EXT)
