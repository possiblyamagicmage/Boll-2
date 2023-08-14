//set up game directories and caches
global.workdir=working_directory+"\"
global.tempdir=temp_directory+"\"

global.savedir=global.workdir+"save\"
directory_create(global.savedir)

global.savefile=global.savedir+gametitle+".cfg"

global.cache=global.savedir+"cache\"

global.pbase=global.workdir+"vanilla\character\"


if (global.modded) {
    global.cache=global.workdir+global.moddata
    if (!directory_exists(global.cache)) {
        directory_create(global.cache)
        global.cache=global.workdir+global.moddata
    }
} else {
    directory_create(global.cache)
}

global.tmpfile=global.tempdir+"res.gms"
global.tasfile=global.tempdir+"tas.gms"
//global.boll=makeboll()


//globals
global.sysfont=spr_sysfont
global.fontmapbase="" for (i=1;i<128;i+=1) global.fontmapbase+=chr(i)
global.sprfont=-1
global.tscale=1

global.debug=debug_mode
global.gamemaker=(program_directory!=working_directory)
//global.easter=calceaster() || (date_get_month(date_current_datetime())=4 && date_get_day(date_current_datetime())=1)

global.setmap=ds_map_create()
global.strmap=ds_map_create()
global.statmap=ds_map_create()
global.spentblocks=ds_map_create()
//global.keylog=buffer_create()

global.kill=0
global.restarting=0
global.quietyou=0
global.lastroom=room
global.replaycache=-1
global.bmovie=-1
global.w=480
global.h=270
global.s=2
global.mplay=0
global.fool=0
global.electric=0
global.bgscroll=0
global.frameskipcounter=0
global.editpicked=-1
global.pfps=60
global.spd=60
global.vapor=0
global.vaporkek=0
global.vaporpass=0
global.steamprompt=0
global.lastcmd=""
global.lastrun="show_message("+qt+"hello world"+qt+")"
global.lemonfilename=""
global.levelfname=""
global.lemontest=0
global.lemontestviewhack=0
global.replaythumb=-1
global.tasing=0
global.pos=1
global.length=1
global.inputwait=0
global.mousebacklock=0
global.tcalc=0
global.halign=0
global.valign=0
global.loadstate=0
global.loadtime=0
global.specialestr="S# ´`\/O.:t%@!bB123FT"
for (i=0;i<4;i+=1) {
    global.playermask[i]=sprite_create_from_screen(0,0,96,96,0,0,48,82)
}

//final preparations
draw_set_color($ffffff)
draw_set_font(global.omifont)
draw_set_circle_precision(64)

game_loadoptions()
game_stats("bootups",game_stats("bootups")+1)
