//draw_self();
draw_player();

/*x_frame += anim_speed/room_speed;
if(x_frame >= anim_length) x_frame = initialx_frame;*/ //change later when animation data gets added

if (drawProgram != undefined) {
	drawProgram.setSelf(id)
	drawProgram();
}