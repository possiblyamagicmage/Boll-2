///error(message)
//This pauses the game and shows an error message

if (!instance_exists(globalmanager) || global.kill) exit

game_stats("errors seen",game_stats("errors seen")+1)

if (room=lemon || global.debug) {show_message(string_wordwrap(argument[0],50)) exit}

global.halign=0
mus_pause(1)

d3d_set_projection_ortho(0,0,480,270,0)
d3d_transform_add_translation(-1*(480/window_get_region_width()),-1*(270/window_get_region_height()),0)

draw_rect(0,0,481,271,$ff0000,0.5)
draw_systext(16,16,string_wordwrap(argument[0],46))
screen_refresh()
sleep(500)
draw_systext(16,192,string_wordwrap(game_lang("error press"),46))
d3d_transform_set_identity()
screen_refresh()
io_clear()
do {
    sleep(50)
    io_handle()
} until (keyboard_check(vk_anykey) || global.kill)
//if (keyboard_check(vk_escape)) {system_end() exit}
//if (keyboard_check(vk_f9)) system_screenshot(1)
//if (keyboard_check(vk_f10)) room_goto(lemon)
io_clear()
mus_pause(0)
