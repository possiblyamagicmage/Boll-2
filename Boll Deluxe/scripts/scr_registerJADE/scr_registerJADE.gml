#macro OBJECT_MODE 0
#macro DECO_MODE 1
#macro NODE_MODE 2
#macro JADE_VERSION 4

global.tilesets={}
//add tilesets
global.tilesets[$ "tTilesetMain"]=[spr_TilesetMain, tTilesetMain, "Floragrande Tiles"]
global.tilesets[$ "tTilesetPipes"]=[spr_TilesetPipes, tTilesetPipes, "Pipe Tiles"]
global.tilesets[$ "tTilesetMainDeco"]=[spr_TilesetMainDeco, tTilesetMainDeco, "Floragrande Decoration"]
global.tilesets[$ "tTilesetWorld5"]=[spr_TilesetWorld5, tTilesetWorld5, "Frigid Dark Tiles"]

function JADE_initializeobj() {
	obj_data = {};
	properties = new JADEproperties()
	objectlist = new JADElisthandler(1296-216-14,56, 216, 640, "selected_obj")
	decolist = new JADElisthandler(1296-216-14,56, 216, 640, "selected_obj")
	propertylist = new JADEpropertylisthandler(1296-216-14,56, 216, 640);
	
	list_tabbuttons=new JADEsmallbuttons(1296-216-14,38,96,20,8,false, true)
	
	list_tabbuttons.add("Object List", function() {
		properties_tab_active = false;
	});
	list_tabbuttons.add("Properties", function() {
		properties_tab_active = true;
	});
	list_tabbuttons.selected_button=0
	
	registerobj(oPlayerSpawn, spr_spawner, 8, 8, 16, 16, false, false, objectlist, "Player Spawn")
	registerobj(oCollider, spr_collider, 0, 0, 16, 16, true, true, objectlist, "Collider")
	registerobj(oSlopeCollider, spr_slopesolid, 0, 0, 16, 16, true, true, objectlist, "Slope Collider")
	
	var blockcategory = new JADElistcategory("Blocks")
	registerobj(oBrick, spr_brick, 8, 8, 16, 16, false, false, blockcategory, "Brick Block")
	registerobj(oItemBox, spr_itembox, 8, 8, 16, 16, false, false, blockcategory, "Item Box")
	properties.addDropdown(oItemBox, "Content", "content", "coin", ["Single Coin", "Multiple Coins", "Super Mushroom", "Fire Flower", "Thunder Flower", "Starman", "1UP Mushroom", "3UP Moon", "Poison Mushroom"], ["coin", "multicoins", "mushroom", "fireflower", "thunderflower", "star", "1up", "3up", "poison"])
	properties.addNumberInput(oItemBox, "Amount", "amount", 1, true)
	properties.addCheckbox(oItemBox, "Is Brick", "bricked", false)
	properties.addCheckbox(oItemBox, "Is Hidden", "hidden", false)
	properties.addCheckbox(oItemBox, "Is Dispenser", "eject", false)
	registerobj(oLongItemBox, spr_longitembox, 24, 8, 48, 16, false, false, blockcategory, "Long Item Box")
	registerobj(oMonitor, spr_monitor, 8, 8, 16, 16, false, false, blockcategory, "Monitor")
	
	objectlist.add(blockcategory) //we added the items to the category, but we still need to apply the category to the main list
}

function WM_initializeobj() {	
	/*obj_data = ds_map_create();
	obj_name = ds_list_create();
	
	#region Categories
		cat_blocks = ds_list_create();
		cat_tech = ds_list_create();
		cat_node = ds_list_create();
		
		jade_cats[OBJECT_MODE] = [cat_blocks, cat_tech];
		jade_cats[NODE_MODE] = [cat_node];
	#endregion


	show_debug_message("Registering JADE object list...")
	registerobj(object_get_name(oPlayerSpawn), spr_spawner, -sprite_get_xoffset(spr_spawner), -sprite_get_yoffset(spr_spawner), sprite_get_width(spr_spawner), sprite_get_height(spr_spawner), false, false, OBJECT_MODE, 0, object_get_properties("oPlayerSpawn"), "Player Spawn")
	registerobj(object_get_name(oCollider), spr_collider, -sprite_get_xoffset(spr_collider), -sprite_get_yoffset(spr_collider), sprite_get_width(spr_collider), sprite_get_height(spr_collider), true, true, OBJECT_MODE, 0, object_get_properties("oCollider"), "Collider")
	registerobj(object_get_name(oSlopeCollider), spr_slopesolid, -sprite_get_xoffset(spr_slopesolid), -sprite_get_yoffset(spr_slopesolid), sprite_get_width(spr_slopesolid), sprite_get_height(spr_slopesolid), true, true, OBJECT_MODE, 0, object_get_properties("oSlopeCollider"), "Solid Slope")
	
	registerobj(object_get_name(oScript), spr_scripttrigger, 0, 0, 16, 16, true, true, OBJECT_MODE, 1, object_get_properties("oScript"), "Script Block", true)
	registerobj(object_get_name(oCustomObject), spr_customobject, 0, 0, 16, 16, false, false, OBJECT_MODE, 1, object_get_properties("oCustomObject"), "Custom Object", true)
	
	//NODE MODE
	registerobj(object_get_name(oCameraRegion), spr_cameraregion, -sprite_get_xoffset(spr_cameraregion), -sprite_get_yoffset(spr_cameraregion), sprite_get_width(spr_cameraregion), sprite_get_height(spr_cameraregion), true, true, NODE_MODE, 0, object_get_properties("oCameraRegion"), "Camera Region")
	registerobj(object_get_name(oCameraBoundary), spr_cameraboundary, -sprite_get_xoffset(spr_cameraboundary), -sprite_get_yoffset(spr_cameraboundary), sprite_get_width(spr_cameraboundary), sprite_get_height(spr_cameraboundary), true, true, NODE_MODE, 0, object_get_properties("oCameraBoundary"), "Camera Boundary")
	*/
}

