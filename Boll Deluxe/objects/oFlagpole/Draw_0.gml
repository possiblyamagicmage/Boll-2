draw_self()

if (reward != 0) {
	draw_text(x + 2, y - gfx_y - 160, string(reward));
}

if (state < 2) {
	draw_sprite(spr_flagFromPole, global.roomTimer div 8,x ,y + gfx_y);
	exit;
}