//wandering coder PLEASE make the spinning better i BEG -moster
//ok

if (spinning) {
	spin_dir += (spin_speed*4);
	
	//lengthdir 1 doesnt have decimals so we have to get it through this
	flag_scale = (lengthdir_x(20,spin_dir)/20);
	
	spin_speed = approach_val(spin_speed,1*sign(spin_speed),0.05);
	
	if (spin_dir >= 90) {
		flag_index = 1;
	}
	
	if (spin_dir >= 360) {
		spin_dir -= 360;
		if (spin_amount) {
			spin_amount--;
		} else {
			spinning = false;
			flag_scale = 1;
			spin_dir = 0;
			spin_speed = 0;
		}
	}
	
	palette_speed = max(palette_speed-0.25,1);
}

/*if (!hit && image_speed == 0) {
	image_index = 0 + (dir * 6);
	exit
} 

var flawed = floor(image_index)

if (image_speed > 0 && flawed mod 3 == 0 && prev_image_index != flawed) {
	image_speed -= 0.25
	if (palette_speed > 1)
		palette_speed -= 0.25
	if (image_speed <= 0.5)
		image_speed = 0
}

if (flawed == 3 && prev_image_index != flawed) {
	if (spin_amount >= 0) {
		spin_amount -= 1
	}
}

if (hit && spin_amount == -1)
	sprite_index = spr_checkpoint_hit

prev_image_index = flawed

if (image_speed == 0)
	spinning = 0;	