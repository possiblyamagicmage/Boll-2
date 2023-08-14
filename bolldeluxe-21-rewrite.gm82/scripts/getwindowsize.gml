rw=480
rh=270
//if (room=scoring || room=change || room=game) {
    if (global.mplay=2) {rh=448+4}
    if (global.mplay>2) {rw=800+4 rh=448+4}
//}

dw=display_get_width()
dh=display_get_height()

if (game_settings("fullscreen")) {
    /*if ((room=lemon && !global.lemontestviewhack) || (room=speciale && !instance_exists(moranboll))) {rw=dw rh=dh s=1}
    else*/ s=min(dw/rw,dh/rh)
} else {
    /*if (room=speciale && !instance_exists(moranboll)) {
        s=1
        rw=1074
        rh=700
    } else if (room=lemon && !global.lemontestviewhack) {
        s=1
        if (game_settings("zoomlemon")) {rw=floor(dw*0.8) rh=floor(dh*0.8)}
        else {rw=800 rh=700}
    } else*/ {
        s=game_settings("zoom")
        if (s=3) s=min(floor((dw-32)/rw),floor((dh-80)/rh))
        else if (rw*s>(dw-32) || rh*s>(dh-80)) s=min((dw-32)/rw,(dh-80)/rh)
    }
}
