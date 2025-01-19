# Star Fox mug converter / foxchr

These command line tools will convert a 24bit PNG into the correct SNES 4bpp format.

The PNG must be 40 pixels tall, and a multiple of 32 pixels wide. Use [SuperFamiconv](https://github.com/Optiroc/SuperFamiconv) (included) to convert the PNG into SNES 4bpp format. Transparent background pixels should be converted into color #0 in the SNES format by superfamiconv. If not, use the RGB color green #00FF00 as a background, and edit the .bat file to use ``mugs-green.pal``.

Then use foxchr.exe to convert the SNES 4bpp image from horizontal alignment into vertical alignment.

The included ``make_FACE.bat`` file does this for you.

The source code to foxchr is included in the zip file.
