///@description Respawn
if (fall) {
	respawntime = global.roomTimer + 320;
	x = xstart;
	y = ystart;
	no_collide = true;
	fall = 0;
	visible = 0;
}