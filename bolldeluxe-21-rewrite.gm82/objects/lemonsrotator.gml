#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
type = ""
image_index=fr
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,lemons) image_index = fr+2
else
image_index = fr

switch (parid.rot)
{
case 0: if fr=0 x = parid.bbox_left+9 else x = parid.bbox_right-8 y = parid.y break;
case 90: if fr=1 y = parid.bbox_top+9 else y = parid.bbox_bottom-8 x = parid.x break;
case 180: if fr=1 x = parid.bbox_left+9 else x = parid.bbox_right-8 y = parid.bbox_bottom break;
case 270: if fr=0 y = parid.bbox_top+9 else y = parid.bbox_bottom-8 x = parid.bbox_right break;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///rotate the pipe
if fr = 0
switch round(parid.rot)
{
case 0: parid.rot = 90 parid.y += 15 parid.x-=16 parid.xsc=-1 break;
case 90: parid.rot = 180 parid.y += 16 parid.x += 15 parid.xsc=-1 break;
case 180: parid.rot = 270 parid.y-=15 parid.x += 16 parid.xsc=1 break;
case 270: parid.rot = 0 parid.y -= 16 parid.x -= 15 parid.xsc=1 break;
}
else
switch round(parid.rot)
{
case 0: parid.rot = 270 parid.y+=16 parid.x += 15 parid.xsc=1 break;
case 90: parid.rot = 0 parid.y -= 15 parid.x +=16 parid.xsc=1 break;
case 180: parid.rot = 90 parid.y -= 16 parid.x-=16 parid.xsc=-1 break;
case 270: parid.rot = 180 parid.y +=15 parid.x -= 15 parid.xsc=-1 break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
