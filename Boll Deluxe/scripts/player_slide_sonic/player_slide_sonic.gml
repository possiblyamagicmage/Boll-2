// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_slide_sonic(slope_influence, rolling, roll_up_influence = 0, roll_down_influence = 0) {
	
	var slope = 0
	
	if grounded {
		if !rolling {
			slope = slope_influence
		} else {
			if sign(gsp) !=	sign(dsin(colangle)) {
				slope = roll_down_influence
			}else {
				slope = roll_up_influence
			}
		}
		
		gsp -= (slope * dsin(colangle))
		
		var angle = colangle
		if (angle < 0) angle = 360 + colangle
		
		if abs(gsp) < 0.5 {
			if(angle >= 45 && angle <= 360-45 && control_lock = 0) {
				control_lock = 30	
			}
		}
	}
}