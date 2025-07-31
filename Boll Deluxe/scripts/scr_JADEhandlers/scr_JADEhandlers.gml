function draw_gui(_x, _y, w, h, color, alpha, outline=false){
	draw_sprite_stretched_ext(spr_JADEguibevel,outline,_x,_y,w,h,color,alpha)
}

function JADEsmallbuttons(_x, _y, _width, _height, spacing=8, is_toggle=true, inverted=false) constructor {
	x = _x;
    y = _y;
	width = _width;
	height = _height;
	button_spacing = spacing;
	buttons = [];
	drawstruct = [];
	funcs = [];
	button_toggle = is_toggle;
	selected_button=-1;
	color_invert = inverted;
	
	static add = function(name, func) {
		array_push(buttons, name)
		array_push(drawstruct,ScribblejrFitExt(name,fa_left,fa_center,global.rulerGold,1,width,height));
		array_push(funcs,func);
	}	
	
	static draw = function() {
		
		var curs_x = window_mouse_get_x()
		var curs_y = window_mouse_get_y()
		
		var i=0;
		repeat(array_length(buttons)) {
			var over = point_in_rectangle(curs_x,curs_y,x+(width+button_spacing)*i,y,x+width+(width+button_spacing)*i,y+height) && !instance_exists(oJADEGUIpar)
			
			if !color_invert
			var buttoncolor = oJADEController.themeaccent3
			else buttoncolor=oJADEController.themeaccent2
			
			if (selected_button == i) {
				if !color_invert
				buttoncolor = oJADEController.themeaccent2
				else
				buttoncolor = oJADEController.themeaccent3
			} else if (over) {
				buttoncolor = oJADEController.themeaccent4
			}
			
			draw_gui(x+(width+button_spacing)*i,y,width,height,buttoncolor, 1)
			drawstruct[i].Draw(x+2+(width+button_spacing)*i,y+height/2)
			i++;
		}
	}
	
	static update = function() {
		
		var curs_x = window_mouse_get_x()
		var curs_y = window_mouse_get_y()
		
		var i=0;
		repeat(array_length(buttons)) {
			var over = point_in_rectangle(curs_x,curs_y,x+(width+button_spacing)*i,y,x+width+(width+button_spacing)*i,y+height)
			
			var myfunc = funcs[i]
			if over {
				//if i havent already been selected
				if !(selected_button == i) || !(button_toggle) {
					selected_button=i
					myfunc();
				} else {
					//destroy my created gui, if i have one
					selected_button=-1
					instance_destroy(oJADEGUIpar)
				}
				break;
			}
			i++;
		}
	}
	
	static reset = function() {
		selected_button=[-1,-1]
	}
}

function JADEtoolbar(_x, _y) constructor {
	x = _x;
    y = _y;
	buttons = [];
	size=28;
	spacing=8;
	
	static set = function(arr) {
		buttons = arr;		
	}
	
	static draw = function() {
		
		var curs_x = window_mouse_get_x();
		var curs_y = window_mouse_get_y();
		
		var length=array_length(buttons);
		var i=0;
		repeat(length) {
			var over = point_in_rectangle(curs_x,curs_y,x+(size+spacing)*i,y,x+size+(size+spacing)*i,y+size) && !instance_exists(oJADEGUIpar)
			
			var buttoncolor = oJADEController.themeaccent3
			
			if (oJADEController.selected_tool==buttons[i])
				buttoncolor = oJADEController.themeaccent1
			else if (over) buttoncolor = oJADEController.themeaccent4
			
			draw_gui(x+(size+spacing)*i,y,size,size,buttoncolor, 1)
			draw_sprite(spr_JADEtoolicons,buttons[i],x+(size/2)+(size+spacing)*i,y+size/2)
			i++;
		}
	}
	
	static update = function() {
		if instance_exists(oJADEGUIpar) exit;
		
		var curs_x = window_mouse_get_x()
		var curs_y = window_mouse_get_y()
		
		var length=array_length(buttons);
		var i=0;
		repeat(length) {
			var over = point_in_rectangle(curs_x,curs_y,x+(size)*i,y,x+size+(size+spacing)*i,y+size)
		
			if over {
				oJADEController.selected_tool=buttons[i]
				break;
			}
			i++;
		}
	}
}

