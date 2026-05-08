if (!global.settings[$ "fullscreen_type"]) {
	window_enable_borderless_fullscreen(false);
	window_set_fullscreen(false);
	window_set_size(432*global.settings[$ "resolution_scale"],248*global.settings[$ "resolution_scale"]);
	window_center();
} else {
	if (global.settings[$ "fullscreen_type"] == 1) window_enable_borderless_fullscreen(true);
	else window_enable_borderless_fullscreen(false);
	window_set_fullscreen(true);
}
display_set_gui_size(432,248)
surface_resize(application_surface, 432, 248);
VinylStopAll();
VinylStop(editorMusic);
window_center();