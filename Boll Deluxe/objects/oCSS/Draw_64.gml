var _spacing=0, _cardSizeW=sprite_get_width(spr_rostercard);
var _startX=(room_width/2) + ((_cardSizeW+_spacing)*(_rowLimit/2)), _startY=(room_height/2) + ((_cardSizeW+_spacing)*(_rowLimit/2));
var _x=0, _y=0;

for (var i=1; i<_charCount+1; i++;) {
	draw_sprite(spr_rostercard,0,_startX+_x,_startY+_y);
	if (_select+1=i) {
		draw_sprite(spr_rostercard,5,_startX+_x,_startY+_y-1);
	}
	_x+=_cardSizeW+_spacing;
	if (i%_rowLimit=0) {
		_x=0;
		_y+=_cardSizeW+_spacing;
	}
}