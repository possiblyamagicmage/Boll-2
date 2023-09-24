#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hsp=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=hsp

if !(inview())
instance_destroy()

coll=instance_place(x,y,player)
if (coll)
with(coll) hurtplayer()
