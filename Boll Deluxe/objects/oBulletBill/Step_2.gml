var coll=instance_place(x+hsp,y,oCollider)
if (coll) && !(coll.no_collide) && !(coll.semi) && (coll != spawn_object) {
	instance_destroy();
}