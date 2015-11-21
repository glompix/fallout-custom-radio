# Fallout 4: Use Custom Radio Tracks

#### Requirements

0. Windows 7 or later. (requires Powershell)
0. Some music.

#### Directions

0. Make a change to one line in `Fallout4.ini` to enable mods. (mine is in `Documents\My Games\Fallout4`)
  * Before: `sResourceDataDirsFinal=STRINGS\`
  * After: `sResourceDataDirsFinal=STRINGS\, textures\, meshes\, scripts\, sound\, music\, misc\, shadersfx\, interface\, programs\, materials\`
0. Download this repository as a zip file. There's a button for it on this page. Dump it somewhere.
0. Download [MultiXwm](http://www.nexusmods.com/skyrim/mods/3159/?). It will allow you to convert mp3s and whatnot to Fallout's format. Copy the `MultiXwm` folder into the `fallout-custom-radio` folder you extracted.
0. Run MultiXwm and convert your tracks to its default output folder.
0. Click the Windows button and type `Powershell`.
0. `cd` to the `fallout-custom-radio` folder.
0. Run `.\move-radiotracks.ps1`.

#### Move-RadioTracks Parameters

* `station` - use one of the names in the `radio-stations` folder. Default: `diamondcity`
* `sourceFolder` - where the converted music lives. Default: `.\MultiXwm\output`
* `falloutFolder` - where Fallout 4 is installed to. Default: `C:\Program Files (x86)\Steam\steamapps\common\Fallout 4`

If you have any issues... brush up on Powershell and figure it out. :) Or send me a tweet [@glompix](http://twitter.com/glompix).
