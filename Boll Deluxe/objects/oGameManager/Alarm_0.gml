///@description Play Music
// this delays if put in room start, so i have to delay this LOL
if (!is_undefined(fgMusic) && VinylIsPlaying(fgMusic))
	VinylStop(fgMusic);
if (!is_undefined(bgMusic) && VinylIsPlaying(bgMusic))
	VinylStop(bgMusic);
fgMusic=VinylPlay("frigid dark bgm", true, 0.2*VinylMixGetGain("music"));
//bgMusic=VinylPlay("overworld bgm BG", true, 0.2*VinylMixGetGain("music"));
bgMusic=undefined;