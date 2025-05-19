script_onTrigger = ""
script_onStep = ""
script_onCreate = ""

ran_create_event = false

is_triggered = false
only_once = false

depth=1;

enum TRIGGER
{
	NONE,
    OVERLAP,
    OVERLAP_ONCE,
    ON_TOUCH,
    PASS_X,
    PASS_Y,
    CHANNEL_ID,
}

detection_type = TRIGGER.NONE

detection_value = 0

pathing=-1;
pathprenum=0;
pathnum=1;
pathspd=2;
pathcanrev=false;
pathisrev=false;
pathfallen=false;
pathcanfall=false;
pathdraw=true;
pathstarted=true;