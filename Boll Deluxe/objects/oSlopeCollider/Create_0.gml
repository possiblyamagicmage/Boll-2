/// @description init

// chearii: about time we rip off the bandaid on this
// currently is ONLY semisolid and I can only see full-solid slopes being polygons

hflip = false;
LDtkReloadFields();

rise = (sprite_get_height(sprite_index) * image_yscale) div 1;
run = (sprite_get_width(sprite_index) * image_xscale) div 1;

slopediv = (rise/run);
no_collide = false;
