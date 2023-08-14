if (place_meeting(x+hsp,y,collider)){
    yPlus = 0;
    while(place_meeting(x+hsp,y-yPlus,collider) && yPlus <= abs(2*hsp)){
        yPlus +=1;
    }
    if(place_meeting(x+hsp, y-yPlus,collider)){
        while(!place_meeting(x+sign(hsp),y,collider)){
            x += sign(hsp);
        }
        hsp = 0;
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
    //Landing variables
    grounded=true
    realjump = 0;
    jump=0;
    if !(alarm[0]) hurt=0;
}

semicoll=instance_place(x,y+vsp,semilider)

if (place_meeting(x,y+vsp,semilider)){
    while(!place_meeting(x,round(y+sign(vsp)),semilider)){
        y += sign(vsp);
    }    

    if floor(vsp) >= 0
    if (semicoll.bbox_top-bbox_bottom >= 1) //how the hell did this actually work LOL... and why is it the ONLY method that works??
    {
        vsp = 0;
        //Landing variables
        grounded=true;
        realjump = 0;
        jump=0;
        if !(alarm[0]) hurt=0
    }

}

y += vsp;

if !place_meeting(x,round(y),collider){
    y=round(y);
}
