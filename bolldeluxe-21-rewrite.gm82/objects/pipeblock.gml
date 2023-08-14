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
rot = wrap_val(rot,0,270)

inst=instance_nth_nearest(x,y,pipeblock,128)
targety = inst.y
targetx = inst.x

if global.lemon{
    if place_meeting(x,y,lemons){
        if !instance_exists(lemonsslider){
        slider = instance_create(x,bbox_bottom,lemonsslider)
        slider.type = "pipe"
        slider.parid = id
        }
        if !instance_exists(lemonsrotator){
        slider = instance_create(bbox_left,bbox_top,lemonsrotator)
        slider.type = "pipe"
        slider.fr = 0
        slider.parid = id
        slider = instance_create(bbox_right,bbox_top,lemonsrotator)
        slider.type = "pipe"
        slider.fr = 1
        slider.parid = id
        }
    }
}

rot=round(rot)
image_angle = rot
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,xsc,ysc,rot,c_white,1)
dy=0

repeat(image_yscale-1){
    dy+=1
    //Draw the rest of the pipe in here this
    switch(rot)
    {
    case 0:
    case 90: draw_sprite_ext(spr_pipetiler,0,x+(dy*16*(rot==90)),y+(dy*16*(rot==0)),xsc,ysc,rot,c_white,1) break;
    case 180:
    case 270: draw_sprite_ext(spr_pipetiler,0,x-(dy*16*(rot==270)),y-(dy*16*(rot==180)),xsc,ysc,rot,c_white,1) break;
    }
}



if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
//inst=instance_nth_nearest(x,y,pipeblock,128)
//draw_line(x,y,inst.x,inst.y)
