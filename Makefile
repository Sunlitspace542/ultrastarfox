# Redirects to the correct Makefiles

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

all:
ifeq ($(PLATFORM),windows)

else ifeq ($(PLATFORM),msys2)
	@$(MAKE) -C tools
else ifeq ($(PLATFORM),linux)
	@$(MAKE) -C tools
endif
	@$(MAKE) -C SF

upload:
	@$(MAKE) -C SF upload

boot:
	@$(MAKE) -C SF boot

clean:
	@$(MAKE) -C SF clean

distclean:
	@$(MAKE) -C SF clean
	@$(MAKE) -C tools clean
