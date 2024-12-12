// don't bother rendering if we're not active
if (!(active && ready))
{
	exit;	
}

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

var eyeposy=y-16
var eyeposx=x
var nearplayer=instance_nearest(x,y,oPlayer)

if instance_exists(oPlayer) {
	var eyetargetx=lengthdir_x(24,point_direction(eyeposx,eyeposy,nearplayer.x,nearplayer.y))
	var eyetargety=lengthdir_y(12,point_direction(eyeposx,eyeposy,nearplayer.x,nearplayer.y))
} else {
	var eyetargetx=0
	var eyetargety=0
}

eyedestx=lerp(eyedestx,eyetargetx,0.05)
eyedesty=lerp(eyedesty,eyetargety,0.05)

var eyelocx=median(-16,floor(eyedestx),16)
var eyelocy=median(-8,floor(eyedesty),8)

draw_sprite(
	spr_slime_eye,2,
	floor(eyeposx+eyelocx-6),
	floor(eyeposy+morph.vis_y+eyelocy)
);
draw_sprite(
	spr_slime_eye,2,
	floor(eyeposx+eyelocx+2),
	floor(eyeposy+morph.vis_y+eyelocy)
);

if (global.debug)
{
	draw_set_color(c_red);
	draw_text(x,y-128,$"(cost)\nthinker: {max(0, cur_delta - last_delta) / 1000}ms ({(max(0, cur_delta - last_delta)) / delta_time * 100}%)"
				    +$"\nobject: {cur_delta_2 / 1000}ms"
					+$"\noverall: {(cur_delta_2 / delta_time) * 100}%");
	draw_set_color(c_white);	
}