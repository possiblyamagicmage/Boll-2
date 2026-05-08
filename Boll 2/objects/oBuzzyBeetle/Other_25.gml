// Inherit the parent event
event_inherited();

if check_collision_line(x-hit_sizex,y-hit_sizey-8,x+hit_sizex,y-hit_sizey-8,COL_TOP) {
	attach_to_ceiling = true;
	grounded=false;
	grav=-defaultgrav;
}