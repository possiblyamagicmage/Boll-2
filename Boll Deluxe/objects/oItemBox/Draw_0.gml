// Inherit the parent event
event_inherited();

if (sprite_index == image_normal) && !bricked {
	var scissor = gpu_get_scissor()

	gpu_set_scissor(x-(sprite_width/2)+1-global.camera_x,y-(sprite_height/2)+1-global.camera_y,sprite_width-2,sprite_height-2)

	var overlay_x = (global.roomTimer/3.5) mod sprite_width

	draw_sprite(spr_itemboxoverlay,floor(global.roomTimer/6),x-overlay_x+sprite_width,y+dy)

	draw_sprite(spr_itemboxoverlay,floor(global.roomTimer/6),x-overlay_x,y+dy)

	gpu_set_scissor(scissor);
}