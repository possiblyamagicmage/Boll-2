#define create

#define step
if instance_exists(clearpipeblock)
{
inst = instance_nth_nearest(x,y,clearpipeblock,128)
with(instance_create(inst.x,inst.y-10,goomba)) {vspeed=-10 hspeed=random_range(-4,4) hsp=0}
}

#define draw
draw_text(x,y,"this is called the poopie cannon")