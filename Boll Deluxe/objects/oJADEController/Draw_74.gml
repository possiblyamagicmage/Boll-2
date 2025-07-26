if selected_tool == FILL_TOOL && tile_fill && !fill_circle {
	var box_w = (floor((mouse_x - (tile_fill_last_x * 16)) / 16)) * (16/zoom_level)
	var box_h = (floor((mouse_y - (tile_fill_last_y * 16)) / 16)) * (16/zoom_level)
	draw_sprite_stretched(spr_JADEselection, floor(selection_box_fr), floor((floor(tile_fill_last_x * 16-cam_x)/zoom_level)+min(box_w, 0)), floor((floor(tile_fill_last_y * 16-cam_y)/zoom_level)+min(box_h, 0)), floor(abs(box_w)), floor(abs(box_h)))
}
