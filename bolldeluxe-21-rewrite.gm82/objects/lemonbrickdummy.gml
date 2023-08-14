#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemonpause{
    if !paused {
        paused=1
    }
    exit
} else if paused && !global.lemonpause{ //Upon removing lemonpause (entering live editor)
    inactive=0
    paused=0
    event_user(1)
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,brick)
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if inview()
{
    if global.lemon {
    draw_sprite_ext(sprite_index,0,xstart,ystart,1,1,rot,c_white,0.25+0.75*global.lemonpaused)
    if inactive||global.lemonpaused exit
    }
}
