#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orbit_speed = 2.5;
orbit_length = 64;
orbit_angle = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//orbit_angle = wave_val(0,-180,orbit_speed,0)
if global.lemonpause exit

//rotat += rot_spd;
//this needs to be turned into a targetx and y later
x=((xstart-8) + lengthdir_x(orbit_length, orbit_angle))
y=(ystart + lengthdir_y(orbit_length, orbit_angle))

///dude i just give up on this shit
coll = instance_place(x+hsp,y,player)

totalvsp = abs(vsp)

coll = instance_place(x,yprevious-(totalvsp+1),player)

if coll
{
    //with(coll) if place_meeting(x+other.hsp,y,collider) exit
    //coll.x += hsp; idfk
    coll.y = (bbox_top-1)-(coll.bbox_bottom+1-coll.bbox_top)
}

//orbit_angle+=orbit_speed
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xx=xstart-8 yy=ystart+8
repeat ((orbit_length/16)+1) {
    draw_sprite(spr_swingplatchain,0,floor(xx),floor(yy))
    xx+=lengthdir_x(16,orbit_angle) yy+=lengthdir_y(16,orbit_angle)
}
draw_sprite(spr_swingplatchain,1,xstart-8,ystart+8)

/*if global.lemon {
draw_sprite_ext(sprite_index,0,xstart,ystart,1,1,rot,c_white,0.25+0.75*global.lemonpaused)
if inactive||global.lemonpaused exit
}*/

floordraw_self()

if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}

draw_text(x,y,hsp)
