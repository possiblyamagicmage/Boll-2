draw_sprite_ext(sprite_index, frame, x, y,xsc,ysc,0,#FFFFFF,1)
if global.debug {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	draw_text(bbox_right,bbox_bottom,string(x/16))
}