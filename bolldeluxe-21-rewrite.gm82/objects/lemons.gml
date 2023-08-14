#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lemon_objregister()
register_media()
global.lemonpause=0
global.lemon=1
//The idea is to allow for live editing which would be fucking awesome, ->
//Having global.lemon active will result in objects not actually instance_destroying themselves, only just setting themselves to inactive, so you can still remove them and not place over them ->
//Considering we are trying to have good 4 player split screen fps, we should be able to do this without lagging out. - -S-
image_speed=0
indexed=0
selected = 0
mouse_x_prev=mouse_x;
mouse_y_prev=mouse_y;
mouse_xsp=0;
mouse_ysp=0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
indexed = wrap_val(indexed,0,ds_list_size(lemonobjlist) - 1) //automatically calculate the list size

input_get(-1)
if sbut {
    global.lemonpause=!global.lemonpause

    if global.lemonpause {
        with part instance_destroy() //delete all particles
        //enemies and the like should handle this on their own.
    }

}

//In case you're wondering, yes, lemons is also supposed to be the cursor
image_index=0
mouse_hsp=mouse_x-mouse_x_prev;
mouse_vsp=mouse_y-mouse_y_prev;
mouse_x_prev=mouse_x;
mouse_y_prev=mouse_y;

image_angle = round(mouse_vsp)*4+round(mouse_hsp)*4 //DO THE FUNNY DANCE

x=mouse_x
y=mouse_y
mx=(floor(x/16)*16)
my=(floor(y/16)*16)

if mouse_wheel_down() {
    indexed+=1
    sound_stop(lemonitemselect)
    sound_play(lemonitemselect)
}

if mouse_wheel_up() {
    indexed-=1
    sound_stop(lemonitemselect)
    sound_play(lemonitemselect)
}

selected = ds_list_find_value(lemonobjlist, indexed);


coll=instance_place(x,y,lemonstile) //-S- Please make this compatible with things that arent colliders,,,
slidercoll = instance_place(x,y,lemonsslider) 
vslidercoll = instance_place(x,y,lemonsverticalslider) 
hslidercoll = instance_place(x,y,lemonshorizontalslider) 
expandercoll = instance_place(x,y,lemonsexpander)
rotatorcoll = instance_place(x,y,lemonsrotator) 

if mouse_check_button_pressed(mb_right) && place_meeting(x,y,lemonstile)
{
instance_destroy_id(lemonspropertymenu)
i=instance_create(x,y,lemonspropertymenu) 
i.sourceobj=coll
}

if mouse_check_button_pressed(mb_left){ //dude i really need to like   optimize this LOL
    if place_empty(mx+1,my+1) && selected != 0
    {
        if !place_meeting(x,y,lemonsuipar) && !place_meeting(x,y,lemonspropertymenu)
        { 
            if selected == pipeblock
                with(instance_create(mx,my,selected)) image_yscale = 2
            else if selected == clearpipeblock
                with(instance_create(mx,my,selected)) image_yscale = 2
            else if selected == mushroomblock
                with(instance_create(mx-16,my,selected)) {image_xscale = 3 ysize = 3}
            else if object_is_ancestor(selected, enemy) || selected == enemy
                instance_create(mx+8,my+8,selected)
            else instance_create(mx,my,selected)
        }
        sound_play(lemonplace)
    }
    else {
        //unhardcoding yo shit -cubie
        if (coll) && !place_meeting(x,y,lemonsuipar) { //checking for a pipe's slider
            drag=1 //1 is for regular dragging, 2 is for vertical scaling
            dragged=coll
            sound_play(lemonclick)
        }
        if (slidercoll) { //checking for a pipe's slider
            if slidercoll.type == "pipe"
            {
                drag=2 //1 is for regular dragging, 2 is for vertical scaling
                dragged=slidercoll.parid
            }
            sound_play(lemonclick)
        }
        if (vslidercoll) { //mushroom
            if vslidercoll.type == "mushroom"
            {
                drag=5
                dragged=vslidercoll.parid
            }
            sound_play(lemonclick)
        }
        if (hslidercoll) { //mushroom
            if hslidercoll.type == "left" || hslidercoll.type == "right" || hslidercoll.type == "railleft" || hslidercoll.type == "railright"
            {
                drag=4 //4 is for horizontal scaling
                dragged=hslidercoll.parid
            }
            sound_play(lemonclick)
        }
        if (expandercoll) { //checking for a slider to expand in 4 directions
                drag=3 //1 is for regular dragging, 2 is for shit like this
                dragged=expandercoll.parid
                sound_play(lemonclick)
        }
    }
    
    if place_meeting(x,y,lemonspropertymenu){
        drag=6
        dragged=instance_place(x,y,lemonspropertymenu)
        sound_play(lemonpickup)
    }

    //rotato
    if place_meeting(x,y,lemonsrotator) {
        with(rotatorcoll) event_user(0)
        sound_play(lemonclick)
    }
}

