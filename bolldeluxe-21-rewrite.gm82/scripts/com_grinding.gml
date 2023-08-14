///Rail Grinding script

if (place_meeting(x,y+vsp,grindrail) || place_meeting(x,y+1,grindrail)) && vsp >= 0
{
    vsp=0;
    move_lock=true;
    is_grinding=true;
    grounded=true;

    if abs(hsp) < 5 hsp=5*xsc
}
else
{
    move_lock=false;
    is_grinding=false;
}
