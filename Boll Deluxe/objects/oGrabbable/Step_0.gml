node_path_movement();

if !(grabbed) {
    grab_delay = max(grab_delay-1, 0)
    if !(grounded) { 
        vsp=min(vsp+grav,6);
    }
    
    if (grounded) {
		thrown = false;
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

    player_collision();
} else {
    grounded = false
}
