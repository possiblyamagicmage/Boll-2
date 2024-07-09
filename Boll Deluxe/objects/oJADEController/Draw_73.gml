///@description Object Overlays 
if !surface_exists(editor_surface)
exit

surface_set_target(editor_surface);
camera_apply(view_camera[0])
for (var i = 0; i < ds_list_size(object_layer_map); ++i) {
	var obj = ds_list_find_value(object_layer_map, i)
	if (obj[5]) && selected_tool == SELECT_TOOL {
		
		draw_rect((obj[1]*16), (obj[2]*16), round(obj[6]/16)*16, round(obj[7]/16)*16, c_white, 0.5)
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

surface_reset_target();