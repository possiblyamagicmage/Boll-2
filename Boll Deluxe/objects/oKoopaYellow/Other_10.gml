///@description Animation Controller
if (in_shell) {
	if (in_shell > (shell_time/2.5)) {
		sprite_index = spr_koopashellspin_y; 
		image_speed = abs(hsp); 
		if (hsp==0) image_index = 0;
	} else {
		sprite_index = spr_koopashellwake_y;
		image_speed =1;
	}
} else {
	if !(turning) {
		sprite_index = spr_koopawalk_y;
	} else {
		sprite_index = spr_koopaturn_y;
	}
	image_speed = 1;
}