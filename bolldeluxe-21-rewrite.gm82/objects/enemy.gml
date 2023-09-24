#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x,y,lemonstile)
i.myobject=id
//Basically the actual create event v
event_user(1)//This is here for the sake of having the enemy reset when unpausing lemon
#define Step_1
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
if inactive{
    exit
}

if hp <= 0{
    event_user(0)
}

//help,,,
if (!damage_on_contact)
{
    //Reduced this.
    if place_meeting(x,y-1,player) && !phaseid && round(instance_place(x,y-1,player).vsp) > 0 && !(instance_place(x,y-1,player).hurt) && !(place_meeting(x-1,y,player) && place_meeting(x+1,y,player) && instance_place(x,y,player).grounded)
    {
        if (!no_stomping) hp-=1

        phaseid=instance_place(x,y-1,player)
        phaseid.vsp=-4-phaseid.akey*1.5

        exit
    }
    if (phaseid) && !place_meeting(x,y,phaseid) phaseid=0
}

if place_meeting(x+hsp,y,player)
{
with(instance_place(x,y,player)) if !hurt knockplayer()
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemonpause || inactive exit

if !place_meeting(x,y+1,collider)
{
vsp += grav;
}
else
{
vsp=0
}

//Landing variables
if (place_meeting(x,y+1,collider))
{
grounded=1
}
else
grounded=0

coll = instance_place(x+hsp, y-yPlus,enemy)

if(coll) && !(coll.inactive){
        hsp = -hsp;
}

if (place_meeting(x+hsp,y,collider)){
    yPlus = 0;
    while(place_meeting(x+hsp,y-yPlus,collider) && yPlus <= abs(2*hsp)){
        yPlus +=1;
    }
    if(place_meeting(x+hsp, y-yPlus,collider)){
        while(!place_meeting(x+sign(hsp),y,collider)){
            if !(stop_moving) x += sign(hsp);
        }
        hsp = -hsp;
    }
    else{
        y -= yPlus;
    }
}
else{
    yMinus = 0;
    while(!place_meeting(x+hsp,y+yMinus,collider) && yMinus <= abs(1*hsp)){
        yMinus +=1;
    }
    //still not sure why exactly this needs to be here, but it does for math reasons.
    yMinus -= 1;

    //if there is a place of meeting at yMinus (speed+1) but not at yMinus (speed) AND we're already on the ground, move down
    if(place_meeting(x+hsp, round(y+yMinus)+1,collider) && !place_meeting(x+hsp, round(y+yMinus),collider) && place_meeting(x, y+1,collider)) {
        y = round(y+yMinus);
    }
}

if !(stop_moving) x += hsp;

if (place_meeting(x,y+vsp,collider)){
    while(!place_meeting(x,round(y+sign(vsp)),collider)){
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (edgeturn) && !(turned) && !collision_rectangle(floor(x)+8*sign(hsp),floor(y)+8,floor(x)+9*sign(hsp),floor(y)+9,collider,true,true)
{
turned=1
hsp=-hsp
}

if collision_rectangle(floor(x)-9,floor(y)+8,floor(x)+9,floor(y)+9,collider,true,true) turned=0

if(!place_meeting(x,round(y),collider)){
    y=round(y);
}

if hsp != 0 xsc=-esign(hsp,-1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lemon_destroy()
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Lemon Reactivation
hp=4 // how many times the player can stomp/damage them, could be useful for things like rexes, or some weird crazy bosses.
kidhp=4 // how many kid bullets it takes to kill the enemy
damage_on_contact=0 // this already exists, will hurt the player if they collide with it at all, making it impossible to kill, unless you have a star. if its = 2 it would be invincible to stars aswell.
no_stomping=0 // this would make it so that the enemy wouldnt lose hp/die when being stomped, so it would make it kinda act like an ant trooper from 3d world
edgeturn=0 // this basically just makes it turn on an edge like a red koopa/goombrat
stop_moving=0 // step variable, this makes it so hsp just. doesnt work when activated
hsp=-0.5
vsp=0
grav=0.25
rot=0
xsc=1
ysc=1
x=xstart
y=ystart
image_speed=0.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemon && object_index != shell {
draw_sprite_ext(sprite_index,0,xstart,ystart,1,1,rot,c_white,0.25+0.75*global.lemonpaused)
if inactive||global.lemonpaused exit
}

if inview()
{
draw_sprite_ext(sprite_index,image_index,floor(x),floor(y),xsc,ysc,rot,image_blend,image_alpha)
}
