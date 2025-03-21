// Inherit the parent event
event_inherited();

hit_sizey=8;
myBalloon=noone;
phaseid=noone;
targeted_player=noone;
bheight=2;
passive=true;
phase_leeway=0
dashcooldown=0;
dashduration=0;
hurt=false;
upset_walk=true;
LOStimer=0;
delete enemyCollidePlayer;
enemyCollidePlayer = new Signal();

enemyStomped.Connect( self, function(hit_p) {
	if instance_exists(myBalloon) {
		myBalloon._owner=noone;
		with(myBalloon) {
			hsp=-other.constantspd;
		}
	}
	myBalloon=noone;
	passive=false;
	dashduration=0;
	dashcooldown=60;
	constantspd=0;
	_direction=0;
	gsp=0;
	hsp=0;
	hurt=true;
});

enemyCollidePlayer.Connect( self, function(hit_p) {
	if !(passive) {
		with(hit_p) {
			sig.Emit("collide_with_enemy")
		}
		phaseid=hit_p
		phase_leeway=7;
	} else {
		passive=false;
		phaseid=hit_p
		phase_leeway=7;
		xsc=esign(hit_p.x-x,hit_p.xsc);
		hsp=2*-xsc;
		vsp=-3;
		hurt=true;
		dashcooldown=60;
		if instance_exists(myBalloon) {
			myBalloon._owner=noone;
			with(myBalloon) {
				hsp=-other.constantspd;
			}
		}
		myBalloon=noone;
		grounded=false;
	}
});