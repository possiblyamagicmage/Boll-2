// don't bother rendering if we're not active
if (!(active && ready))
{
	return;	
}

var _tex = sprite_get_uvs(spr_slime_morphcone, 0);

morph_uv_left = _tex[0];
morph_uv_right = _tex[2];
morph_uv_top = _tex[1];
morph_uv_bottom = _tex[3];

var finy = camera_y;
var exceed = max(0, y - camera_y - (CAMERA_MAX_HEIGHT - 8));

finy += exceed;

if (global.debug)
{
	//draw_circle(x,y,8,true);
	
	//draw_circle_color(x - (morph.vis_width div 2), y, 8, c_red, c_red, true);
	//draw_circle_color(x + (morph.vis_width div 2), y, 8, c_red, c_red, true);
	//draw_circle_color(x,y - morph.vis_height,8,c_blue,c_blue,true);
	
	// draw the actual sprite bounds
	draw_rectangle_color(x - (morph.vis_width div 2),
						 y - morph.vis_height,
						 x + (morph.vis_width div 2),
						 y,
						 c_purple,
						 c_purple,
						 c_purple,
						 c_purple,
						 true);
						 

}

shader_set(shd_morphing);
	morph_set_shader_data(morph);
	
	draw_sprite(spr_slime_morphcone,0,camera_x + morph.exceed_x,finy);
shader_reset();

if (global.debug)
{
	draw_set_color(c_red);
	draw_text(x,y-128,$"(cost)\nthinker: {max(0, cur_delta - last_delta) / 1000}ms ({(max(0, cur_delta - last_delta)) / delta_time * 100}%)"
				    +$"\nobject: {cur_delta_2 / 1000}ms"
					+$"\noverall: {(cur_delta_2 / delta_time) * 100}%");
	draw_set_color(c_white);	
}