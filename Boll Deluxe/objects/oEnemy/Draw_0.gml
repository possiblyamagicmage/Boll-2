if !inview() exit

draw_sprite_ext(sprite_index,image_index,floor(x),floor(y),xsc,ysc,rot,image_blend,image_alpha)

if global.debug {
	draw_rect(x-hit_sizex,y-hit_sizey,hit_sizex*2,hit_sizey*2,c_red,0.5)
	
	draw_line(x + (-xsc * (hit_sizex-4)),y,x + (-xsc * (hit_sizex-4)),y+hit_sizey+16)
	draw_set_font(smallF)
	draw_text(x,y-8,bool(collision_line(x + (xsc * (hit_sizex-4)),y,x + (xsc * (hit_sizex-4)),y+hit_sizey+16,collision_array, false, true)))
}