if (parent_pipe == noone) {
	//player_collision();
	grounded = false;
	var col = instance_place(x, y + vsp, oCollider)
	if col != noone {
		if (col.object_index == oPipe) {
			parent_pipe = col;
			exposed = true;
			y = parent_pipe.bbox_top;
			vsp = 0;
			go = -4;
			travel = 32;
			exit;
		}
		
		if (col.object_index != oSemilider && col.object_index != oSemiSlope) {
			vsp = 0
			if (col.bbox_top - y) {
				y = col.bbox_bottom + hit_sizey;
			} else {
				y = col.bbox_top;
				grounded = true;
			}
			exit;
		}
		
		if vsp >= 0 {
			grounded = true;
			vsp = 0;
		}
	}
	
	x += hsp
	y += vsp
	
	if grounded {
		vsp = 0;
		hsp /= 2;
	} else {
		vsp = clamp(vsp + 0.15,-8,8)
	}
	exit;
}

if (go == 0) {
	timer = clamp(timer - 1,0,120)
	if (timer == 0) {
		if (exposed) {
			go = -0.5
		} else if !(collision_rectangle(x-24,0,x+24,room_height,oPlayer,true,true)) { //turns out i didnt need to do anything fancy here LOL
			go = 0.5
		}
		exit;
	}
}

if (go != 0) {
	travel += go;//approach_val(travel, 32 * esign(go, 1), go)
	travel = clamp(travel,-32,32); //i genuinely dont know why this is nessecary considering approach_val should already clamp
	
	if !place_meeting(x,y,parent_pipe) && !(exposed) {
		exposed = true;
		y = parent_pipe.bbox_top;
		timer = 90;
		go = 0;
	} else if y >= parent_pipe.bbox_top + 32 && (exposed) {
		y = parent_pipe.bbox_top + 32;
		exposed = false;
		timer = 120;
		go = 0;
	}
}

y = floor(parent_pipe.bbox_bottom-1) - travel
x = parent_pipe.x