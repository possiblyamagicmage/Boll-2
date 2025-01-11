// Inherit the parent event

event_inherited();

parent_pipe = noone;
instance_activate_object(oPipe);
parent_pipe = instance_place(x, y + hit_sizey + 1, oPipe);
//parent_pipe = collision_point(x,y+hit_sizey+1,oPipe,false,true);
//phaseid = parent_pipe;