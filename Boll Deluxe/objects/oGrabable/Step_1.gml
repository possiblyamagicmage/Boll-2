/// @description Insert description here
// You can write your code in this editor
if (grab_delay == 0) {
    no_collide = false
}

if grabbed{
    no_collide = true
    bounce = true
    grab_delay = 8
}

if vsp != 0 {
    bounce_speed = vsp
}