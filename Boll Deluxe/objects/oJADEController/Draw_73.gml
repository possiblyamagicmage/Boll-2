for (var i = 0; i < ds_list_size(object_layer_map); ++i) {
	var obj = ds_list_find_value(object_layer_map, i)
	if (obj[5]) && selected_tool == SELECT_TOOL && selected_mode == OBJECT_MODE {
		draw_sprite(spr_JADE4scaler, 3, (obj[1]*16) + round(obj[6]/16)*16, (obj[2]*16) + round(obj[7]/16)*16)
	}
	
	var sprite = ds_map_find_value(obj_data,obj[0])
	var xoff = -sprite[1];
	var yoff = -sprite[2];
	if (sprite[9]) && (drawing_node==i) && (array_length(obj[11]) > 0) {
		for (var j = 0; j < array_length(obj[11]); ++j) {
			var arr=obj[11][j]
			if j>0 {
				var x2=obj[11][j-1][0]
				var y2=obj[11][j-1][1]
			} else {
				var x2=obj[11][0][0]
				var y2=obj[11][0][1]
			}
			draw_line_color(x2,y2,arr[0],arr[1],c_red,c_orange)
		}
		draw_line_color(draw_node_x,draw_node_y,(gridx*16)+xoff,(gridy*16)+yoff,c_red,c_orange)
	}
}

for (var i = 0; i < ds_list_size(node_layer_map); ++i) {
	var obj = ds_list_find_value(node_layer_map, i)
	if (obj[5]) && selected_tool == SELECT_TOOL && selected_mode == NODE_MODE {
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
	var start_x = tile_fill_last_x 
	var start_y = tile_fill_last_y 
	var size_x = (gridx - tile_fill_last_x)
	var size_y = (gridy - tile_fill_last_y) 
		
	if size_x < 0 {
		start_x = gridx
		size_x = abs(size_x)
	}
	if size_y < 0 {
		start_y = gridy
		size_y = abs(size_y)
	}
	draw_ellipse(tile_fill_last_x * 16,tile_fill_last_y * 16,gridx * 16, gridy * 16, true)
}