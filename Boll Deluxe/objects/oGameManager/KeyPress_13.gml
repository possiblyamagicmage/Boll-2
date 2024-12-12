if (global.jade_testing || global.debug) { // need to be testing the level to stop testing the level
	global.jade_testing = false;
	
	global.checkpointX = no_checkpoint;
	global.checkpointY = no_checkpoint;

	room_goto(rEditor)
}