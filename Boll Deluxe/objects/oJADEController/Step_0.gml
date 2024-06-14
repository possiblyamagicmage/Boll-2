mbleft=mouse_check_button_pressed(mb_left)

curs_x=mouse_x
curs_y=mouse_y

if keyboard_check_pressed(vk_escape) room_goto(rMainMenu)

for (var i = 0; i < 5; ++i)
{
	if (mbleft) && mouse_in_mode_slot(i) {
		if selected_mode != i {
			selected_toolbar=0
			selected_mode=i
		}
	}
}

var tb_length = array_length(toolbar[selected_mode])
for (var i = 0; i < tb_length; ++i)
{
	if (mbleft) && mouse_in_toolbar_slot(i) {
		selected_toolbar=i
	}
}

selected_tool=toolbar[selected_mode][selected_toolbar]

if (mbleft) && mouse_in_setting_slot(0) { //exit button
	room_goto(rMainMenu)
}