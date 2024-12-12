if (!hit) {
	hit = 1;
	
	global.checkpointX = x
	global.checkpointY = y
	global.checkpointDir = dir
	
	if (global.roomTimer < 10) {
		sprite_index = spr_checkpoint_hit
		exit;
	}
	
	
	var spd = abs(other.x - other.xprevious) //too many speed variables
	
	// AAARGH -moster
	
	if (spd <= 3) {
		image_speed = 1.25;
	} else if (spd <= 6) {
		image_speed = 2.75;
		spin_amount = 1;
	} else {
		image_speed = 5;
		spin_amount = 3;
	}
}