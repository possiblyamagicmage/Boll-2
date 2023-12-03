/// global helper functions

function obj_place_meeting(src,x,y,obj)
{
	var meet = false;
	
	with(src)
	{
		meet = place_meeting(x,y,obj);
	}
	
	return meet;
}