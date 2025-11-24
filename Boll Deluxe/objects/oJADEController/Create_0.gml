///@description Intialize
///Tools:
#macro EMPTY_SLOT -1
#macro SELECT_TOOL 0 //region, object, background, node
#macro BRUSH_TOOL 1 //object, tile, background
#macro FILL_TOOL 2 //object, tile
#macro ERASE_TOOL 3 //object, tile, background, node
#macro PICKER_TOOL 4 //object, tile, background
#macro REFERENCE_TOOL 5 //object, tile, background, node
#macro ROTATE_TOOL 6 //tile, background
#macro MIRROR_TOOL 7 //tile, background
#macro FLIP_TOOL 8 //tile, background
#macro COLOR_TOOL 9 //tile, background
#macro NODE_TOOL 10 //node
#macro ROTATOR_TOOL 11 //node

selected_mode=OBJECT_MODE;
selected_toolbar=0;
selected_tool=SELECT_TOOL;

camera = view_camera[0]

camera_set_view_pos(camera,0,room_height-camera_get_view_height(camera))

cam_x = camera_get_view_x(view_camera[0])
cam_y = camera_get_view_y(view_camera[0])
cam_w = camera_get_view_width(view_camera[0])
cam_h = camera_get_view_height(view_camera[0])
guiw = display_get_gui_width();
guih = display_get_gui_height();

themeaccent1=scribble_rgb_to_bgr($0d1128)
themeaccent2=scribble_rgb_to_bgr($1c2348)
themeaccent3=scribble_rgb_to_bgr($3a4466)
themeaccent4=scribble_rgb_to_bgr($67739a)
themehighlight=c_white

JADE_initializeobj();

current_tileset="tTilesetMain"
deco_mode_type="tile";

GUIcanvas = surface_create(guiw,guih);

topbuttons = new JADEsmallbuttons(4,4,52,16)
topbuttons.add("File", function() {
	JADEdropdown(4,4+16,["New", "Open", "Open Recent", "Save", "Save As", "Exit"], function(name,ind) {
		switch(ind) {
			case 0:
			//new file
			break;
			case 1:
			//open file
			break;
			case 2:
			//open recent file
			break;
			case 3:
			//save file
			break;
			case 4:
			//save file as
			break;
			case 5:
			//exit editor
			room_goto(rMainMenu);
			break;
		}
		with(oJADEController) topbuttons.reset();
	})
});
topbuttons.add("Edit", function() {

});
topbuttons.add("View", function() {

});
topbuttons.add("Region", function() {

});

selected_layer=-1
tilemap=-1;
tilemap_layer=-1;
layerlist = new JADElayerlisthandler(8,56,192-24,640, "selected_layer") 
layerlist.add(new JADElistunselectable("Objects"))
array_push(layerlist.listcontents,new JADEtilelayer("Main Tiles", current_tileset))
layerlist.update_depths();
selected_layer=layerlist.listcontents[1]

update_layer = function(_layer) {
	var type="tile"
	if is_instanceof(_layer,JADEtilelayer) {
		current_tileset = _layer.tileset
		var info = tileset_get_info(_layer.tileset_info[1])
		default_grid_size = info.tile_width
		current_grid_size = default_grid_size
		tilemap=_layer.tilemap
		tilemap_layer=_layer.my_deco_layer
	} else if is_instanceof(_layer, JADEassetlayer) {
		type="asset";
	} else if is_instanceof(_layer, JADEbackgroundlayer) {
		type="background";
	}
	deco_mode_type=type;
}

modebuttons = new JADEsmallbuttons(272,4,86,16,8)
modebuttons.add("Object Mode", function() {
	selected_mode = OBJECT_MODE
});
modebuttons.add("Deco Mode", function() {
	selected_mode = DECO_MODE
	update_layer(oJADEController.selected_layer)
});
modebuttons.add("Gizmo Mode", function() {
	selected_mode = NODE_MODE
});

