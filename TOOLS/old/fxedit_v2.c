// Star Fox 2: FX bitmap inserter/extractor (it's now like MERGE.EXE! well,sort of. edits done by @SegaRetro92)

#include <stdio.h>
#include <string.h>
#include <memory.h>
#include <stdbool.h>

typedef unsigned char u8;
typedef unsigned int u32;

u8 buffer[1024][256];	// 256 pixels wide

FILE *image,*fx_low,*fx_high;

void Read_8x8(int row, int col, FILE *fp, bool mode)
{
	// grab 8x8 4-bpp pixels
	for(int lcv2=0; lcv2<8; lcv2++)
	{
		u32 data=0;

		for(int lcv=0; lcv<8; lcv++)
		{
			u8 byte = buffer[row+lcv2][col+lcv];

			// de-interleave
			if(!mode) { byte &= 0xf0; byte>>=4; }
			else { byte &= 0x0f; }

			data <<= 4;
			data |= byte;
		}

		fputc(data>>24,fp);
		fputc(data>>16,fp);
		fputc(data>>8,fp);
		fputc(data>>0,fp);
	}
}

void Write_8x8(int row, int col, FILE *fp, bool mode)
{
	// place 8x8 4-bpp pixels
	for(int lcv2=0; lcv2<8; lcv2++)
	{
		u32 data=0;

		data |= (fgetc(fp)<<24);
		data |= (fgetc(fp)<<16);
		data |= (fgetc(fp)<<8);
		data |= (fgetc(fp)<<0);

		for(int lcv=0; lcv<8; lcv++)
		{
			u8 byte = (data&0xf0000000)>>28;
			data <<= 4;

			// interleave
			if(!mode) { byte <<= 4; }
			else {}

			buffer[row+lcv2][col+lcv] |= byte;
		}
	}
}

void Extract_FX()
{
	//fseek(image,0x90000,SEEK_SET);
	fread(buffer,0x18000,1,image);

	////////////////////////////////////////////////
	// FX 4-bpp interleaved image ==> 4-bpp linear

	for(int row=0; row<384; row+=8)
	{
		for(int col=0; col<256; col+=8)
		{
			Read_8x8(row,col,fx_low,0);
			Read_8x8(row,col,fx_high,1);
		}
	}
}

void Insert_FX()
{
	memset(buffer,0,0x18000);

	////////////////////////////////////////////////
	// 4-bpp linear ==> FX 4-bpp interleaved image

	for(int row=0; row<384; row+=8)
	{
		for(int col=0; col<256; col+=8)
		{
			Write_8x8(row,col,fx_low,0);
			Write_8x8(row,col,fx_high,1);
		}
	}

	//fseek(image,0x90000,SEEK_SET);
	//fwrite(buffer,1,0x18000,image);
}

int main(int argc, char**argv)
{
	// SUNLITFIX add help text so it doesn't crash with no arguments supplied
	if (argv[1] == NULL){
		printf("Interleaved FXGfx extractor/inserter\nUsage: %s [extract/insert] [bin/dat file] [file1] [file2]\nModified from fx.cpp by Matthew Callis\n", argv[0]);
		return 0;
	}
	if(strcmp(argv[1],"extract")==0)
	{
		image = fopen(argv[2],"rb");
		fx_low = fopen(argv[3],"wb");
		fx_high = fopen(argv[4],"wb");

		Extract_FX();

		fclose(image);
		fclose(fx_low);
		fclose(fx_high);
	}
	else if(strcmp(argv[1],"insert")==0)
	{
		image = fopen(argv[2],"r+b");
		fx_low = fopen(argv[3],"rb");
		fx_high = fopen(argv[4],"rb");

		Insert_FX();

		fclose(image);
		fclose(fx_low);
		fclose(fx_high);
	}

	return 0;
}
