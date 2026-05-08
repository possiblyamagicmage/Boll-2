// Inherit the parent event
event_inherited();

if !(pausestun) {
	stun=max(stun-1,0);

	if !(stun) && !(didstun) {
		onStunRecover.Emit();
	}
}