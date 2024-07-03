// Inherit the parent event
event_inherited();

if (global.debug) {
	draw_text(x+8,y-16,place_meeting(x,y,parent_pipe))
	draw_text(x-8,y-16,go)
	draw_text(x-8,y-32,exposed)
}