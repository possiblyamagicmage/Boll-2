pipecoll=instance_place(x,y+1,pipeblock)
pipecollin=instance_place(x,y,pipeblock)

//Down
if (pipecoll && pipecoll.rot = 0) && (down) && !(piped)
{
    piped=1
    ypoint=y
    x=pipecoll.x
    hsp=0
    vsp=0
    move=0
}

if (piped) && !(unpipe)
{
    y = approach_val(y,ypoint+32,0.5+(1.5*speedpipe))
    thing=approach_val(thing,0,1)

    if round(y) == ypoint+16 && !p
    {
        thing=15
        visible=0
        p=1
    }

    if round(y) == ypoint+16 && !(thing) && (p)
    {
        yy=pipecollin.targety
        xx=pipecollin.targetx
        y=yy
        x=xx
        unpipe=1
    }
}

if (unpipe)
{
    visible=1
    y = approach_val(y, yy-16,0.5)
    if round(y) == yy-16
    {
        unpipe=0
        piped=0
    }
}
