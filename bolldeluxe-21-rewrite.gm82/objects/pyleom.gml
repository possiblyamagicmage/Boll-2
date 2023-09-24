#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (abs(nearestplayer().x-x)<64) inrange=true
else inrange=false

if !(inrange) || (refill) {
    if (ammo!=32) {
        stop_moving=1
        ammo=approach_val(ammo,32,0.5)
    }
    else {stop_moving=0 refill=0}
    shoottimer=64
}
else {
    stop_moving=1
    ammo=approach_val(ammo,0,0.1)
    shoottimer=approach_val(shoottimer,0,1)

    if !(shoottimer) && (ammo){
        i=instance_create(x,y,pyleomspike)
        i.hsp=-1*xsc
        shoottimer=64
    }

    if !(ammo) refill=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lemon_destroy()
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Lemon Reactivation
event_inherited()
hp=1
kidhp=4
edgeturn=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ammo)
draw_sprite_part_ext(spr_pyleomstack,0,0,0,16,floor(ammo),floor(x)-6,floor(y)-8-floor(ammo),xsc,ysc,c_white,0)

event_inherited();

draw_text(x,y,ammo)
