fr+=0.2
if floor(fr) >= 3
fr=0

draw_sprite(sprite_index,image_index,floor(x),floor(y))
draw_sprite(spr_movingplatformwheel,floor(fr),x,y)