function JADEdropdown(_x,_y, names, func) {
	instance_destroy(oJADEGUIpar)
	draw_set_font(global.rulerGold)
	var inst=instance_create_depth(_x+3,_y+3,oJADEController.depth-1,oJADEDropDown)
	var i=0;
	var maxwidth=0;
	repeat(array_length(names)) {
		if maxwidth<string_width(names[i]) {
			maxwidth=string_width(names[i])
		}
		i++;
	}
	inst.image_xscale=max(96,maxwidth)
	inst.image_yscale=(16*array_length(names))
	inst.names=names
	inst.func=func
}

function JADElistcategory(_name) constructor {
	listname=_name;
	listcontents=[];
	collapsed = true;
	
	static collapse = function() {
		collapsed=!collapsed
	}
	
	static add = function(_item) {
		array_push(listcontents, _item)
	}
	
	static get_contents = function() {
		return listcontents;
	}
}

function JADElisthandler(_x, _y, _width, _height, _checkvar) constructor {
	x=_x;
	y=_y;
	width=_width;
	height=_height;
	listcontents=[];
	checkvar=_checkvar;
	listwidth = 0;
	listheight = 0;
	scroll_x = 0;
	scroll_y = 0;
	handle_x = 0;
	handle_y = 0;
	mouse_offset_x = 0;
	mouse_offset_y = 0;
	is_scrolling_x=0;
	is_scrolling_y=0;
	
	static add = function(_item) {
		array_push(listcontents, _item)
	}
	
	static get_contents = function() {
		return listcontents;
	}
	
	static draw = function() {
		draw_rect(x,y,width,height,oJADEController.themeaccent3,1)
		var prevarr=[];
		var currarr=[];
		var prevind=[];
		
		var curs_x = window_mouse_get_x()
		var curs_y = window_mouse_get_y()
		var mbleft = mouse_check_button_pressed(mb_left);
		
		array_copy(currarr,0,listcontents,0,array_length(listcontents));
		var indent=0;
		var i=0;
		checkervalue=variable_instance_get(oJADEController, checkvar)
		
		var prevscissor = gpu_get_scissor();
		gpu_set_scissor(x,y,width,height);
		
		listwidth = 0;
		listheight = 0;
		
		var over = point_in_rectangle(curs_x,curs_y,x,y,x+width,y+height);
		
		draw_set_font(global.rulerGold)
		while(array_length(currarr)) { //this code is a fucking mess Im sorry.
			var item = currarr[0]
			array_delete(currarr,0,1);
			if (is_instanceof(item, JADEobj)) {
				var over_button = point_in_rectangle(curs_x,curs_y,x+indent+scroll_x,y+(24*i)+scroll_y,x+width+indent+scroll_x,y+24+(24*i)+scroll_y) && over
				if (mbleft) && (over_button) {
					variable_instance_set(oJADEController, checkvar, item)
					mbleft=0
				}
			
				if (checkervalue!=-1) && (checkervalue.uuid == item.uuid) {
					draw_rect(x+indent+scroll_x,y+(24*i)+2+scroll_y,width,20,oJADEController.themeaccent2,1)
				}
				else if (over_button) draw_rect(x+indent+scroll_x,y+(24*i)+2+scroll_y,width,20,oJADEController.themeaccent4,1,true)
				
				draw_rect(x+2+indent+scroll_x,y+24+(24*i)-1+scroll_y,width-4,2,oJADEController.themeaccent2,1) //divider
				draw_text(x+24+indent+scroll_x,y+8+(24*i)+scroll_y, item.name)
				
				if (!array_length(currarr)) && array_length(prevarr) {
					var temp=array_pop(prevarr)
					array_copy(currarr,0,temp,0,array_length(temp))
					indent=array_pop(prevind);
					
				}
			} else if is_instanceof(item, JADElistcategory) {
				var over_button = point_in_rectangle(curs_x,curs_y,x+indent+scroll_x,y+(24*i)+scroll_y,x+width+indent+scroll_x,y+24+(24*i)+scroll_y) && over
				if (mbleft) && (over_button) {
					item.collapse();
					scroll_x=clamp(scroll_x,-listwidth,0)
					mbleft=0
				}
				
				draw_gui(x+4+indent+scroll_x,y+(24*i)+1+scroll_y,width-8,22,oJADEController.themeaccent4,1) //button
				draw_text(x+8+24+indent+scroll_x,y+8+(24*i)+scroll_y,item.listname) //category name
				draw_sprite(spr_JADElistarrow,item.collapsed,x+8+indent+scroll_x,y+4+(24*i)+scroll_y) //collapse arrow
				
				if !(item.collapsed) {
					if array_length(currarr) {
						array_push(prevarr,variable_clone(currarr))
						array_push(prevind,indent);
					}
					currarr=[];
					array_copy(currarr,0,item.listcontents,0,array_length(item.listcontents))
					indent+=16;
					listwidth+=16;
				}
			}
			i++;
			if i>(height/24) listheight+=24
		}
		gpu_set_scissor(prevscissor);
		
		//Scrollbars
		var total_height=height+listheight
		var total_width=width+listwidth
		
		var over_vert_scrollbar = point_in_rectangle(curs_x,curs_y,x+width,y,x+width+4+8,y+height);
		var bar_height = max(6,(height/total_height)*height)
		
		var over_horizontal_scrollbar = point_in_rectangle(curs_x,curs_y,x,y+height,x+width,y+height+4+8);
		var bar_width = max(6,(width/total_width)*width)
		
		draw_gui(x+width+4,y,6,height,oJADEController.themeaccent2,1) //vertical scrollbar bg
		draw_gui(x+width+4,y+handle_y,6,bar_height,oJADEController.themeaccent4,1) //vertical scrollbar handle
		
		draw_gui(x,y+height+4,width,6,oJADEController.themeaccent2,1) //horizontal scrollbar bg
		draw_gui(x+handle_x,y+height+4,bar_width,6,oJADEController.themeaccent4,1) //horizontal scrollbar handle
		
		var mwheel = mouse_wheel_down() - mouse_wheel_up();
		if (mwheel == 0) {
			mwheel = keyboard_check(vk_down) - keyboard_check(vk_up)
		}
		
		if (over) && (mwheel != 0) {
			if !keyboard_check(vk_control) {
				scroll_y+=12*-mwheel
				scroll_y=clamp(scroll_y,-listheight,0)
				
				if (listheight)
				handle_y = -((height - bar_height) * scroll_y / (listheight))
			} else {
				scroll_x+=8*mwheel
				scroll_x=clamp(scroll_x,-listwidth,0)
				
				if (listwidth)
				handle_x = -((width - bar_width) * scroll_x / (listwidth))
			}
		}
		
		if (mbleft) {
			if (over_vert_scrollbar)  {
				if !is_scrolling_y {
					mouse_offset_y = (curs_y - (y + handle_y))	
				}
				is_scrolling_y=true
			} else if (over_horizontal_scrollbar) {
				if !is_scrolling_x {
					mouse_offset_x = (curs_x - (x + handle_x))	
				}
				is_scrolling_x=true
			}
		}
		
		if (mouse_check_button_released(mb_left)) {
			is_scrolling_x=0
			is_scrolling_y=0
		}
		
		if (is_scrolling_y) {
			handle_y = curs_y - y - mouse_offset_y;
			handle_y = clamp( handle_y, 0, height - bar_height);
			
			scroll_y = -((listheight) * handle_y / (height - bar_height));
		} else if (is_scrolling_x) {
			handle_x = curs_x - x - mouse_offset_x;
			handle_x = clamp(handle_x, 0, width - bar_width);
			
			scroll_x = -((listwidth) * handle_x / (width - bar_width));
		}
	}
}

