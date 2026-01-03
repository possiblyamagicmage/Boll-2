// Inherit the parent event
if !in_shell {
	if ceiling {
		sprite_index = spr_buzzyshell;
		ysc = -1;
	} else {
		ysc = 1
	}
}

event_inherited();

if global.debug {
	draw_set_font(global.omiFont)
	draw_text(x,y,string(state))
	draw_text(x,y-8,string(ceiling))
}