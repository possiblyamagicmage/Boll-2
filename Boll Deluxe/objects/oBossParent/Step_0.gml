event_user(0)
if alarm[0] {exit;}
if (hp <= 0) {
	event_user(2)
	alarm[0] = 120;
	exit;
}

hsp = sign(floor(oPlayer.x) - x)
vsp += 0.2

player_collision()

x += hsp
y += vsp