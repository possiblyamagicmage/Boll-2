#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemonpause exit

if place_meeting(x,y+vsp, collider) //TEMP
{
vsp=-vsp
}

if place_meeting(x+hsp,y, collider) //TEMP
{
hsp=-hsp
}

coll = instance_place(x+hsp,y,player)

if place_meeting(x+hsp,y,player)
{
//with(coll) if place_meeting(x+other.hsp,y,collider) crushplayer()

coll.x += hsp
}

x+=hsp
y+=vsp

coll = instance_place(x,y-1,player)

if coll && (coll.vsp >= 0)
{
with(coll) if place_meeting(x+other.hsp,y,collider) exit

coll.x += hsp
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemon {
draw_sprite_ext(sprite_index,0,xstart,ystart,1,1,rot,c_white,0.25+0.75*global.lemonpaused)
if inactive||global.lemonpaused exit
}

floordraw_self()

if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
