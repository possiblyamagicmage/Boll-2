var guiw=display_get_gui_width()
var guih=display_get_gui_height()

draw_sprite_stretched_ext(spr_JADEtab_left,0,0,(guih/4)-8,32,(32*5)+4,c_black,0.1)
draw_sprite_stretched(spr_JADEtab_left,0,0,(guih/4)-10,32,(32*5)+4)

for (var i = 0; i < 5; ++i) //draw Mode icons
{
	draw_sprite(spr_JADEicon_bg,0,0,((guih/4)-8)+32*i) //bg square
   
	draw_sprite(spr_JADEicons,15+i,4,((guih/4)-4)+32*i) //icon
   
	if (selected_mode == i) { //selection overlay
		draw_sprite(spr_JADEicon_bg,1,0,((guih/4)-8)+32*i)
	} else if point_in_rectangle(curs_x,curs_y,4,((guih/4)-4)+32*i,28,(((guih/4)-4)+32*i)+24) {
		draw_sprite(spr_JADEicon_bg,2,0,((guih/4)-8)+32*i) //hover overlay
	}
}

