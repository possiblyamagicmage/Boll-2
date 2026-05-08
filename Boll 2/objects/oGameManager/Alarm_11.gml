/// @description go to menu
global.checkpointX = no_checkpoint;
global.checkpointY = no_checkpoint;

if !(global.jade_testing) {
	room_goto(rMainMenu);
} else {
	global.jade_testing=false;
	room_goto(rEditor);
}
