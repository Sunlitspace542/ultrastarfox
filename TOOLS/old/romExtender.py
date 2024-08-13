#Usage example: 
# python3 romExtender.py "Star Fox Exploration Showcase v6.55.sfc"
#or, just drag 'n' drop!

import os
import sys
romFile = sys.argv[1]

with open(romFile,'rb') as currentFile: #read data from file
    romData = bytearray(currentFile.read())

if len(romData) < 2097152:
    zeroFillAmt = 2097152 - len(romData) #calculate needed 0's

    for i in range(zeroFillAmt): #append 0's to data
        romData.append(0)

    with open(romFile,'wb') as currentFile: #write new data to file
        currentFile.write(romData)

    print("Done adding", zeroFillAmt, "0x00s to ROM...")

else: print("Nothing to do for", romFile) #do nothing if over 2MB