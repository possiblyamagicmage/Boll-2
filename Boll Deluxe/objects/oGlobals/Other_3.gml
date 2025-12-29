var settings_string = json_stringify(global.settings)

SaveStringToFile(game_save_id+"\settings.ini",settings_string)

if file_exists(game_save_id+"\save.jade") file_delete(game_save_id+"\save.jade")