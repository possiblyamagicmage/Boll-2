var i;
if (egg == "3") {
	for (i = 0; i < 320; i++) {
		draw_sprite_part_ext(sprite_index,frame,0,ysc * (i / 320),xsc,1,(i & 1) ^ (global.roomTimer & 1),i,1,1,#FFFFFF,1)
	}
	draw_text(view_get_xport(0) + 320,room_height/2,"egg = "+string(egg)+"\nroomTimer = "+string(global.roomTimer)+"\nframe = "+string(frame))
} else {
	//uhh draw the boll ig? cant bother fo figure that out rn
	shader_set(shd_flatcolor)
	vertex_submit(boll, pr_trianglelist, sprite_get_texture(spr_Samba, 0));
	shader_reset()
	//draw_sprite(sonic,0,view_xport + stretch,view_yport)
	//draw_sprite(mario,global.roomTimer div 5,view_xport - stretch,view_yport)
	//draw_sprite_ext(sprite_index,0,view_xport,view_yport,stretch,1,0,c_white,1)
}