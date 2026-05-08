var i=instance_create_depth(x,y,0,oCoin)
with (i) {
	pathing=other.pathing;
	pathprenum=other.pathprenum;
	pathnum=other.pathnum;
	pathspd=other.pathspd;
	pathcanrev=other.pathcanrev;
	pathisrev=other.pathisrev;
	pathfallen=other.pathfallen;
	pathcanfall=other.pathcanfall;
	pathdraw=other.pathdraw;
	pathstarted=other.pathstarted;
	rotdat=other.rotdat;
	rotangle=other.rotangle;
	rotdist=other.rotdist;
	rotorgx=other.rotorgx;
	rotorgy=other.rotorgy;
	rotspd=other.rotspd;
	rotating=other.rotating;
}
instance_destroy();