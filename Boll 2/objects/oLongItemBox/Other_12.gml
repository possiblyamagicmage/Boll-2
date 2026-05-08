///@description Empty Contents on bump
switch (content) {
	case "coin": 
	case "multicoins": {
		var i=instance_create_depth(x,y,0,pCoinCollected)
		i.vspeed=3*hit
		i.gravity=0.15*-sign(i.vspeed)
		collect_coins(1);
	} break;
}
//extra coins
var i=instance_create_depth(x-16,y,0,pCoinCollected)
i.vspeed=3*hit
i.gravity=0.15*-sign(i.vspeed)
var i=instance_create_depth(x+16,y,0,pCoinCollected)
i.vspeed=3*hit
i.gravity=0.15*-sign(i.vspeed)
var playsound = bool(content!="coin" && content!="multicoins")  //prevent sound overlap
collect_coins(2,playsound);