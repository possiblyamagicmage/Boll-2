if !on_screen(32,32) && !origin_on_screen(xstart,ystart,32,32) {
	x = xstart
	y = ystart
	light_timer=0;
	state=0;
} else if on_screen(32,32) {
	instance_activate_region(x-activation_region_width, y-activation_region_width, activation_region_width*2, activation_region_height*2, true)
}


light_timer=max(0, light_timer-1);

if !light_timer {
	flare_frame=0;
	flare_alpha=1;
	state=wrap_val(state+1,0,2)
	flare_fading=false;
	switch(state) {
		case 0:
		light_timer=60*2;
		lasering=false;
		break;
		case 1:
		light_timer=60;
		lasering=false;
		break;
		case 2:
		elec_frame=0;
		light_timer=60*3;
		lasering=true;
		break;
	}
}

if (lasering) {
	damage_on_contact=true
	var laserbboxleft = x-3;
	var laserbboxtop = y+hit_sizey;
	var laserbboxright = x+3;
	var laserbboxbottom = y+hit_sizey+laserlength-12;
	with(oPlayer) {
		if rectangle_in_rectangle(laserbboxleft,laserbboxtop,laserbboxright,laserbboxbottom, x-hit_sizex,y-hit_sizey,x+hit_sizex,y+hit_sizey) {
			if !(electrocuted) && !(hurt) && !(dead)
			sig.Emit("electrocute");
		}
	}
} else damage_on_contact=false

image_index=state