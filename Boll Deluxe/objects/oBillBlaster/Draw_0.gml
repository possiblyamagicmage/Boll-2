draw_sprite_ext(spr_blasterhead,0,x+8,y+8,xscale,yscale,0,c_white,1)
draw_self();

if global.debug draw_rect(
	x + (hit_sizex div 2) - hit_sizex,
	y, 
	hit_sizex * 2, 
	hit_sizey - 1,
	#FF0000,
	0.25)