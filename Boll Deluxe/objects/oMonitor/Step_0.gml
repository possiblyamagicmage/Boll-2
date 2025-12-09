if (physics_enabled) {
	if !grounded { 
		vsp=min(vsp+grav,6);
	}

	x += hsp
	y += vsp

	player_collision()
}

image_index=floor(global.roomTimer/4)