#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viewh=view_hview[0]
vieww=view_wview[0]
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Reset view location
if keyboard_check_direct(vk_f2) {
    view_xview[0]=480
    view_yview[0]=256
    view_hview[0]=viewh
    view_wview[0]=vieww
}

if keyboard_check(vk_left) view_xview[0]-=2
if keyboard_check(vk_right) view_xview[0]+=2
if keyboard_check(vk_up) view_yview[0]-=2
if keyboard_check(vk_down) view_yview[0]+=2

view_hview[0]+=4*(keyboard_check(187)-keyboard_check(189))
view_wview[0]+=8*(keyboard_check(187)-keyboard_check(189))
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
