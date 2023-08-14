#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemon{
    if place_meeting(x,y,lemons){
        if !instance_exists(lemonsexpander){
        expander = instance_create(bbox_left,bbox_top,lemonsexpander)
        expander.type = "basic"
        expander.fr = 0
        expander.parid = id
        expander = instance_create(bbox_right,bbox_top,lemonsexpander)
        expander.type = "basic"
        expander.fr = 1
        expander.parid = id
        expander = instance_create(bbox_left,bbox_bottom,lemonsexpander)
        expander.type = "basic"
        expander.fr = 2
        expander.parid = id
        expander = instance_create(bbox_right,bbox_bottom,lemonsexpander)
        expander.type = "basic"
        expander.fr = 3
        expander.parid = id
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var dx, dy;
for (dx = 0; dx < image_xscale; dx += 1) {
    draw_sprite(sprite_index, 0, x + dx * 16, y);
    for (dy = 1; dy < image_yscale; dy += 1) {
        draw_sprite(sprite_index, 0, x + dx * 16, y + dy * 16);
    }
}
//i am dying about something that is a fucking placeholder

dx=0
dy=0

if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
