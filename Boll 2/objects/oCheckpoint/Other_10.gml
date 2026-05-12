/// @description Unmark previous checkpoints
instance_activate_object(oCheckpoint)
with (oCheckpoint) {
	if (id != other.id) {
		reset.Emit();
	}
}