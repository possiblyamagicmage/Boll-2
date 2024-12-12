var nearestObj = instance_nearest(x,y,oPlayer);

var xdiff = 0;
var ydiff = xdiff;

if (nearestObj)
{
    xdiff = nearestObj.x - x;
    ydiff = nearestObj.y - y;
}

//var deg = point_direction(0,0,xdiff,ydiff) % 360;

//var ang = degtorad(deg);

var ang = arctan2(ydiff,xdiff);

var xoff = cos(ang) * mul div 1;
var yoff = sin(ang) * mul div 1;

var xx = (x div 1) + (xoff);
var yy = (y div 1) + (yoff);

draw_sprite(spr_slime_eye,sprframe % 3,xx - 4,yy);
draw_sprite(spr_slime_eye,sprframe % 3,xx + 4,yy);