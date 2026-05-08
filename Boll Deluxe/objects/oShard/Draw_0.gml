if !(collect_timer) {
	var radius = 12+wave_val(0,4,1);
	
	gpu_set_blendmode(bm_add);
	draw_set_alpha(0.33);

	draw_circle(x,y,radius,false);

	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
}

draw_self();