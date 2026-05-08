if (respawntime && respawntime <= global.roomTimer) {
	no_collide = false;
	visible = 1;
	if (respawntime > (global.roomTimer - 80)) {
		instance_create(x + (8 * image_xscale), y + (8 * image_yscale), pSmoke)
	}
	respawntime = -1;
}

if (onTimer>=30) || (onTimer>=3 && collapsing) {
	fall=true;
}

if (fall) { 
	image_index=1;
	y+=2;
} else {
	node_path_movement();
}