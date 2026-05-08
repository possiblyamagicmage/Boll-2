var player_over = false;
with(oPlayer) {
	if (collision_rectangle(x-hit_sizex,y-hit_sizey,x+hit_sizex,y+hit_sizey,other,false,false)) {
		player_over = true;
		if (up) && !(other.is_talking) {
			other.is_talking = true;
			other.temptext="";
		}
	}
}

over = player_over

if (is_talking) {
	talking_pause--;
	
	if !(talking_pause) {
		var char = string_char_at(text,textcount);
	
		temptext += char
	
		var pause;
	
		switch(char) {
			case ",": pause=5 break;
			default: pause=2 break;
		}
	
		talking_pause = pause
	
		textcount++
	
		if (textcount > string_length(text)) {
			is_talking=false;
			text_leftover=text_leftover_max;
			textcount=1;
		}
	}
} else {
	text_leftover=max(text_leftover-1,0);
}