// Inherit the parent event
event_inherited();

ceiling = noone;
in_shell = 0;
gsp = esign(x - oPlayer.x, -1)*0.5;
state = 2;

statehax = [
	function () { //state 0: ceiling walk
		var logicombi = 0
		y = ceiling.bbox_bottom + (bbox_height / 2) + 1;
		x = clamp(x + gsp, ceiling.bbox_left, ceiling.bbox_right);
		logicombi = (x == ceiling.bbox_left) | ((x == ceiling.bbox_right) << 1) | (place_meeting(x+gsp, y ,oCollider) << 2);
		
		if (logicombi) {
			turning = true;
			gsp = -gsp;
		}
		
		if collision_rectangle(x - 48, y, x + 48, room_height + 255, oPlayer, false, true) {
			state = 1
			sprite_index = spr_buzzyshell;
		}
		return 0;
	},
	
	function () {//state 1: fall from ceiling
		vsp = clamp(vsp + 0.25, 0, 8);
		var col = instance_place(x,y,oCollider);
		y += vsp;
		if col {
			while (place_meeting(x,y,col)) {
				y -= 0.25;
			}
			state = 3;
			
			sprite_index = spr_buzzyshell;
			constantspd = 2;
			_direction = esign(oPlayer.x - x, -1);
			shell_move = true;
			in_shell = shell_time;
			no_stomping = false;
			kickedplayer = noone;
			enemycoll=false;
			
			return 1;
		}
		return 0;
	},
	function () {//state 2: detect ceiling
		state = 3;
		ceiling = collision_line(x, y, x, y-8, oCollider, false, true)
		if (ceiling != noone) && (ceiling.object_index != oSlopeCollider) {
			y = ceiling.bbox_bottom + (bbox_height / 2) + 1;
			ysc = -1;
			state = 0;
			event_user(0);
			image_index = spr_buzzybeetle_walk;
		} else {
			return 1;
		}
		return 0;
	},
	function () { //state 3: inherit step event
		return 1;
	}
]