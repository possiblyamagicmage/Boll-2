if global.paused || inactive exit

if (in_shell) && (hsp=0) in_shell--; //Decreases the time for the koopa to get up

event_inherited();

//Animation
if (in_shell) { sprite_index = spr_koopashellspin_g; image_speed = abs(hsp);}
else { sprite_index = spr_koopawalk_g; image_speed = 1;}