/// @description set up limits
x_limit = 0;
y_limit = 0;
make_limits_scale = false;

;

if (make_limits_scale)
{
	x_limit = intlib_make_u32(abs(16 * image_xscale));
	y_limit = intlib_make_u32(abs(16 * image_yscale)); 
}