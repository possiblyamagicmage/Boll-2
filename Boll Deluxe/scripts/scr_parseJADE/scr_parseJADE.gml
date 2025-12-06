/*function parse_level(dir=game_save_id+"\save.jade") {
	tile_layer=array_create(1);
	tilemap=array_create(1);
	var file = dir
	if !file_exists(file) {
		show_message($"Level does not exist at {dir}! make sure you've saved first!")
		room_goto(rMainMenu)
	}
	var loaded = buffer_load(file)
	var save_file = buffer_decompress(loaded)
	var level_data = json_parse(buffer_read(save_file,buffer_string))
	show_debug_message($"Loading JADE level from: {file}")
	show_debug_message(level_data)
	if is_struct(level_data) {
		var jadeversion = level_data[$ "version"]
		if (jadeversion == JADE_VERSION) {
			var objects=level_data[$ "objects"]
			var node_objects=level_data[$ "node_objects"]
			var tile_layers=level_data[$ "tile_layers"]
			var i=0;
		}
	}
	with(all) {event_user(15)}
	buffer_delete(loaded)
	buffer_delete(save_file)
	show_debug_message($"Successfully loaded JADE level from: {file}!")
}