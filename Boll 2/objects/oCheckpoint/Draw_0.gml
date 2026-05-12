palette_frame = (palette_frame + (palette_speed / 10)) mod 2

var true_palette_frame = floor(palette_frame) + 1
if (palette_frame mod 1 >= 0.75) true_palette_frame = 3

pal_swap_set(spr_checkpointpal, !!hit * true_palette_frame, false)

draw_sprite(spr_checkpoint_base,0,x,y);

pal_swap_reset();

var draw_front = false;

if (flag_scale > -0.25 && flag_scale < 0.25) && (spin_dir >= 180) {
	draw_front = true;
}

if !(draw_front) {
	var offset = 2;
	if (dir) offset = -2;
	draw_sprite_ext(flag_sprite,flag_index,x+offset*sign(flag_scale),y+4,flag_scale,1,0,c_white,1);
} else {
	var offset = 1;
	if (dir) offset = -1;
	draw_sprite_ext(spr_checkpoint_flag_front,flag_index,x+flag_scale*offset,y+4,esign(flag_scale,-1),1,0,c_white,1);
}

if (global.debug) {
	var x1 = x;
	var y1 = y-24;
	var x2 = x1+lengthdir_x(12,spin_dir);
	var y2 = y1+lengthdir_y(12,spin_dir);
	
	draw_text(x,y-48,flag_scale);
	
	draw_line(x1,y1,x2,y2);
}