layeraddbutton = new JADEiconbutton(layerlist.x,layerlist.y+layerlist.height+16,spr_JADEaddicon,function() {
	JADEdropdown(layeraddbutton.x,layeraddbutton.y+layeraddbutton.height,["Add Tile Layer", "Add Asset Layer", "Add Background Layer"], function(optname,ind) {
		show_debug_message(ind)
		switch(ind) {
			case 0:
				var name = "New Layer 0"
				var i=0;
				var src=layerlist.get_contents();
				repeat (array_length(src)) {
					if layer_get_id(name)!=-1 {
						var name = "New Layer "+string(i)
					}
					i++;
				}
				layerlist.add(new JADEtilelayer(name,"tTilesetMain"))
			break;
			case 1:
				var name = "New Layer 0"
				var i=0;
				var src=oJADEController.layerlist.get_contents();
				repeat (array_length(src)) {
					if layer_get_id(name)!=-1 {
						var name = "New Layer "+string(i)
					}
					i++;
				}
				layerlist.add(new JADEassetlayer(name))
			break;
			case 2:
				var name = "New Layer 0"
				var i=0;
				var src=oJADEController.layerlist.get_contents();
				repeat (array_length(src)) {
					if layer_get_id(name)!=-1 {
						var name = "New Layer "+string(i)
					}
					i++;
				}
				layerlist.add(new JADEbackgroundlayer(name,spr_BGtest))
			break;
		}
		layerlist.update_depths();
		layeraddbutton.reset();
	})
});

layerdeletebutton = new JADEiconbutton(layerlist.x+20,layerlist.y+layerlist.height+16,spr_JADEdeleteicon,function() {
	layerlist.update_depths();
	layerdeletebutton.reset();
});

layereditbutton = new JADEiconbutton(layerlist.x+40,layerlist.y+layerlist.height+16,spr_JADEediticon,function() {
	var inst = instance_create_depth(guiw/2,guih/2,oJADEController.depth-2,oJADELayerProperties)
	inst.selected_layer = selected_layer
	layereditbutton.created_gui = inst;
});

playtestbutton = new JADEiconbutton(196,26+36,spr_JADEplaytestbutton,function() {
	JADEdropdown(playtestbutton.x,playtestbutton.y+playtestbutton.height,oGlobals._charmList, function(optname,ind) {
		if ind!=-1 {
			JADE_save();
			global._playerChars=[oGlobals._charmList[ind]];
		
			global.nextlevel=game_save_id+"\save.jade" //the level the game will load
			global.jade_testing = true;
		
			i = 0;
			repeat(4) {
				global.lives[i]=5
				i++
			}
			room_goto(rGame)
		}
		playtestbutton.reset();
	})
});

tilepicker = new JADEtilepicker(1296-216-14,56, 220, 320)

//Modes:
//1: Objects
//2: Tiles
//3: Backgrounds
//4: Nodes
//Mode is first, tool is second
//Object
toolbar[0][0]=SELECT_TOOL
toolbar[0][1]=BRUSH_TOOL
toolbar[0][2]=FILL_TOOL
toolbar[0][3]=ERASE_TOOL
toolbar[0][4]=PICKER_TOOL
toolbar[0][5]=REFERENCE_TOOL
//Tile
toolbar[1][0]=BRUSH_TOOL
toolbar[1][1]=FILL_TOOL
toolbar[1][2]=ERASE_TOOL
toolbar[1][3]=PICKER_TOOL
toolbar[1][4]=ROTATE_TOOL
toolbar[1][5]=MIRROR_TOOL
toolbar[1][6]=FLIP_TOOL
toolbar[1][7]=REFERENCE_TOOL
//Background
toolbar[2][0]=SELECT_TOOL
toolbar[2][1]=BRUSH_TOOL
toolbar[2][2]=ERASE_TOOL
toolbar[2][3]=PICKER_TOOL
toolbar[2][4]=MIRROR_TOOL
toolbar[2][5]=FLIP_TOOL
toolbar[2][6]=COLOR_TOOL
toolbar[2][7]=REFERENCE_TOOL
//Asset
toolbar[3][0]=SELECT_TOOL
toolbar[3][1]=BRUSH_TOOL
toolbar[3][2]=ERASE_TOOL
toolbar[3][3]=PICKER_TOOL
toolbar[3][4]=MIRROR_TOOL
toolbar[3][5]=FLIP_TOOL
toolbar[3][6]=COLOR_TOOL
toolbar[3][7]=REFERENCE_TOOL
//Node
toolbar[4][0]=SELECT_TOOL
toolbar[4][1]=BRUSH_TOOL
toolbar[4][2]=NODE_TOOL
toolbar[4][3]=ROTATOR_TOOL
toolbar[4][4]=ERASE_TOOL
toolbar[4][5]=REFERENCE_TOOL

