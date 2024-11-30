gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_pFireballtrail,0,floor(x)-hsp,floor(y)-vsp,1,1,point_direction(x-hsp,y-vsp,x,y),c_white,0.75)
gpu_set_blendmode(bm_normal);
draw_sprite(sprite_index,image_index,floor(x),floor(y))