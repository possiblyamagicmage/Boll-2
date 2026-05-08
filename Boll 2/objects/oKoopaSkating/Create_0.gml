// Inherit the parent event
event_inherited();

jump = false;

enemyCollidePlayer.Connect( self, function(hit_p) {
	if (hit_p.y > y) {
		vsp=-5;
		jump=true;
	}
});

koopaEscapeShell.Connect( self, function(hit_p) {
	constantspd = 1.5;
});