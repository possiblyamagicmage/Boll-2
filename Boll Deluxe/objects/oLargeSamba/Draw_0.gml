draw_sprite_ext(sprite_index,image_index,x,floor(y + gfx_y),image_xscale,image_yscale,image_angle,#FFFFFF,1)
if (global.debug) {draw_text(x+sprite_width/2,(y-sprite_height*2)+gfx_y+64,image_angle)}