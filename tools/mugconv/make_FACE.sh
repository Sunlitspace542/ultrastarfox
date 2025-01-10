superfamiconv/superfamiconv tiles -i FACE.png -p superfamiconv/mugs-transparent.pal --out-data FACE.CGX --bpp 4 --no-discard
./foxchr FACE.CGX
rm -rf FACE.CGX
