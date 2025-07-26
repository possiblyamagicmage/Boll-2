#region Scaler drawing
if array_length(selected_array) {
	
}
#endregion

#region Cursor Drawing
//Draw object
if (not_on_gui) {
	if (selected_tool == BRUSH_TOOL || selected_tool == FILL_TOOL) {
		var obj = selected_obj
		var drawx = gridx*16
		var drawy = gridy*16
		if (is_struct(obj)) {
			draw_sprite_ext(obj.sprite,0,drawx+obj.xoff,drawy+obj.yoff,(1*obj.sizex),(1*obj.sizey),0,c_white,0.5);
		}
	}
	if (selected_tool == SELECT_TOOL) {

		//Selection Tool mass-select box
		if (selected_tool == SELECT_TOOL && selection_box) {
				selection_box_fr+=0.2
			var box_w = (mouse_x - selection_box_x)
			var box_h = (mouse_y - selection_box_y)
			draw_sprite_stretched(spr_JADEselection, floor(selection_box_fr), floor(floor(selection_box_x)+min(box_w, 0)), floor(floor(selection_box_y)+min(box_h, 0)), floor(abs(box_w)), floor(abs(box_h)))
		}
	}
}
#endregion