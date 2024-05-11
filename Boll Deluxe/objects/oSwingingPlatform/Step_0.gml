var dir = reverse ? 1 : -1

if !(continuous) {
	orbit_angle = -wave_val(start_angle,end_angle,swing_speed * dir);
}
else {
	//continuous movement, no swinging
	orbit_angle += (swing_speed/2) * dir;
	orbit_angle = wrap_val(orbit_angle,0,359);
}

orbit_length = (chain_length*16)

var oldx, oldy

oldx = floor(newx)
oldy = floor(newy)

newx = (targetx) + (orbit_length * dcos(orbit_angle+offset_angle));
newy = (targety)- (orbit_length * dsin(orbit_angle+offset_angle));

x = floor(newx)
y = floor(newy)

if x>xprevious
dir=1;
else if x<xprevious
dir=-1;

if y>xprevious
ydir=1;
else if y<xprevious
ydir=-1;


x_diff = (x - oldx);
y_diff = (y - oldy);