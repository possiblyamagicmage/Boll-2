event_inherited();

enemyFireballed.Connect( self, function(proj, hit_p) {
	var col = instance_place(x,y,oPlayer) 
	if col != noone	{
		hp = 0;
	}
});

state = 0;
frame = 0;
timer_offset = 0;

hit_sizex=13;
hit_sizey=13;