///@description Empty Contents on break
var j = noone;
switch (content) {
	case "coin": {
		j= oCoin
	} break;
	
	case "mushroom": {
		j = oMushroom;
	} break;
	
	case "fireflower": {
		j = oFireFlower;
	} break;
	
	case "thunderflower": {
		j = oThunderFlower;
	} break;
    
    case "star": {
        j = oStar;
    } break;	
    
    case "1up": {
        j = o1up;
    } break;
    
    case "3up": {
        j = o3up;
    } break;
	
	case "mysteryorb": {
        j = oMysteryOrb;
    } break;
	
	default: exit;
}

var i = instance_create_depth(x,y,0,j);

instance_create_depth(x,y,0,pSmoke)
instance_destroy();