#macro CLEANEDGESCALE 4.0

globalvar cleanedge_highestcolor, cleanedge_simthres, cleanedge_linewidth, cleanedge_imgres;

globalvar cleanedge_sprtable;

cleanedge_sprtable = array_create(1,array_create(1,undefined));

cleanedge_highestcolor = shader_get_uniform(shd_cleanEdge,"highestColor");
cleanedge_simthres = shader_get_uniform(shd_cleanEdge, "similarThreshold");
cleanedge_linewidth = shader_get_uniform(shd_cleanEdge, "lineWidth");
cleanedge_imgres = shader_get_uniform(shd_cleanEdge,"iResolution");
shader_set_uniform_f(cleanedge_highestcolor,1.0,1.0,1.0);
shader_set_uniform_f(cleanedge_simthres, 0.0);
shader_set_uniform_f(cleanedge_linewidth, 1.0);
shader_set_uniform_f(cleanedge_imgres,1.0,1.0,0.0);

// returns a cleanedge-filtered version of a sprite
// I DO NOT recommend running this every frame; this is *very* costly
function make_cleanedge_sprite(input,subimg)
{
	var iWidth = sprite_get_width(input);
	var iHeight = sprite_get_height(input);
	
	var iXoff = sprite_get_xoffset(input);
	var iYoff = sprite_get_yoffset(input);
	
	var output; // the output sprite

	var cleanedge_scale = CLEANEDGESCALE;
	
	var tempsurf = surface_create(max(1, round(iWidth / 16)) * 16 * cleanedge_scale,
									  max(1, round(iHeight / 16)) * 16 * cleanedge_scale);
	
	// horrendously messy code, here's a tl;dr:
	// the function makes a surface where the cleanedge version of the sprite is drawn
	// cleanedge versions are 4x the scale (although this can be modified)
	// afterwards, it converts this surface to a sprite, and frees the surface from memory
	surface_set_target(tempsurf);
		draw_clear_alpha(c_black, 0);
	
		shader_set(shd_cleanEdge);
			shader_set_uniform_f(cleanedge_imgres,
								iWidth,
								iHeight,
								0.0);
			shader_set_uniform_f(cleanedge_highestcolor,1.0,1.0,1.0);
			shader_set_uniform_f(cleanedge_simthres, 0.0);
			shader_set_uniform_f(cleanedge_linewidth, 1.0);
	
			draw_sprite_ext(input,
						    subimg,
							iXoff,
							iYoff,
							1,
							1,
							0,
							c_white,
							1);
		shader_reset();
	surface_reset_target();

	output = sprite_create_from_surface(tempsurf,
										0,
										0,
										surface_get_width(tempsurf),
										surface_get_height(tempsurf),
										false,
										false,
										iXoff * cleanedge_scale,
										iYoff * cleanedge_scale
										);	

	surface_free(tempsurf);
	
	return output;
}

function draw_sprite_cleanedge(sprite,subimg,x,y,xscale,yscale,rot,col,alpha)
{	
	var cleanedge_scale = CLEANEDGESCALE;
	
	var sprid = real(sprite);
	
	if (sprid > array_length(cleanedge_sprtable) - 1)
	{
		show_debug_message($"{sprid} was out of range! resizing table...");
		array_resize(cleanedge_sprtable, sprid + 1);
	}
	
	if (cleanedge_sprtable[sprid] == 0)
	{
		show_debug_message($"table for {sprid} does not exist");
		cleanedge_sprtable[sprid] = array_create(sprite_get_number(sprite),undefined);
	}
	
	var make_new = 0;
	if (subimg > (array_length(cleanedge_sprtable[sprid]) - 1)) // out of array range
	{
		make_new |= 1;
	}
	else if (!sprite_check_valid(cleanedge_sprtable[sprid][subimg])) // sprite doesn't exist
	{
		make_new |= 2;
	}
		
	if (make_new)
	{
		if (make_new & 1)
		{
			array_resize(cleanedge_sprtable[sprid],subimg + 1);
		}
			
		cleanedge_sprtable[sprid][subimg] = make_cleanedge_sprite(sprite,subimg div 1);
	}

	if (sprite_check_valid(cleanedge_sprtable[sprid][subimg]))
	{
		draw_sprite_ext(cleanedge_sprtable[sprid][subimg],
						0,
						x,
						y,
						(1/cleanedge_scale) * xscale,
						(1/cleanedge_scale) * yscale,
						rot,
						col,
						alpha);	
	}	
}