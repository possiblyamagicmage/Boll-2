function draw_gui(_x, _y, w, h, color, alpha, outline=false){
	draw_sprite_stretched_ext(spr_JADEguibevel,outline,_x,_y,w,h,color,alpha)
}

function JADEsmallbuttons(_x, _y, _width, _height, spacing=8) constructor {
	x = _x;
    y = _y;
	width = _width;
	height = _height;
	button_spacing = spacing;
	buttons = [];
	drawstruct = [];
	funcs = [];
	
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
			
			var buttoncolor = oJADEController.themeaccent3
			
			if (oJADEController.selected_button[0]==self && oJADEController.selected_button[1] == i)
			buttoncolor = oJADEController.themeaccent2
			else if (over) buttoncolor = oJADEController.themeaccent4
			
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
				if !(oJADEController.selected_button[0]==self && oJADEController.selected_button[1] == i) {
					oJADEController.selected_button=[self,i]
					myfunc();
				} else {
					//destroy my created gui, if i have one
					oJADEController.selected_button=[-1,-1]
					instance_destroy(oJADEGUIpar)
				}
				break;
			}
			i++;
		}
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
		
		draw_set_font(global.rulerGold)
		while(array_length(currarr)) { //this code is a fucking mess Im sorry.
			var item = currarr[0]
			array_delete(currarr,0,1);
			if (is_instanceof(item, JADEobj)) {
				var over = point_in_rectangle(curs_x,curs_y,x+indent,y+(24*i),x+width+indent,y+24+(24*i))
				if (mbleft) && (over) {
					variable_instance_set(oJADEController, checkvar, item)
					mbleft=0
				}
			
				if (checkervalue!=-1) && (checkervalue.uuid == item.uuid) {
					draw_rect(x+indent,y+(24*i)+2,width,20,oJADEController.themeaccent2,1)
				}
				else if (over) draw_rect(x+indent,y+(24*i)+2,width,20,oJADEController.themeaccent4,1,true)
				
				draw_rect(x+2+indent,y+24+(24*i)-1,width-4,2,oJADEController.themeaccent2,1) //divider
				draw_text(x+24+indent,y+8+(24*i), item.name)
				
				if (!array_length(currarr)) && array_length(prevarr) {
					var temp=array_pop(prevarr)
					array_copy(currarr,0,temp,0,array_length(temp))
					indent=array_pop(prevind);
				}
			} else if is_instanceof(item, JADElistcategory) {
				var over = point_in_rectangle(curs_x,curs_y,x+indent,y+(24*i),x+width+indent,y+24+(24*i))
				if (mbleft) && (over) {
					item.collapse();
					mbleft=0
				}
				
				draw_gui(x+4+indent,y+(24*i)+1,width-8,22,oJADEController.themeaccent4,1)
				draw_text(x+8+indent,y+8+(24*i),item.listname)
				
				if !(item.collapsed) {
					if array_length(currarr) {
						array_push(prevarr,variable_clone(currarr))
						array_push(prevind,indent);
					}
				
					array_copy(currarr,0,item.listcontents,0,array_length(item.listcontents))
					indent+=16;
				}
			}
			i++;
		}
		
	}
}

function JADEobj(_uuid, _sprite,_xoff,_yoff,_width,_height,_can_xscale,_can_yscale,_properties,_name,_nodeable,_sizex,_sizey) constructor {
	uuid = _uuid;
	sprite = _sprite;
	xoff = _xoff;
	yoff = _yoff;
	width = _width;
	height = _height;
	can_xscale = _can_xscale;
	can_yscale = _can_yscale;
	properties = _properties;
	name = _name;
	nodeable = _nodeable;
	sizex = _sizex;
	sizey = _sizey;
}