if owner!=noone {
	instance_activate_region(x-16,y-16,32,(lineheight+4)*16, true)
}

if instance_exists(owner) {
	x=lerp(x,owner.x-8*owner.xsc,0.1)+wave_val(-0.5,0.5,2)
	y=lerp(y,owner.y-16-lineheight*16,0.1)
} else if owner==noone {
	vsp+=0.05;
	
	x+=hsp;
	y-=vsp;
	
	if !on_screen_xy(32,32+lineheight) {
		instance_destroy();
	}
}