# Redirects to the correct Makefiles
all:
	@$(MAKE) -C tools
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
