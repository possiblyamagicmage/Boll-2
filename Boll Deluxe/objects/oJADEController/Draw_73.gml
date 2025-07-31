#region Scaler drawing
if array_length(selected_array)==1 {
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

#region Cursor Drawing
//Draw object
if (not_on_gui) {
	if (selected_tool == BRUSH_TOOL || selected_tool == FILL_TOOL) {
		var obj = selected_obj
		var drawx = gridx*current_grid_size
		var drawy = gridy*current_grid_size
		if (is_struct(obj)) {
			draw_sprite_ext(obj.sprite,0,drawx+obj.xoff,drawy+obj.yoff,(1*obj.sizex),(1*obj.sizey),0,c_white,0.5);
		}
	}
}
#endregion