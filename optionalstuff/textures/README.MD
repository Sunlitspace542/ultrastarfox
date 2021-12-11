# Textures
A short explanation of textures in Star Fox

## General Info
These are all the texture files for the final game (English + German), along with early files, backups, and misc textures found in the leak.
Textures in Star Fox are .CGX files which are interleaved using MERGE.EXE (found in TOOLS), which is how the .dat files in MSPRITES are made.

P_COL.COL is the palette used for textures, found in the DATA folder.

## Editing/Viewing
For viewing these texture files, you can use SCAD (found in Gigaleak 2), or Hyper CG-CAD by LuigiBlood (hcgcad).
The latter option is better because of the raw import feature.

YY-CHR.NET and Tile Molester v0.20 are good options for editing textures.
v0.20 of Tile Molester natively supports .col files, but in the end it just boils down to preference.

If you use YY-CHR.NET, open the palette in vSNES (make sure to go to settings and select SNES palette in the PalViewer tab), then save palette.
This will make it compatible with YY-CHR.NET.

All tools mentioned (except SCAD) are in the links section.

## Notes
- The maping and misc textures are not drop in replacements for the final textures, they need to be defined
- Textures are defined in DEFSPR.ASM, entries are in COLTABS.ASM

## Links
- [Hyper CG-CAD](https://github.com/LuigiBlood/hcgcad)
- [YY-CHR.NET](https://www.smwcentral.net/?p=section&a=details&id=27208)
- [Tile Molester v0.20](https://www.romhacking.net/utilities/1583/)
- [vSNES](https://www.romhacking.net/utilities/274/)
