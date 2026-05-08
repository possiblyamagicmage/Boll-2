if (collect_timer >= 1) {
	collect_timer++;
	
	if (collect_timer > 30) {
		var dir = 30;
		repeat (3) {
			make_particle(pGlitter,x,y,depth-1,1,lengthdir_x(2,dir),lengthdir_y(2,dir),0,0);
			dir+=120;
		}
	
		instance_destroy();
	}
}