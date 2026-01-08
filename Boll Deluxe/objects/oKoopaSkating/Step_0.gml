// Inherit the parent event
event_inherited();

if (vsp > 0) && (jump) {
	var coll = collision_line(x-hit_sizex,y+hit_sizey+vsp+1,x+hit_sizex,y+hit_sizey+vsp+1, oBrick, false, true)
	if (coll) {
		vsp=-1.5;
		grounded=false;
		coll.blockHit.Emit(1, id)
	}
}