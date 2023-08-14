#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
type = ""
//Im expanding your MOM -cubie
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,lemons) image_index = fr+4
else
image_index = fr

if type = "basic"
{
    switch fr
    {
    case 0: x = parid.bbox_left y = parid.bbox_top break;
    case 1: x = parid.bbox_right y = parid.bbox_top break;
    case 2: x = parid.bbox_left y = parid.bbox_bottom break;
    case 3: x = parid.bbox_right y = parid.bbox_bottom break;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
