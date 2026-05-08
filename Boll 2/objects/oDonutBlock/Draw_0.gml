if (onTimer) {
	if global.roomTimer mod 5 >= 2.5 xoff=-xoff
	if (fall) xoff=0;
	draw_sprite_ext(sprite_index,image_index,x+xoff,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
} else draw_self();