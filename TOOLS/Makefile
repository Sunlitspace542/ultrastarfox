SUPERFAMICONV_VERSION := 0.10.0
CC := cc
# Does -march=native also work on Clang?
CFLAGS_OPTIM := -O2 -pipe

all: bgconv/bin/palconv mugconv/foxchr bgconv/bin/sf_crunch bgconv/bin/superfamiconv mugconv/superfamiconv/superfamiconv

clean:
	rm -f bgconv/bin/palconv
	rm -f bgconv/bin/sf_crunch
	rm -f mugconv/foxchr
	rm -f bgconv/bin/superfamiconv
	rm -f mugconv/superfamiconv/superfamiconv
	make -C SuperFamiconv-$(SUPERFAMICONV_VERSION) clean

distclean: clean
	rm -f SuperFamiconv-*.tar.gz
	rm -rf SuperFamiconv-*

bgconv/bin/palconv: palconv_src/palconv.c
	$(CC) $(CFLAGS_OPTIM) palconv_src/palconv.c -o bgconv/bin/palconv

bgconv/bin/sf_crunch: cru_src/sf_crunch_mod.c
	$(CC) $(CFLAGS_OPTIM) cru_src/sf_crunch_mod.c -o bgconv/bin/sf_crunch

mugconv/foxchr: mugconv/foxchr_source/foxchr.c mugconv/foxchr_source/foxchr.h
	$(CC) $(CFLAGS_OPTIM) mugconv/foxchr_source/foxchr.c -o mugconv/foxchr

SuperFamiconv-$(SUPERFAMICONV_VERSION).tar.gz:
	curl https://codeload.github.com/Optiroc/SuperFamiconv/tar.gz/refs/tags/v$(SUPERFAMICONV_VERSION) -o SuperFamiconv-$(SUPERFAMICONV_VERSION).tar.gz

SuperFamiconv-$(SUPERFAMICONV_VERSION)/Makefile: SuperFamiconv-$(SUPERFAMICONV_VERSION).tar.gz
	tar -zxf SuperFamiconv-$(SUPERFAMICONV_VERSION).tar.gz

SuperFamiconv-$(SUPERFAMICONV_VERSION)/bin/superfamiconv: SuperFamiconv-$(SUPERFAMICONV_VERSION)/Makefile
	make -C SuperFamiconv-$(SUPERFAMICONV_VERSION)

bgconv/bin/superfamiconv: SuperFamiconv-$(SUPERFAMICONV_VERSION)/bin/superfamiconv
	install -CS ./SuperFamiconv-$(SUPERFAMICONV_VERSION)/bin/superfamiconv ./bgconv/bin

mugconv/superfamiconv/superfamiconv: SuperFamiconv-$(SUPERFAMICONV_VERSION)/bin/superfamiconv
	install -CS ./SuperFamiconv-$(SUPERFAMICONV_VERSION)/bin/superfamiconv ./mugconv/superfamiconv

.PHONY: all clean distclean
