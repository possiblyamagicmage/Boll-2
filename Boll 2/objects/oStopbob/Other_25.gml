// Inherit the parent event
event_inherited();

linelength=0;
laserlength=0;
var loopcount=0;
while !check_collision_rectangle(x-hit_sizex,y-hit_sizey,x+hit_sizex,y-hit_sizey-linelength,COL_TOP) {
	linelength+=16
	loopcount++;
	if loopcount > 50 {
		linelength=0;
		show_debug_message("couldnt find line!")
		break;
	}
	if check_collision_rectangle(x-hit_sizex,y-hit_sizey,x+hit_sizex,y-hit_sizey-linelength,COL_TOP)
	break;
}
show_debug_message("stopbob line length! {0}", linelength)

var loopcount=0;
while !check_collision_rectangle(x-hit_sizex,y+hit_sizey,x+hit_sizex,y+hit_sizey+maxlaserlength,COL_BOTTOM) {
	maxlaserlength+=16
	loopcount++;
	if loopcount > 50 {
		laserlength=0;
		break;
	}
	
	if check_collision_rectangle(x-hit_sizex,y+hit_sizey,x+hit_sizex,y+hit_sizey+maxlaserlength,COL_BOTTOM)
	break;
}

light_timer=120+timer_offset