function JADEobj(_uuid, _sprite,_xoff,_yoff,_width,_height,_can_xscale,_can_yscale,_name,_nodeable,_sizex,_sizey) constructor {
	uuid = _uuid;
	sprite = _sprite;
	xoff = _xoff;
	yoff = _yoff;
	width = _width;
	height = _height;
	can_xscale = _can_xscale;
	can_yscale = _can_yscale;
	name = _name;
	nodeable = _nodeable;
	sizex = _sizex;
	sizey = _sizey;
}


function JADEpropertylisthandler(_x, _y, _width, _height) constructor {
	x=_x;
	y=_y;
	width=_width;
	height=_height;
	listwidth = 0;
	listheight = 0;
	scroll_x = 0;
	scroll_y = 0;
	handle_x = 0;
	handle_y = 0;
	mouse_offset_x = 0;
	mouse_offset_y = 0;
	is_scrolling_x=0;
	is_scrolling_y=0;
	typing_box=0;
	
	static draw = function(objarr) {
		draw_rect(x,y,width,height,oJADEController.themeaccent3,1)
		var curs_x = window_mouse_get_x()
		var curs_y = window_mouse_get_y()
		var mbleft = mouse_check_button_pressed(mb_left);
		var over = point_in_rectangle(curs_x,curs_y,x,y,x+width,y+height);
		listwidth = 0;
		listheight = 0;
		
		if array_length(objarr) {
			var obj = oJADEController.object_layer_map[oJADEController.selected_region][| objarr[0]]
			var arr = oJADEController.properties.property_data[$ obj[0]]
			var arrvar = oJADEController.properties.property_values[$ obj[0]]
			var data = oJADEController.obj_data[$ obj[0]]
			
			var prevscissor = gpu_get_scissor();
			gpu_set_scissor(x,y,width,height);
			
			draw_set_font(global.rulerGold)
			
			draw_rect(x+15,y+15,66,66,c_white,1,true)
			draw_text(x+16,y+96,data.name)
			
			obj[1]=JADEnumberinput(x+96, y+16, "X", obj[1], 100)
			
			obj[2]=JADEnumberinput(x+96, y+56, "Y", obj[2], 101)
			
			draw_rect(x+8,y+128,width-16,2,oJADEController.themeaccent2,1)
			
			var i=0;
			repeat(array_length(arr)) { 
				var item = arr[i]
				
				switch (item[$ "type"]) {
					case "checkbox": {
						arrvar[i][1]=JADEcheckbox(x+16,y+144+32*i, item[$ "name"], arrvar[i][1])
					} break;
					case "number_input": {
						if !item[$ "absolute"]
						arrvar[i][1]=JADEnumberinput(x+16,y+144+32*i, item[$ "name"], arrvar[i][1],102+i)
						else arrvar[i][1]=JADEnumberinput(x+16,y+144+32*i, item[$ "name"], arrvar[i][1],102+i,0)
					} break;
					case "number_range_input": {
						arrvar[i][1]=JADEnumberinput(x+16,y+144+32*i, item[$ "name"], arrvar[i][1],102+i,item[$ "minimum"],item[$ "maximum"])
					} break;
					case "string_input": {
						arrvar[i][1]=JADEstringinput(x+16,y+144+32*i, item[$ "name"], arrvar[i][1],102+i)
					} break;
					case "dropdown": {
						JADEdropdownproperty(x+16,y+144+32*i, item[$ "name"], arrvar[i][1], i, objarr[0], item[$ "dropdowndata"], item[$ "dropdownnames"])
					} break;
				}
				
				i++;
				if i>(height/32) listheight+=32
			}
			gpu_set_scissor(prevscissor);
		}
		
		//Scrollbars
		#region Scrolling
		var total_height=height+listheight
		var total_width=width+listwidth
		
		var over_vert_scrollbar = point_in_rectangle(curs_x,curs_y,x+width,y,x+width+4+8,y+height);
		var bar_height = max(6,(height/total_height)*height)
		
		var over_horizontal_scrollbar = point_in_rectangle(curs_x,curs_y,x,y+height,x+width,y+height+4+8);
		var bar_width = max(6,(width/total_width)*width)
		
		draw_gui(x+width+4,y,6,height,oJADEController.themeaccent2,1) //vertical scrollbar bg
		draw_gui(x+width+4,y+handle_y,6,bar_height,oJADEController.themeaccent4,1) //vertical scrollbar handle
		
		draw_gui(x,y+height+4,width,6,oJADEController.themeaccent2,1) //horizontal scrollbar bg
		draw_gui(x+handle_x,y+height+4,bar_width,6,oJADEController.themeaccent4,1) //horizontal scrollbar handle
		
		var mwheel = mouse_wheel_down() - mouse_wheel_up();
		if (mwheel == 0) {
			mwheel = keyboard_check(vk_down) - keyboard_check(vk_up)
		}
		
		if (over) && (mwheel != 0) {
			if !keyboard_check(vk_control) {
				scroll_y+=12*-mwheel
				scroll_y=clamp(scroll_y,-listheight,0)
				
				if (listheight)
				handle_y = -((height - bar_height) * scroll_y / (listheight))
			} else {
				scroll_x+=8*mwheel
				scroll_x=clamp(scroll_x,-listwidth,0)
				
				if (listwidth)
				handle_x = -((width - bar_width) * scroll_x / (listwidth))
			}
		}
		
		if (mbleft) {
			if (over_vert_scrollbar)  {
				if !is_scrolling_y {
					mouse_offset_y = (curs_y - (y + handle_y))	
				}
				is_scrolling_y=true
			} else if (over_horizontal_scrollbar) {
				if !is_scrolling_x {
					mouse_offset_x = (curs_x - (x + handle_x))	
				}
				is_scrolling_x=true
			}
		}
		
		if (mouse_check_button_released(mb_left)) {
			is_scrolling_x=0
			is_scrolling_y=0
		}
		
		if (is_scrolling_y) {
			handle_y = curs_y - y - mouse_offset_y;
			handle_y = clamp( handle_y, 0, height - bar_height);
			
			scroll_y = -((listheight) * handle_y / (height - bar_height));
		} else if (is_scrolling_x) {
			handle_x = curs_x - x - mouse_offset_x;
			handle_x = clamp(handle_x, 0, width - bar_width);
			
			scroll_x = -((listwidth) * handle_x / (width - bar_width));
		}
		#endregion
	}
	
	static updatefromdropdown = function(ind, propind, objind) {
		var obj = oJADEController.object_layer_map[oJADEController.selected_region][| objind]
		var arr = oJADEController.properties.property_data[$ obj[0]]
		var arrvar = oJADEController.properties.property_values[$ obj[0]]
		var item = arr[propind]
		
		arrvar[oJADEController.property_dropdown_index][1]=item[$ "dropdowndata"][ind]
	}
}

