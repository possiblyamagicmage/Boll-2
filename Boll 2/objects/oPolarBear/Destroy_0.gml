// Inherit the parent event
instance_create_depth(x,y,0,pSpinningEnemy,{sprite_index : spr_polarbeardead, vspeed : -1, hspeed : 0})

if instance_exists(myBalloon) {
	myBalloon._owner=noone;
		with(myBalloon) {
		hsp=-other.constantspd;
	}
}