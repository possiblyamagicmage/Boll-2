var guiw=display_get_gui_width()
var guih=display_get_gui_height()

mbleft=mouse_check_button_pressed(mb_left)

curs_x=mouse_x
curs_y=mouse_y

if keyboard_check_pressed(vk_escape) room_goto(rMainMenu)

for (var i = 0; i < 5; ++i)
{
	if (mbleft) && point_in_rectangle(curs_x,curs_y,4,((guih/4)-4)+32*i,28,(((guih/4)-4)+32*i)+24) {
		selected_mode=i
	}
}