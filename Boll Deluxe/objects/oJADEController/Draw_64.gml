if !surface_exists(GUIcanvas) exit;

surface_set_target(GUIcanvas)
draw_clear_alpha(c_black, 0)

draw_set_font(global.omiFont)

draw_rect(0,0,guiw,24,themeaccent1,1)
draw_rect(0,24,guiw,32,themeaccent2,1)
draw_rect(guiw-256,24,256,guih-24,themeaccent1,1)
draw_rect(0,56,192,guih-56,themeaccent1,1)

topbuttons.draw();
toolbarbuttons.draw();
objectlist.draw();

with(oJADEDropDown) {
	event_perform(ev_draw,ev_draw_normal);
}

surface_reset_target();

draw_surface(GUIcanvas, 0, 0)