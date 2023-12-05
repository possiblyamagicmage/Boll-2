// this just makes sure that vsp and hsp actually work while in a pipe lol
if (piped)
{
    y += vsp;
    x += hsp;
    exit
}

// chearii: guessing these are a buncha quickvars
right = input_check("right");
left = input_check("left");
up = input_check("up");
down = input_check("down");
akey = input_check("jump");
apress = input_check_pressed("jump");
bkey = input_check("action");
bpress = input_check_pressed("action");
ckey = input_check("special");
cpress = input_check_pressed("special");

if ((apress) && (grounded == false))
{
    alarm[1] = 10;  // ammount of frames for jump buffering
    alarm[2] = 10;  // Walljump buffering
}
else if (grounded == true)
{
    alarm[2] = 0;
    wallbuffer = 0;
}

if ((alarm[1] > 0) && (grounded == true))
{
    bufferjump = 1;
    alarm[1] = 0;
}

move = (right - left);

maxspd = 2;

if (move != 0)
{
    image_speed = 1;

    hsp += (move * accel);

    hsp = clamp(hsp, -maxspd, maxspd);
}
else
{
    image_speed = 0;
    image_index = 0;
    hsp = lerp(hsp, 0, fric);
}

// Fall off platform
if (!grounded)
{
    vsp = min(4, vsp + grav);
    canjump -= 1;
	
	// chearii: coneyor speed management
	if (abs(chsp * 100))
	{
		chsp *= 0.95;
		
		if ((chsp * 100 div 1) == 0)
			chsp = 0;
	}
}
else
{
    canjump = 5;  // Coyote frames
}

grounded = false;


// polygons!!!!!
//nekonesse: i beg of you turn this into a basic script/function for charm users....

// check to see if we need to update the polybox
if (sprindex_prev != sprite_index)
{
	obj_update_poly_from_bounding(self);
	sprindex_prev = sprite_index;
}

my_collision();

if (grounded)
    jump = 0;

// Pipes ??? (works now)
if (grounded && down && place_meeting(x, y + 4, oPipeUp))
{  
    with instance_place(x, y + 4, oPipeUp)
    {
        if (canenter)
        {
            with other
            {  
                alarm[3] = 80;
                piped = 1;
                vsp = 1.5;
                hsp = 0;
                x = (other.x + (other.sprite_width / 2));
            }
            // sorry about the global variables here but the player object isnt
            // persistent so im overpreparing for room reloads lol
            global.exitlocation = target;  
            
            global.exittype = warptypes.pipe;  
        }
    }
}

// Jumping
if (!akey)
{
    if ((canstopjump == 1) && (vsp < -2))
    {
        vsp *= 0.6;
    }
}

if ((canjump > 0 && (apress)) 
    || (bufferjump))
{
	jump = 1;
    fr = 1;
    bufferjump = 0;
    vsp = -6;
    canjump = 0;
    canstopjump = 1;
}

// Switch direction
if (left)
{
    xsc = -1;
}
else if (right)
{
    xsc = 1;
}

coll = instance_place(x, y, oMushroom);

if (coll)
{
    oldsize = size;

    if (size < 1)
        size = 1;

    alarm[11] = 60;
    instance_destroy(coll);
}

// switch for sheets or whatever
switch (size)
{
default:
case 0:
    sprite_index = spr_player;
    break;
case 1:
    sprite_index = spr_playerbig;
    break;
}