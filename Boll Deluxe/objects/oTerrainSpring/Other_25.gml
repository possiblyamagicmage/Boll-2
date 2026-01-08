switch(image_angle) {
	case 90:
	case 180:
	image_xscale=-1;
	if place_meeting(x,y+4,[oCollider,oEnemyGround,oGrate]) {
		yoff=2;
	}
	break;
	default: break;
}