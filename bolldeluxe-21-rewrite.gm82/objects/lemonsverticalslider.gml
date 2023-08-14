#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
type = ""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,lemons) image_index = 1
else
image_index = 0

if type == "mushroomstem"
{
x = parid.x+((parid.image_xscale*16)/2)
y = (parid.bbox_bottom+(parid.ysize-1)*16)-7
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
