/*	be warned - lots of jank cause this is a chatGPT job, i just gave it data structures + params for reading files.
	this is based off of an old internal tool for yoshi's island to convert .ch7 to .cpc (fx interleaved format), now for fx textures.
	this is basically merge.exe now, which is crazy! - @segaretro92	*/

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
#define CGX_READ_LIMIT 0x4000 // Limit reading to the first 0x4000 bytes

/* Type aliases for readability */
typedef unsigned char unchar;

/* Buffers */
unchar ch7buf[CHRMAX];
unchar binbuf[BINMAX];

/* Function prototypes */
void process_cgx_file(const char *cgx_filename, unchar *ch7_buffer, size_t ch7_offset);
void convert_tile_to_ch7(const unchar *cgx_tile, unchar *ch7_tile);
void reverse_chunks(unchar *buffer, size_t buffer_size);
void convert_to_bin();
void write_bin_file(const char *output_filename);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_cgx1> <input_cgx2> <output_bin>\n", argv[0]);
        return EXIT_FAILURE;
    }

	printf("Interleaving FXGfx data for %s...", argv[2]);

    const char *input_cgx1 = argv[1];
    const char *input_cgx2 = argv[2];
    const char *output_bin = argv[3];

    /* Process both CGX files into the in-memory CH7 buffer */
    process_cgx_file(input_cgx1, ch7buf, 0);          // Fill the first half of ch7buf
    process_cgx_file(input_cgx2, ch7buf + CHRHALF, 0); // Fill the second half of ch7buf

    /* Reverse swapped chunks in the CH7 buffer */
    reverse_chunks(ch7buf, CHRMAX);

    /* Convert the CH7 buffer back to CPC format... you mean BIN */
    convert_to_bin();

    /* Write the final CPC file, basically FX interleaved */
    write_bin_file(output_bin);

    return EXIT_SUCCESS;
}

/* Function to process a .CGX file and fill part of the CH7 buffer */
void process_cgx_file(const char *cgx_filename, unchar *ch7_buffer, size_t ch7_offset) {
    FILE *cgx_file = fopen(cgx_filename, "rb");
    if (!cgx_file) {
        perror("Error opening .CGX file");
        exit(EXIT_FAILURE);
    }

    unchar cgx_tile[TILE_SIZE_CGX];
    unchar ch7_tile[TILE_SIZE_CH7];

    size_t bytes_read = 0;
    while (bytes_read < CGX_READ_LIMIT && fread(cgx_tile, 1, TILE_SIZE_CGX, cgx_file) == TILE_SIZE_CGX) {
        convert_tile_to_ch7(cgx_tile, ch7_tile);
        memcpy(ch7_buffer + ch7_offset, ch7_tile, TILE_SIZE_CH7);
        ch7_offset += TILE_SIZE_CH7;
        bytes_read += TILE_SIZE_CGX;
    }

    fclose(cgx_file);
}

/* Function to convert a single CGX tile to CH7 format */
void convert_tile_to_ch7(const unchar *cgx_tile, unchar *ch7_tile) {
    memset(ch7_tile, 0, TILE_SIZE_CH7);

    for (int row = 0; row < 8; row++) {
        for (int col = 0; col < 8; col++) {
            int bitplane1 = (cgx_tile[row * 2 + 0] >> (7 - col)) & 1;
            int bitplane2 = (cgx_tile[row * 2 + 1] >> (7 - col)) & 1;
            int bitplane3 = (cgx_tile[16 + row * 2 + 0] >> (7 - col)) & 1;
            int bitplane4 = (cgx_tile[16 + row * 2 + 1] >> (7 - col)) & 1;

            ch7_tile[row * 8 + col] = (bitplane4 << 3) | (bitplane3 << 2) | (bitplane2 << 1) | bitplane1;
        }
    }
}

/* Function to reverse the swapped chunks */
void reverse_chunks(unchar *buffer, size_t buffer_size) {
    for (size_t chunk_start = 0; chunk_start < buffer_size; chunk_start += CHUNKSIZE) {
        size_t swap_size = (SWAP_END - SWAP_START + 1) / 2;

        /* Get pointers to the two halves */
        unchar *first_half = buffer + chunk_start + SWAP_START;
        unchar *second_half = first_half + swap_size;

        /* Perform the reverse swap */
        for (size_t i = 0; i < swap_size; i++) {
            unchar temp = first_half[i];
            first_half[i] = second_half[i];
            second_half[i] = temp;
        }
    }
}

/* Function to convert the CH7 buffer back to CPC format, sorry we're doing starfox now not YI */
void convert_to_bin() {
    int wcnt = 0;
    long n, i, j, k, l, m;

    /* Interleave the low nibbles */
    for (n = 0; n < (64 * 16 * 32); n += (64 * 16 * 16)) {
        for (i = n; i < (n + 64 * 16 * 8); i += (64 * 16)) {
            for (j = i; j < (i + 64); j += 8) {
                for (k = j; k < (j + 64 * 16 * 8 * 2); k += (64 * 16 * 8)) {
                    for (l = k; l < (k + 64 * 16); l += 64) {
                        for (m = l; m < (l + 8); m++) {
                            binbuf[wcnt++] = ch7buf[m] & 0x0F;
                        }
                    }
                }
            }
        }
    }

    /* Overlay the high nibbles */
    wcnt = 0;
    for (n = 0; n < (64 * 16 * 32); n += (64 * 16 * 16)) {
        for (i = n; i < (n + 64 * 16 * 8); i += (64 * 16)) {
            for (j = i; j < (i + 64); j += 8) {
                for (k = j; k < (j + 64 * 16 * 8 * 2); k += (64 * 16 * 8)) {
                    for (l = k; l < (k + 64 * 16); l += 64) {
                        for (m = l; m < (l + 8); m++, wcnt++) {
                            binbuf[wcnt] |= (ch7buf[m + 0x8000] & 0x0F) << 4;
                        }
                    }
                }
            }
        }
    }
}

/* Function to write the CPC file, no silly we're doing BIN now! - segaretro92 */
void write_bin_file(const char *output_filename) {
    FILE *file = fopen(output_filename, "wb");
    if (!file) {
        perror("Error opening .BIN output file");
        exit(EXIT_FAILURE);
    }

    if (fwrite(binbuf, sizeof(unchar), BINMAX, file) != BINMAX) {
        fprintf(stderr, "Error writing .BIN file\n");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fclose(file);
}
