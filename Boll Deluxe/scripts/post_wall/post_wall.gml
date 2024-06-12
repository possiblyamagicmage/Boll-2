// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function post_wall(){
	//left wall stop
	if check_collision_dot(x - hit_sizex- 1,y,COL_WALL) and hsp < 0.000{
			hsp = 0
			if grounded {
				gsp = 0	
			}
		}
	
	//right wall stop
	if check_collision_dot(x + hit_sizex + 1,y,COL_WALL) and hsp > 0.000{
			hsp = 0
			if grounded {
				gsp = 0	
			}
		}
}