// Inherit the parent event
event_inherited();
onStunRecover = new Signal();

stun=0;
revving=false;
revtimer=0;
blowing=false;
blowtimer=0;
cooldowntimer=0;
fireballflash=0;
didstun=false;
pausestun=false;
		
uni_r = shader_get_uniform(shd_flatcolor, "red");

blowingPart=-1;

enemyStomped.Connect( self, function(hit_p) {
	stun=180;
	didstun=false;
	hsp=0;
	constantspd=0;
});

enemyFireballed.Connect( self, function(proj, hit_p) {
	fireballflash = 30;
});

onStunRecover.Connect( self, function() {
	constantspd=0.5;
	hp=2;
	didstun=true;
});