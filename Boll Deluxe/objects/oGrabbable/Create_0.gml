event_inherited();
hsp = 0;
vsp = 0;
gsp = 0;
grounded = false;
grav = 0.2;
bounce = false;
hit_sizex = 8;
hit_sizey = 8;
collision_array = [oCollider]

thrown = false;
thrown_player = noone;
grabbed = false;
grab_delay = 0;

onThrown = new Signal();

onThrown.Connect( self, function(thrown_p) {
	thrown_player = thrown_p;
	if (thrown_player.up) {
        vsp = -6
        hsp = thrown_player.hsp
    } else if (thrown_player.down) {
        vsp = 0
        hsp = 0
		bounce = false
    } else {
        vsp = -1
		hsp = (thrown_player.xsc * 3)
    }
	
	make_particle(pImpact,x,y,2)
	VinylPlay(snd_enemykick)
	
	grabbed = false;
	thrown = true;
});

node_init_vars()