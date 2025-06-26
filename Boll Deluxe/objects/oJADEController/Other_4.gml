window_set_size(480*3,270*3)
display_set_gui_size(480*3,270*3)
surface_resize(application_surface, 480*3, 270*3);
JADE_load();
VinylStopAll();
editorMusic=VinylPlay("editor bgm", true, 0.2);