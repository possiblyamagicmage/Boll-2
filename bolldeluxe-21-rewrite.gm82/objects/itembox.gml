#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemonpause||inactive exit

if place_meeting(x,y+1,player) && !(player.grounded) && !(hitted) { //temp state check
event_user(0)
player.vsp = 2
hitted=1
}


if (hitted)
{
if (hit != 0)
{
spd+=0.5
dy = approach_val(dy,8*sign(hit),1.5+spd) //hit -1 is up, hit 1 is down
image_index=1
}
else
{
spd=0
dy = approach_val(dy,0,1)
image_index=2
}
}
else
{
image_index=0
}

if abs(dy) == 8 hit = false
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Lemons reload
dy=0
hit=false;
image_speed=0;
spd=0
image_index=0
hitted=0;
