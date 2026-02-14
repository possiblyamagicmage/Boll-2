function post_wall(auto_coords=true,l=0,r=0,t=0,b=0) {
	
	var left, right, top, bottom;
	
	if (auto_coords)
	{
		left = -hit_sizex;
		right = hit_sizex-1;
		top = -hit_sizey;
		bottom = hit_sizey;
	}
	else
	{
		left = l;
		right = r-1;
		top = t;
		bottom = b;
	}
	
	//left wall stop
	if check_collision_line(x + left - 1,y + top + 2,x + left - 1,y + bottom - 2,COL_WALL) and hsp < 0{
		var oldhsp = hsp;
		
		hsp = 0
		if grounded {
			gsp = 0	
		}
		
		if (object_index==oPlayer) && (oldhsp != 0) {
			if (state == "frozen") {
				state=""
				vsp=-2;
				hurt = true;
				grounded=false;
				was_frozen = true;
				y-=8
				var j=noone
				j = instance_create(x-8,y+8,pDestruction) with(j){image_index=10 hspeed=-1 vspeed=-2} //bottom left
				j = instance_create(x-8,y-8,pDestruction) with(j){image_index=10 hspeed=1 vspeed=-2} //bottom right
				j = instance_create(x+8,y+8,pDestruction) with(j){image_index=10 hspeed=-1 vspeed=-4} //top left
				j = instance_create(x+8,y-8,pDestruction) with(j){image_index=10 hspeed=1 vspeed=-4} //top right
				VinylPlay(snd_iceshatter)
			}
			
			sig.Emit("wall_hit")
		}
	}
	
	//right wall stop
	if check_collision_line(x + right + 1,y + top + 2,x + right + 1,y + bottom - 2,COL_WALL) and hsp > 0 {
		var oldhsp = hsp;
		
		hsp = 0
		if grounded {
			gsp = 0	
		}
		
		if (object_index==oPlayer) && (oldhsp != 0) {
			if (state == "frozen") {
				state=""
				vsp=-2;
				hurt=1;
				grounded=false;
				was_frozen = true;
				y-=8
				var j=noone
				j = instance_create(x-8,y+8,pDestruction) with(j){image_index=10 hspeed=-1 vspeed=-2} //bottom left
				j = instance_create(x-8,y-8,pDestruction) with(j){image_index=10 hspeed=1 vspeed=-2} //bottom right
				j = instance_create(x+8,y+8,pDestruction) with(j){image_index=10 hspeed=-1 vspeed=-4} //top left
				j = instance_create(x+8,y-8,pDestruction) with(j){image_index=10 hspeed=1 vspeed=-4} //top right
				VinylPlay(snd_iceshatter)
			}
			
			sig.Emit("wall_hit")
		}
	}
}