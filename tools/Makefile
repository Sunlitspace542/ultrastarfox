###############################
# UltraStarFox Tools Makefile #
###############################

# C/C++ compiler
CC=gcc

# Everything to be done
all: sf_crunch cgx2fx romextender foxfont inccol argonautmapdecoder

clean:
	@rm -rf ./sf_crunch ./cgx2fx ./romextender ./foxfont ./inccol ./argonautmapdecoder

sf_crunch:
	@$(CC) sf_crunch.cpp -o $@

cgx2fx:
	@$(CC) cgx2fx.c -o $@

romextender:
	@$(CC) romextender.c -o $@

foxfont:
	@$(CC) foxfont.c -o $@

inccol:
	@$(CC) inccol.c -o $@

argonautmapdecoder:
	@$(CC) argonautmapdecoder.c -o $@
