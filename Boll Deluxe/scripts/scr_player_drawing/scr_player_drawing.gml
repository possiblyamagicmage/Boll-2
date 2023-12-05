function draw_player() {
	
	draw_sprite_general(
		sheet[0],0,
		8+floor(fr)*box_width+(1*floor(fr)),
		8+top_margin+sprite_list[array_find_index(sprite_list,spr)]*box_height+(1*array_find_index(sprite_list,spr)),
		box_width,
		box_height, //might need to add some lengthdir bullshit to make it rotate on offset properly
		floor(x)-offset_x+(box_width*(xsc==-1)),
		floor(y)-offset_y+(box_height*(ysc==-1)),
		xsc,ysc,
		rot,
		col,col,col,col,
		opacity
	)
					
}