###############################
# UltraStarFox Linux Makefile #
###############################

# Use wine to run DOSBox instead of native Linux version (may be faster depending on your situation)
WINE ?= 0

DOSPARMS=-fastlaunch -nolog

ifeq ($(WINE),0)
DOSBOX=dosbox-x $(DOSPARMS)
else
DOSBOX=wine dosbox-x.exe $(DOSPARMS)
endif

all: 
	@$(DOSBOX) BUILD.BAT

log: 
	@$(DOSBOX) BLDTOLOG.BAT

clean:
	@$(DOSBOX) CLEAN.BAT
