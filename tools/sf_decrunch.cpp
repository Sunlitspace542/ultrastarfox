//
//  sf_decrunch.cpp
//  sf_decrunch
//
//  Created by everything8215 on 7/28/20.
//  (everything8215@gmail.com)
//

#include <stdio.h>
#include <stdlib.h>

using namespace std;

// 64k should be enough for anything
unsigned char src[0x10000]; // source buffer
unsigned char dest[0x10000]; // destination buffer
int s = 0; // source pointer
int d; // destination pointer
int d_length = 0; // length of decrunched data

unsigned int buffer; // 32-bit buffer
int b = 0; // buffer bit offset

void put_byte(unsigned char byte) {
    if (d == 0) return;
    dest[--d] = byte;
}

void refill_buffer() {
    buffer = 0;
    b = 0;
    
    if (s == 0) return;
    buffer = src[--s];
    b += 8;
    
    if (s == 0) return;
    buffer |= src[--s] << 8;
    b += 8;
    
    if (s == 0) return;
    buffer |= src[--s] << 16;
    b += 8;
    
    if (s == 0) return;
    buffer |= src[--s] << 24;
    b += 8;
}

void init_buffer() {
    refill_buffer();
    unsigned int mask = 1;
    b = 1;
    while (buffer & ~mask) {
        mask <<= 1;
        mask |= 1;
        b++;
    }
    
    // mask off the last bit
    buffer &= (mask >> 1);
    b--;
}

int get_bits(int n) {
    int bits = 0;
    if (n > b) {
        n -= b;
        bits = get_bits(b);
        refill_buffer();
    }
    for (int i = 0; i < n; i++) {
        bits <<= 1;
        bits |= buffer & 1;
        buffer >>= 1;
    }
    b -= n;
    return bits;
}

void put_raw(int run) {
    // write uncompressed bytes
    while (run--) put_byte(get_bits(8));
}

void put_lzw(int run, int offset) {
    // write bytes from destination buffer (lzw)
    while (run--) put_byte(dest[d + offset - 1]);
}

void decrunch_lzw() {
    int control = get_bits(2);
    int run = 0;
    int offset = -1;
    
    if (control == 0) {
        // comx10 (run is 2 bytes)
        run = 2;
        offset = get_bits(8);
        
    } else if (control == 1) {
        // com1xx (run is 3 bytes)
        run = 3;
        if (get_bits(1)) {
            offset = get_bits(8);
        } else {
            offset = get_bits(14);
        }
        
    } else if (control == 2) {
        // fill (run is 4 bytes)
        run = 4;
        
    } else if ((control = get_bits(2)) < 2) {
        // run is 5 or 6 bytes
        run = control + 5;
        
    } else if (control == 2) {
        // com11x (run is 7 to 10 bytes)
        run = get_bits(2) + 7;

    } else if (control == 3) {
        // com111 (run is 11 to 255 bytes)
        run = get_bits(8);

    }

    if (run > 3) {
        // fill
        if (!get_bits(1)) {
            offset = get_bits(16);
        } else if (get_bits(1)) {
            offset = get_bits(8);
        } else {
            offset = get_bits(12);
        }
    }

    put_lzw(run, offset);
}

void decrunch() {

    // get the decrunched length
    d_length |= src[--s];
    d_length |= src[--s] << 8;
    s -= 2; // skip two bytes
    d = d_length;

    // initialize the bit buffer
    init_buffer();
    
    while (d) {
        int run = get_bits(3);
        if (run == 0) {
            // compressed, fall through to below
        
        } else if (run < 7) {
            // copy 1 to 6 bytes
            put_raw(run);

        } else if (!get_bits(1)) {
            // copy 7 to 22 bytes
            put_raw(get_bits(4) + 7);

        } else if ((run = get_bits(10))) {
            // copy up to 0x3FF bytes
            put_raw(run);

        } else {
            // copy up to 0x3FFFF bytes
            put_raw(get_bits(18));

        }
        decrunch_lzw();
    }
}

int main(int argc, const char* argv[]) {
    
    // print help message
    if (argc < 3) {
        printf(
            "sf_decrunch v0.01\n"
            "Decompression utility for Star Fox / Star Fox 2\n"
            "by everything8215 (everything8215@gmail.com)\n"
            "usage: sf_decrunch input.ccr [offset] output.cgx\n"
            "offset is END of crunched data (defaults to end of file)\n"
            "\n"
        );
        return 0;
    }
    
    const char* i_filename = argv[1];
    const char* o_filename;
    
    //parse arguments
    if (argc == 4) {
        s = (int)strtol(argv[2], NULL, 0);
        o_filename = argv[3];
    } else {
        o_filename = argv[2];
    }

    FILE* i_file = fopen(i_filename, "rb");
    if (!i_file) {
        printf("error opening input file: %s\n", i_filename);
        return 0;
    }

    // get data offset (end of data)
    if (!s) {
        fseek(i_file, 0, SEEK_END);
        s = (int)ftell(i_file);
    }
    
    // copy file to source buffer
    if (s > 0x10000) {
        fseek(i_file, s - 0x10000, SEEK_SET);
        fread(src, 1, 0x10000, i_file);
        s = 0x10000;
    } else {
        fseek(i_file, 0, SEEK_SET);
        fread(src, 1, s, i_file);
    }
    fclose(i_file);

    // decrunch the data
    decrunch();

    // write output file
    FILE* o_file = fopen(o_filename, "wb");
    fwrite(dest, 1, d_length, o_file);
    fclose(o_file);

    return 0;
}
