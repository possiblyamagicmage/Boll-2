// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_grab(){
    if (bkey && grabbed_obj == noone) {
        var awesome = collision_line(x,y,x +((hit_sizex + 2) * move_dir),y, oGrabable, false, true) 
        if (awesome && variable_instance_exists(awesome, "grabbed")) {
            grabbed_obj = awesome
            awesome.grabbed = true
        }
    }
    
    if (grabbed_obj != noone) {
        grabbed_obj.x = x + (xsc * (16))
        grabbed_obj.y = y
        grabbed_obj.grabbed = true
        
        if (!bkey) {
            if (up) {
                grabbed_obj.vsp = -6
                grabbed_obj.hsp = hsp
            } else if (down) {
                grabbed_obj.vsp = 0
                grabbed_obj.hsp = 0
            } else {
                grabbed_obj.vsp = -1
                grabbed_obj.hsp = (xsc * 3)
            }
            
            grabbed_obj.grabbed = false
            grabbed_obj = noone
        }
    }
}