// Inherit the parent event
event_inherited();

cooldowntimer=max(cooldowntimer-1,0);

var pl=nearestplayer()

if (pl) && !(stun) && !(blowing) && !(cooldowntimer) && (abs(pl.x-x) <= 96) && (within(pl.y,y-16,y+16)) && !(revving) {
	revving=true;
	revtimer=50;
	constantspd=0;
	_direction = esign(-(pl.x-x),xsc);
	xsc = _direction;
}

if (revving) {
	revtimer=max(revtimer-1,0)
	
	if !(revtimer) {
		revving=false;
		blowing=true
		blowtimer=90;
	}
}