function JADEproperties() constructor {
	property_data = {};
	property_values = {};
	static initProperties = function(obj) {
		var objn = object_get_name(obj)
		property_data[$ objn]=[]
		property_values[$ objn]=[];
	}
	
	static addCheckbox = function(obj, name, variable_name, default_val) {
		var objn = object_get_name(obj)
		var struct = {};
		struct[$ "type"]="checkbox"
		struct[$ "name"]=name
		array_push(property_data[$ objn], struct)
		array_push(property_values[$ objn], [variable_name, default_val])
	}
	
	static addStringInput = function(obj, name, variable_name, default_val) {
		var objn = object_get_name(obj)
		var struct = {};
		struct[$ "type"]="string_input"
		struct[$ "name"]=name
		array_push(property_data[$ objn], struct)
		array_push(property_values[$ objn], [variable_name, default_val])
	}
	
	static addNumberInput = function(obj, name, variable_name, default_val, is_absolute=false) {
		var objn = object_get_name(obj)
		var struct = {};
		struct[$ "type"]="number_input"
		struct[$ "name"]=name
		struct[$ "absolute"]=is_absolute
		array_push(property_data[$ objn], struct)
		array_push(property_values[$ objn], [variable_name, default_val])
	}
	
	static addNumberRangeInput = function(obj, name, variable_name, default_val, _min, _max) {
		var objn = object_get_name(obj)
		var struct = {};
		struct[$ "type"]="number_range_input"
		struct[$ "name"]=name
		struct[$ "minimum"]=_min
		struct[$ "maximum"]=_max
		array_push(property_data[$ objn], struct)
		array_push(property_values[$ objn], [variable_name, default_val])
	}
	
	static addDropdown = function(obj, name, variable_name, default_val, options_name, options_data) {
		var objn = object_get_name(obj)
		var struct = {};
		struct[$ "type"]="dropdown"
		struct[$ "name"]=name
		struct[$ "dropdownnames"]=options_name
		struct[$ "dropdowndata"]=options_data
		array_push(property_data[$ objn], struct)
		array_push(property_values[$ objn], [variable_name, default_val])
	}
	
	static getDefaultValues = function(obj) {
		return property_values[$ obj]
	}
}

