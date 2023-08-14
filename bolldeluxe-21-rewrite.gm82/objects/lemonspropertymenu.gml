#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
objname=ds_map_find_value(lemons.lemonnamelist, sourceobj.object_index)
image_yscale = 1+ds_map_find_value(lemons.lemonargname, sourceobj.object_index)

if !instance_exists(sourceobj)
instance_destroy();

//Click arguments
if(mouse_check_button_pressed(mb_left)) {
    var mmx;
    mmx=mouse_x;
    var mmy;
    mmy=mouse_y;

    for (var i; i < image_yscale-1; i+=1) {
        if (mmx > x && mmy < y+(i*16)+32 ) {
            if(mmx < bbox_right && mmy > y+(i*16)+15) {
                selected=i+1
                sourceobj.data[i]=!sourceobj.data[i]
            }
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
max_width = round((string_width(objname))/8)
draw_set_color(c_red)
draw_arrow(x,y,sourceobj.x,sourceobj.y,8)
draw_set_color(c_white)

draw_rect(x,y+16,image_xscale*8,1,c_white,1)

repeat (image_yscale-1) {
    dy+=1

    var nametext;
    nametext = lemons.argnamelist[sourceobj.object_index,dy]

    if round((string_width(nametext))/8) > round((string_width(objname))/8) && round((string_width(nametext))/8) > max_width
    max_width = round((string_width(nametext))/8)+2

    draw_sprite(spr_lemondropmenuleft,1,x,y+(dy*16)) //left
    draw_sprite_stretched(spr_lemondropmenumiddle,1,x+8,y+(dy*16),(image_xscale-2)*8,16) //middle
    draw_sprite(spr_lemondropmenuright,1,x+((image_xscale-2)*8),y+(dy*16)) //right

    draw_set_color(c_black)
    draw_text(x+4,y+(dy*16),nametext)
    draw_set_color(c_white)
    draw_rect(x,y+(dy*16)+16,image_xscale*8,1,c_white,1)
}
image_xscale = 2+max_width

draw_sprite(spr_lemondropmenuleft,0,x,y) //left
draw_sprite_stretched(spr_lemondropmenumiddle,0,x+8,y,(image_xscale-2)*8,16) //middle
draw_sprite(spr_lemondropmenuright,0,x+((image_xscale-1)*8)-8,y) //right

if (selected)
{
draw_set_alpha(0.25)
draw_rectangle_color(x,y+((selected-1)*16)+16,bbox_right,y+((selected-1)*16)+31,c_yellow,c_yellow,c_yellow,c_yellow,false)
draw_set_alpha(1)
}

draw_set_font(font0)
draw_set_color(c_black)
draw_text(x+4,y,objname)
draw_set_color(c_white)

dy=0
