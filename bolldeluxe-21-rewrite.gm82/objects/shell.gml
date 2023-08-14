#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemonpause{
    instance_destroy()
}

if inactive{
    exit
}

switch type
{
case "green": sprite_index = spr_greenshell break;
case "red": sprite_index = spr_redshell break;
}

if (!damage_on_contact)
{
    //Reduced this.
    if place_meeting(x,y-1,player) && !phaseid && round(instance_place(x,y-1,player).vsp) > 0 && !(instance_place(x,y-1,player).hurt) && !(place_meeting(x-1,y,player) && place_meeting(x+1,y,player) && instance_place(x,y,player).grounded)
    {
        phaseid=instance_place(x,y-1,player)
        phaseid.vsp=-4-phaseid.akey*1.5

        kicked=1

        if hsp == 0 //what the fuck
        hsp=3*sign(phaseid.xsc)
        else hsp = 0 kicked=0

        phased=1
    }
    if (phaseid) && !place_meeting(x,y,phaseid) phaseid=0
}


if place_meeting(x-1,y,player) && !kicked && !phaseid && round(hsp) == 0
{
kicked=1
hsp=3
phased=1
}

if place_meeting(x+1,y,player) && !kicked && !phaseid && round(hsp) == 0
{
kicked=1
hsp=-3
phased=1
}

if !place_meeting(x,y,player)
{
phased=0
}

if place_meeting(x+hsp,y,player) && !(phased) && !(phaseid) && round(hsp) != 0
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

/*if(place_meeting(x+hsp, y-yPlus,enemy)){

}*/

if (place_meeting(x+hsp,y,collider)){
    yPlus = 0;
    while(place_meeting(x+hsp,y-yPlus,collider) && yPlus <= abs(2*hsp)){
        yPlus +=1;
    }
    if(place_meeting(x+hsp, y-yPlus,collider)){
        while(!place_meeting(x+sign(hsp),y,collider)){
            x += sign(hsp);
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

x += hsp;

if (place_meeting(x,y+vsp,collider)){
    while(!place_meeting(x,round(y+sign(vsp)),collider)){
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if(!place_meeting(x,round(y),collider)){
    y=round(y);
}

if hsp != 0 xsc=-esign(hsp,-1)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Lemon Reactivation
event_inherited()
if type=0 type="green"
hsp=0
vsp=0
grav=0.25
rot=0
xsc=1
ysc=1
image_speed=0.1
