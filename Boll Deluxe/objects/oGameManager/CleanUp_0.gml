surface_free(HUDsurface)
var i=0;
repeat (array_length(playerPalettes)) {
	sprite_delete(playerPalettes[i]);
	i++;
}
instance_destroy(oBackgroundManager);
PlayerColl.Clear();
PlayerColl.Destroy();
delete PlayerColl;
CustomColl.Clear();
CustomColl.Destroy();
delete CustomColl;

VinylMixVoicesStop("music")
VinylMixVoicesStop("sound effects")
with(oPlayer) {
	var dir=$"{working_directory}\\_vanilla\\character\\{charmName}\\sfx\\"
	var i=0;
	repeat (array_length(sound_list)) {
		if VinylPatternExists($"{charmName}{sound_list[i]}") {
			VinylUnloadExternal($"{charmName}{sound_list[i]}")
		}
		i++;
	}
}