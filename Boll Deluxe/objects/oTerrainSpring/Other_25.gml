switch(image_angle) {
	case 90:
	if place_meeting(x,y+2,[oCollider,oEnemyGround,oGrate]) {
		yoff=2;
	}
	case 180:
	image_xscale=-1;
	break;
	case 270:
	if place_meeting(x,y+2,[oCollider,oEnemyGround,oGrate]) {
		yoff=2;
	}
	break;
}