if keyboard_check_pressed(vk_delete) {
    if !place_empty(mx+1,my+1) || !place_empty(x,y){
    //thankfully this only happens every press of the right click haahahaha
    //No More.
        instance_destroy_id(instance_place(mx,my,lemonspropertymenu))
        instance_destroy_id(instance_place(mx,my,lemonstile))
        instance_destroy_id(instance_place(mx,my,lemondummypar))
        instance_destroy_id(instance_place(mx,my,enemy))
        instance_destroy_id(instance_place(mx,my,customobject))
        instance_destroy_id(lemonsuipar)
        instance_destroy_id(collision_rectangle(mx,my,mx+15,my+15,slopel,false,true))
        instance_destroy_id(instance_place(mx,my,hittable))
        sound_play(lemondelete)
    }
}

if place_meeting(x,y,lemonspropertymenu)
image_index=2

if drag{ //Messing With Thingies TM
    if !mouse_check_button(mb_left) drag=0
    if drag=1{
        instance_destroy_id(lemonsuipar)
        dragged.x=mx-(dragged.rot==270 || dragged.rot==180)+(16*(dragged.rot==270))-(16*(dragged.rot==90)) // i am, going insane -cubie
        dragged.y=my-(dragged.rot==90 || dragged.rot==180)+(32*(dragged.rot==180))+(16*(dragged.rot==270 || dragged.rot==90))
        image_index = 3
    }
    if drag=6{
        //non snap dragging for property menu specifically
        instance_destroy_id(lemonsuipar)
        //dragged.x=x-dragged.sprite_width/2
        //dragged.y=y-4
        image_index = 3
    }
    if drag=2{ //Stretching
        //temp fix JESUS FUCKING CHRIST I FINALLY GOT IT SOMEWHAT WORKING
        //-s- i will be so mad if you somehow optimize this to be way better -cubie
        image_index = 3
        switch(dragged.rot)
        {
        case 0: {
            dragged.image_yscale=2+(ceil(my-(dragged.y+16))/16)
            break;
            }
        case 90: {
            dragged.image_yscale=2+(ceil(mx-(dragged.x+16))/16)
            break;
            }
        case 180: {
            dragged.image_yscale=1+(-(ceil(my-(dragged.y-16))/16))
            break;
            }
        case 270: {
            dragged.image_yscale=1+(-(ceil(mx-(dragged.x-16))/16))
            break;
            }
        }
        if dragged.object_index == clearpipeblock if round(dragged.image_yscale)<2 dragged.image_yscale=2
        if round(dragged.image_yscale)<=0 dragged.image_yscale=1
    }
    if drag=3{ //Resizing
        image_index = 3
        dragged.image_yscale=2+(ceil(my-(dragged.y+16))/16) //please make this work with negative values or whatever
        dragged.image_xscale=2+(ceil(mx-(dragged.x+16))/16) //because only the bottom right one works,,, -cubie
        if dragged.image_yscale<=0 dragged.image_yscale=1
        if dragged.image_xscale<=0 dragged.image_xscale=1
    }
    if drag=4{ //Resizing
        image_index = 3
        dragged.image_xscale=2+(ceil(mx-(dragged.x+16))/16) //please make this work with the left side or whatever
        if dragged.image_xscale<=2 dragged.image_xscale=3
    }
    if drag=5{ //Resizing
        image_index = 3
        dragged.ysize=2+(ceil(my-(dragged.y+16))/16)
        if round(dragged.ysize)<=0 dragged.ysize=1
    }

}
else if !drag && !coll && !place_meeting(x,y,lemonsuipar)
{
instance_destroy_id(lemonsuipar)
}

if coll && coll != prevcoll //prevcoll prevents the ui from staying on one object if you never touch an empty space but still hover another object.
{
instance_destroy_id(lemonsuipar)
}

prevcoll=instance_place(x,y,lemonstile)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//sound_loop(pizza)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
offsetx=ds_list_find_value(lemonoffsetxlist, indexed)
offsety=ds_list_find_value(lemonoffsetylist, indexed)

if place_empty(mx+1,my+1) && !place_meeting(x,y,lemonsuipar)
draw_sprite_ext(spr_lemonpalette,ds_list_find_value(lemonindexlist, indexed)+1,mx+8+offsetx,my+8+offsety,1,1,image_angle/2,c_white,0.5)

draw_self()
