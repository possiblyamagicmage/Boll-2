if room!=rLDTKload
parse_level(global.nextlevel)
global.player_spritelists[0][0]="";
if room==rLDTKload||room==rGame {
	PlayerColl=new Collage("Players", 4096, 4096, false, 1, true)
	import_sheets();
}

global.warptimer=0;
global.yellow_switch=0;
global.cyan_switch=0;
global.magenta_switch=0;