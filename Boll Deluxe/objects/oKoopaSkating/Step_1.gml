event_inherited();

var coll = collision_line(x-hit_sizex,y+hit_sizey+vsp,x+hit_sizex,y+hit_sizey+vsp, oBrick, false, true)
if !(grounded) && (vsp > 0) && (coll) {
	vsp=-1.5;
	grounded=false;
	coll.blockHit.Emit(1, id)
}