var coll=instance_place(x+hsp,y,oCollider)
if (coll) && !(coll.no_collide) && (coll != spawn_object) {
	instance_destroy();
}