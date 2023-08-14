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

if image_yscale < 2 image_yscale=2

if global.lemon{
    if place_meeting(x,y,lemons){
        if !instance_exists(lemonsslider){
        slider = instance_create(x,bbox_bottom,lemonsslider)
        slider.type = "pipe"
        slider.parid = id
        }
        if !instance_exists(lemonsrotator){
        slider = instance_create(bbox_left+9,bbox_top,lemonsrotator)
        slider.type = "pipe"
        slider.fr = 0
        slider.parid = id
        slider = instance_create(bbox_right-8,bbox_top,lemonsrotator)
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
if !place_meeting(x,y-1,clearpipebend)
draw_sprite_ext(sprite_index,0,x,y,xsc,ysc,rot,c_white,1)
else
draw_sprite_ext(spr_clearpipetiler,0,x,y,xsc,ysc,rot,c_white,1)

dy=0

repeat(image_yscale-2+place_meeting(x+(-1*rot==270)+(1*rot==90),y+(-1*rot==0)+(1*rot==180),clearpipebend)){
    dy+=1
    //Draw the rest of the pipe in here this
    switch(rot)
    {
    case 0:
    case 90: draw_sprite_ext(spr_clearpipetiler,0,x+(dy*16*(rot==90)),y+(dy*16*(rot==0)),xsc,ysc,rot,c_white,1) break;
    case 180:
    case 270: draw_sprite_ext(spr_clearpipetiler,0,x-(dy*16*(rot==270)),y-(dy*16*(rot==180)),xsc,ysc,rot,c_white,1) break;
    }
}
if !place_meeting(x+(-1*rot==270)+(1*rot==90),y+(-1*rot==0)+(1*rot==180),clearpipebend) {
switch(rot)
    {
    case 0: draw_sprite_ext(spr_clearpipe,0,x+(image_yscale*16*(rot==90))-1,y+(image_yscale*16*(rot==0))-1,-1,ysc,rot+180,c_white,1) break;
    case 90: draw_sprite_ext(spr_clearpipe,0,x+(image_yscale*16*(rot==90))-1,y+(image_yscale*16*(rot==0))+1,1,1,rot+180,c_white,1) break;
    case 180: draw_sprite_ext(spr_clearpipe,0,x-(image_yscale*16*(rot==270))+1,y-(image_yscale*16*(rot==180))+1,-1,-1,rot+180,c_white,1) break;
    case 270: draw_sprite_ext(spr_clearpipe,0,x-(image_yscale*16*(rot==270))+(1*image_yscale==2),y-(image_yscale*16*(rot==180))-1,-1,ysc,rot+180,c_white,1) break;
    }
}


if global.lemon{
    if place_meeting(x,y,lemons){
        cursor = instance_place(x,y,lemons)
        if cursor.image_index != 3 cursor.image_index = 2
        draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,3)
    }
}
