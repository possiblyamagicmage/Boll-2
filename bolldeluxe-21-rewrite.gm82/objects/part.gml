#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=0.2
alarm[0]=60
alarm[1]=15
xsc=1
ysc=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Decay

if image_alpha<=0
instance_destroy()
else {image_alpha-=0.1 alarm[0]=1}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Turn Angle
image_angle += 90
alarm[1] = 15
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_brickpart,0,x,y)
