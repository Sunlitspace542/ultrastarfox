# Redirects to the correct Makefiles
all:
	@make -C tools
	@make -C SF

clean:
	@make -C tools clean
	@make -C SF clean
