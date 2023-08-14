///loadopt()
//loads settings from file

var f,str,k,temp;

game_loaddefsettings()

global.settingschanged=0
if (file_exists(global.savefile)) {
    f=file_text_open_read(global.savefile)
    str=file_text_read_string(f)
    file_text_close(f)
    if (string_length(str)<16) exit

    temp=ds_map_create()

    if (!ds_map_read_safe(temp,str)) {ds_map_destroy(temp) exit}
    else {
        if (!is_string(game_settings("version"))) {ds_map_destroy(temp) exit}
        else if (game_settings("version")!=version) {ds_map_destroy(temp) exit}
        else {
            k=ds_map_find_first(temp)
            repeat (ds_map_size(temp)) {
                game_settings(k,ds_map_find_value(temp,k))
                k=ds_map_find_next(temp,k)
            }
            ds_map_destroy(temp)
        }
    }
}

game_applysettings()
