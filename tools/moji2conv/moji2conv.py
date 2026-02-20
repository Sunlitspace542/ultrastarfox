#!/usr/bin/env python3

import argparse
from pathlib import Path
from PIL import Image

def png_to_1bpp_bin(
    input_png: str,
    output_bin: str,
):
    img = Image.open(input_png).convert("RGBA")
    width, height = img.size

    if width % 8 != 0:
        raise ValueError("Image width must be a multiple of 8")

    pixels = img.load()
    out = bytearray()
    bytes_per_row = width // 8

    for y in range(height):
        row = bytearray()

        for x in range(0, width, 8):
            byte = 0
            for i in range(8):
                r, g, b, a = pixels[x + i, y]

                if a == 0:
                    bit = 0
                else:
                    bit = 1 if (r or g or b) else 0

                byte |= (bit & 1) << (7 - i)

            row.append(byte)

            row.reverse()

        out.extend(row)

    with open(output_bin, "wb") as f:
        f.write(out)

    print(
        f"Wrote {len(out)} bytes "
        f"({width}x{height})"
    )

def main():
    parser = argparse.ArgumentParser(
        description="Convert a 16x1280px RGBA PNG of MOJI_2.FON into 1BPP 16x16 .FON format."
    )
    parser.add_argument("input", help="Input PNG")
    #parser.add_argument("output", help="Output binary")

    args = parser.parse_args()
    input_path = Path(args.input)

    png_to_1bpp_bin(
        args.input,
        input_path.with_suffix(".fon"),
    )

if __name__ == "__main__":
    main()
