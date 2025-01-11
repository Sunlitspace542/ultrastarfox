# Redirects to the correct Makefiles
all:
	@make -C tools
	@make -C SF

tools:
	@make -C tools

upload:
	@make -C SF upload

boot:
	@make -C SF boot

clean:
	@make -C SF clean

distclean:
	@make -C SF clean
	@make -C tools clean
