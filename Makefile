###############################
# UltraStarFox Linux Makefile #
###############################

DOSBOX=dosbox-x

all: 
	@$(DOSBOX) BUILD.BAT

log: 
	@$(DOSBOX) BLDtolog.BAT

clean:
	@$(DOSBOX) clean.BAT