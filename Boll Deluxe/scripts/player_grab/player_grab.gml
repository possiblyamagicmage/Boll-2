function player_grab(){
    if (bkey && grabbed_obj == noone) {
        var grabbing = collision_line(x, y, x + (hit_sizex*xsc)+hsp+(2*move), y, oGrabbable, false, true) 
        if (grabbing) {
            grabbed_obj = grabbing
			is_grabbing = true
            grabbing.grabbed = true
        }
    }
    
    if (grabbed_obj != noone) {
        grabbed_obj.x = x + (12 * xsc) - (1 * xsc == -1)
        grabbed_obj.y = y
        grabbed_obj.grabbed = true
		is_grabbing = true
        
        if (!bkey) {
            grabbed_obj.onThrown.Emit(id);
			sig.Emit("throw_object");
            
            grabbed_obj = noone
			is_grabbing = false
        }
    }
}