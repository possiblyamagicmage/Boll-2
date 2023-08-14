#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
myscript=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,lemons) && mouse_check_button_pressed(mb_right)
{
event_user(0)
}

if !global.lemonpause
customobject_load(myscript,x/16,"step")
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///load custom object
myscript=search_return_file(".gml")

if !global.lemonpause
customobject_load(myscript,x/16,"create")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lemonpause) draw_self()

if !global.lemonpause
customobject_load(myscript,x/16,"draw")
