# MSU-1 Audio Setup for Dummies

Here's a quick explanation of how to get MSU-1 audio going.

Note that for the final file arrangement, the name prefix of all the files necessary (.sfc, .pcm, .msu) should all match (e.g. `sf_msu1`).

1. In `SF\CONFIG\ROM.INC`, set `msu1` to 1 to enable MSU-1 music.

2. Build the ROM as usual.

3. Obtain a PCM set or make your own. The tracklist is described in `SF\INC\MSUTRKS.INC`.
   
   - I have prepared a PCM set [here](https://github.com/Sunlitspace542/star-fox-msu1-pcm. If you're using my set, I have included instructions on how to build the set there. You will end up with a bunch of .PCM files named like `sf_msu1-#.pcm`.

4. Create a dummy `.msu` file. This is required to indicate that the MSU-1 should be used. It can be left empty or filled with some placeholder data.

5. Arrange the files together in the same directory like so:

```
sf_msu1.sfc - Program ROM (i.e. the game)

sf_msu1.msu - MSU-1 data file (required for chip detection) if using Ares, you may need to rename this to "msu1.data.rom".

sf_msu1-#.pcm - Audio tracks
```

Note how all the file name prefixes are the same.
I recommend you rename the files to lowercase so the various emulators can properly detect that the chip is being used and such.