/// @description Animation
if (in_shell) {
	if (in_shell > (shell_time/2.5)) {
		sprite_index = spr_koopashellspin_g; 
		image_speed = abs(hsp); 
		if (hsp==0) image_index = 0;
	} else {
		sprite_index = spr_koopashellwake_g;
		image_speed =1;
	}
} else {
	if (turning) {
		sprite_index = spr_koopaturn_g;
	} else if (getup_timer) {
		sprite_index = spr_koopapopout_g;
	} else {
		sprite_index = spr_koopawalk_g;
		image_speed = 1;
	}
}