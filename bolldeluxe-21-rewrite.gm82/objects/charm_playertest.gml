#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;

name="sonic"

///These should all be moved to charm v
defaultgrav = 0.25; //for resetting gravity back to default
grav=defaultgrav //we're having an actual grav var now because changing gravity should be EASIER!!
maxspd = 0; //gets overwritten in step event
accel =0.06; //how fast you gain speed
defaultfric = 0.3; //friction, slipperiness
fric = defaultfric;
maxspd = 0; //gets overridden in step event
accel =0.06; //how fast you gain speed
size = 1;
star = 0; //do not use size 4 for stars anymore that is kinda Bitch mode
//why is it called starred, the og game just uses star //uhh Whoops i didnt know lol - cubie
vsp=0
hsp=0

move=0 //placeholder

xsc=1
ysc=1
rot=0
fr=0

realjump = 0;
canjump = 0;
bufferjump = 0;
wallbuffer = 0;
move_lock = false; //prevent player from moving, like piped
piped = false;
grounded = false;
dead = 0;
carrying = 0;
run=0;
wf=1;

sprite=""
oldspr=""
fallspr=""

charm_applyskin(working_directory+"\vanilla\character\sonic\",0) 

windowscale=3;

antigrav = false;
canstopjump=0;
jump=0

window_set_cursor(cr_none)

//this should be all moved to an options screen later
window_set_size(480*windowscale,270*windowscale)

if !window_get_fullscreen()
{
    window_center();
}

viewh=view_hview[0]
vieww=view_wview[0]

input_keysinit()
charm_init()

charm_run("start")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
input_get(-1)


charm_run("controls")
charm_run("movement")
charm_run("actions")

view_hview[0]+=4*(keyboard_check(ord("1"))-keyboard_check(ord("2")))
view_wview[0]+=8*(keyboard_check(ord("1"))-keyboard_check(ord("2")))

if keyboard_check(ord("3"))
{
view_hview[0]=viewh
view_wview[0]=vieww
}

if y > room_height+16
{
x=xstart
y=ystart
}
windowscale = clamp(windowscale,2,4)


if keyboard_check_pressed(107) || keyboard_check_pressed(187)
{
windowscale+=1
window_set_size(480*windowscale,270*windowscale)
window_center();
}

if keyboard_check_pressed(189)
{
windowscale-=1
window_set_size(480*windowscale,270*windowscale)
window_center();
}

if global.lemonpause {
    if !paused {
        paused=1
    }
if left && !right x-=2
if right && !left x+=2
if up && !down y-=2
if down && !up y+=2
exit}

//player_camera(0)
draw_player(1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.debug) draw_rect(bbox_left,bbox_top,bbox_right-bbox_left+1,bbox_bottom-bbox_top+1,$ffffff,1)
/*frn=global.animdat[p2,k+1+min(4,size)] //frame number
if (frame<0) frame+=1
if (frame>=frn) {frame=frame-frn if (frl<frn) frame+=frl}*/
//Here follows the -S- dumb bitch extravaganza
//Animation system, initialized within charm_applyskin.

draw_player(0)







//draw_sprite_part_ext(sheets[size],0,8+(floor(frm)*48),128+(sid*48),47,47,round(x)-(24*xsc),round(y)-26,xsc,ysc,c_white,image_alpha)

//this will probably be merged int oa script
