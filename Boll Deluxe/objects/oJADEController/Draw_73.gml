#region Scaler drawing
if array_length(selected_array)==1 && (selected_mode != DECO_MODE || (selected_mode == DECO_MODE && deco_mode_type!="tile")) {
	var obj=object_layer_map[selected_region][| selected_array[0]]
	var data=obj_data[$ obj[0]]
	if (resizing != 1)
	draw_sprite(spr_JADE4scaler,0,obj[1],obj[2])
	else draw_sprite_ext(spr_JADE4scaler,0,obj[1],obj[2],1.5,1.5,0,c_white,1)
	if (resizing != 2)
	draw_sprite(spr_JADE4scaler,1,obj[1]+(data.width*obj[3]),obj[2])
	else draw_sprite_ext(spr_JADE4scaler,1,obj[1]+(data.width*obj[3]),obj[2],1.5,1.5,0,c_white,1)
	if (resizing != 3)
	draw_sprite(spr_JADE4scaler,2,obj[1],obj[2]+(data.height*obj[4]))
	else draw_sprite_ext(spr_JADE4scaler,2,obj[1],obj[2]+(data.height*obj[4]),1.5,1.5,0,c_white,1)
	if (resizing != 4)
	draw_sprite(spr_JADE4scaler,3,obj[1]+(data.width*obj[3]),obj[2]+(data.height*obj[4]))
	else draw_sprite_ext(spr_JADE4scaler,3,obj[1]+(data.width*obj[3]),obj[2]+(data.height*obj[4]),1.5,1.5,0,c_white,1)
}
#endregion

if (selected_mode == DECO_MODE && deco_mode_type=="tile") && array_length(selected_array) {
	if !(selection_grab) {
		var i=0
		repeat(array_length(selected_array)) {
			var tile = ds_list_find_value(tilemap,selected_array[i])
			draw_rect(tile[1]*16,tile[2]*16,16,16,$ff5a2a,0.5)
			i++;
		}
	} else {
		var i=0
		repeat(array_length(selected_array)) {
			var tile = ds_list_find_value(tilemap,selected_array[i])
			var x_diff = (tile[1]*16 - selection_grab_x)
			var y_diff = (tile[2]*16 - selection_grab_y)
			draw_tile(selected_layer.tileset_info[1],tile[0],0,floor((mouse_x+x_diff)/16)*16,floor((mouse_y+y_diff)/16)*16)
			draw_rect(floor((mouse_x+x_diff)/16)*16,floor((mouse_y+y_diff)/16)*16,16,16,$ff5a2a,0.5)
			i++;
		}
	}
}

#region Cursor Drawing
//Draw object
if (not_on_gui) {
	switch(selected_mode) {
		case OBJECT_MODE:
		if (selected_tool == BRUSH_TOOL || selected_tool == FILL_TOOL) {
			var obj = selected_obj
			var drawx = gridx*current_grid_size
			var drawy = gridy*current_grid_size
			if (is_struct(obj)) {
				draw_sprite_ext(obj.sprite,0,drawx+obj.xoff,drawy+obj.yoff,(1*obj.sizex),(1*obj.sizey),0,c_white,0.5);
			}
		}
		break;
		case DECO_MODE:
		if (selected_tool == BRUSH_TOOL || selected_tool == FILL_TOOL) {
			if deco_mode_type == "tile" {
				var t_width = sprite_get_width(tilesets[$ current_tileset][0])
				var t_height = sprite_get_height(tilesets[$ current_tileset][0])
				var i=0;
				repeat(tile_sel_width+1) {
					var j=0;
					repeat(tile_sel_height+1) {
						var _data = current_tile_id[i][j]
						if _data != 0 {
							var t_x = ((_data mod (t_width / 16)) * 16)
							var t_y = (floor(_data / (t_width/16)) * 16)
							draw_sprite_part_ext(tilesets[$ current_tileset][0], 0, t_x, t_y, 16, 16, (gridx+i)*16,(gridy+j)*16, 1, 1, c_white, 0.25)	
						}
						j++;
					}
					i++;
				}
			}
		}
		break;
	}
}
#endregion