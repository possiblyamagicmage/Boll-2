cam_x = camera_get_view_x(view_camera[0])
cam_y = camera_get_view_y(view_camera[0])
cam_w = camera_get_view_width(view_camera[0])
cam_h = camera_get_view_height(view_camera[0])
guiw = display_get_gui_width();
guih = display_get_gui_height();

if !os_is_paused() && guiw>0 && guih>0 {
	if !surface_exists(GUIcanvas) {
		GUIcanvas=surface_create(guiw,guih);
	} else {
		if (guiw!=surface_get_width(GUIcanvas) || guih!=surface_get_height(GUIcanvas)) {
			surface_resize(GUIcanvas,guiw,guih);
		}
	}
}

mbleftpress=mouse_check_button_pressed(mb_left)
mbleftrel=mouse_check_button_released(mb_left)
mbleft=mouse_check_button(mb_left)
mbrightpress=mouse_check_button_pressed(mb_right)
mbrightrel=mouse_check_button_released(mb_right)
mbright=mouse_check_button(mb_right)
mbmiddle = (mouse_check_button(mb_middle) || (keyboard_check(vk_space) && mouse_check_button(mb_left))) //this scroll wheel is Pissing me off... i'm the original        keywalker

#region GUI Input Handler
if (mbleftpress) {
	topbuttons.update();
	toolbarbuttons.update();
}
#endregion

curs_x=window_mouse_get_x()
curs_y=window_mouse_get_y()

#region Camera Panning
if (not_on_gui) && (mbmiddle) {
	if !(view_grab) { //check position
		view_grab=1 
		view_grabx=curs_x
		view_graby=curs_y
		initial_viewx = cam_x
		initial_viewy = cam_y
	}
} else {
	view_grab=0
}

if (view_grab) { //update camera position
    camera_set_view_pos(view_camera[0],floor(initial_viewx+(view_grabx-curs_x)*zoom_level),floor(initial_viewy+(view_graby-curs_y)*zoom_level))
}
#endregion

var mwheel = mouse_wheel_down() - mouse_wheel_up();
if (mwheel == 0) {
	mwheel = keyboard_check_direct(vk_down) - keyboard_check_direct(vk_up)
}

//var dir = (keyboard_check_pressed(vk_right) || mouse_check_button_pressed(mb_side1)) - (mouse_check_button_pressed(mb_side2) || keyboard_check_pressed(vk_left)) 

//object_list_scroll_pos[selected_mode][current_cat]+=24*mwheel

//object_list_scroll_pos[selected_mode][current_cat] = clamp(object_list_scroll_pos[selected_mode][current_cat], 0, (ds_list_size(jade_cats[selected_mode][current_cat])*32)-object_list_area_height)

#region Camera Zooming
if (mwheel != 0) && keyboard_check(vk_control) && (not_on_gui) {
	zoom_goto += 0.125*mwheel
	zoom_x = curs_x
    zoom_y = curs_y;
}
zoom_goto=clamp(zoom_goto,0.125, 5)
var oldzoom=zoom_level
zoom_level=approach_val(zoom_level,zoom_goto,0.025)
camera_set_view_size(camera, floor(1440*zoom_level), floor(810*zoom_level))

if (zoom_level!=oldzoom) {
	cam_x = camera_get_view_x(view_camera[0])
	cam_y = camera_get_view_y(view_camera[0])
	cam_w = camera_get_view_width(view_camera[0])
	cam_h = camera_get_view_height(view_camera[0])
	
	var old_cam_w = floor(1440*oldzoom)
	var old_cam_h = floor(810*oldzoom)
	cam_x += floor(old_cam_w/2 - cam_w/2) //+ ((zoom_x-guiw/2)/(zoom_level/(zoom_goto-zoom_level)))*mwheel
	cam_y += floor(old_cam_h/2 - cam_h/2) //+ ((zoom_y-guih/2)/(zoom_level/(zoom_goto-zoom_level)))*mwheel
	
	camera_set_view_pos(camera,cam_x,cam_y)
}
#endregion

gridx = floor(mouse_x/16) 
gridy = floor(mouse_y/16)

droppedfiles=file_dropper_get_files(".jade")

if array_length(droppedfiles) {
	global.save_dir=droppedfiles[0]
	JADE_load(droppedfiles[0])
}

if (mbleft && not_on_gui) {
	switch(selected_tool) {
		case BRUSH_TOOL:
			switch(selected_mode) {
				case OBJECT_MODE:
					if is_struct(selected_obj) && !check_colliding_object(gridx*16,gridy*16) {
						var obj = [selected_obj.uuid, gridx*16, gridy*16, 1, 1]
						var data = obj_data[$ obj[0]]
						//add other data stuff here later
						ds_list_add(object_layer_map[selected_region], obj)
					}
				break;
			}
		break;
		case ERASE_TOOL:
			switch(selected_mode) {
				case OBJECT_MODE:
					var obj = check_colliding_object(gridx*16,gridy*16)
					if (obj) {
						ds_list_delete(object_layer_map[selected_region], obj-1)
					}
				break;
			}
		break;
		case SELECT_TOOL:
			if (mbleftpress) {
				var draggingobject=false;
				//select single object
				var col = check_colliding_object(gridx*16,gridy*16)
				if (col) {
					if array_get_index(selected_array,col-1)==-1 {
						array_push(selected_array,col-1)
						break;
					} else if !keyboard_check(vk_shift) {
						draggingobject=true;
						selection_grab = true;
						selection_grab_x = gridx*16;
						selection_grab_y = gridy*16;
						break;
					}
				}
				
				//unselect all objects unless shift is held
				if !keyboard_check(vk_shift) && !draggingobject {
					selected_array=[];
				}
				selection_box=true
				selection_box_x=mouse_x;
				selection_box_y=mouse_y;
			}
			
			if (selection_grab) {
				var x_diff = (selection_grab_x-(gridx*16));
				var y_diff = (selection_grab_y-(gridy*16));
				if (x_diff!=0) || (y_diff!=0) {
					var i=0;
					repeat(array_length(selected_array)) {
						var obj = object_layer_map[selected_region][| selected_array[i]]
						obj[1]-=x_diff;
						obj[2]-=y_diff
						i++;
					}
					selection_grab_x = gridx*16;
					selection_grab_y = gridy*16;
				}
			}
		break;
	}
}

if (mbleftrel) {
	if (selection_box) {
		var box_w = (mouse_x - selection_box_x)
		var box_h = (mouse_y - selection_box_y)
		var box_x1 = floor(selection_box_x+min(box_w, 0))
		var box_y1 = floor(selection_box_y+min(box_h, 0))
		var box_x2 = floor(selection_box_x+min(box_w, 0)+abs(box_w))
		var box_y2 = floor(selection_box_y+min(box_h, 0)+abs(box_h))
		var i=0;
		repeat(ds_list_size(object_layer_map[selected_region])) {
			var obj=object_layer_map[selected_region][| i]
			if rectangle_in_rectangle(box_x1,box_y1,box_x2,box_y2,obj[1],obj[2],obj[1]+15,obj[2]+15) {
				if array_get_index(selected_array,i)==-1 {
					array_push(selected_array,i)
				}
			}
			i++;
		}
	}
	selection_box = false;
	selection_grab = false;
}