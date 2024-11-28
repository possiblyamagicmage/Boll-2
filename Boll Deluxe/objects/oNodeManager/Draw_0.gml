for (var i = 0; i < ds_list_size(objectNodesList); ++i) {
	var pathing=objectNodesList[| i][0]
	var length=array_length(pathing);
	if is_array(pathing) && length > 1 {
		for (var j = 0; j < length-1; ++j) {
		    var arr=pathing[j+1]
			var arr2=pathing[j]
			var ysc=(point_direction(arr[0],arr[1],arr2[0],arr2[1]) >= 180) ? -1 : 1
			draw_sprite_ext(spr_track,0,arr[0],arr[1],point_distance(arr[0],arr[1],arr2[0],arr2[1]),ysc,point_direction(arr[0],arr[1],arr2[0],arr2[1]),c_white,1);
		}
		
		if (objectNodesList[| i][1]) {
			if !(objectNodesList[| i][2]) {
				draw_sprite(spr_trackstop,0,pathing[length-1][0],pathing[length-1][1])
			}
			draw_sprite(spr_trackstop,0,pathing[0][0],pathing[0][1])
		} else {
			if !(objectNodesList[| i][2]) {
				var arr=pathing[length-1]
				var arr2=pathing[0]
				var ysc=(point_direction(arr[0],arr[1],arr2[0],arr2[1]) >= 180) ? -1 : 1
				draw_sprite_ext(spr_track,0,arr[0],arr[1],point_distance(arr[0],arr[1],arr2[0],arr2[1]),ysc,point_direction(arr[0],arr[1],arr2[0],arr2[1]),c_white,1);
			}
			if (objectNodesList[| i][2]) {
				draw_sprite(spr_trackstop,0,pathing[0][0],pathing[0][1])
			}
		}
	}
}