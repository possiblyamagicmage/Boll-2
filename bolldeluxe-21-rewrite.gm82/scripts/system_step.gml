//this is going to be a kick in the ballz

global.ignorejoy=0

//fix for background game process on error during room change
if (global.kill) {game_end() exit}


//mus_update()
//input_update()

//closing animation
if (fadekill) {
    volkill=max(0,volkill*0.9)
    //mus_volume(volkill)
    //FMODMasterSetVolume(volkill)
    if (volkill<=0.025) system_end()

    getwindowsize()

    fadekillbob=!fadekillbob
    if (fadekillbob) {
        window_set_region_scale(1,1)
        window_set_region_size(rw*s,ceil(rh*s*sqr(volkill)),1)
        window_center()
    } else {
        draw_clear(merge_color(0,$ffffff,1-volkill))
        window_set_color(merge_color(0,$ffffff,1-volkill))
        screen_refresh()
    }
    exit
}
if input_esc() fadekill=1


//if (input_esc() && !instance_exists(console)) menu_cancel()
//if (keyboard_check_pressed(vk_tab)) if (!instance_exists(console)) instance_create(0,0,console)


//For what we care about, this script ends here.

//wacko gm8 close button detection
//look at global game settings/other
//notice the Esc checkboxes :)
//if (keyboard_check(vk_escape)) {if (!esc && !keyboard_check_pressed(vk_escape)) menu_closebutton() esc=1} else esc=0

//if (keyboard_check_pressed(vk_f1)) ping(roomtip())
//if (keyboard_check_pressed(vk_f9)) screenshot=1
//if (keyboard_check_pressed(vk_f12)) global.hidereplayui=!global.hidereplayui

/*if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_f4) && !keyboard_check(vk_alt))) {
    settings("fullscreen",!settings("fullscreen"))
    windowhandler()
    io_clear()
} else if (keyboard_check_pressed(vk_f11)) {
    if (room=lemon) {
        editwindowsize()
    } else if (room=speciale) {
        settings("fullscreen",!settings("fullscreen"))
        windowhandler()
        io_clear()
    } else {
        if (settings("fullscreen")) {settings("fullscreen",0) settings("zoom",1)}
        else if (settings("zoom")=1) settings("zoom",2)
        else if (settings("zoom")=2) settings("zoom",3)
        else settings("fullscreen",1)
        windowhandler()
    }
}*/

if (game_settings("checkres")) {
    if (global.s!=game_settings("mems")) game_windowhandler()
    game_settings("checkres",0)
}