function JADEnumberinput(_x, _y, _name, _var, _type_index, _min=NaN, _max=NaN) {
	
	var curs_x = window_mouse_get_x()
	var curs_y = window_mouse_get_y()
	
	var mbleft = mouse_check_button_pressed(mb_left) && !oJADEController.pressed_dropdown;
	var pressed_button = false;
	
	draw_set_font(global.rulerGold)
	draw_text(_x,_y+6, $"{_name}:")
	var spacing = string_width($"{_name}:")+8
	
	draw_sprite_stretched(spr_JADEinputbox, 0,_x+spacing,_y,48,24)
	draw_sprite(spr_JADEinputscroll, 0, _x+48+spacing,_y)
	
	if oJADEController.is_typing != _type_index
		ScribblejrFitExt(_var,fa_left,fa_top,global.rulerGold,1,44,20).Draw(_x+2+spacing,_y+2)
	else
		ScribblejrFitExt(keyboard_string,fa_left,fa_top,global.rulerGold,1,44,20).Draw(_x+2+spacing,_y+2)
	
	var overtop = point_in_rectangle(curs_x,curs_y,_x+48+spacing,_y,_x+48+12+spacing,_y+12);
	var overbot = point_in_rectangle(curs_x,curs_y,_x+48+spacing,_y+12,_x+48+12+spacing,_y+24);
	var overinp = point_in_rectangle(curs_x,curs_y,_x+spacing,_y,_x+48+spacing,_y+24);
	
	//up
	if (mbleft) && (overtop) {
		pressed_button=true;
		if _max==NaN
		return _var+1
		else return min(_var+1,_max)
	}
			
	//down
	if (mbleft) && (overbot) {
		pressed_button=true;
		if _min==NaN
		return _var-1
		else return max(_var-1,_min)
	}
	
	//start typing
	if (mbleft) && (overinp) {
		oJADEController.is_typing = _type_index;
		keyboard_string="";
		pressed_button=true;
	}
	
	if mouse_wheel_up() && (overtop || overbot || overinp) {
		if _max==NaN
		return _var+1
		else return min(_var+1,_max)
	}
	
	if mouse_wheel_down() && (overtop || overbot || overinp) {
		if _min==NaN
		return _var-1
		else return max(_var-1,_min)
	}
	
	//unselect when clicking off
	if (mbleft) && (oJADEController.is_typing == _type_index) && !(pressed_button) {
		keyboard_string="";
		oJADEController.is_typing = -1;
	}
	
	if (keyboard_check_pressed(vk_enter)) && (oJADEController.is_typing == _type_index) {
		oJADEController.is_typing = -1;
		return unreal(string_digits(keyboard_string),_var)
	}
	
	return _var
}

