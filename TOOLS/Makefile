CC := cc
# Does -march=native also work on Clang?
CFLAGS_OPTIM := -O2

all: bgconv/bin/palconv mugconv/foxchr bgconv/bin/sf_crunch

clean:
	rm -f bgconv/bin/palconv
	rm -f bgconv/bin/sf_crunch
	rm -f mugconv/foxchr

bgconv/bin/palconv: palconv_src/palconv.c
	$(CC) $(CFLAGS_OPTIM) palconv_src/palconv.c -o bgconv/bin/palconv

bgconv/bin/sf_crunch: cru_src/sf_crunch_mod.c
	$(CC) $(CFLAGS_OPTIM) cru_src/sf_crunch_mod.c -o bgconv/bin/sf_crunch

mugconv/foxchr: mugconv/foxchr_source/foxchr.c mugconv/foxchr_source/foxchr.h
	$(CC) $(CFLAGS_OPTIM) mugconv/foxchr_source/foxchr.c -o mugconv/foxchr

.PHONY: all clean
