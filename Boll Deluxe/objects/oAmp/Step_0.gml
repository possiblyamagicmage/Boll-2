dirchange=collision_rectangle(x-1,y-1,x,y,oDirectionChanger,false,true)
if (dirchange) {
	if (dirchange.reverse) reverse=!reverse
	
	if (dirchange.is_break) fallen=1;
	
	if !reverse {
		dir=dirchange.dir
	} else { 
		dir=dirchange.revdir
	}
}

x+=lengthdir_x(spd,dir)
y+=lengthdir_y(spd,dir)

if (fallen) {
	vsp = min(3,vsp+grav);
	y += vsp;
}