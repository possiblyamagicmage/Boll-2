///@description Animation Controller
if (passive) {
	sprite_index=spr_polarbearwalk
	if (turning) {
		sprite_index=spr_polarbearturn
	}
} else {
	if (hurt) {
		sprite_index=spr_polarbearhit
		if image_index>=5
		image_index=1
	} else if (dashduration) {
		sprite_index=spr_polarbearbash
	} else if (upset_walk) {
		sprite_index=spr_polarbearwalk_upset
		if (turning) {
			sprite_index=spr_polarbearturn_upset
		}
	}
}