#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=0
xsc=1
ysc=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemon{
    if place_meeting(x,y,lemons) || collision_rectangle(x+((image_xscale*16)/2)-7,y,x+((image_xscale*16)/2)+7,bbox_bottom+ysize*16,lemons,false,true){
        if !instance_exists(lemonsverticalslider){
            slider = instance_create(x+((image_xscale*16)/2),(bbox_bottom+ysize*16)-7,lemonsverticalslider)
            slider.type = "mushroomstem"
            slider.parid = id
            slider = instance_create(x,bbox_top,lemonshorizontalslider)
            slider.type = "left"
            slider.parid = id
            slider = instance_create(x+(image_xscale*16),bbox_top,lemonshorizontalslider)
            slider.type = "right"
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
dy=0

draw_sprite(sprite_index,0,x,y) //left
draw_sprite_tiled_area(sprite_index,1,0,0,x+16,y,x+((image_xscale-1)*16),y+16) //middle
draw_sprite(sprite_index,2,x+((image_xscale-1)*16),y) //right

repeat(ysize-1){
    dy+=1
    //Draw the rest of the mushroom stalk in here this
    //depth=10+(-y/16)
    draw_sprite_ext(spr_mushroomtiler,(dy>1),x+((image_xscale*16)/2),y+(dy*16),xsc,ysc,rot,c_white,1)
}


if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
