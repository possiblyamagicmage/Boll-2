if array_length(connections) {
	fr+=0.125;
	if fr>=sprite_get_number(spr_current) fr=0;
} else fr=0;

var list = ds_list_create();
collision_circle_list(x, y, radius, global.conductive_array, false, false, list, false);

for(var i = 0, len = ds_list_size(list); i < len; i++;) { 
    var obj = list[| i]
    if not array_contains(connectedObjects, obj) {
        array_push(connectedObjects, obj);
        findConnectedObjects(obj);
    }
}
ds_list_destroy(list);

for(var i = 0, len = array_length(connections); i < len; i++;) { 
	draw_sprite_ext(spr_current,fr,connections[i][0],connections[i][1],point_distance(connections[i][0],connections[i][1],connections[i][2],connections[i][3])/sprite_get_width(spr_current),1,point_direction(connections[i][0],connections[i][1],connections[i][2],connections[i][3]),c_white,1)
}