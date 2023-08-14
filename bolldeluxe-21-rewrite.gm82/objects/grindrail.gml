#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemon{
    if place_meeting(x,y,lemons) {
        if !instance_exists(lemonshorizontalslider){
            slider = instance_create(x,bbox_top+4,lemonshorizontalslider)
            slider.type = "railleft"
            slider.parid = id
            slider = instance_create(x+(image_xscale*16),bbox_top+4,lemonshorizontalslider)
            slider.type = "railright"
            slider.parid = id
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,bbox_left-16,y) //left
draw_sprite_tiled_area(sprite_index,1,0,0,x,y,x+(image_xscale*16),y+16) //middle
draw_sprite(sprite_index,2,bbox_right,y) //right

if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
