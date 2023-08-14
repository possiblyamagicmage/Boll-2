#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat(image_yscale){
    dy+=1
    //Draw the rest of the mushroom stalk in here this
    depth=10+(-y/16)
    draw_sprite_ext(sprite_index,(dy>1),x+((image_xscale*16)/2),y+(dy*16),xsc,ysc,rot,c_white,1)
}
