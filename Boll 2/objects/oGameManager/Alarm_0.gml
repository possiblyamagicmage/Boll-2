///@description Play Music
// this delays if put in room start, so i have to delay this LOL
if (!is_undefined(fgMusic) && VinylIsPlaying(fgMusic))
	VinylStop(fgMusic);
if (!is_undefined(bgMusic) && VinylIsPlaying(bgMusic))
	VinylStop(bgMusic);
//fgMusic=VinylPlay("frigid dark bgm", true, 0.2*VinylMixGetGain("music"));
//bgMusic=VinylPlay("overworld bgm BG", true, 0.2*VinylMixGetGain("music"));
//bgMusic=undefined;

fgMusic=undefined;
bgMusic=undefined;

var musicstr;
// ATM this is just temporary, make this use the level properties struct later
//musicstr="floragrande"

musicstr="frigiddark"
if (level_properties.music_track != undefined)
	musicstr=level_properties.music_track


if (struct_exists(global.musiclist, musicstr)) {
	var lmix, bmix;
	lmix = global.musiclist[$ musicstr].leadmix;
	bmix = global.musiclist[$ musicstr].backmix;
	if (lmix != undefined)
		fgMusic=VinylPlay(lmix, true, MUSIC_GAIN * VinylMixGetGain("music"));
	if (bmix != undefined)
		bgMusic=VinylPlay(bmix, true, MUSIC_GAIN * VinylMixGetGain("music"));
}