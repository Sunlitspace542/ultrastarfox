/*	you get the point. it's janky and done with chatGPT, based off an internal nintendo tool made to convert .ch7 to .cpc for YI
	this is reversed though, gets a bin file and outputs 2 4bpp cgx files... pretty much merge.exe but backwards.
	don't need to correct the comments to be bin though, yay! - @segaretro92	*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Constants */
#define CHRMAX  (256 * 256)
#define BINMAX  (256 * 128)
#define CHRHALF (CHRMAX / 2)
#define CHUNKSIZE  0x4000
#define SWAP_START 0x1000
#define SWAP_END   0x2FFF
#define TILE_SIZE_CH7 64   // 8x8 tile in Mode 7 format (64 bytes)
#define TILE_SIZE_CGX 32   // 8x8 tile in CGX format (32 bytes)

/* Type aliases for readability */
typedef unsigned char unchar;

/* Buffers */
unchar ch7buf[CHRMAX];
unchar binbuf[BINMAX];

/* Function prototypes */
void read_bin_file(const char *input_filename);
void convert_to_ch7();
void process_chunks(unchar *buffer, size_t buffer_size);
void write_cgx_files(const char *output_filename_base);
void convert_to_cgx(const unchar *ch7_buffer, const char *cgx_filename, size_t start, size_t size);
void convert_tile_to_cgx(const unchar *ch7_tile, unchar *cgx_tile);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_bin>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *input_filename = argv[1];

    /* Process the files */
    read_bin_file(input_filename);
    convert_to_ch7();
    process_chunks(ch7buf, CHRMAX);
    write_cgx_files(input_filename);

    return EXIT_SUCCESS;
}

/* Function to read binary input file into buffer */
void read_bin_file(const char *input_filename) {
    FILE *file = fopen(input_filename, "rb");
    if (!file) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    if (fread(binbuf, sizeof(unchar), BINMAX, file) != BINMAX) {
        fprintf(stderr, "Error reading input file\n");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fclose(file);
}

/* Function to convert binary data to CH7 format */
void convert_to_ch7() {
    int wcnt = 0;
    long n, i, j, k, l, m;

    /* Clear the buffer before reconstruction */
    memset(ch7buf, 0, sizeof(ch7buf));

    /* De-interleave the low nibbles */
    for (n = 0; n < (64 * 16 * 32); n += (64 * 16 * 16)) {
        for (i = n; i < (n + 64 * 16 * 8); i += (64 * 16)) {
            for (j = i; j < (i + 64); j += 8) {
                for (k = j; k < (j + 64 * 16 * 8 * 2); k += (64 * 16 * 8)) {
                    for (l = k; l < (k + 64 * 16); l += 64) {
                        for (m = l; m < (l + 8); m++) {
                            ch7buf[m] |= binbuf[wcnt++] & 0x0F;
                        }
                    }
                }
            }
        }
    }

    /* De-interleave the high nibbles */
    wcnt = 0;
    for (n = 0; n < (64 * 16 * 32); n += (64 * 16 * 16)) {
        for (i = n; i < (n + 64 * 16 * 8); i += (64 * 16)) {
            for (j = i; j < (i + 64); j += 8) {
                for (k = j; k < (j + 64 * 16 * 8 * 2); k += (64 * 16 * 8)) {
                    for (l = k; l < (k + 64 * 16); l += 64) {
                        for (m = l; m < (l + 8); m++, wcnt++) {
                            ch7buf[m + 0x8000] = (binbuf[wcnt] & 0xF0) >> 4;
                        }
                    }
                }
            }
        }
    }
}

/* Function to process chunks and swap halves of the specified range */
void process_chunks(unchar *buffer, size_t buffer_size) {
    for (size_t chunk_start = 0; chunk_start < buffer_size; chunk_start += CHUNKSIZE) {
        size_t swap_size = (SWAP_END - SWAP_START + 1) / 2;

        /* Get pointers to the two halves */
        unchar *first_half = buffer + chunk_start + SWAP_START;
        unchar *second_half = first_half + swap_size;

        /* Perform the swap */
        for (size_t i = 0; i < swap_size; i++) {
            unchar temp = first_half[i];
            first_half[i] = second_half[i];
            second_half[i] = temp;
        }
    }
}

/* Function to write CGX files */
void write_cgx_files(const char *output_filename_base) {
    char fname_cgx_lo[256], fname_cgx_hi[256];

    /* Construct filenames for the two CGX files */
    snprintf(fname_cgx_lo, sizeof(fname_cgx_lo), "%s_lo.CGX", output_filename_base);
    snprintf(fname_cgx_hi, sizeof(fname_cgx_hi), "%s_hi.CGX", output_filename_base);

    /* Convert the two halves of the CH7 buffer to CGX format */
    convert_to_cgx(ch7buf, fname_cgx_lo, 0, CHRHALF);          // Lower half
    convert_to_cgx(ch7buf + CHRHALF, fname_cgx_hi, 0, CHRHALF); // Upper half
}

/* Function to convert a portion of the CH7 buffer to CGX format and write it to a file */
void convert_to_cgx(const unchar *ch7_buffer, const char *cgx_filename, size_t start, size_t size) {
    FILE *cgx_file = fopen(cgx_filename, "wb");
    if (!cgx_file) {
        perror("Error opening CGX file");
        exit(EXIT_FAILURE);
    }

    unchar ch7_tile[TILE_SIZE_CH7];
    unchar cgx_tile[TILE_SIZE_CGX];

    for (size_t offset = start; offset < size; offset += TILE_SIZE_CH7) {
        memcpy(ch7_tile, ch7_buffer + offset, TILE_SIZE_CH7);
        convert_tile_to_cgx(ch7_tile, cgx_tile);
        fwrite(cgx_tile, 1, TILE_SIZE_CGX, cgx_file);
    }

    fclose(cgx_file);
}

/* Function to convert a single Mode 7 tile to CGX format */
void convert_tile_to_cgx(const unchar *ch7_tile, unchar *cgx_tile) {
    memset(cgx_tile, 0, TILE_SIZE_CGX);

    for (int row = 0; row < 8; row++) {
        for (int col = 0; col < 8; col++) {
            unsigned char color = ch7_tile[row * 8 + col] % 16;

            unsigned char bitplane1 = (color >> 0) & 1;
            unsigned char bitplane2 = (color >> 1) & 1;
            unsigned char bitplane3 = (color >> 2) & 1;
            unsigned char bitplane4 = (color >> 3) & 1;

            cgx_tile[row * 2 + 0] |= (bitplane1 << (7 - col));
            cgx_tile[row * 2 + 1] |= (bitplane2 << (7 - col));
            cgx_tile[16 + row * 2 + 0] |= (bitplane3 << (7 - col));
            cgx_tile[16 + row * 2 + 1] |= (bitplane4 << (7 - col));
        }
    }
}
