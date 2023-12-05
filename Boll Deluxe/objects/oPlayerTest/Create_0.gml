///Initialize

name = "mario";

sprite_list = ["idle"];
spr = "idle";

anim_speed = 4;
anim_length = 1;

fr = 0;
y_offset = 0;

box_width = 47;
box_height = 47;

offset_x = 23;
offset_y = 41;

xsc = 1;
ysc = 1;
rot = 0;
col = $FFFFFF;
opacity = 1;
top_margin = 120;

sheet[0]=sprite_add(working_directory+"\_vanilla\\character\\"+name+"\\"+name+"-basic.png",0,true,false,0,0)

Catspeak.applyPreset(
	CatspeakPreset.MATH,
	CatspeakPreset.MATH_3D,
	CatspeakPreset.DRAW,
	CatspeakPreset.COLOUR,
	CatspeakPreset.ARRAY,
	CatspeakPreset.STRUCT,
	CatspeakPreset.STRING,
	CatspeakPreset.ASSET,
	CatspeakPreset.TYPE,
	CatspeakPreset.RANDOM,
	"collision",
	"instance",
	"custom"
);
if file_exists(working_directory+"\_vanilla\\character\\"+name+"\\code\\create.meow") {
	var buffer = buffer_load(working_directory+"\_vanilla\\character\\"+name+"\\code\\create.meow");
	var ast = Catspeak.parse(buffer);
	buffer_delete(buffer);

	createProgram = Catspeak.compileGML(ast);
	
	createProgram.setSelf(id)
	createProgram();
}

stepProgram=undefined;
if file_exists(working_directory+"\_vanilla\\character\\"+name+"\\code\\step.meow") {
	var buffer = buffer_load(working_directory+"\_vanilla\\character\\"+name+"\\code\\step.meow");
	var ast = Catspeak.parse(buffer);
	buffer_delete(buffer);

	stepProgram = Catspeak.compileGML(ast);
}

drawProgram=undefined;
if file_exists(working_directory+"\_vanilla\\character\\"+name+"\\code\\draw.meow") {
	var buffer = buffer_load(working_directory+"\_vanilla\\character\\"+name+"\\code\\draw.meow");
	var ast = Catspeak.parse(buffer);
	buffer_delete(buffer);

	drawProgram = Catspeak.compileGML(ast);
}