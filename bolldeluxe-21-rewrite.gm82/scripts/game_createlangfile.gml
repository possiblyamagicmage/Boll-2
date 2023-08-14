var fn,f;

directory_create(global.workdir+"mods\language")
fn="mods\language\example.txt"

s=surface_create(144,144)
if (!surface_set_target(s)) exit

draw_clear_alpha($ff00ff,1)
draw_sprite(spr_sysfont,0,0,0)
surface_reset_target()
surface_save(s,"mods\language\example.png")
surface_free(s)

if (file_exists(fn)) file_delete(fn)



f=file_text_open_append(fn)
file_text_write_string(f,gametitle+" example language file")
file_text_writeln(f)
file_text_writeln(f)

//write the strings down
global.yeat=1
global.yeatfile=f
game_langdefault()
global.yeat=0

file_text_close(f)
//ping("Default language example regenerated.")
