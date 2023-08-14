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

if type == "left"
{
x = parid.x+8
y = parid.bbox_top+8
}

if type == "right"
{
x = parid.x+(parid.image_xscale*16)-8
y = parid.bbox_top+8
}

if type == "railleft"
{
x = parid.x
y = parid.bbox_top+4
}

if type == "railright"
{
x = parid.x+(parid.image_xscale*16)
y = parid.bbox_top+4
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
