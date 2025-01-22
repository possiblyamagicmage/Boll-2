var col = noone;
if (state = 0) {
	
	frame = 0
	
	if collision_rectangle(x-90,y,x+90,y+255,oPlayer,false,true) {
		frame = 1
	}
	
	if collision_rectangle(x-40,y,x+40,y+255,oPlayer,false,true) {
		frame = 2
		state = 1
	}
}

if (state == 1) {
	vsp = clamp(vsp + 0.25, 0, 4)
	col = instance_place(x, y+vsp, [oCollider, oBrick])
	if col {
		if col.object_index == oBrick {
			with col {
				var j = noone;
				j = instance_create(x-4,y+4,pDestruction) with (j) {image_index=0 hspeed=-1 vspeed=-2} //bottom left
				j = instance_create(x-4,y-4,pDestruction) with (j) {image_index=0 hspeed=1 vspeed=-2} //bottom right
				j = instance_create(x+4,y+4,pDestruction) with (j) {image_index=0 hspeed=-1 vspeed=-4} //top left
				j = instance_create(x+4,y-4,pDestruction) with (j) {image_index=0 hspeed=1 vspeed=-4} //top right
			
				instance_destroy();
			}
			VinylPlay(snd_blockbreak)
			exit;
		}
		state = 2
		vsp = 0
		timer_offset = 90
		y = col.bbox_top - 15
		VinylPlay(snd_enemyexplode)
		with(oCamera) {
			shakeoffset=4
		}
	}
} else if (state == 2) {
	if !timer_offset {
		y = approach_val(y, ystart, 1)
		frame = 0
		if (y == ystart) {
			state = 0
		}
		exit;
	}
	timer_offset -= 1
}

y += vsp