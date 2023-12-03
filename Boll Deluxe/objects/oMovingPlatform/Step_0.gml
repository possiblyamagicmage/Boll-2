dirchange=collision_rectangle(x-1,y-1,x,y,oDirectionChanger,false,true)
if (dirchange) {
	dir=dirchange.dir
}

x_prev = x;
y_prev = y;

switch (dir) {
	case "right": {
		x+=spd
		break;
	}
	case "left": {
		x-=spd
		break;
	}
	case "up": {
		y-=spd
		break;
	}
	case "down": {
		y+=spd
		break;
	}
}

x_diff = (x - x_prev);