function JADEstringinput(_x, _y, _name, _var, _type_index) {
	
	var curs_x = window_mouse_get_x()
	var curs_y = window_mouse_get_y()
	
	var mbleft = mouse_check_button_pressed(mb_left) && !oJADEController.pressed_dropdown;
	var pressed_button = false;
	
	draw_set_font(global.rulerGold)
	draw_text(_x,_y+6, $"{_name}:")
	var spacing = string_width($"{_name}:")+8
	
	draw_sprite_stretched(spr_JADEinputbox, 0,_x+spacing,_y,64,24)
	
	if oJADEController.is_typing != _type_index
		ScribblejrFitExt(_var,fa_left,fa_top,global.rulerGold,1,60,20).Draw(_x+2+spacing,_y+2)
	else
		ScribblejrFitExt(keyboard_string,fa_left,fa_top,global.rulerGold,1,60,20).Draw(_x+2+spacing,_y+4)
	
	var overinp = point_in_rectangle(curs_x,curs_y,_x+spacing,_y,_x+64+spacing,_y+24);

	//start typing
	if (mbleft) && (overinp) {
		oJADEController.is_typing = _type_index;
		keyboard_string="";
		pressed_button=true;
	}

	//unselect when clicking off
	if (mbleft) && (oJADEController.is_typing == _type_index) && !(pressed_button) {
		keyboard_string="";
		oJADEController.is_typing = -1;
	}
	
	if (keyboard_check_pressed(vk_enter)) && (oJADEController.is_typing == _type_index) {
		oJADEController.is_typing = -1;
		return keyboard_string
	}
	
	return _var
}

