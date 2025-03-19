// Inherit the parent event
event_inherited();

if instance_exists(myBalloon) instance_activate_object(myBalloon);

if !(passive) {
	dashcooldown=max(0,dashcooldown-1);
	if (grounded)
	dashduration=max(0,dashduration-1);
	overridexsc=true;
	
	if (dashduration) {
		constantspd=2
		_direction=-xsc;
		edgeturn=false
		dashcooldown=60;
		var p=nearestplayer();
		if esign(x-p.x,xsc)!=xsc {
			dashduration=0;
		}
	} else {
		edgeturn=true
		constantspd=approach_val(constantspd,0,0.1);
		var p=nearestplayer();
		if !(constantspd) {
			xsc=esign(x-p.x,xsc)
		} else {
			if esign(x-p.x,xsc)==xsc {
				dashduration=60;
				xsc=esign(x-p.x,xsc);
				_direction=-xsc;
				constantspd=2
			}
		}
	}
	
	if !(dashcooldown) && !(dashduration) {
		var p=nearestplayer();
		dashduration=60;
		xsc=esign(x-p.x,xsc);
		_direction=-xsc;
		constantspd=2
	}
}

if (myBalloon!=noone) {
	instance_activate_region(x-16,y-16-(bheight+4)*16,32,(bheight+6)*16, true)
}