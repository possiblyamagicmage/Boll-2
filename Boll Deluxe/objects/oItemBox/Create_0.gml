event_inherited();
hitted=0;
content=Contents.Mushroom

image_hit = spr_emptybox
image_exausted = spr_emptybox
image_speed=1;
depth=-1
flash=0

blockFinished.Connect( self, function() {
	event_user(1);
	image_speed=0;
	sprite_index = image_exausted;
	image_index = 0;
	no_hit=true;
	if content != Contents.Coin && content != Contents.MultiCoins {
		VinylPlay(snd_itemappear);
	}
});

blockHit.Connect( self, function(hit_p, obj) {
	flash=bumpMax
});