///game_windowhandler() updates window size and location
var changed;

getwindowsize()

if (abs((rw/rh)-(dw/dh))<0.15) {window_set_region_scale(0,1) global.full=game_settings("fullscreen")}
else {window_set_region_scale(-1,1) global.full=0}

window_set_fullscreen(game_settings("fullscreen"))

game_roomviewshandler()

game_viewhandler(s)

global.w=rw
global.h=rh
global.s=s
