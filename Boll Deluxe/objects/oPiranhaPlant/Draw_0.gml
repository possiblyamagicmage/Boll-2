//draw_sprite_ext(sprite_index,image_index,floor(x),floor(y) + hit_sizey,xsc,ysc,rot,image_blend,image_alpha)
event_inherited()
 
if global.debug {
	
	depth = -1;
	draw_text(x+8,y+16,string(timer))
	draw_text(x+8,y-16,place_meeting(x,y,parent_pipe))
	draw_text(x-8,y-16,go)
	draw_text(x-8,y-32,exposed)
	draw_rectangle_color(x-24,0,x+24,room_height,#FF0000,#FF0000,#FF0000,#FF0000,true)
	exit;

}
depth = 710;