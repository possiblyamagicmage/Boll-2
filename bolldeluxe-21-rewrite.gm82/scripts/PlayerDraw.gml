///spriteswitch(step)
//sprite manager for player characters
//if step is true, animation is executed, otherwise it draws
var mem,step;

step=argument[0]

if (object_index=player) {
    if (step) {
        oldspr=sprite
        if (!piped) charm_run("sprmanager")
        if ((depth=0 || depth=1) && p2=gamemanager.plrsort) depth=!depth
    }
    if (flash && global.bgscroll mod 5<3) exit
    if (diggity=32 && digvisible) exit
        {
        mem=size
        if (((hurt || fall=6) && hk<4) || (grow && gk mod 6<3)) size=oldsize
        sheet=sheets[size]
    }
} else {
    if (step) {oldspr=sprite
    }
    sheet=sheets[size]
}

if (global.tpose) {sprite="stand" frame=0}

if (step) {
    //reset frame on sprite change
    if (sprite!=oldspr) frame=0
    //find sprite position in list
    sid=0
    for (i=0;i<global.animdat[p2,0];i+=1) {
        if (string(global.animdat[p2,16+128*i])==sprite) {sid=i break}
    }
}

if (object_index=player||object_index=charmdeath||is_spriteswitcher) {
    if (dotkid && !step) draw_sprite(spr_dotkid,0,x,y+dy+13)
    else ssw_core(step)
    if (!super) if (((hurt || fall=6) && hk<4) || (grow && gk mod 6<3)) size=mem
} else ssw_core(step)
