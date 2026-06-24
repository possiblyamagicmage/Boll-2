right = InputCheck(INPUT_VERB.RIGHT);
rightpress = InputPressed(INPUT_VERB.RIGHT);
left = InputCheck(INPUT_VERB.LEFT);
leftpress = InputPressed(INPUT_VERB.LEFT);
up = InputCheck(INPUT_VERB.UP);
uppress = InputPressed(INPUT_VERB.UP);
down = InputCheck(INPUT_VERB.DOWN);
downpress = InputPressed(INPUT_VERB.DOWN);
if !finish {
	akey = InputCheck(INPUT_VERB.A);
	apress = InputPressed(INPUT_VERB.A);
	bkey = InputCheck(INPUT_VERB.B);
	bpress = InputPressed(INPUT_VERB.B);
	ckey = InputCheck(INPUT_VERB.C);
	cpress = InputPressed(INPUT_VERB.C);
	vpress = InputPressed(INPUT_VERB.V);
}
maxspd=2.5;

movedir=point_direction(0,0,right-left,down-up)
if (!left && !right && !up && !down) movedir=-1

if (movedir!=-1) {
	xsc=esign(right-left,xsc);
	
	hsp=(right-left)*maxspd
	vsp=(down-up)*maxspd
	
	repeat(2) {
		x+=hsp/2
		y+=vsp/2
		grounded=false
		player_collision()
	}
	post_wall();
}
catspeak_execute(global.scripts[? $"{charmName}_worldmap"]);