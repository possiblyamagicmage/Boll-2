///@description Animation Controller

if (turning) {
	sprite_index=spr_shyguy_turn
} else if (stun) {
	if (stun > 30) {
		sprite_index=spr_shyguy_stun
	} else {
		sprite_index=spr_shyguy_getup
	}
} else {
	sprite_index=spr_shyguy_walk
}