#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,maxrun,brake,spring,springfall,jump,bonk,ball,spindash,push,hang,fire,dash,specfall,climbing,flagslide


#define soundlist
release,skid,spin,spindash,insta,dash,boom,firedash,peelcharge,peelrelease


#define movelist
Sonic
#
[a]: Instashield (air)
[b]: Dash (air)
After a dash, stay grounded to gain speed
<fire>
Sonic [flwr]
#
[a]: Instashield (air)
[b]: Fire Dash (air) / Sonic Boom (ground)
After a dash, stay grounded to gain speed
<feather>
Sonic [fthr]
#
[a]: Instashield (air)
[b]: Feather Dash (air)
After a dash, stay grounded to gain speed


#define rosterorder
6


#define start


#define stop


#define itemget


#define effectsfront

#define grabflagpole


#define endofstage

#define damager


#define projectile

#define sprmanager
frspd=1
if (jump) sprite="jump"
else if round(hsp)!=0 sprite="walk"
else sprite="stand"


#define controls

apress=abut
bpress=bkey
cpress=ckey

maxspd = 2+(bkey);

if (left)
{
xsc=-1
}
else if (right)
{
xsc=1
}

#define movement

if (!move_lock && !piped && !hurt) {
    move = -left + right
}

if (apress) && grounded == false
{
alarm[1] = 10; //ammount of frames for jump buffering
alarm[2] = 10; //Walljump buffering
}
else if grounded == true
{
alarm[2] = 0;
wallbuffer = 0;
}

if (alarm[1] > 0) && grounded == true
{
bufferjump = 1;
alarm[1] = 0;
}

if move != 0
{
hsp += move*accel

hsp = clamp(hsp,-maxspd,maxspd)
}
else
{
if grounded
hsp = lerp(hsp,0,fric)
}

//Fall off platform
if !grounded
{
vsp=min(4,vsp+grav)
canjump -= 1
}
else
{
canjump = 5 //Coyote frames
}

if !(akey) {
    if (canstopjump=1 && vsp<-2 ) {
        vsp*=0.6
    }
}

//Landing variables
if (place_meeting(x,y+1,collider))
{
grounded=true
realjump = 0;
jump=0
if !(alarm[0]) hurt=0
}
else
grounded=false

//Jumping
if (canjump > 0 && (apress)) || (bufferjump)
{
fr=1
bufferjump = 0;
vsp = -6;
jump=1
canjump = 0;
canstopjump=1;
}

collision();

com_interactions();

#define actions


#define enemycoll


#define hurt


#define hitblocks


#define hitwall     


#define landing

#define death


#define enterpipe


