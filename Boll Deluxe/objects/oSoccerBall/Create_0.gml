///// PHYSICS /////
grav=0.25; //we're having an actual grav var now because changing gravity should be EASIER!!
defaultgrav = grav; //for resetting gravity back to default
vsp=0;
hsp=0;
gsp=0;

chsp = 0;
cvsp = 0;

steep_slope = false

fric = 0.0625; //slipperiness
rot=0
xsc=1
ysc=1
grounded = false
piped = false

hit_sizex = 6
hit_sizey = 8
flipped=false

function ball_movement() {
	//bounce off wall
	if check_collision_dot(x+(hit_sizex+1)*xsc, y, COL_WALL, oCollider) {
		hsp=-hsp
		gsp=-gsp
	}
	
	if !grounded {
		vsp += grav
		
		//bounce off the ground
		if (floor(vsp) > 0 && check_collision_line(x-hit_sizex,y+hit_sizey+vsp,x+hit_sizex,y+hit_sizey+vsp, COL_BOTTOM)) || (vsp < 0 && check_collision_line(x-hit_sizex,y-hit_sizey-vsp,x+hit_sizex,y-hit_sizey-vsp, COL_TOP)) {
			vsp=-vsp
			vsp*= 0.5
			
			//bounce off a slope at an angle
			get_angle_line(x-hit_sizex-2,y+hit_sizey+3,x+hit_sizex+2,y+hit_sizey+3)
			hsp += lengthdir_x(2,colangle+90)
		}
	} else {
		vsp = 0	
	}
	
	if (grounded) {
		//apply friction
		gsp=approach_val(gsp,0,0.05)
		
		var coll=check_collision_line(x-hit_sizex,y+hit_sizey+2,x+hit_sizex,y+hit_sizey+2, COL_BOTTOM)
		
		//center of mass checking, checks if the center is leaning off an edge and pushes it off
		if (coll) && (x > coll.bbox_right) && (y < (coll.bbox_top+2)) { //left leaning
			hsp -= 0.05
		} else if (coll) && (x < coll.bbox_left) && (y < (coll.bbox_top+2)) { //right leaning
			hsp += 0.05
		} else {
			gsp -= (0.25 * dsin(colangle)) //regular slope speed
		}
		
		vsp = gsp * -dsin(colangle)
		hsp = gsp * dcos(colangle)
	}
	
	x += hsp 
	y += vsp
}