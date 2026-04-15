if (VinylMixGetGain("music") > 0) {
	var underwaterMusic = false;
	with(oPlayer) {
		if in_water() underwaterMusic = true;
	}


	if VinylIsPlaying(fgMusic) {
		if (underwaterMusic) {
			VinylSetGain(fgMusic, 0.05, 0.5)
			if VinylIsPlaying(bgMusic) VinylSetGain(bgMusic, 0.15*VinylMixGetGain("music"), 0.5)
		} else {
			VinylSetGain(fgMusic, 0.2, 0.5)
			if VinylIsPlaying(bgMusic) VinylSetGain(bgMusic, 0.2*VinylMixGetGain("music"), 0.5)
		}
	}
}

game_timer += delta_time / 1000000;

reserve_timer = lerp(reserve_timer,0,0.2);

if (reserve_timer <= 0.01) {
	reserve_timer = 0;
}