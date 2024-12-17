// scr_outline

globalvar outline_r, outline_g, outline_b, u_outline_color, u_texel;

outline_r = 0.0;
outline_g = 0.0;
outline_b = 0.0;

u_outline_color = shader_get_uniform(shd_outline,"outlineColor");
u_texel = shader_get_uniform(shd_outline,"in_Texel");

function set_outlinecolor_from_hex(hex)
{
	var r, g, b;
	
	b = hex & 0xFF;
	g = ((hex) >> 8) & 0xFF;
	r = ((hex >> 16) & 0xFF);
	
	outline_r = r / 0xFF;
	outline_g = g / 0xFF;
	outline_b = b / 0xFF;
	
	shader_set_uniform_f(u_outline_color,
						 outline_r,
						 outline_g,
						 outline_b,
						 1.0);
}