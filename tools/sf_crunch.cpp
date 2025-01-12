//
//  sf_crunch.cpp
//  sf_crunch
//
//  Created by everything8215 on 7/29/20.
//  (everything8215@gmail.com)
//

#include <stdio.h>
#include <stdlib.h>

using namespace std;

// 64k should be enough for anything
unsigned char src[0x10000]; // source buffer
unsigned char dest[0x10000]; // destination buffer
int s = 0; // source pointer
int s_length = 0; // length of decrunched data
int d = 0; // destination pointer

unsigned int buffer = 0; // 32-bit buffer
int b = 32; // number of bits left in bit buffer

unsigned char raw_buffer[0x10000]; // buffer for uncompressed bytes
int r = 0;

void put_buffer() {

    dest[d++] = (unsigned char)(buffer >> 24);
    dest[d++] = (unsigned char)(buffer >> 16);
    dest[d++] = (unsigned char)(buffer >> 8);
    dest[d++] = (unsigned char)(buffer);
    
    buffer = 1;
    b = 32;
}

void put_bits(int n, int bits) {
    if (n > b) {
        n -= b;
        int bits2 = bits;
        bits >>= b;
        put_bits(b, bits2);
        put_buffer();
    }
    for (int i = 0; i < n; i++) {
        buffer <<= 1;
        buffer |= (bits & 1);
        bits >>= 1;
    }
    b -= n;
}

void put_raw() {
    
    if (r == 0) return;
    for (int i = 0; i < r; i++) put_bits(8, raw_buffer[i]);

    if (r <= 6) {
        put_bits(3, r);
    } else if (r <= 22) {
        put_bits(4, r - 7);
        put_bits(1, 0);
        put_bits(3, 7);
    } else if (r <= 0x3FF) {
        put_bits(10, r);
        put_bits(1, 1);
        put_bits(3, 7);
    } else {
        put_bits(18, r);
        put_bits(10, 0);
        put_bits(1, 1);
        put_bits(3, 7);
    }

    r = 0;
}

void put_lzw(int run, int offset) {

    // put the offset
    if (run == 2) {
        put_bits(8, offset);
        
    } else if (run == 3 && offset <= 0xFF) {
        put_bits(8, offset);
        put_bits(1, 1);

    } else if (run == 3) {
        put_bits(14, offset);
        put_bits(1, 0);

    } else if (offset <= 0xFF) {
        put_bits(8, offset);
        put_bits(1, 1);
        put_bits(1, 1);

    } else if (offset <= 0xFFF) {
        put_bits(12, offset);
        put_bits(1, 0);
        put_bits(1, 1);

    } else {
        put_bits(16, offset);
        put_bits(1, 0);

    }

    // put the run
    if (run <= 4) {
        put_bits(2, run - 2);

    } else if (run <= 6) {
        put_bits(2, run - 5);
        put_bits(2, 3);

    } else if (run <= 10) {
        put_bits(2, run - 7);
        put_bits(2, 2);
        put_bits(2, 3);

    } else {
        put_bits(8, run);
        put_bits(2, 3);
        put_bits(2, 3);

    }
}

void crunch() {
    
    while (d < 0x10000 && s < s_length) {
        // find the longest sequence that matches the decompression buffer
        int run_max = 0;
        int offset_max = 0;
        for (int s1 = s + 1; s1 < s_length; s1++) {
            int run = 0;

            while ((s1 + run < s_length) && (src[s1 + run] == src[s + run]) && run < 255) run++;

            if (run <= run_max) continue;
            
            int offset = s1 - s;

            if (run < 2) continue;
            
            // offset must be 8 bits or smaller for 2-byte runs
            if ((run == 2) && (offset > 0xFF)) continue;
            
            // offset must be 14 bits or smaller for 3-byte runs
            if ((run == 3) && (offset > 0x3FFF)) continue;
            
            // this sequence is longer than any others that have been found so far
            run_max = run;
            offset_max = offset;
        }
        
        if (run_max) {
            if (r) {
                // write string of raw data
                put_raw();
                
            } else {
                put_bits(3, 0);
            }
            
            // put lzw data
            put_lzw(run_max, offset_max);
            s += run_max;
            
        } else {
            // add to string of raw data
            raw_buffer[r++] = src[s++];
        }
    }

    // write leftover string of raw data
    if (r) put_raw();
    
    // put the "suffix"
    if (b == 0) put_buffer();
    put_buffer();
    
    // write the decrunched length
    buffer = s_length;
    put_buffer();
}

int main(int argc, const char* argv[]) {
    
    // print help message
    if (argc != 3) {
        printf(
            "sf_crunch v0.01\n"
            "Compression utility for Star Fox / Star Fox 2\n"
            "by everything8215 (everything8215@gmail.com)\n"
            "usage: sf_crunch input.cgx output.ccr\n"
            "\n"
        );
        return 0;
    }
	
	// added by Sunlit, printf's status so it doesn't look weird executed en masse
//    if (argc == 3) {
//        printf("Crunching %s...", argv[2]);
//    }
    
    const char* i_filename = argv[1];
    const char* o_filename = argv[2];

    FILE* i_file = fopen(i_filename, "rb");
    if (!i_file) {
        printf("error opening input file: %s\n", i_filename);
        return 0;
    }

    // get data offset (end of data)
    fseek(i_file, 0, SEEK_END);
    s_length = (int)ftell(i_file);
    
    if (s_length >= 0x10000) {
        printf("unable to decompress files longer than 64k\n");
        return 0;
    }
    
    // copy file to source buffer
    fseek(i_file, 0, SEEK_SET);
    fread(src, 1, s_length, i_file);
    fclose(i_file);

    // crunch the data
    crunch();

    // write output file
    FILE* o_file = fopen(o_filename, "wb");
    fwrite(dest, 1, d, o_file);
    fclose(o_file);

    return 0;
}
