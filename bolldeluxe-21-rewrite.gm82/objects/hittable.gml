#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(1)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if instance_exists(mycoll) with(mycoll) instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemonpause||inactive exit

if place_meeting(x,y+1,player) && ((!instance_place(x,y+1,player).grounded && instance_place(x,y+1,player).vsp > 0) || (instance_place(x,y+1,player).jump))  { //temp state check
event_user(0)
player.vsp = 2
}

if (hit != 0)
{
spd+=0.5
dy = approach_val(dy,8*sign(hit),1.5+spd) //hit -1 is up, hit 1 is down
}
else
{
spd=0
dy = approach_val(dy,0,1)
}

if abs(dy) == 8 hit = false
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit = -1;
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if inview() draw_sprite(sprite_index,image_index,x,y+dy)

if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
