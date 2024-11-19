if is_array(pathing) && (pathspd) { //prevent crashing & a slight optimization
	var arr=pathing[pathnum];
	
	if (arr[2])
	{
		// curved path, handle special behavior
		var dir=point_direction(pathing[pathprenum][0],
								pathing[pathprenum][1],
								arr[0],
								arr[1]);
		
		// first, get the x and y path distances
		var pathx, pathy;
		
		pathx = arr[0] - pathing[pathprenum][0];
		pathy = arr[1] - pathing[pathprenum][1];
		
		show_debug_message(pathy);
		
		// this is very, very dumb
		x+=lengthdir_x(pathspd,dir);
		
		// prevent X from overshooting
		x=median(x,pathing[pathprenum][0],arr[0]);
		
		// get the x difference
		var xdiff;
		
		xdiff = abs(x - pathing[pathprenum][0]);
		
		// do circular easing on the y movement
		var curvey = easeMovement(xdiff,max(1,abs(pathx))) * pathy;
		
		// clamp y instead of finding the median point
		
		var top, bttm, temp;
		
		top = pathing[pathprenum][1];
		bttm = arr[1];
		
		// clamp is dumb; if our bottom is above our top, swap the values
		if (bttm < top)
		{
			temp = bttm;
			bttm = top;
			top = temp;
		}
		
		// FINALLY set the Y value
		y = clamp(pathing[pathprenum][1] + curvey,
				  top,
				  bttm);
	}
	else
	{
		var dir=point_direction(x,y,arr[0],arr[1]);
		x+=lengthdir_x(pathspd,dir); //move towards the next node
		y+=lengthdir_y(pathspd,dir);
		x=median(x,pathing[pathprenum][0],arr[0]); //prevent overshooting
		y=median(y,pathing[pathprenum][1],arr[1]);
	}
	
	if !floor(point_distance(x,y,arr[0],arr[1])) { //check if we've reached our destination
		x=arr[0]; //snap to our destination just in case we misalign by a margin
		y=arr[1];
		pathprenum=pathnum;
		if !(pathisrev) {
			if ((array_length(pathing)-1) > pathnum) {
				pathnum++ //if there is another node in our path, continue on
			} else {
				if (pathcanrev) { //can we reverse our pathing?
					pathisrev=true;
					pathnum--; //we have reversed direction, go backwards in our pathing
				} else {
					pathspd=0; //stop running the path code, because why would we? we've stopped.
				}
			}
		} else {
			if (pathnum==0) { //if we have reached the beginning
				pathisrev=false;
				pathnum++; //we have reversed direction, go forwards in our pathing
			} else { //if not, then continue
				pathnum--;
			}
		}
	}
}