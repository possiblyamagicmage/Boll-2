for (var i = 0; i < ds_list_size(object_layer_map); ++i) {
	var obj = ds_list_find_value(object_layer_map, i)
	if (obj[5]) && selected_tool == SELECT_TOOL {
		draw_sprite(spr_JADE4scaler, 3, (obj[1]*16) + round(obj[6]/16)*16, (obj[2]*16) + round(obj[7]/16)*16)
	}
}

selection_box_fr+=0.2
//Selection Tool mass-select box
if selected_tool == SELECT_TOOL && selection_box {
	var box_w = mouse_x - selection_box_x
	var box_h = mouse_y - selection_box_y
	draw_sprite_stretched(spr_JADEselection, floor(selection_box_fr), floor(selection_box_x + min(box_w, 0)), floor(selection_box_y + min(box_h, 0)), floor(abs(box_w)), floor(abs(box_h)))
}

if selected_tool == FILL_TOOL && tile_fill && !fill_circle {
	var box_w = (floor((mouse_x - (tile_fill_last_x * 16)) / 16)) * 16
	var box_h = (floor((mouse_y - (tile_fill_last_y * 16)) / 16)) * 16
	draw_sprite_stretched(spr_JADEselection, floor(selection_box_fr), floor((tile_fill_last_x * 16) + min(box_w, 0)), floor((tile_fill_last_y * 16) + min(box_h, 0)), floor(abs(box_w)), floor(abs(box_h)))
}

if selected_tool == FILL_TOOL && tile_fill && fill_circle {
	draw_ellipse(tile_fill_last_x * 16,tile_fill_last_y * 16,gridx * 16, gridy * 16, true)
}