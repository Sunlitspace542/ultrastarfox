CC := cc
# Does -march=native also work on Clang?
CFLAGS_OPTIM := -O2

all: bgconv/bin/palconv mugconv/foxchr

clean:
	rm -f bgconv/bin/palconv
	rm -f mugconv/foxchr

bgconv/bin/palconv: palconv_src/palconv.c
	$(CC) $(CFLAGS_OPTIM) palconv_src/palconv.c -o bgconv/bin/palconv

mugconv/foxchr: mugconv/foxchr_source/foxchr.c mugconv/foxchr_source/foxchr.h
	$(CC) $(CFLAGS_OPTIM) mugconv/foxchr_source/foxchr.c -o mugconv/foxchr

.PHONY: all clean
