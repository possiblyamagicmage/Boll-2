node_path_movement();

if !(grabbed) {
	if !(check_rectangle_in_hitbox((-sprite_width/2)+1,sprite_width/2,(-sprite_height/2)+1,(sprite_height/2)-1, oPlayer)) {
		grab_delay = max(grab_delay-1, 0)
	}
    if !(grounded) { 
        vsp=min(vsp+grav,6);
    }
    
    if (grounded) {
		thrown = false;
		carry_player = noone;
        if (bounce) {
            grounded = false
            bounce = false
            hsp = gsp / 2
            vsp = -1.5
        } else {
			hsp = approach_val(hsp, 0, 0.1);
        }
    }
    
    x += hsp
    y += vsp

    player_collision(true, false, (-sprite_width/2)+1,sprite_width/2,(-sprite_height/2)+1,(sprite_height/2)-1);
} else {
    grounded = false
}