function JADEcheckbox(_x, _y, _name, _var) {
	
	var curs_x = window_mouse_get_x()
	var curs_y = window_mouse_get_y()
	
	var mbleft = mouse_check_button_pressed(mb_left) && !oJADEController.pressed_dropdown;
	
	draw_set_font(global.rulerGold)
	draw_text(_x,_y+6, $"{_name}:")
	var spacing = string_width($"{_name}:")+8
	
	draw_sprite(spr_JADEcheckbox, bool( _var),_x+spacing,_y)
	
	var overinp = point_in_rectangle(curs_x,curs_y,_x+spacing,_y,_x+24+spacing,_y+24);
	
	//start typing
	if (mbleft) && (overinp) {
		return !bool(_var)
	}
	
	return _var
}

function JADEdropdownproperty(_x, _y, _name, _var, _index, obj_ind, _options, _names) {
	
	var curs_x = window_mouse_get_x()
	var curs_y = window_mouse_get_y()
	
	var mbleft = mouse_check_button_pressed(mb_left) && !oJADEController.pressed_dropdown;
	
	draw_set_font(global.rulerGold)
	draw_text(_x,_y+6, $"{_name}:")
	var spacing = string_width($"{_name}:")+8
	
	draw_sprite_stretched(spr_JADEdropdownbox, 0,_x+spacing,_y,128,24)
	ScribblejrFitExt(_names[array_get_index(_options,_var)],fa_left,fa_top,global.rulerGold,1,124,20).Draw(_x+2+spacing,_y+4)
	
	var overinp = point_in_rectangle(curs_x,curs_y,_x+spacing,_y,_x+128+spacing,_y+24);
	
	//start typing
	if (mbleft) && (overinp) {
		if oJADEController.property_dropdown_index!=_index {
			oJADEController.property_dropdown_index = _index
			oJADEController.property_object_index = obj_ind
			JADEdropdown(_x+spacing,_y+24,_names, function(name,ind) {
				oJADEController.propertylist.updatefromdropdown(ind, oJADEController.property_dropdown_index, oJADEController.property_object_index);
				oJADEController.property_dropdown_index=-1;
				oJADEController.property_object_index = -1;
			})
		} else instance_destroy(oJADEController,false)
	}
	
}