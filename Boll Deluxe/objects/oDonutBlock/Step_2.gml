if (no_collide)
	exit;

var x_diff = x-xprevious;
var y_diff = y-yprevious;
var object_is_on=false;

with(oPlayer) {
	if (grounded) && collision_line(x-hit_sizex+x_diff,y+hit_sizey+2+abs(y_diff),x+hit_sizex+x_diff,y+hit_sizey+2+abs(y_diff),other,false,true) {
		object_is_on=true;
		x += x_diff;
		y += y_diff;
	}
}

with(oEnemy)
{
	if (grounded) && (grav!=0) && collision_line(x-(hit_sizex-4),y+hit_sizey+1,x+(hit_sizex-4),y+hit_sizey+1,other,true,true) {
		object_is_on=true;
		x += x_diff;
		y += y_diff;
	}
}

if !(object_is_on) {
	if !(fall) image_index=0;
	onTimer=0;
} else {
	image_index=1;
	onTimer++;
}

if (collapsing) image_index=1;

