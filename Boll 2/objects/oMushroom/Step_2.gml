if check_collision_line(x+(hit_sizex*xsc)+hsp,y-hit_sizey,x+(hit_sizex*xsc)+hsp,y+hit_sizey,COL_WALL) {
	hsp=-hsp
}
//wall flip

if (phaseid) && !check_hitbox_on_hitbox(id,phaseid) {
	phase_leeway=max(phase_leeway-1,0)
	if !phase_leeway {
		phaseid=noone
	}
}