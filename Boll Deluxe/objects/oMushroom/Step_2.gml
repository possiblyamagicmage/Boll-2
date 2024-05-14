/// @description Insert description here
// You can write your code in this editor
if check_collision_dot(bbox_left - 1,y,COL_WALL) and hsp < 0{
		hsp = abs(hsp)
	}
	
//right wall stop
if check_collision_dot(bbox_right + 1,y,COL_WALL) and hsp > 0{
		hsp = -abs(hsp)
	}

