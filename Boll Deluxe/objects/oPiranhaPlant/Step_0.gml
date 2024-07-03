if (parent_pipe == -1) exit

if !(go) {
	timer=max(0,timer-1)

	if !(timer) {
		if (exposed) {
			go=-1
		} else {
			go=1
		}
	} 
}

if (go != 0) {
	travel+=go
	travel=clamp(travel,-32,32) //i genuinely dont know why this is nessecary considering approach_val should already clamp
	
	if !place_meeting(x,y,parent_pipe) && !(exposed) {
		exposed=true;
		y=parent_pipe.bbox_top;
		timer=60;
		go=0;
	} else if y==parent_pipe.bbox_bottom-1 && (exposed) {
		exposed=false;
		timer=120;
		go=0;
	}
}

y=floor(parent_pipe.bbox_bottom-1)-travel
x=parent_pipe.x