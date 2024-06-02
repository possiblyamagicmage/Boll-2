var coll = instance_place(x,y,oHardBlock)
if (coll) {
	with (coll)
	{
		 instance_destroy();
		 //var i=instance_create(x+4,y+12,part) with(i){type=4 hspeed=-1 vspeed=-1+2*go}
		 //var i=instance_create(x+12,y+12,part) with(i){type=4 hspeed=1 vspeed=-1+2*go}
		 //var i=instance_create(x+4,y+4,part) with(i){type=4 hspeed=-1 vspeed=-3+2*go}
		 //var i=instance_create(x+12,y+4,part) with(i){type=4 hspeed=1 vspeed=-3+2*go}
	}
}

var coll=instance_place(x,y,oCollider)
if (coll) && !(coll.no_collide) && !(coll.semi) && (coll != spawn_object) {
	instance_destroy();
}