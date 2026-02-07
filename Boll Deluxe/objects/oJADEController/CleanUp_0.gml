ds_list_destroy(object_layer_map)
ds_list_destroy(node_layer_map)
layerlist.wipe();

surface_free(GUIcanvas);

if (sprite_exists(reference_sprite)) {
	sprite_delete(reference_sprite)
}