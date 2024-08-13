#! /bin/bash

echo "======"
echo "Star Fox Background Maker 9000"
echo "Tool by Sunlit, version 1.01_02_l"
echo "======"

echo " "
echo "!!!!!!"
echo "Make sure you have reformatted your 512x512px PNG into a 256x1024px \"tall\" PNG"
echo "before feeding it into this script, or else the tilemap format will be wrong!!"
echo "See bgchunkorder.png and bgchunkorder_vertical.png for a template."
echo "!!!!!!"
echo " "

echo "Enter the input 256x1024px PNG file prefix (without extension): "
read infile
echo "Enter the prefix for the output CGX/SCR/COL and CCR/PCR files: "
read outfile
bin/superfamiconv -v -i ${infile}.png -B 4 --color-zero \#00000000 -p ${outfile}.pal -t ${outfile}.cgx -m ${outfile}.scr

echo " "
echo "======"
echo "Running superfamiconv..."
echo "======"
echo " "

echo " "
echo "======"
echo "PNG to CGX/SCR conversion complete."
echo "Ensure the tileset has 192 tiles or less, and the palette contains 111 colors or less."
echo "Look in the log above for text that says \"Created palette with...\" and \"Created optimized tileset with...\""
echo "After verifying, press any key to pad the palette file to 0x200 bytes and create a .col format palette."
echo "======"
echo " "

read -n1 -r -p "Press any key to continue..." key

python3 bin/padpal.py ${outfile}.pal
rm -rf ${outfile}.pal
cp ${outfile}.col ${outfile}.pal
rm -rf ${outfile}.col
bin/palconv ${outfile}.pal ${outfile}.col pal2col

echo " "
echo "======"
echo "Palette conversion successful!"
echo "======"
echo " "

echo " "
echo "!!!!!!"
echo "If you ARE NOT using ultrastarfox 2.0+, press any key to create CCR/PCR LZW compressed versions of the CGX/SCR files."
echo " "
echo " "
echo "If you ARE using ultrastarfox 2.0+, you can now close this script. (press CTRL + C)"
echo "!!!!!!"

read -n1 -r -p "Press any key to continue..." key

bin/sf_crunch ${outfile}.cgx ${outfile}.ccr
bin/sf_crunch ${outfile}.scr ${outfile}.pcr

echo " "
echo "======"
echo "GFX crunch successful!"
echo "======"
echo " "

read -n1 -r -p "Press any key to continue..." key