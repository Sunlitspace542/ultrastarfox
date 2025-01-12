# Redirects to the correct Makefiles
all:
ifeq ($(OS),Windows_NT)
ifndef MSYSTEM
else
	@$(MAKE) -C tools
endif
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
