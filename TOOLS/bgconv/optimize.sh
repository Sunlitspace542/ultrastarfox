echo "======"
echo "Star Fox Background Optimizer 9000"
echo "Tool by Sunlit, version 1.0_l"
echo "======"

echo "Enter the input 512x512 PNG file prefix (without extension): "
read infile
echo "Enter Source .PAL Palette (no SCAD stamp, w/o extension): "
read inpal
echo "Enter the prefix for the output CGX/SCR/COL and CCR/PCR files: "
read outfile

echo " "
echo "======"
echo Converting BG PNG to proper format...
echo "======"
echo " "

python3 bin/pngformatter.py ${infile}.png

echo " "
echo "======"
echo "Running superfamiconv..."
echo "======"
echo " "

bin/superfamiconv tiles -v -i ${infile}_tall.png -p ${inpal}.PAL --out-data ${outfile}.cgx --bpp 4
bin/superfamiconv map -v -i ${infile}_tall.png -p ${inpal}.PAL -t ${outfile}.cgx --out-data ${outfile}.scr --bpp 4
rm -rf ${infile}_tall.png

echo " "
echo "======"
echo "PNG to CGX/SCR conversion complete!"
echo "======"
echo " "

read -n1 -r -p "Press any key to continue..." key

echo " "
echo "!!!!!!"
echo "Do you want to crunch the new gfx data? if yes, press any key, if no, close script"
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