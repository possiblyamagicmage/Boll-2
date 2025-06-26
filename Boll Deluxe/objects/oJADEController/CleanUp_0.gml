var g=0;
repeat(4) {
	ds_list_destroy(object_layer_map[g])
	ds_list_destroy(node_layer_map[g])

	var i=0;
	repeat (array_length(tile_layer[g])) {
		ds_list_destroy(tile_layer_map[g][i])
		i++
	}
	g++;
}

surface_free(object_list_area_surface)
surface_free(GUIcanvas);