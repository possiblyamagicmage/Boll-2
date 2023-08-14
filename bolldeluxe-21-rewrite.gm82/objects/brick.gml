#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//add small check
if size = 0
{
hit = -1;
}
else
{
i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-4.5+2}
i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-4.5+2}
i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-6+2 }
i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-6+2 }
if global.lemon instance_create(x,y,lemonbrickdummy)
instance_destroy()
}
