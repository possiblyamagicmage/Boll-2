pathprenum=max(pathnum-1,0)
if is_array(pathing) && (pathdraw) {
	ds_list_add(oNodeManager.objectNodesList,[pathing,pathcanrev,pathcanfall,sprite_get_xoffset(sprite_index),sprite_get_yoffset(sprite_index),id])
}

if !is_undefined(global.scripts_object[? $"{script_name}_create"])
txr_exec(global.scripts_object[? $"{script_name}_create"]);