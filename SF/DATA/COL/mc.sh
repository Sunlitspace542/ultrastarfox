#!/bin/bash
# mc.sh
# Syntax: ./mc.sh <file prefix> <start> <end>

set -e  # Exit immediately if any command fails

# Invoke inccol with the provided arguments
../tools/inccol "DATA/COL/$1.COL" "$2" "$3"

# This has to be done due to filepath memes
mv col.tmp DATA/COL/col.tmp

# Concatenate the temporary file with the master palette file
cat DATA/COL/allcols.col DATA/COL/col.tmp > DATA/COL/col2.tmp
mv DATA/COL/col2.tmp DATA/COL/allcols.col
