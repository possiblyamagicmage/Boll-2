#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
type = ""
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,lemons) image_index = 1
else
image_index = 0

if type = "pipe"
{
    switch round(parid.rot)
    {
    case 0: x = parid.x y = parid.bbox_bottom image_angle = 0  break;
    case 90: y = parid.y x = parid.bbox_right image_angle = 90 break;
    case 180: x = parid.x y = parid.bbox_top image_angle = 0 x+=1 break;
    case 270: y = parid.y x = parid.bbox_left image_angle = 90 y-=1 break;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