function registerobj(uuid,_sprite,_xoff,_yoff,_width,_height,_can_xscale,_can_yscale,_list,_name,_nodeable=false,_sizex=1,_sizey=1) {
	var _id=object_get_name(uuid)
	if is_undefined(obj_data[$ _id]) {
		obj_data[$ _id]=new JADEobj(_id,_sprite,_xoff,_yoff,_width,_height,_can_xscale,_can_yscale,_name,_nodeable,_sizex,_sizey)
		properties.initProperties(uuid)
		_list.add(obj_data[$ _id])
	} else {
		show_debug_message($"JADE object {object_get_name(uuid)} has already been initialized! Ignoring...")
	}
}

function JADE_save(file=game_save_id+"\save.jade") {
	file_delete(file)
	show_debug_message($"Saving JADE file to: {file}")
	var struct = {};
	var tilelayers = layerlist.listcontents;
	var tilearr = [];
	var i=0;
	repeat(array_length(tilelayers)) {
		var _layer = tilelayers[i];
		if !is_instanceof(_layer, JADElistunselectable) {
			var tile_layer_contents = []; //wow!
			var j=0;
			repeat(ds_list_size(_layer.tilemap)) {
				array_push(tile_layer_contents,_layer.tilemap[| j])
				j++;
			}
			var _arr = [_layer.tileset,_layer.name,_layer.tileset,_layer.layerdepth,tile_layer_contents]
			array_push(tilearr,_arr);
		} else {
			var _arr = ["MAIN",_layer.name]
			array_push(tilearr,_arr);
		}
		i++;
	}
	struct[$ "tile_layers"]=tilearr;
	struct[$ "version"]=JADE_VERSION
	show_debug_message(struct)
	var _json=json_stringify(struct); //compile all saved things
	var save_file = buffer_create(string_byte_length(_json), buffer_grow, 1);
	buffer_write(save_file, buffer_string, _json); //save compilation into a buffer
	var compressed = buffer_compress(save_file, 0, buffer_tell(save_file))
	buffer_save(compressed, file); //save buffer into the save file
	buffer_delete(save_file)
	buffer_delete(compressed)
	show_debug_message($"Successfully saved JADE file to: {file}!")
}

function JADE_load(file=game_save_id+"\save.jade") {
	if !file_exists(file) exit;
	var loaded = buffer_load(file)
	var save_file = buffer_decompress(loaded)
	var level_data = json_parse(buffer_read(save_file,buffer_string))
	if (level_data[$ "version"]==JADE_VERSION) {
		var tilelayers = level_data[$ "tile_layers"]
		layerlist.listcontents = [];
		var len=array_length(tilelayers);
		var i=len-1;
		repeat(len) {
			var _layer_contents = tilelayers[i];
			
			var _layer;
			
			if (_layer_contents[0]!="MAIN") {
				_layer = new JADEtilelayer(_layer_contents[1],_layer_contents[0])
				
				var tile_layer_contents = _layer_contents[4]
				
				var j=0;
				repeat(array_length(tile_layer_contents)) {
					ds_list_add(_layer.tilemap, tile_layer_contents[j])
					tilemap_set(_layer.my_deco_layer, tile_layer_contents[j][0], tile_layer_contents[j][1], tile_layer_contents[j][2]);
					j++;
				}
			} else {
				_layer = new JADElistunselectable("Objects")
			}
			
			layerlist.add(_layer);
			i--;
		}
		layerlist.update_depths();
	}
	buffer_delete(loaded)
	buffer_delete(save_file)
	show_debug_message($"Successfully loaded JADE file from: {file}!")
}

function tile_layer_alpha_check() {
	//This makes the tile layer transparent if you arent in tile mode by using layer scripts
	if oJADEController.selected_mode!=DECO_MODE || layer!=oJADEController.selected_layer.my_layer {
		shader_set(shd_alpha)
		var alpha = shader_get_uniform(shd_alpha, "alpha");
		shader_set_uniform_f(alpha,0.33)
	}
}