toolbarbuttons = new JADEtoolbar(196,26)

toolbarbuttons.set(toolbar[0])

selected_tile_layer=2;

not_on_gui = false

savetextdur=0;

is_typing = -1;

default_grid_size = 16;
current_grid_size = default_grid_size;

selection_grab = false;
selection_grab_x = 0;
selection_grab_y = 0;
selected_array = [];
selection_box = false;
selection_box_x = 0;
selection_box_y = 0;
resizing = 0;
resizing_x = 0;
resizing_y = 0;
resizing_x2 = 0;
resizing_y2 = 0;
resizing_initial_w=0;
resizing_initial_h=0;

current_tile_id[0][0] = 0
tile_drag = false;
tile_sel_width = 0
tile_sel_height = 0
tile_sel_last_x = 0
tile_sel_last_y = 0
tile_fill_last_x = 0
tile_fill_last_y = 0
tile_fill = false
fill_circle = false

selected_region = 0;
object_layer_map[0] = ds_list_create();
node_layer_map[0] = ds_list_create();

gotoroom=rGame

curs_x=mouse_x
curs_y=mouse_y

selected_obj=-1;
selected_deco_obj=-1;

view_grab=0 //view panning
view_grabx=0
view_graby=0
initial_viewx=0;
initial_viewy=0;

zoom_level = 1;
zoom_goto = 1;
zoom_x = 0;
zoom_y = 0;
ui_opacity = 0.5;

drawing_node=-1;
draw_node_x=0;
draw_node_y=0;

drawing_rotator=-1;
draw_rotator_x=0;
draw_rotator_y=0;

selection_box_fr=0

properties_tab_active = false;
property_dropdown_index = -1;
property_object_index = -1;

pressed_dropdown = false;

check_colliding_object = function(_x,_y) {
	if (selected_mode == OBJECT_MODE) {
		var i=0;
		repeat(ds_list_size(object_layer_map[selected_region])) {
			var obj=object_layer_map[selected_region][| i]
			var data = obj_data[$ obj[0]]
			if point_in_rectangle(_x,_y,obj[1],obj[2],obj[1]+(data.width*obj[3])-1,obj[2]+(data.height*obj[4])-1) {
				return i+1
			}
			i++;
		}
	}
}

check_colliding_tile = function(_x, _y) {
	var i=0;
	repeat(ds_list_size(tilemap)) {
		var tile=tilemap[| i]
		var tilesetinf = tileset_get_info(selected_layer.tileset_info[1])
		if point_in_rectangle(_x,_y,tile[1]*16,tile[2]*16,tile[1]*16+tilesetinf.tile_width,tile[2]*16+tilesetinf.tile_height) {
			return i+1
		}
		i++;
	}
}

object_place = function(_uuid, _x, _y, _xscale, _yscale) {
	var obj = [_uuid, _x, _y, _xscale, _yscale]
	var data = obj_data[$ obj[0]]
	obj[5] = properties.getDefaultValues(_uuid);
	//add other data stuff here later
	ds_list_add(object_layer_map[selected_region], obj)
}


tile_update_properties = function() {
	var list=tilemap
	var i=ds_list_size(list)-1;
	while (i > 0) {
		var data=list[| i]
		if data==undefined {
			ds_list_delete(list,i) 
			continue
		}
		
		var fetched=tilemap_get(tilemap_layer,data[1],data[2])
		
		if (data[0]!=fetched) { //If data does not match the tile at place
			ds_list_delete(list, i) //remove if tile has changed
			continue
		}
		i--;
	}
}


//object_place("oCollider",0,167*16,30*16,2)
//object_place("oPlayerSpawn",3*16,166*16)

JADE_load();