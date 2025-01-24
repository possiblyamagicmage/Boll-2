var col = noone, i = 0;
if state == 128 {
	y += vsp
	x += killhsp
	vsp += 0.2
	if !on_screen() {
		instance_destroy()
	}
	exit;
}
x -= (x % 16);
if (state = 0) {
	frame = 0
	
	col = collision_rectangle(x-90,y,x+90,y+255,oPlayer,false,true)
	if col!=noone {
		frame = 1
	}
	
	col = collision_rectangle(x-40,y,x+40,y+255,oPlayer,false,true)
	if col!=noone {
		frame = 2
		state = 1
	}
}

if (state == 1) {
	vsp = clamp(vsp + 0.25, 0, 5)
	col = instance_place(x, y + vsp, oEnemy)
	while col != noone && col.hp > 0 {
		if (col.sprite_width < sprite_width) {
			col.hp = 0;
			col.killtype="stomp";
		}
		col = instance_place(x, y + vsp, oEnemy)
	}
	col = instance_place(x, y+vsp, [oCollider, oBrick])
	if (col) {
		if (col.object_index == oBrick) {
			while (col != noone && i < 10) {
				instance_destroy(col);
				col = collision_line(bbox_left,bbox_bottom+vsp,bbox_right,bbox_bottom+vsp,oBrick,false,true)
				i += 1;
			}
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